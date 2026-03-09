// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import '/backend/supabase/supabase.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import "package:community_testing_ryusdv/backend/schema/enums/enums.dart"
    as community_testing_ryusdv_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<LatLng>> getRoadRoute(
  LatLng start,
  LatLng end,
) async {
  // Replace with your actual Mapbox Access Token
  const String accessToken =
      'pk.eyJ1IjoidGFydGFyc2F1Y2UiLCJhIjoiY21rdG45dXFlMW10djNmczkwNXM3amFpaSJ9.d0HTHKdv5a3zfS2zwARLtQ';

  // Mapbox expects: longitude,latitude;longitude,latitude
  final url = Uri.parse(
      'https://api.mapbox.com/directions/v5/mapbox/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?geometries=geojson&access_token=$accessToken');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Mapbox returns "geometry" directly inside the first route
      final List<dynamic> coordinates =
          data['routes'][0]['geometry']['coordinates'];

      return coordinates
          .map((coord) => LatLng(coord[1].toDouble(), coord[0].toDouble()))
          .toList();
    } else {
      // Log the error so you know why it's failing
      print('Mapbox API Error: ${response.body}');
      return [start, end]; // Fallback to straight line
    }
  } catch (e) {
    print('Error fetching road route: $e');
    return [start, end];
  }
}
