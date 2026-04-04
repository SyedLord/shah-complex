// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> getOneDriveDirectLink(String sharedUrl) async {
  try {
    // 1. URL ko clean karna
    String cleanUrl = sharedUrl.split('?')[0];

    // 2. URL ko Microsoft Graph API wale Base64 format mein convert karna
    List<int> urlBytes = utf8.encode(cleanUrl);
    String base64String = base64Url.encode(urlBytes);
    String encodedUrl =
        base64String.replaceAll('=', ''); // Padding remove karna
    String shareId = 'u!$encodedUrl';

    // 3. Microsoft Graph API ko hit karna (Public links ke liye begair token ke chal jata hai)
    String apiUrl =
        'https://graph.microsoft.com/v1.0/shares/$shareId/driveItem';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Agar direct download link mil gaya to return kar do
      if (data.containsKey('@microsoft.graph.downloadUrl')) {
        return data['@microsoft.graph.downloadUrl'];
      }
    }
    // Agar nahi mila to null return karo
    print('Microsoft API Error: ${response.body}');
    return null;
  } catch (e) {
    print('Custom Action Error: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
