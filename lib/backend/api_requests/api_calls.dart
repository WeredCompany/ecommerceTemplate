import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PostOrderCall {
  static Future<ApiCallResponse> call({
    String? contactName = '',
    String? contactEmail = '',
    String? contactLastname = '',
    dynamic? productsJson,
  }) async {
    final products = _serializeJson(productsJson);
    final ffApiRequestBody = '''
{
  "contact_name": "${contactName}",
  "contact_lastname": "${contactLastname}",
  "contact_email": "${contactEmail}",
  "payment_status": "unpaid",
  "products": ${products}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postOrder',
      apiUrl: 'https://api.tiendanube.com/v1/4618329/draft_orders',
      callType: ApiCallType.POST,
      headers: {
        'Authentication': 'bearer 2f964227124e040643fb066c8890ec16dd12d248',
        'User-Agent': 'E-Commerce App (info@weredco.com)',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? oID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? cEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.contact_email''',
      ));
  static String? cName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.contact_name''',
      ));
  static String? oTotal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.total_spent''',
      ));
  static String? oCurrancy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.total_spent_currency''',
      ));
  static String? oCheckout(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.checkout_url''',
      ));
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
