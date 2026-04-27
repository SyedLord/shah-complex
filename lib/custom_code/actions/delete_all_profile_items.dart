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

import 'package:cloud_firestore/cloud_firestore.dart';

Future deleteAllProfileItems(
  String collectionName,
  DocumentReference profileReference,
) async {
  final firestore = FirebaseFirestore.instance;

  try {
    // Is collection mein profile_ref wale saare documents dhoondho
    QuerySnapshot snapshot = await firestore
        .collection(collectionName)
        .where('profile_ref', isEqualTo: profileReference)
        .get();

    // Loop chala kar sab ko delete kar do
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    print('✅ All related documents deleted from $collectionName');
  } catch (e) {
    print('❌ Error deleting documents: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
