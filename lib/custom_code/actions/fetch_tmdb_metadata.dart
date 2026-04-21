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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchTmdbMetadata(
  String? inputUrl,
  String mediaType,
) async {
  // 1. Agar input khali hai to wapas jao
  if (inputUrl == null || inputUrl.isEmpty) return null;

  // 2. ID Extract karna (Number ho ya puri link)
  String tmdbId = "";
  if (RegExp(r'^\d+$').hasMatch(inputUrl)) {
    tmdbId = inputUrl;
  } else {
    RegExp regExp = RegExp(r'(?:movie|tv)/(\d+)');
    Match? match = regExp.firstMatch(inputUrl);
    if (match != null) {
      tmdbId = match.group(1) ?? "";
    } else {
      RegExp numRegExp = RegExp(r'\d+');
      Match? numMatch = numRegExp.firstMatch(inputUrl);
      if (numMatch != null) tmdbId = numMatch.group(0) ?? "";
    }
  }

  // Agar ID nahi mili to ruk jao
  if (tmdbId.isEmpty) return null;

  // 3. TMDB API ko hit karna
  String apiKey =
      "c5668e874013b9df2a50fba06875a331"; // Aapki script wali API key
  String url = "";

  if (mediaType.toLowerCase() == 'movie') {
    url =
        "https://api.themoviedb.org/3/movie/$tmdbId?api_key=$apiKey&append_to_response=images,release_dates";
  } else {
    url =
        "https://api.themoviedb.org/3/tv/$tmdbId?api_key=$apiKey&append_to_response=images,content_ratings";
  }

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // 4. Data mil gaya! Ise JSON bana kar wapas bhej do
      return jsonDecode(response.body);
    } else {
      print("TMDB Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("API hit karne mein masla: $e");
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
