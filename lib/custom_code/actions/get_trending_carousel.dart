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
        .limit(10)
        .get();

    for (var doc in movieSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // 🔥 NAYI LOGIC: Asli Genres uthao. Agar na mile to Category uthao.
      List<String> itemGenres = [];
      if (data['genres'] != null && (data['genres'] as List).isNotEmpty) {
        itemGenres = List<String>.from(data['genres']);
      } else if (data['category'] != null) {
        itemGenres = [data['category']]; // Fallback
      }

      carouselItems.add(HeroItemStruct(
        title: data['title'] ?? 'Unknown Movie',
        logoImage: data['logo_image'] ?? '',
        image: data['backdrop_image'] ??
            data['poster_image'] ??
            'https://via.placeholder.com/1280x720.png?text=No+Image',
        genres: itemGenres, // Yahan ab asli genres jayenge
        contentType: 'movie',
        movieRef: doc.reference,
        videoLink: data['video_url'] ?? '',
      ));
    }

    // ==========================================
    // 2. SERIES UTHAYEN
    // ==========================================
    QuerySnapshot seriesSnapshot = await FirebaseFirestore.instance
        .collection('series')
        .where('is_trending', isEqualTo: true)
        .limit(10)
        .get();

    for (var doc in seriesSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // 🔥 NAYI LOGIC: Asli Genres uthao.
      List<String> itemGenres = [];
      if (data['genres'] != null && (data['genres'] as List).isNotEmpty) {
        itemGenres = List<String>.from(data['genres']);
      } else if (data['category'] != null) {
        itemGenres = [data['category']]; // Fallback
      }

      carouselItems.add(HeroItemStruct(
        title: data['title'] ?? 'Unknown Series',
        logoImage: data['logo_image'] ?? '',
        image: data['backdrop_image'] ??
            data['poster_image'] ??
            'https://via.placeholder.com/1280x720.png?text=No+Image',
        genres: itemGenres, // Yahan ab asli genres jayenge
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
