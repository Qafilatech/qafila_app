import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeocodingAndoidCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lng,
    String? apiKey = 'AIzaSyBMwBGynKTbtb1lutB-9BvMXxTmrNYoN7s',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Geocoding Andoid',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? address(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?;
}

class GeocodingIOSCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lng,
    String? apiKey = 'AIzaSyCX-tNBeRrqwCim7XsOr1FMzQOHG12CphE',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Geocoding IOS',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? formattedAddress(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?;
  static List? addressShort(dynamic response) => getJsonField(
        response,
        r'''$.results[:].address_components[:].short_name''',
        true,
      ) as List?;
  static List? addressLong(dynamic response) => getJsonField(
        response,
        r'''$.results[:].address_components[:].long_name''',
        true,
      ) as List?;
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
