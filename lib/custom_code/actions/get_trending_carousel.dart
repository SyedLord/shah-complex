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
    QuerySnapshot movieSnapshot = await FirebaseFirestore.instance
        .collection('movies')
        .where('is_trending', isEqualTo: true)
        .limit(3)
        .get();

    for (var doc in movieSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      carouselItems.add(HeroItemStruct(
        title: data['title'] ?? 'Unknown Movie',
        // Aapke DB ka exact field name: 'backdrop_image'
        image: data['backdrop_image'] ??
            data['poster_image'] ??
            'https://via.placeholder.com/1280x720.png?text=No+Image',
        // Aapke DB mein 'category' hai (e.g., "Hollywood"). Isay hum list mein daal kar bhej rahe hain taake UI na toote.
        genres: data['category'] != null ? [data['category']] : [],
        contentType: 'movie',
        // Aapke DB ka exact field name: 'video_url'
        videoLink: data['video_url'] ?? '',
      ));
    }

    // ==========================================
    // 2. SERIES UTHAYEN
    // ==========================================
    QuerySnapshot seriesSnapshot = await FirebaseFirestore.instance
        .collection('series')
        .where('is_trending', isEqualTo: true)
        .limit(3)
        .get();

    for (var doc in seriesSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      carouselItems.add(HeroItemStruct(
        title: data['title'] ?? 'Unknown Series',
        image: data['backdrop_image'] ??
            data['poster_image'] ??
            'https://via.placeholder.com/1280x720.png?text=No+Image',
        genres: data['category'] != null ? [data['category']] : [],
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
