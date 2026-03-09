import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';

List<LatLng> returnlatlng(List<double> doubles) {
  List<LatLng> result = [];
  for (int i = 0; i < doubles.length; i += 2) {
    result.add(LatLng(doubles[i], doubles[i + 1]));
  }
  return result;
}
