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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateMetadataDirectly(
  DocumentReference? docRefMovie,
  DocumentReference? docRefSeries,
  dynamic apiFullData,
  String mediaType,
) async {
  if (apiFullData == null) return;

  // 1. Faisla karna ke konsa Reference use karna hai
  DocumentReference? targetRef;
  if (mediaType.toLowerCase() == 'movie') {
    targetRef = docRefMovie;
  } else {
    targetRef = docRefSeries;
  }

  // Agar ghalti se reference pass nahi hua to action rok do
  if (targetRef == null) {
    print("❌ Error: Document Reference is missing!");
    return;
  }

  Map<String, dynamic> updates = {};

  try {
    // --- 2. COMMON FIELDS ---
    updates['tmdb_id'] = apiFullData['id'];

    if (apiFullData['overview'] != null &&
        apiFullData['overview'].toString().isNotEmpty) {
      updates['description'] = apiFullData['overview'];
    }

    if (apiFullData['poster_path'] != null) {
      updates['poster_image'] =
          'https://image.tmdb.org/t/p/w500${apiFullData['poster_path']}';
    }

    if (apiFullData['backdrop_path'] != null) {
      updates['backdrop_image'] =
          'https://image.tmdb.org/t/p/w1280${apiFullData['backdrop_path']}';
    }

    if (apiFullData['vote_average'] != null) {
      updates['vote_average'] =
          double.parse((apiFullData['vote_average']).toStringAsFixed(1));
    }

    if (apiFullData['genres'] != null) {
      updates['genres'] = (apiFullData['genres'] as List)
          .map((g) => g['name'].toString())
          .toList();
    }

    // --- 3. LOGO IMAGE EXTRACT ---
    if (apiFullData['images'] != null &&
        apiFullData['images']['logos'] != null) {
      List logos = apiFullData['images']['logos'];
      if (logos.isNotEmpty) {
        var enLogo = logos.firstWhere((l) => l['iso_639_1'] == 'en',
            orElse: () => logos[0]);
        updates['logo_image'] =
            'https://image.tmdb.org/t/p/w500${enLogo['file_path']}';
      }
    }

    // --- 4. MOVIE SPECIFIC ---
    if (mediaType.toLowerCase() == 'movie') {
      updates['title'] = apiFullData['title'] ?? '';

      if (apiFullData['release_date'] != null &&
          apiFullData['release_date'].toString().isNotEmpty) {
        updates['release_year'] = int.tryParse(
                apiFullData['release_date'].toString().split('-')[0]) ??
            0;
      }

      if (apiFullData['runtime'] != null) {
        int runtime = apiFullData['runtime'];
        int h = runtime ~/ 60;
        int m = runtime % 60;
        updates['duration'] =
            h > 0 ? (m > 0 ? "${h}h ${m}m" : "${h}h") : "${m}m";
      }

      String contentRating = "NR";
      if (apiFullData['release_dates'] != null &&
          apiFullData['release_dates']['results'] != null) {
        List results = apiFullData['release_dates']['results'];
        var usRelease = results.firstWhere((r) => r['iso_3166_1'] == 'US',
            orElse: () => null);
        if (usRelease != null &&
            usRelease['release_dates'] != null &&
            usRelease['release_dates'].isNotEmpty) {
          contentRating =
              usRelease['release_dates'][0]['certification'] ?? "NR";
        } else if (results.isNotEmpty &&
            results[0]['release_dates'] != null &&
            results[0]['release_dates'].isNotEmpty) {
          contentRating =
              results[0]['release_dates'][0]['certification'] ?? "NR";
        }
      }
      updates['content_rating'] = contentRating.isEmpty ? "NR" : contentRating;

      // --- 5. SERIES SPECIFIC ---
    } else {
      updates['title'] = apiFullData['name'] ?? '';

      if (apiFullData['first_air_date'] != null &&
          apiFullData['first_air_date'].toString().isNotEmpty) {
        updates['release_year'] = int.tryParse(
                apiFullData['first_air_date'].toString().split('-')[0]) ??
            0;
      }

      updates['total_seasons'] = apiFullData['number_of_seasons'] ?? 1;

      String contentRating = "NR";
      if (apiFullData['content_ratings'] != null &&
          apiFullData['content_ratings']['results'] != null) {
        List results = apiFullData['content_ratings']['results'];
        var usRating = results.firstWhere((r) => r['iso_3166_1'] == 'US',
            orElse: () => null);
        if (usRating != null) {
          contentRating = usRating['rating'] ?? "NR";
        } else if (results.isNotEmpty) {
          contentRating = results[0]['rating'] ?? "NR";
        }
      }
      updates['content_rating'] = contentRating.isEmpty ? "NR" : contentRating;
    }

    // --- 6. FIREBASE UPDATE (Magic!) ---
    // Yahan ab direct docRef ki jagah 'targetRef' use ho raha hai
    await targetRef.update(updates);
    print(
        "✅ Metadata successfully updated in ${mediaType.toUpperCase()} collection!");
  } catch (e) {
    print("❌ Error updating document: $e");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
