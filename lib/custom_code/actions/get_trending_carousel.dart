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

Future<List<HeroItemStruct>> getTrendingCarousel() async {
  List<HeroItemStruct> carouselItems = [];

  try {
    // ==========================================
    // 1. MOVIES UTHAYEN
    // ==========================================
    QuerySnapshot movieSnapshot =
        await FirebaseFirestore.instance.collection('movies').limit(3).get();

    for (var doc in movieSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // 🔥 VIP FIX: Check and add https:// if missing
      String imageUrl = data['image'] ?? '';
      if (imageUrl.isNotEmpty && !imageUrl.startsWith('http')) {
        // Agar link kisi slash (/) se shuru ho raha hai TMDB API ki tarah
        if (imageUrl.startsWith('/')) {
          imageUrl = 'https://image.tmdb.org/t/p/w500' + imageUrl;
        } else {
          imageUrl = 'https://' + imageUrl;
        }
      }

      carouselItems.add(HeroItemStruct(
        title: data['title'] ?? 'Unknown Movie',
        image: imageUrl,
        genres: data['genres'] != null ? List<String>.from(data['genres']) : [],
        contentType: 'movie',
        videoLink: data['video_id'] ?? '',
      ));
    }

    // ==========================================
    // 2. SERIES UTHAYEN
    // ==========================================
    QuerySnapshot seriesSnapshot =
        await FirebaseFirestore.instance.collection('series').limit(3).get();

    for (var doc in seriesSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // 🔥 VIP FIX: Check and add https:// if missing
      String imageUrl = data['image'] ?? '';
      if (imageUrl.isNotEmpty && !imageUrl.startsWith('http')) {
        if (imageUrl.startsWith('/')) {
          imageUrl = 'https://image.tmdb.org/t/p/w500' + imageUrl;
        } else {
          imageUrl = 'https://' + imageUrl;
        }
      }

      carouselItems.add(HeroItemStruct(
        title: data['title'] ?? 'Unknown Series',
        image: imageUrl,
        genres: data['genres'] != null ? List<String>.from(data['genres']) : [],
        contentType: 'series',
        seriesRef: doc.reference,
      ));
    }

    // ==========================================
    // 3. MIX KAREIN (Shuffle)
    // ==========================================
    carouselItems.shuffle();

    return carouselItems;
  } catch (e) {
    print('Error fetching carousel data: $e');
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
