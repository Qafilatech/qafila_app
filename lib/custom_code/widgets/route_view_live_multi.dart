// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'dart:math' show cos, sqrt, asin;

class RouteViewLiveMulti extends StatefulWidget {
  const RouteViewLiveMulti({
    super.key,
    this.width,
    this.height,
    required this.coordinates,
    this.lineColor = Colors.black,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    required this.rideDetailsReference,
    required this.addresses,
  });

  final double? height;
  final double? width;
  final List<LatLng> coordinates;
  final Color lineColor;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final DocumentReference rideDetailsReference;
  final List<String> addresses;

  @override
  State<RouteViewLiveMulti> createState() => _RouteViewLiveMultiState();
}

class _RouteViewLiveMultiState extends State<RouteViewLiveMulti> {
  late final CameraPosition _initialLocation;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> initialPolylines = {};

  String get googleMapsApiKey {
    if (kIsWeb) {
      return widget.webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return widget.iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return widget.androidGoogleMapsApiKey;
      default:
        return widget.webGoogleMapsApiKey;
    }
  }

  Future<Map<PolylineId, Polyline>?> _calculateDistance({
    required List<LatLng> coordinates,
    required List<String> addresses,
  }) async {
    if (markers.isNotEmpty) markers.clear();

    try {
      double totalDistance = 0.0;
      List<latlng.LatLng> polylineCoordinates = [];

      for (int i = 0; i < coordinates.length - 1; i++) {
        double startLatitude = coordinates[i].latitude;
        double startLongitude = coordinates[i].longitude;
        double destinationLatitude = coordinates[i + 1].latitude;
        double destinationLongitude = coordinates[i + 1].longitude;

        String startCoordinatesString = '($startLatitude, $startLongitude)';
        String destinationCoordinatesString =
            '($destinationLatitude, $destinationLongitude)';

        Marker startMarker = Marker(
          markerId: MarkerId(startCoordinatesString),
          position: latlng.LatLng(startLatitude, startLongitude),
          infoWindow: InfoWindow(
            title: 'Start $startCoordinatesString',
            snippet: addresses[i],
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        Marker destinationMarker = Marker(
          markerId: MarkerId(destinationCoordinatesString),
          position: latlng.LatLng(destinationLatitude, destinationLongitude),
          infoWindow: InfoWindow(
            title: 'Destination $destinationCoordinatesString',
            snippet: addresses[i + 1],
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        markers.add(startMarker);
        markers.add(destinationMarker);

        final result = await _createPolylines(
          startLatitude,
          startLongitude,
          destinationLatitude,
          destinationLongitude,
        );

        final polylines = result.item1;
        polylineCoordinates.addAll(result.item2);

        for (int i = 0; i < result.item2.length - 1; i++) {
          totalDistance += _coordinateDistance(
            result.item2[i].latitude,
            result.item2[i].longitude,
            result.item2[i + 1].latitude,
            result.item2[i + 1].longitude,
          );
        }
      }

      final placeDistance = totalDistance.toStringAsFixed(2);
      debugPrint('MAP::TOTAL DISTANCE: $placeDistance km');
      FFAppState().update(() {
        FFAppState().routeDistance = '$placeDistance km';
      });

      var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${coordinates.last.latitude},${coordinates.last.longitude}&origins=${coordinates.first.latitude},${coordinates.first.longitude}&key=$googleMapsApiKey',
      );
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        final String durationText =
            jsonResponse['rows']['elements']['duration']['text'];
        debugPrint('MAP::$durationText');
        FFAppState().update(() {
          FFAppState().routeDuration = '$durationText';
        });
      } else {
        debugPrint('ERROR in distance matrix API');
      }

      return {
        PolylineId('multi_polyline'): Polyline(
          polylineId: PolylineId('multi_polyline'),
          color: widget.lineColor,
          points: polylineCoordinates,
          width: 3,
        )
      };
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<Tuple2<Map<PolylineId, Polyline>, List<latlng.LatLng>>>
      _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    List<latlng.LatLng> polylineCoordinates = [];

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(latlng.LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: widget.lineColor,
      points: polylineCoordinates,
      width: 3,
    );

    return Tuple2({id: polyline}, polylineCoordinates);
  }

  @override
  void initState() {
    super.initState();
    final startCoordinate = latlng.LatLng(
      widget.coordinates.first.latitude,
      widget.coordinates.first.longitude,
    );
    _initialLocation = CameraPosition(
      target: startCoordinate,
      zoom: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RideRecord>(
      stream: RideRecord.getDocument(widget.rideDetailsReference),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: widget.height,
            width: widget.width,
            child: GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(initialPolylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                _calculateDistance(
                    coordinates: widget.coordinates,
                    addresses: widget
                        .addresses); // Directly calculate and set the polylines
              },
            ),
          );
        }

        final rideRecord = snapshot.data;
        debugPrint('MAP::UPDATED');
        return Container(
          height: widget.height,
          width: widget.width,
          child: FutureBuilder<Map<PolylineId, Polyline>?>(
            // Continue using the FutureBuilder
            future: _calculateDistance(
                coordinates: widget.coordinates, addresses: widget.addresses),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return GoogleMap(
                  markers: Set<Marker>.from(markers),
                  initialCameraPosition: _initialLocation,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  polylines: Set<Polyline>.of(initialPolylines.values),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                );
              }

              return GoogleMap(
                markers: Set<Marker>.from(markers),
                initialCameraPosition: CameraPosition(
                  target: latlng.LatLng(
                    widget.coordinates.last.latitude,
                    widget.coordinates.last.longitude,
                  ),
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                polylines: Set<Polyline>.of(snapshot.data!.values),
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              );
            },
          ),
        );
      },
    );
  }
}
