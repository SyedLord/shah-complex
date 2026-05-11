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
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String apiKey = "c5668e874013b9df2a50fba06875a331"; // TMDB API Key
  String tmdbIdStr = apiFullData['id'].toString();

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

      // 🔥 SMART COLLECTION LOGIC (ONLY FOR MOVIES) 🔥
      if (apiFullData['belongs_to_collection'] != null) {
        var colInfo = apiFullData['belongs_to_collection'];
        int colId = colInfo['id'];
        String colName = colInfo['name'] ?? '';
        String colPoster = colInfo['poster_path'] != null
            ? 'https://image.tmdb.org/t/p/w500${colInfo['poster_path']}'
            : '';
        String colBackdrop = colInfo['backdrop_path'] != null
            ? 'https://image.tmdb.org/t/p/w1280${colInfo['backdrop_path']}'
            : '';

        String colUrl =
            "https://api.themoviedb.org/3/collection/$colId?api_key=$apiKey";

        try {
          final colRes = await http.get(Uri.parse(colUrl));
          if (colRes.statusCode == 200) {
            var colData = jsonDecode(colRes.body);
            int releasedCount = 0;
            DateTime now = DateTime.now();

            if (colData['parts'] != null) {
              for (var part in colData['parts']) {
                if (part['release_date'] != null &&
                    part['release_date'].toString().isNotEmpty) {
                  try {
                    DateTime releaseDate = DateTime.parse(part['release_date']);
                    if (releaseDate.isBefore(now) ||
                        releaseDate.isAtSameMomentAs(now)) {
                      releasedCount++;
                    }
                  } catch (e) {
                    // Ignore parsing error for bad dates
                  }
                }
              }
            }

            if (releasedCount > 1) {
              // ✅ Collection valid hai, check karein pehle se hai ya nahi
              QuerySnapshot colSnapshot = await FirebaseFirestore.instance
                  .collection('movie_collections')
                  .where('tmdb_id', isEqualTo: colId)
                  .limit(1)
                  .get();

              DocumentReference colRef;
              if (colSnapshot.docs.isEmpty) {
                // Nayi collection create karein
                colRef = await FirebaseFirestore.instance
                    .collection('movie_collections')
                    .add({
                  'tmdb_id': colId,
                  'name': colName,
                  'overview': colData['overview'] ?? '',
                  'poster_image': colPoster,
                  'backdrop_image': colBackdrop,
                });
                print("✨ Nayi Smart Collection ban gayi: $colName");
              } else {
                colRef = colSnapshot.docs.first.reference;
              }
              // Movie ko is collection se link karein
              updates['collection_ref'] = colRef;
              print("🔗 Movie linked to Collection: $colName");
            } else {
              // ⛔ Collection ignore karein
              updates['collection_ref'] = FieldValue.delete();
              print(
                  "⛔ SMART SKIP: '$colName' has 1 or 0 released parts. Skipped.");
            }
          }
        } catch (e) {
          print("❌ TMDB Collection check failed: $e");
        }
      } else {
        // Agar pehle kisi collection mein thi lekin ab API mein nahi, toh remove kar do
        updates['collection_ref'] = FieldValue.delete();
      }

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

    // --- 6. MAIN DOCUMENT UPDATE ---
    await targetRef.update(updates);
    print(
        "✅ Main Metadata successfully updated in ${mediaType.toUpperCase()} collection!");

    // --- 7. EPISODES SUBCOLLECTION UPDATE (NEW MAGIC 🪄) ---
    if (mediaType.toLowerCase() != 'movie') {
      print("🔄 Updating episodes subcollection...");

      // Get all existing episodes from Firestore
      QuerySnapshot episodesSnapshot =
          await targetRef.collection('episodes').get();

      for (var epDoc in episodesSnapshot.docs) {
        Map<String, dynamic> epData = epDoc.data() as Map<String, dynamic>;
        int? seasonNum = epData['season_number'];
        int? episodeNum = epData['episode_number'];

        if (seasonNum != null && episodeNum != null) {
          // TMDB API call for this specific episode
          String epUrl =
              "https://api.themoviedb.org/3/tv/$tmdbIdStr/season/$seasonNum/episode/$episodeNum?api_key=$apiKey";

          try {
            final response = await http.get(Uri.parse(epUrl));
            if (response.statusCode == 200) {
              var epApiData = jsonDecode(response.body);
              Map<String, dynamic> epUpdates = {};

              // Title update
              if (epApiData['name'] != null &&
                  epApiData['name'].toString().isNotEmpty) {
                epUpdates['title'] = epApiData['name'];
              }
              // Description update
              if (epApiData['overview'] != null &&
                  epApiData['overview'].toString().isNotEmpty) {
                epUpdates['description'] = epApiData['overview'];
              }
              // Thumbnail update
              if (epApiData['still_path'] != null) {
                epUpdates['thumbnail'] =
                    'https://image.tmdb.org/t/p/w500${epApiData['still_path']}';
              }
              // Duration update
              if (epApiData['runtime'] != null) {
                int runtime = epApiData['runtime'];
                int h = runtime ~/ 60;
                int m = runtime % 60;
                epUpdates['duration'] =
                    h > 0 ? (m > 0 ? "${h}h ${m}m" : "${h}h") : "${m}m";
              }

              // Update this episode in Firestore
              if (epUpdates.isNotEmpty) {
                await epDoc.reference.update(epUpdates);
                print("✅ Updated Season $seasonNum Episode $episodeNum");
              }
            }
          } catch (e) {
            print(
                "❌ Failed to update Season $seasonNum Episode $episodeNum: $e");
          }
        }
      }
      print("✅ All episodes updated successfully!");
    }
  } catch (e) {
    print("❌ Error updating document: $e");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
