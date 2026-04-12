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
  // Wo list jisme hum movies aur series mix karenge
  List<HeroItemStruct> carouselItems = [];

  try {
    // ==========================================
    // 1. MOVIES UTHAYEN (Max 3)
    // ==========================================
    QuerySnapshot movieSnapshot = await FirebaseFirestore.instance
        .collection(
            'movies') // Agar database mein naam alag hai to yahan change karein
        // .orderBy('rating', descending: true) // Agar trending nikalni hai to is line ko un-comment karein
        .limit(3)
        .get();

    for (var doc in movieSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // Movie ka data HeroItem mein fit karna
      carouselItems.add(HeroItemStruct(
        title: data['title'] ?? 'Unknown Movie',
        image: data['image'] ??
            '', // Agar field ka naam poster hai to 'image' ki jagah 'poster' likhein
        genres: data['genres'] != null ? List<String>.from(data['genres']) : [],
        contentType: 'movie',
        videoLink:
            data['video_id'] ?? '', // Apni video field ka naam yahan likhein
        // seriesRef khali rahega kyunke ye movie hai
      ));
    }

    // ==========================================
    // 2. SERIES UTHAYEN (Max 3)
    // ==========================================
    QuerySnapshot seriesSnapshot = await FirebaseFirestore.instance
        .collection(
            'series') // Agar collection ka naam alag hai to change karein
        // .orderBy('rating', descending: true)
        .limit(3)
        .get();

    for (var doc in seriesSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // Series ka data HeroItem mein fit karna
      carouselItems.add(HeroItemStruct(
        title: data['title'] ?? 'Unknown Series',
        image: data['image'] ?? '',
        genres: data['genres'] != null ? List<String>.from(data['genres']) : [],
        contentType: 'series',
        seriesRef: doc
            .reference, // Is se humein play button par episode dhoondne mein madad milegi
        // videoLink khali rahega kyunke iski episodes alag collection mein hain
      ));
    }

    // ==========================================
    // 3. MIX KAREIN (Shuffle)
    // ==========================================
    // Is line se movies aur series aapas mein mix ho jayengi (jaise Movie, Series, Movie, Movie, Series)
    carouselItems.shuffle();

    return carouselItems;
  } catch (e) {
    print('Error fetching carousel data: $e');
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
