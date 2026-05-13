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

import 'package:package_info_plus/package_info_plus.dart';

Future<int> getAppBuildNumber() async {
  try {
    // Phone se app ki info fetch kar raha hai
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // Build Number normally string hota hai, isey number (integer) banayen
    return int.tryParse(packageInfo.buildNumber) ?? 1;
  } catch (e) {
    print('Error getting build number: $e');
    return 1; // Agar koi masla aye to default 1 assume karega
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
