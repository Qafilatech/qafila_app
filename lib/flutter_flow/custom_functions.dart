import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? orderidcreate() {
  // need a function that creates ab order ID when called. the format should be alphanumerical with the first 2 being letters and the 4 remianing to be numbers
  final String letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String numbers = '0123456789';

  String orderId = '';

  // Generate first 2 letters
  for (int i = 0; i < 2; i++) {
    orderId += letters[math.Random().nextInt(letters.length)];
  }

  // Generate next 4 numbers
  for (int i = 0; i < 4; i++) {
    orderId += numbers[math.Random().nextInt(numbers.length)];
  }

  return orderId;
}

double priceCalcu(
  double gasPrice,
  int assist,
  String truckType,
  double distance,
) {
// Define the base price for the cargo
  double basePrice = 0.000;

  // Calculate price based on assistance
  if (assist > 0) {
    basePrice += 0.04 * distance;
  }

  // Calculate price based on truck type
  if (truckType == 'van') {
    basePrice += (0.08 + gasPrice) * distance;
  } else if (truckType == 'flatbed') {
    basePrice += (0.10 + gasPrice) * distance;
  } else if (truckType == 'boxtruck') {
    basePrice += (0.12 + gasPrice) * distance;
  } else if (truckType == 'semi-trailer') {
    basePrice += (0.14 + gasPrice) * distance;
  } else if (truckType == 'wheeler') {
    basePrice += (0.16 + gasPrice) * distance;
  }

  // Return the total price as a string
  return double.parse(basePrice.toStringAsFixed(3));
}

String? listOfChoiceChips(List<String>? choiceItems) {
  return choiceItems?.join(", ") ?? "No selected Items";
}

double? routeDistanceCalc(
  LatLng? pickUpLocation,
  LatLng? dropOffLocation,
) {
  // need a function to calculate the distance between two given points on the map
  if (pickUpLocation == null || dropOffLocation == null) {
    return null;
  }

  // Calculate the distance between two points using the Haversine formula
  const double earthRadius = 6371.0; // in kilometers

  double lat1 = pickUpLocation.latitude;
  double lon1 = pickUpLocation.longitude;
  double lat2 = dropOffLocation.latitude;
  double lon2 = dropOffLocation.longitude;

  double dLat = (lat2 - lat1) * (math.pi / 180);
  double dLon = (lon2 - lon1) * (math.pi / 180);

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1 * (math.pi / 180)) *
          math.cos(lat2 * (math.pi / 180)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distance = earthRadius * c;

  return distance; // Return distance rounded to 2 decimal places
}

int? routeDurationCalculator(
  LatLng? location1,
  LatLng? location2,
) {
  // need a function to calculate the duration between two given points on a map
  // need a function to calculate the duration between two given points on a map
  if (location1 == null || location2 == null) {
    return null;
  }

  const earthRadius = 6371; // Earth's radius in kilometers
  const averageSpeed = 100.0; // Average speed in km/h

  final lat1 = location1.latitude * (math.pi / 180);
  final lon1 = location1.longitude * (math.pi / 180);
  final lat2 = location2.latitude * (math.pi / 180);
  final lon2 = location2.longitude * (math.pi / 180);

  final dLat = lat2 - lat1;
  final dLon = lon2 - lon1;

  final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1) * math.cos(lat2) * math.sin(dLon / 2) * math.sin(dLon / 2);
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  final distance = earthRadius * c;
  final durationInHours = distance / averageSpeed;
  final durationInMinutes = (durationInHours * 60).round();

  return durationInMinutes;
}

List<double> latlngSplit(LatLng? location) {
  location ??= LatLng(0.0, 0.0);
  return [location.latitude, location.longitude];
}

double? routeDistanceCalcMulti(List<LatLng>? coordinates) {
  // need a code to calculate the distance between multipe points on  map
  // need a function to calculate the total distance traveled between multiple points on a map
  if (coordinates == null || coordinates.isEmpty) {
    return null;
  }

  double totalDistance = 0.0;

  for (int i = 0; i < coordinates.length - 1; i++) {
    LatLng start = coordinates[i];
    LatLng end = coordinates[i + 1];

    double distance = routeDistanceCalc(start, end) ?? 0.0;
    totalDistance += distance;
  }

  return double.parse((totalDistance).toStringAsFixed(2));
}

int? routeDurationCalcMulti(List<LatLng>? coordinates) {
  // need a function to calculate the duration between multiple given  points on a map
  // need a function to calculate the total duration of travel between multiple points on a map
  if (coordinates == null || coordinates.isEmpty) {
    return null;
  }

  int totalDuration = 0;

  for (int i = 0; i < coordinates.length - 1; i++) {
    LatLng start = coordinates[i];
    LatLng end = coordinates[i + 1];

    int duration = routeDurationCalculator(start, end) ?? 0;
    totalDuration += duration;
  }

  return totalDuration;
}
