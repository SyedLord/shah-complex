// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_appauth/flutter_appauth.dart';

Future<String?> refreshGoogleToken(String refreshToken) async {
  final FlutterAppAuth appAuth = FlutterAppAuth();
  // Wahi Google Client ID jo pehle use ki thi
  final String clientId =
      '491007200119-idq8l6r70a53q4c40k8l7890agfpagqp.apps.googleusercontent.com';
  final String redirectUrl =
      'com.googleusercontent.apps.491007200119-idq8l6r70a53q4c40k8l7890agfpagqp:/oauth2redirect';

  try {
    final TokenResponse? result = await appAuth.token(TokenRequest(
      clientId,
      redirectUrl,
      refreshToken: refreshToken,
      issuer: 'https://accounts.google.com',
    ));

    if (result != null) {
      print("✅ Google Token Refreshed!");
      return result.accessToken; // Naya 1 ghante wala token
    }
  } catch (e) {
    print("❌ Refresh Google Token Error: $e");
    return null;
  }
  return null;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
