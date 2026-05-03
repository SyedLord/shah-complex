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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> generateWebStreamUrl(
  String? rawVideoUrl,
  String? driveType,
  String? profileId,
) async {
  // Agar URL khaali hai toh wapas bhej do
  if (rawVideoUrl == null || rawVideoUrl.isEmpty) {
    return '';
  }

  // Agar pehle se direct link hai, toh wahi wapas kar do
  if (rawVideoUrl.startsWith('http')) {
    return rawVideoUrl;
  }

  // Worker se signed URL mangwao
  String finalPlayUrl = '';
  final source = driveType == 'gdrive' ? 'gdrive' : 'onedrive';
  final safeProfileId = profileId ?? 'web_user';

  try {
    final tokenUri = Uri.parse(
      'https://shahcomplex.sa-syedali2000.workers.dev/generate-token'
      '?file_id=${Uri.encodeComponent(rawVideoUrl)}'
      '&source=$source'
      '&profile_id=${Uri.encodeComponent(safeProfileId)}',
    );

    final tokenResponse = await http.post(
      tokenUri,
      headers: {'X-Shah-App': 'ShahComplexSecret2024'},
    ).timeout(const Duration(seconds: 10));

    if (tokenResponse.statusCode == 200) {
      final data = jsonDecode(tokenResponse.body) as Map<String, dynamic>;
      finalPlayUrl = (data['stream_url'] as String?) ?? '';
    }
  } catch (e) {
    print('Web URL Generation Failed: $e');
  }

  return finalPlayUrl;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
