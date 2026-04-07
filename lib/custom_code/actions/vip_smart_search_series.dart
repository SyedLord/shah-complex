// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<SeriesRecord>> vipSmartSearchSeries(
  String? searchTerm,
  List<SeriesRecord>? allSeries,
) async {
  if (searchTerm == null || searchTerm.trim().isEmpty) {
    return allSeries ?? [];
  }

  if (allSeries == null || allSeries.isEmpty) {
    return [];
  }

  String cleanSearch =
      searchTerm.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  List<SeriesRecord> filteredSeries = allSeries.where((seriesItem) {
    // Yahan check karein ke series ke naam wala field Firestore mein kya hai (maslan 'title' ya 'name')
    String seriesTitle = seriesItem.title ?? '';

    String cleanTitle =
        seriesTitle.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

    return cleanTitle.contains(cleanSearch);
  }).toList();

  return filteredSeries;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
