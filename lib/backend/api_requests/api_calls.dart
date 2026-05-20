import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class InitSafepayPaymentCall {
  static Future<ApiCallResponse> call({
    int? price,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'InitSafepayPaymentCall',
        'variables': {
          'price': price,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? sessiontracker(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.tracker.token''',
      ));
}

class CreateAuthTokenCall {
  static Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateAuthTokenCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic tbtToken(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
