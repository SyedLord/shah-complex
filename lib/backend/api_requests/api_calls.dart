import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class InitSafepayPaymentCall {
  static Future<ApiCallResponse> call({
    double? price = 500,
  }) async {
    final ffApiRequestBody = '''
{
  "merchant_api_key": "sec_cf9a9c22-e407-40bf-b8eb-95cc44d53bb6",
  "intent": "CYBERSOURCE",
  "mode": "payment",
  "currency": "PKR",
  "amount": ${price}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InitSafepayPayment',
      apiUrl: 'https://sandbox.api.getsafepay.com/order/payments/v3/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 35d5b19a7acec1b416d383d850069f1cb8726f038e05ac23e8cf0c8d81dde928',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? sessiontracker(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.tracker.token''',
      ));
}

class CreateAuthTokenCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'CreateAuthToken',
      apiUrl: 'https://sandbox.api.getsafepay.com/client/passport/v1/token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 35d5b19a7acec1b416d383d850069f1cb8726f038e05ac23e8cf0c8d81dde928',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
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
