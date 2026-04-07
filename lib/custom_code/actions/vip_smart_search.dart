// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MoviesRecord>> vipSmartSearch(
  String? searchTerm,
  List<MoviesRecord>? allMovies,
) async {
  // Agar search bar khali hai, ya movies load nahi huin, to sab wapas bhej do
  if (searchTerm == null || searchTerm.trim().isEmpty) {
    return allMovies ?? [];
  }

  if (allMovies == null || allMovies.isEmpty) {
    return [];
  }

  // User ki search ko saaf karna (lowercase aur special characters/spaces hatana)
  String cleanSearch =
      searchTerm.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  // Movies filter karna
  List<MoviesRecord> filteredMovies = allMovies.where((movie) {
    // Database mein movie ka jo bhi title field hai (yahan 'title' likha hai, agar aapne 'name' rakha hai to change kar lein)
    String movieTitle = movie.title ?? '';

    // Movie title ko bhi wese hi saaf karna jese search ko kiya
    String cleanTitle =
        movieTitle.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

    // Ab check karna ke kya saaf kiye hue title mein search text aata hai
    return cleanTitle.contains(cleanSearch);
  }).toList();

  return filteredMovies;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
