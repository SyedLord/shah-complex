// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:http/http.dart'
    as http; // 🔥 HTTP Import lazmi hai (Pubspec mein http: ^1.2.0 hona chahiye)
import 'dart:convert'; // JSON decode ke liye

Future launchExternalPlayer(
  MoviesRecord? movieDoc,
  EpisodesRecord? episodeDoc,
  ItemsRecord? continueDoc,
  String profileId,
  String? seriesId,
) async {
  // ─── 1. Extract fields from whichever document was passed ───────────────────

  String? rawVideoUrl;
  String? driveType;
  String? tmdbId;
  String? title;
  String? showName; // Series ka naam (only for episodes)
  String contentType = 'movie';
  String? imageUrl;
  int startAtSeconds = 0;
  int? seasonNum;
  int? episodeNum;
  String? resolvedSeriesId = seriesId;

  if (continueDoc != null) {
    rawVideoUrl = continueDoc.videoUrl;
    driveType = continueDoc.driveType;
    tmdbId = continueDoc.tmdbId;
    title = continueDoc.title;
    showName = continueDoc.showName;
    contentType = continueDoc.contentType ?? 'movie';
    imageUrl = continueDoc.imageUrl;
    startAtSeconds = continueDoc.watchedSeconds ?? 0;
    seasonNum = continueDoc.season;
    episodeNum = continueDoc.episode;
    resolvedSeriesId = continueDoc.seriesId ?? seriesId;
  } else if (episodeDoc != null) {
    rawVideoUrl = episodeDoc.videoUrl;
    driveType = episodeDoc.driveType;
    tmdbId = episodeDoc.tmdbId?.toString();
    title = episodeDoc.title;
    contentType = 'episode';
    imageUrl = episodeDoc.thumbnail;
    startAtSeconds = 0;
    seasonNum = episodeDoc.seasonNumber;
    episodeNum = episodeDoc.episodeNumber;
    if (resolvedSeriesId != null) {
      try {
        final seriesSnap = await FirebaseFirestore.instance
            .collection('series')
            .doc(resolvedSeriesId)
            .get();
        showName = (seriesSnap.data()?['title'] as String?) ?? '';
      } catch (_) {
        showName = '';
      }
    }
  } else if (movieDoc != null) {
    rawVideoUrl = movieDoc.videoUrl;
    driveType = movieDoc.driveType;
    tmdbId = movieDoc.tmdbId?.toString();
    title = movieDoc.title;
    contentType = 'movie';
    imageUrl = movieDoc.backdropImage;
    startAtSeconds = 0;
  }

  // Guard: nothing to play
  if (rawVideoUrl == null || rawVideoUrl.isEmpty) return;

  // ─── 2. Server se One-Time Signed URL lo (HMAC Worker pe banta hai) ──────────

  // rawVideoUrl directly http hai to as-is use karo
  // warna Worker se signed stream URL lo
  String finalPlayUrl = rawVideoUrl;
  String signedToken = ''; // Kill switch ke liye zaroori

  if (!rawVideoUrl.startsWith('http')) {
    final source = driveType == 'gdrive' ? 'gdrive' : 'onedrive';

    try {
      final tokenUri = Uri.parse(
        'https://shahcomplex.sa-syedali2000.workers.dev/generate-token'
        '?file_id=${Uri.encodeComponent(rawVideoUrl)}'
        '&source=$source'
        '&profile_id=${Uri.encodeComponent(profileId)}',
      );

      final tokenResponse = await http.post(
        tokenUri,
        headers: {'X-Shah-App': 'ShahComplexSecret2024'},
      ).timeout(const Duration(seconds: 10));

      if (tokenResponse.statusCode == 200) {
        final data = jsonDecode(tokenResponse.body) as Map<String, dynamic>;
        finalPlayUrl = (data['stream_url'] as String?) ?? '';
        // Signed token extract karo URL se (kill switch ke liye)
        final parsedUrl = Uri.parse(finalPlayUrl);
        signedToken = parsedUrl.queryParameters['token'] ?? '';
      }
    } catch (_) {
      // Token generate nahi hua — return karo
      return;
    }

    if (finalPlayUrl.isEmpty) return;
  }

  // ─── 3. Launch the native player via MethodChannel ──────────────────────────

  final String displayTitle = contentType == 'episode'
      ? 'S${seasonNum ?? 0}E${episodeNum ?? 0} · ${title ?? ""}'
      : title ?? '';

  const platform = MethodChannel('com.syedlord.shahcomplex/external_player');
  Map<dynamic, dynamic>? result;

  try {
    result =
        await platform.invokeMethod<Map<dynamic, dynamic>>('launchPlayer', {
      'url': finalPlayUrl,
      'startPositionMs': startAtSeconds * 1000,
      'title': displayTitle,
    });
  } on PlatformException {
    // VLC crash ya foran back — signedToken kill karo
    if (signedToken.isNotEmpty) await _invalidateUrl(signedToken);
    return;
  }

  // 🔥 KILL SWITCH: VLC band hotay hi signed token permanently kill!
  if (signedToken.isNotEmpty) await _invalidateUrl(signedToken);

  if (result == null) return;

  // ─── 4. Calculate progress ───────────────────────────────────────────────────

  final int watchedMs = (result['watched_ms'] as int?) ?? 0;
  final int totalMs = (result['total_ms'] as int?) ?? 0;
  final int watchedSeconds = (watchedMs / 1000).round();
  final int totalSeconds = totalMs > 0 ? (totalMs / 1000).round() : 0;

  if (watchedSeconds < 10) return;

  final double progressPercent = totalSeconds > 0
      ? (watchedSeconds / totalSeconds * 100).clamp(0.0, 100.0)
      : 0.0;

  final bool isFinished = progressPercent > 90.0;

  // ─── 5. Build the Firestore document path ───────────────────────────────────

  final String docId = contentType == 'episode'
      ? '${tmdbId ?? "unknown"}_${seasonNum ?? 0}_${episodeNum ?? 0}'
      : '${tmdbId ?? "unknown"}';

  final DocumentReference itemRef = FirebaseFirestore.instance
      .collection('continue_watching')
      .doc(profileId)
      .collection('items')
      .doc(docId);

  // ─── 6. Write progress or handle completion ──────────────────────────────────

  if (!isFinished) {
    await itemRef.set({
      'tmdb_id': tmdbId ?? '',
      'title': title ?? '',
      'content_type': contentType,
      'video_url': rawVideoUrl,
      'watched_seconds': watchedSeconds,
      'total_seconds': totalSeconds,
      'progress_percent': progressPercent,
      'updated_at': FieldValue.serverTimestamp(),
      'series_id': resolvedSeriesId ?? '',
      'image_url': imageUrl ?? '',
      'drive_type': driveType ?? '',
      if (contentType == 'episode') 'season': seasonNum ?? 0,
      if (contentType == 'episode') 'episode': episodeNum ?? 0,
      if (contentType == 'episode' && showName != null) 'show_name': showName,
    }, SetOptions(merge: true));
    return;
  }

  // ─── 7. Episode finished (>90%) — auto-queue next episode ───────────────────

  await itemRef.delete();

  if (contentType != 'episode' || resolvedSeriesId == null) return;

  final int nextEpisodeNum = (episodeNum ?? 0) + 1;
  final int currentSeasonNum = seasonNum ?? 1;

  QuerySnapshot nextEpQuery = await FirebaseFirestore.instance
      .collection('series')
      .doc(resolvedSeriesId)
      .collection('episodes')
      .where('season_number', isEqualTo: currentSeasonNum)
      .where('episode_number', isEqualTo: nextEpisodeNum)
      .limit(1)
      .get();

  if (nextEpQuery.docs.isEmpty) {
    nextEpQuery = await FirebaseFirestore.instance
        .collection('series')
        .doc(resolvedSeriesId)
        .collection('episodes')
        .where('season_number', isEqualTo: currentSeasonNum + 1)
        .where('episode_number', isEqualTo: 1)
        .limit(1)
        .get();
  }

  if (nextEpQuery.docs.isEmpty) return;

  final nextEpData = nextEpQuery.docs.first.data() as Map<String, dynamic>;
  final String nextRawUrl = (nextEpData['video_url'] as String?) ?? '';
  final String nextDriveType = (nextEpData['drive_type'] as String?) ?? '';
  final String nextTitle = (nextEpData['title'] as String?) ?? '';
  final String nextThumbnail = (nextEpData['thumbnail'] as String?) ?? '';
  final int nextSeason =
      (nextEpData['season_number'] as int?) ?? currentSeasonNum + 1;
  final int nextEpisode = (nextEpData['episode_number'] as int?) ?? 1;

  final String nextDocId = '${tmdbId ?? "unknown"}_${nextSeason}_$nextEpisode';

  await FirebaseFirestore.instance
      .collection('continue_watching')
      .doc(profileId)
      .collection('items')
      .doc(nextDocId)
      .set({
    'tmdb_id': tmdbId ?? '',
    'title': nextTitle,
    'show_name': showName ?? '',
    'content_type': 'episode',
    'video_url': nextRawUrl,
    'watched_seconds': 0,
    'total_seconds': 0,
    'progress_percent': 0.0,
    'updated_at': FieldValue.serverTimestamp(),
    'series_id': resolvedSeriesId,
    'image_url': nextThumbnail,
    'season': nextSeason,
    'episode': nextEpisode,
    'drive_type': nextDriveType,
  });
}

// ─── 🔥 THE KILL SWITCH FUNCTION ─────────────────────────────────────────────
Future<void> _invalidateUrl(String tokenToKill) async {
  if (tokenToKill.isEmpty) return;

  try {
    final uri = Uri.parse(
        'https://shahcomplex.sa-syedali2000.workers.dev/invalidate?token=$tokenToKill');

    // Ye Cloudflare Worker ko bolega ke is link ka saans nikal do!
    await http.post(
      uri,
      headers: {'X-Shah-App': 'ShahComplexSecret2024'},
    );
  } catch (_) {
    // Network error ignore kar dain, main progress bachana zaroori hai
  }
}
