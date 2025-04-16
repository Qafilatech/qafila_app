// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class GoogleMapsRouteWithPins extends StatefulWidget {
  const GoogleMapsRouteWithPins({
    super.key,
    this.width,
    this.height,
    required this.latLngPoints,
    this.webGoogleMapsApiKey = '',
    this.iOSGoogleMapsApiKey = '',
    this.androidGoogleMapsApiKey = '',
    this.initialZoom = 12.0,
    this.routeColor = Colors.blue,
    this.avoidTolls = false,
    this.padding = 80.0,
  });

  final double? width;
  final double? height;
  final List<LatLng> latLngPoints;
  final String webGoogleMapsApiKey;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final double initialZoom;
  final Color routeColor;
  final bool avoidTolls;
  final double padding;

  String get googleMapsApiKey {
    if (kIsWeb) {
      return webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return ''; // Or handle desktop differently if needed
      case TargetPlatform.iOS:
        return iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return androidGoogleMapsApiKey;
      default:
        return webGoogleMapsApiKey;
    }
  }

  @override
  State<GoogleMapsRouteWithPins> createState() =>
      _GoogleMapsRouteWithPinsState();
}

class _GoogleMapsRouteWithPinsState extends State<GoogleMapsRouteWithPins> {
  GoogleMapController? _mapController;
  final Set<gmaps.Marker> _markers = {};
  final Set<gmaps.Polyline> _polylines = {};
  List<gmaps.LatLng> _routePoints = [];
  LatLng? _focusedLocation;
  List<LatLng> _orderedLatLngPoints = []; // To store optimized order

  @override
  void initState() {
    super.initState();
    _orderedLatLngPoints = List.from(widget.latLngPoints);
    _initMap();
  }

