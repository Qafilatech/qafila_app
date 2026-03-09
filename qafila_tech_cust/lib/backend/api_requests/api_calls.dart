import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Qafila Platform API Group Code

class QafilaPlatformAPIGroup {
  static String getBaseUrl() => 'http://localhost:3001';
  static Map<String, String> headers = {};
  static GetHealthCall getHealthCall = GetHealthCall();
  static GetDetailedHealthCall getDetailedHealthCall = GetDetailedHealthCall();
  static SignupCall signupCall = SignupCall();
  static LoginCall loginCall = LoginCall();
  static LogoutCall logoutCall = LogoutCall();
  static GetCurrentUserCall getCurrentUserCall = GetCurrentUserCall();
  static ListOrdersCall listOrdersCall = ListOrdersCall();
  static CreateOrderCall createOrderCall = CreateOrderCall();
  static GetOrderCall getOrderCall = GetOrderCall();
  static CancelOrderCall cancelOrderCall = CancelOrderCall();
  static ListDriversCall listDriversCall = ListDriversCall();
  static ListAvailableDriversCall listAvailableDriversCall =
      ListAvailableDriversCall();
  static RegisterDriverCall registerDriverCall = RegisterDriverCall();
  static GetDriverCall getDriverCall = GetDriverCall();
  static UpdateDriverCall updateDriverCall = UpdateDriverCall();
  static UpdateDriverStatusCall updateDriverStatusCall =
      UpdateDriverStatusCall();
  static GetDriverOrdersCall getDriverOrdersCall = GetDriverOrdersCall();
  static ListBusinessesCall listBusinessesCall = ListBusinessesCall();
  static ListUsersCall listUsersCall = ListUsersCall();
}

class GetHealthCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getHealth',
      apiUrl: '${baseUrl}/health',
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

class GetDetailedHealthCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getDetailedHealth',
      apiUrl: '${baseUrl}/health/detailed',
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

class SignupCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "",
  "password": "",
  "name": "",
  "phone": "",
  "user_type": "customer",
  "tenantId": "",
  "address": "",
  "company_name": "",
  "company_address": "",
  "license_number": "",
  "driver_type": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signup',
      apiUrl: '${baseUrl}/api/v1/auth/signup',
      callType: ApiCallType.POST,
      headers: {},
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
}

class LoginCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "",
  "password": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${baseUrl}/api/v1/auth/login',
      callType: ApiCallType.POST,
      headers: {},
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
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? stAuthToken = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '${baseUrl}/api/v1/auth/logout',
      callType: ApiCallType.POST,
      headers: {
        'st-auth-token': '${stAuthToken}',
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
}

class GetCurrentUserCall {
  Future<ApiCallResponse> call({
    String? stAuthToken = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getCurrentUser',
      apiUrl: '${baseUrl}/api/v1/auth/user',
      callType: ApiCallType.GET,
      headers: {
        'st-auth-token': '${stAuthToken}',
      },
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

class ListOrdersCall {
  Future<ApiCallResponse> call({
    String? status = '',
    int? page,
    int? limit,
    String? stAuthToken = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listOrders',
      apiUrl: '${baseUrl}/api/orders',
      callType: ApiCallType.GET,
      headers: {
        'st-auth-token': '${stAuthToken}',
      },
      params: {
        'status': status,
        'page': page,
        'limit': limit,
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

class CreateOrderCall {
  Future<ApiCallResponse> call({
    String? stAuthToken = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "business_id": 0,
  "cargo_type": "",
  "cargo_description": "",
  "pickup_datetime": "",
  "dropoff_datetime": "",
  "special_instructions": "",
  "orderLocations": [
    {
      "address": "",
      "latitude": 0,
      "longitude": 0,
      "location_type": "pickup"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOrder',
      apiUrl: '${baseUrl}/api/orders',
      callType: ApiCallType.POST,
      headers: {
        'st-auth-token': '${stAuthToken}',
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
}

class GetOrderCall {
  Future<ApiCallResponse> call({
    int? id,
    String? stAuthToken = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getOrder',
      apiUrl: '${baseUrl}/api/orders/${id}',
      callType: ApiCallType.GET,
      headers: {
        'st-auth-token': '${stAuthToken}',
      },
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

class CancelOrderCall {
  Future<ApiCallResponse> call({
    int? id,
    String? stAuthToken = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelOrder',
      apiUrl: '${baseUrl}/api/orders/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        'st-auth-token': '${stAuthToken}',
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
}

class ListDriversCall {
  Future<ApiCallResponse> call({
    String? status = '',
    String? driverType = '',
    int? businessId,
    int? page,
    int? limit,
    String? search = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listDrivers',
      apiUrl: '${baseUrl}/api/truckers',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'status': status,
        'driver_type': driverType,
        'business_id': businessId,
        'page': page,
        'limit': limit,
        'search': search,
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

class ListAvailableDriversCall {
  Future<ApiCallResponse> call({
    int? businessId,
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listAvailableDrivers',
      apiUrl: '${baseUrl}/api/truckers/available/list',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'business_id': businessId,
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

class RegisterDriverCall {
  Future<ApiCallResponse> call({
    String? stAuthToken = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": 0,
  "business_id": 0,
  "license_number": "",
  "driver_type": "",
  "status": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerDriver',
      apiUrl: '${baseUrl}/api/truckers/register',
      callType: ApiCallType.POST,
      headers: {
        'st-auth-token': '${stAuthToken}',
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
}

class GetDriverCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getDriver',
      apiUrl: '${baseUrl}/api/truckers/${id}',
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

class UpdateDriverCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "license_number": "",
  "driver_type": "",
  "status": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateDriver',
      apiUrl: '${baseUrl}/api/truckers/${id}',
      callType: ApiCallType.PUT,
      headers: {},
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
}

class UpdateDriverStatusCall {
  Future<ApiCallResponse> call({
    int? id,
    String? stAuthToken = '',
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "status": "available"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateDriverStatus',
      apiUrl: '${baseUrl}/api/truckers/${id}/status',
      callType: ApiCallType.PATCH,
      headers: {
        'st-auth-token': '${stAuthToken}',
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
}

class GetDriverOrdersCall {
  Future<ApiCallResponse> call({
    int? id,
    int? page,
    int? limit,
  }) async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getDriverOrders',
      apiUrl: '${baseUrl}/api/truckers/${id}/orders',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
        'limit': limit,
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

class ListBusinessesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listBusinesses',
      apiUrl: '${baseUrl}/api/business',
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

class ListUsersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QafilaPlatformAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'listUsers',
      apiUrl: '${baseUrl}/api/users',
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

/// End Qafila Platform API Group Code

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

  static List<String>? formattedAddress(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

class AddressTestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'AddressTest',
      apiUrl:
          'https://places.googleapis.com/v1/places/ChIJY41-oqABjj4R-9JoDGPLh2Y?fields=id,displayName&key=AIzaSyApqmfzSPzjeN3jF75DREZ0kUUswFUNTn0',
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
