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

import 'package:flutter/services.dart'; // System UI control karne ke liye

Future enableImmersiveMode() async {
  // Yeh line navigation bar aur status bar ko hide kar degi
  // Swipe karne par buttons temporary aayenge aur khud chale jayenge
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
