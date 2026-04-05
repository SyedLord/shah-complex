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

Future<dynamic> googleDriveLogin() async {
  final FlutterAppAuth appAuth = FlutterAppAuth();

  // Yahan apna NAYA Google Client ID daalein jo is app ke liye banaya ho
  final String clientId =
      '491007200119-idq8l6r70a53q4c40k8l7890agfpagqp.apps.googleusercontent.com';
  final String redirectUrl =
      'com.googleusercontent.apps.491007200119-idq8l6r70a53q4c40k8l7890agfpagqp:/oauth2redirect';

  try {
    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        clientId,
        redirectUrl,
        issuer: 'https://accounts.google.com',
        // 🌟 JADOO YAHAN HAI: YouTube ki jagah Drive ki readonly permission mang li!
        scopes: [
          'email',
          'profile',
          'https://www.googleapis.com/auth/drive.readonly'
        ],
        promptValues: ['consent', 'select_account'],
        additionalParameters: {'access_type': 'offline'},
      ),
    );

    if (result != null) {
      print("✅ Google Login Successful!");
      return {
        "accessToken": result.accessToken,
        "refreshToken": result.refreshToken
      };
    }
  } catch (e) {
    print("❌ Google Login Error: $e");
    return null;
  }
  return null;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
