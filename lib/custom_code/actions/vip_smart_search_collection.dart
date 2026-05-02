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

Future<List<MovieCollectionsRecord>> vipSmartSearchCollection(
  String? searchTerm,
  List<MovieCollectionsRecord>? allCollections,
) async {
  // Agar search bar khali hai, ya collections load nahi huin, to sab wapas bhej do
  if (searchTerm == null || searchTerm.trim().isEmpty) {
    return allCollections ?? [];
  }

  if (allCollections == null || allCollections.isEmpty) {
    return [];
  }

  // User ki search ko saaf karna (lowercase aur special characters/spaces hatana)
  String cleanSearch =
      searchTerm.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  // Collections filter karna
  List<MovieCollectionsRecord> filteredCollections =
      allCollections.where((collection) {
    // Database mein collection ka naam
    String collectionName = collection.name ?? '';

    // Collection name ko saaf karna
    String cleanName =
        collectionName.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

    // Check karna ke clean name mein search text match ho raha hai ya nahi
    return cleanName.contains(cleanSearch);
  }).toList();

  return filteredCollections;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
