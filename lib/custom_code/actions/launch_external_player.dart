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
  String videoUrl,
  String tmdbId,
  String contentTitle,
  String contentType,
  int? totalSeconds,
  int? startAtSeconds,
  int? seasonNum,
  int? episodeNum,
  String imageUrl,
  String? seriesId,
  String profileId, // 🚀 NAYA PARAMETER ADD HOGAYA
) async {
  const platform = MethodChannel('com.syedlord.shahcomplex/external_player');
  final user = FirebaseAuth.instance.currentUser;

  // Agar user login nahi hai ya profileId khali hai, to aage mat barho
  if (user == null || profileId.isEmpty) return;

  try {
    final result = await platform.invokeMethod('launchPlayer', {
      'url': videoUrl,
      'startPositionMs': (startAtSeconds ?? 0) * 1000,
    });

    if (result == null) return;

    final watchedMs = result['watched_ms'] as int? ?? 0;
    final totalMs = result['total_ms'] as int? ?? 0;
    final watchedSeconds = (watchedMs / 1000).round();
    final totalSecondsActual =
        totalMs > 0 ? (totalMs / 1000).round() : totalSeconds ?? 0;

    if (watchedSeconds < 10) return;

    final progressPercent = totalSecondsActual > 0
        ? (watchedSeconds / totalSecondsActual * 100).clamp(0, 100)
        : 0.0;

    // 90% se zyada pe complete count hoga
    final isFinished = progressPercent > 90;

    final continueRef = FirebaseFirestore.instance
        .collection('continue_watching')
        .doc(profileId) // 🚀 YAHAN USER.UID KI JAGAH PROFILE ID AAGAYA
        .collection('items');

    final currentDocId = '${tmdbId}_${seasonNum ?? ""}_${episodeNum ?? ""}';
    final docRef = continueRef.doc(currentDocId);

    if (isFinished) {
      // 1. Purana episode list se hatayen
      await docRef.delete();

      // 2. NEXT EPISODE AUTO-QUEUE LOGIC 🚀
      if (contentType == 'episode' &&
          seriesId != null &&
          seasonNum != null &&
          episodeNum != null) {
        final episodesRef = FirebaseFirestore.instance
            .collection('series')
            .doc(seriesId)
            .collection('episodes');

        // Check: Kya isi season ka agla episode mojood hai?
        var nextEpQuery = await episodesRef
            .where('season_number', isEqualTo: seasonNum)
            .where('episode_number', isEqualTo: episodeNum + 1)
            .limit(1)
            .get();

        // Check: Agar nahi, to kya aglay season ka pehla episode mojood hai?
        if (nextEpQuery.docs.isEmpty) {
          nextEpQuery = await episodesRef
              .where('season_number', isEqualTo: seasonNum + 1)
              .where('episode_number', isEqualTo: 1)
              .limit(1)
              .get();
        }

        // Agar agla episode mil gaya, to usay list mein 0% progress k sath daal do!
        if (nextEpQuery.docs.isNotEmpty) {
          var nextEpData = nextEpQuery.docs.first.data();
          var nextEpNum = nextEpData['episode_number'];
          var nextSeasonNum = nextEpData['season_number'];

          await continueRef.doc('${tmdbId}_${nextSeasonNum}_${nextEpNum}').set({
            'tmdb_id': tmdbId,
            'title': nextEpData['title'] ?? contentTitle,
            'content_type': 'episode',
            'video_url': nextEpData['video_url'] ?? '',
            'image_url': nextEpData['thumbnail'] ?? imageUrl,
            'watched_seconds': 0,
            'total_seconds': 0,
            'progress_percent': 0.0,
            'season': nextSeasonNum,
            'episode': nextEpNum,
            'series_id': seriesId,
            'updated_at': FieldValue.serverTimestamp(),
          }, SetOptions(merge: true));
        }
      }
    } else {
      // Agar complete nahi hua, to bas current progress save karein
      await docRef.set({
        'tmdb_id': tmdbId,
        'title': contentTitle,
        'content_type': contentType,
        'video_url': videoUrl,
        'image_url': imageUrl,
        'watched_seconds': watchedSeconds,
        'total_seconds': totalSecondsActual,
        'progress_percent': progressPercent,
        'season': seasonNum,
        'episode': episodeNum,
        'series_id': seriesId,
        'updated_at': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  } on PlatformException catch (e) {
    print('Player closed: ${e.message}');
  }
}
