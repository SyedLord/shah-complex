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

Future<dynamic> oneDriveLogin() async {
  final FlutterAppAuth appAuth = FlutterAppAuth();

  // Ye aapki wahi Azure app ki Client ID hai jo humne server ke liye banayi thi
  final String clientId = '11603a39-a52b-42ea-9d41-6630daffb0d6';
  final String redirectUrl =
      'com.googleusercontent.apps.491007200119-idq8l6r70a53q4c40k8l7890agfpagqp://oauth2redirect';

  try {
    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        clientId,
        redirectUrl,
        // Microsoft ke liye common discovery URL use hota hai
        discoveryUrl:
            'https://login.microsoftonline.com/common/v2.0/.well-known/openid-configuration',
        // 🌟 'offline_access' zaroori hai refresh token ke liye, aur 'Files.Read' OneDrive access ke liye
        scopes: ['openid', 'profile', 'email', 'offline_access', 'Files.Read'],
      ),
    );

    if (result != null) {
      print("✅ OneDrive Login Successful!");
      return {
        "accessToken": result.accessToken,
        "refreshToken": result.refreshToken
      };
    }
  } catch (e) {
    print("❌ OneDrive Login Error: $e");
    return null;
  }
  return null;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
