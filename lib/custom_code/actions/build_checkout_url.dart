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

Future<String> buildCheckoutUrl(
  String trackerToken,
  String tbtToken,
) async {
  // Defensive check: Agar FlutterFlow ne token ke ird-gird extra quotes (") laga diye hain toh unhein hata dain
  String cleanTracker = trackerToken.replaceAll('"', '').trim();
  String cleanTbt = tbtToken.replaceAll('"', '').trim();

  const redirectUrl = 'shahcomplex://shahcomplex.com/subscriptionPage';
  const cancelUrl = 'shahcomplex://shahcomplex.com/subscriptionPage';

  // Uri automatically sab kuch URL-Encode kar deta hai (== aur :// ko safe bana deta hai)
  final uri = Uri(
    scheme: 'https',
    host: 'sandbox.api.getsafepay.com',
    path: '/embedded/checkout/v2/activity',
    queryParameters: {
      'env': 'sandbox',
      'tracker': cleanTracker,
      'tbt': cleanTbt,
      'source': 'mobile',
      'redirect_url': redirectUrl,
      'cancel_url': cancelUrl,
    },
  );

  return uri.toString();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
