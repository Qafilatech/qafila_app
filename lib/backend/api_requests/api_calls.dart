import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start PostgraesGroup Group Code

class PostgraesGroupGroup {
  static String getBaseUrl() => '10.128.14.185:3001';
  static Map<String, String> headers = {};
  static GetTestCall getTestCall = GetTestCall();
}

class GetTestCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PostgraesGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetTest',
      apiUrl: '${baseUrl}/api/v1/auth/health',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

/// End PostgraesGroup Group Code

class GeocodingAndoidCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lng,
    String? apiKey = 'AIzaAIzaSyDAEAbHKxyho9-K0MPATyG76VjCRdX5BR0',
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
    String? apiKey = 'AIzaSAIzaSyBd-QNrKLT_VWUbyXRvUNKQnExJrAM9Dtk',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Geocoding IOS',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': apiKey,
      },
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

class GeocodingWEBCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lng,
    String? apiKey = 'AIzaSyD59lDYEREVHxOmkgCIOBBomQqvmVWOKfI',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Geocoding WEB',
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
}

class GetGoogleDirectionsCall {
  static Future<ApiCallResponse> call({
    String? origin = '',
    String? destination = '',
    String? waypoints = '',
    String? apiKey = 'https://maps.googleapis.com/maps/api/directions/json',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGoogleDirections',
      apiUrl: 'https://maps.googleapis.com/maps/api/directions/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'origin': origin,
        'destination': destination,
        'waypoints': waypoints,
        'key': apiKey,
        'mode': "DRIVING",
        'avoid': "tolls",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
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
