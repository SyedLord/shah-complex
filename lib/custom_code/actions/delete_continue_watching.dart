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

Future deleteContinueWatching(String profileId) async {
  final firestore = FirebaseFirestore.instance;

  try {
    // 1. Us specific profile document ka reference banayen
    DocumentReference parentDocRef =
        firestore.collection('continue_watching').doc(profileId);

    // 2. Uske andar mojood "items" subcollection nikalen
    QuerySnapshot itemsSnapshot = await parentDocRef.collection('items').get();

    // 3. Subcollection ke saare documents ko ek ek kar ke delete karein
    for (var doc in itemsSnapshot.docs) {
      await doc.reference.delete();
    }
    print('✅ Subcollection items deleted for profile: $profileId');

    // 4. Aakhir mein parent document ko delete kar dein
    await parentDocRef.delete();
    print(
        '✅ Parent continue_watching document deleted for profile: $profileId');
  } catch (e) {
    print('❌ Error deleting continue_watching data: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
