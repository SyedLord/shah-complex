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
  String contentType = 'movie';
  String? imageUrl;
  int startAtSeconds = 0;
  int? seasonNum;
  int? episodeNum;
  String? resolvedSeriesId = seriesId;

  if (continueDoc != null) {
    // Resuming from continue_watching item — use its stored fields directly
    rawVideoUrl = continueDoc.videoUrl;
    driveType = continueDoc.driveType;
    tmdbId = continueDoc.tmdbId; // already a String in this collection
    title = continueDoc.title;
    contentType = continueDoc.contentType ?? 'movie';
    imageUrl = continueDoc.imageUrl;
    startAtSeconds = continueDoc.watchedSeconds ?? 0;
    seasonNum = continueDoc.season;
    episodeNum = continueDoc.episode;
    resolvedSeriesId = continueDoc.seriesId ?? seriesId;
  } else if (episodeDoc != null) {
    rawVideoUrl = episodeDoc.videoUrl;
    driveType = episodeDoc.driveType;
    // episodes store tmdb_id as Integer — convert to String for continue_watching
    tmdbId = episodeDoc.tmdbId?.toString();
    title = episodeDoc.title;
    contentType = 'episode';
    imageUrl = episodeDoc.thumbnail;
    startAtSeconds = 0;
    seasonNum = episodeDoc.seasonNumber;
    episodeNum = episodeDoc.episodeNumber;
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

  // ─── 2. Build the final playback URL based on drive_type ────────────────────

  String finalPlayUrl = rawVideoUrl;

  if (!rawVideoUrl.startsWith('http')) {
    if (driveType == 'gdrive') {
      finalPlayUrl =
          'https://shahcomplex.sa-syedali2000.workers.dev/?id=$rawVideoUrl';
    } else {
      // onedrive or any other non-gdrive source
      finalPlayUrl =
          'https://shahcomplex.sa-syedali2000.workers.dev/?source=onedrive&file_id=$rawVideoUrl&key=Pappu@007';
    }
  }

  // ─── 3. Launch the native player via MethodChannel ──────────────────────────

  const platform = MethodChannel('com.syedlord.shahcomplex/external_player');
  Map<dynamic, dynamic>? result;

  try {
    result =
        await platform.invokeMethod<Map<dynamic, dynamic>>('launchPlayer', {
      'url': finalPlayUrl,
      'startPositionMs': startAtSeconds * 1000,
    });
  } on PlatformException {
    // Player closed without returning data (e.g. user pressed Back immediately)
    return;
  }

  if (result == null) return;

  // ─── 4. Calculate progress ───────────────────────────────────────────────────

  final int watchedMs = (result['watched_ms'] as int?) ?? 0;
  final int totalMs = (result['total_ms'] as int?) ?? 0;
  final int watchedSeconds = (watchedMs / 1000).round();
  final int totalSeconds = totalMs > 0 ? (totalMs / 1000).round() : 0;

  // Ignore if user barely touched it
  if (watchedSeconds < 10) return;

  final double progressPercent = totalSeconds > 0
      ? (watchedSeconds / totalSeconds * 100).clamp(0.0, 100.0)
      : 0.0;

  final bool isFinished = progressPercent > 90.0;

  // ─── 5. Build the Firestore document path ───────────────────────────────────
  // Format: continue_watching/{profileId}/items/{tmdbId}_{season}_{episode}

  final String docId =
      '${tmdbId ?? "unknown"}_${seasonNum?.toString() ?? ""}_${episodeNum?.toString() ?? ""}';

  final DocumentReference itemRef = FirebaseFirestore.instance
      .collection('continue_watching')
      .doc(profileId)
      .collection('items')
      .doc(docId);

  // ─── 6. Write progress or handle completion ──────────────────────────────────

  if (!isFinished) {
    // Save progress
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
      'season': seasonNum ?? 0,
      'episode': episodeNum ?? 0,
      'drive_type': driveType ?? '',
    }, SetOptions(merge: true));
    return;
  }

  // ─── 7. Episode finished (>90%) — auto-queue next episode ───────────────────

  // Delete the finished item regardless of type
  await itemRef.delete();

  if (contentType != 'episode' || resolvedSeriesId == null) return;

  // Try to find next episode: same season, episode + 1
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

  // If not found, try first episode of next season
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

  // Nothing left to queue (series finished)
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

  // Queue next episode with 0 progress
  await FirebaseFirestore.instance
      .collection('continue_watching')
      .doc(profileId)
      .collection('items')
      .doc(nextDocId)
      .set({
    'tmdb_id': tmdbId ?? '',
    'title': nextTitle,
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
