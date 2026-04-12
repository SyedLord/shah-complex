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
