import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> generateSeasonList(int totalSeasons) {
  // Ye function 1 se le kar totalSeasons tak string list banayega. Agar 4 diya to ["1", "2", "3", "4"]
  return List<String>.generate(totalSeasons, (i) => (i + 1).toString());
}

int stringToInt(String val) {
  return int.parse(val);
}

String formatGenres(List<String>? genreList) {
  // Agar list khali hai to kuch mat dikhao
  if (genreList == null || genreList.isEmpty) {
    return '';
  }
  // List ke har item ke darmiyan dot laga kar ek text bana do
  return genreList.join(' • ');
}

double calculateProgressRatio(
  int? watched,
  int? total,
) {
  // Agar values null hon ya total zero ho, to error se bachne k liye 0.0 return kro
  if (watched == null || total == null || total <= 0) {
    return 0.0;
  }

  // Ratio calculate kro
  double ratio = watched / total;

  // Make sure kro k value hamesha 0.0 aur 1.0 k darmian he rahey (progress bar UI kharab na ho)
  if (ratio > 1.0) {
    return 1.0;
  } else if (ratio < 0.0) {
    return 0.0;
  }

  return ratio;
}

DocumentReference getContinueWatchingRef(DocumentReference profileRef) {
  // Ye profileRef me se ID nikal kar continue_watching ka naya rasta bana dega
  return FirebaseFirestore.instance
      .collection('continue_watching')
      .doc(profileRef.id);
}

MoviesRecord? emptyMovieDoc() {
  return null;
}

EpisodesRecord? emptyEpisodeDoc() {
  return null;
}

ItemsRecord? emptyContinueDoc() {
  return null;
}

DateTime getStartOfDay() {
  // Aaj ka current time nikalna
  final now = DateTime.now();
  // Time ko hata kar sirf aaj ki date aur raat 12:00 baje return karna
  return DateTime(now.year, now.month, now.day);
}

DateTime getNewExpiryDate() {
  // Current time mein 30 din add kar ke return kar raha hai
  return DateTime.now().add(Duration(days: 30));
}
