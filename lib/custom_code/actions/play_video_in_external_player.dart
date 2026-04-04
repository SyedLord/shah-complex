// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io' show Platform;
import 'package:android_intent_plus/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';

Future playVideoInExternalPlayer(String videoUrl) async {
  try {
    if (Platform.isAndroid) {
      // Android ke liye jadu: MIME type 'video/*'
      // Ye OS ko batata hai ke "Open With" mein sirf Video Players dikhao
      final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: videoUrl,
        type: 'video/*',
      );
      await intent.launch();
    } else {
      // iOS (iPhone) ke liye fallback
      Uri url = Uri.parse(videoUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print("Could not launch video URL");
      }
    }
  } catch (e) {
    print("Error playing video: $e");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