  @override
  void didUpdateWidget(covariant GoogleMapsRouteWithPins oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.latLngPoints != oldWidget.latLngPoints ||
        widget.webGoogleMapsApiKey != oldWidget.webGoogleMapsApiKey ||
        widget.iOSGoogleMapsApiKey != oldWidget.iOSGoogleMapsApiKey ||
        widget.androidGoogleMapsApiKey != oldWidget.androidGoogleMapsApiKey ||
        widget.avoidTolls != oldWidget.avoidTolls) {
      _orderedLatLngPoints = List.from(widget.latLngPoints);
      _initMap();
    }
  }

  void _initMap() {
    _markers.clear();
    _polylines.clear();
    if (_orderedLatLngPoints.isNotEmpty) {
      _focusedLocation = _orderedLatLngPoints.first;
      _setMarkers(_orderedLatLngPoints);
      if (_orderedLatLngPoints.length >= 2) {
        _fetchAndDrawRoute(_orderedLatLngPoints);
      } else if (_orderedLatLngPoints.isNotEmpty) {
        _centerOnPosition(_orderedLatLngPoints.first);
      } else {
        _centerOnDefault();
      }
    } else {
      _centerOnDefault();
    }
  }

  void _centerOnDefault() {
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(target: gmaps.LatLng(0.0, 0.0), zoom: 1),
        ),
      );
    }
  }

  void _centerOnPosition(LatLng? position) {
    if (_mapController == null || position == null) return;
    _mapController!.animateCamera(
      CameraUpdate.newLatLng(position.toGoogleMaps()),
    );
  }

  void _setMarkers(List<LatLng> points) {
    setState(() {
      _markers.clear();
      for (final point in points) {
        _markers.add(
          gmaps.Marker(
            markerId: gmaps.MarkerId('${point.latitude}_${point.longitude}'),
            position: point.toGoogleMaps(),
          ),
        );
      }
    });
  }

  Future<void> _fetchAndDrawRoute(List<LatLng> points) async {
    if (points.length < 2) return;

    final String apiKey = widget.googleMapsApiKey;
    if (apiKey.isEmpty &&
        (kIsWeb ||
            defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Google Maps API key is not provided for this platform.')),
      );
      return;
    }

    final LatLng origin = points.first;
    final LatLng destination = points.last;
    final List<LatLng> waypoints = points.sublist(1, points.length - 1);
    const bool optimize = true; // Set to true for optimization
    const String travelMode = "DRIVING";
    final bool avoidTolls = widget.avoidTolls;

    String waypointsString =
        waypoints.map((wp) => "${wp.latitude},${wp.longitude}").join("|");
    if (optimize && waypointsString.isNotEmpty) {
      waypointsString = "optimize:true|$waypointsString";
    }

    final Uri url = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json'
      '?origin=${origin.latitude},${origin.longitude}'
      '&destination=${destination.latitude},${destination.longitude}'
      '${waypointsString.isNotEmpty ? '&waypoints=$waypointsString' : ''}'
      '&mode=$travelMode'
      '${avoidTolls ? '&avoid=tolls' : ''}'
      '&key=$apiKey',
    );

    debugPrint("Directions API URL: ${url.toString()}"); // Logging the URL

    try {
      final response = await http.get(url);
      debugPrint(
          "Directions API Status Code: ${response.statusCode}"); // Logging status code
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        debugPrint(
            "Directions API Response: ${data}"); // Logging the full response
        if (data['status'] == 'OK') {
          _polylines.clear();
          _routePoints.clear();

          if (optimize &&
              data['routes'].isNotEmpty &&
              data['routes'][0]['waypoint_order'] != null) {
            final List<int> order =
                List<int>.from(data['routes'][0]['waypoint_order']);
            List<LatLng> orderedWaypoints = [];
            for (int index in order) {
              orderedWaypoints.add(waypoints[index]);
            }
            _orderedLatLngPoints = [origin, ...orderedWaypoints, destination];
            _setMarkers(
                _orderedLatLngPoints); // Re-set markers based on the new order
          } else if (!optimize) {
            _orderedLatLngPoints = List.from(widget.latLngPoints);
            _setMarkers(_orderedLatLngPoints);
          }

          if (data['routes'].isNotEmpty &&
              data['routes'][0]['overview_polyline'] != null) {
            final String encodedPolyline =
                data['routes'][0]['overview_polyline']['points'];
            final polylinePoints = PolylinePoints();
            final List<PointLatLng> decodedPoints =
                polylinePoints.decodePolyline(encodedPolyline);
            _routePoints = decodedPoints
                .map((p) => gmaps.LatLng(p.latitude, p.longitude))
                .toList();

            _polylines.add(
              gmaps.Polyline(
                polylineId: const gmaps.PolylineId("optimized_route"),
                points: _routePoints,
                color: widget.routeColor,
                width: 6,
              ),
            );

            if (data['routes'][0]['viewport'] != null) {
              final viewport = data['routes'][0]['viewport'];
              final southwest = viewport['southwest'];
              final northeast = viewport['northeast'];
              _centerMapOnRoute(
                gmaps.LatLngBounds(
                  southwest: gmaps.LatLng(southwest['lat'], southwest['lng']),
                  northeast: gmaps.LatLng(northeast['lat'], northeast['lng']),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No routes found.')),
            );
          }

          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Google Maps Directions API error: ${data['status']} ${data['error_message'] ?? ''}')),
          );
          debugPrint(
              'Google Maps Directions API error: ${data['status']} ${data['error_message'] ?? ''}');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('HTTP error: ${response.statusCode}')),
        );
        debugPrint('HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error calling Directions API: $e')),
      );
      debugPrint('Error calling Directions API: $e');
    }
  }

  void _centerMapOnRoute(gmaps.LatLngBounds bounds) {
    if (_mapController == null) return;
    if (_routePoints.isNotEmpty) {
      _mapController!.animateCamera(
        gmaps.CameraUpdate.newLatLngBounds(bounds, widget.padding),
      );
    } else if (_focusedLocation != null) {
      _centerOnPosition(_focusedLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      child: GoogleMap(
        onMapCreated: (controller) {
          _mapController = controller;
        },
        initialCameraPosition: gmaps.CameraPosition(
          target:
              _focusedLocation?.toGoogleMaps() ?? const gmaps.LatLng(0.0, 0.0),
          zoom: widget.initialZoom,
        ),
        markers: _markers,
        polylines: _polylines,
        myLocationEnabled: false,
        compassEnabled: false,
        mapToolbarEnabled: false,
        trafficEnabled: false,
      ),
    );
  }
}

extension FFLatLngToGmapsLatLng on LatLng {
  gmaps.LatLng toGoogleMaps() {
    return gmaps.LatLng(latitude, longitude);
  }
}
