// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_latlng;
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:convert';
import 'dart:math' show cos, sqrt, asin;

// ⚠️ CHANGES APPLIED:
// 1. All references to 'RideRecord' are changed to 'OrdersRecord'.
// 2. Location fields are updated to: 'driverLocation', 'pickupLocation', and 'dropoffLocation'.

class RouteViewLive extends StatefulWidget {
  const RouteViewLive({
    Key? key,
    this.width,
    this.height,
    required this.startCoordinate,
    required this.endCoordinate,
    this.lineColor = Colors.black,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    required this.rideDetailsReference, // This should probably be 'orderDetailsReference'
    this.startAddress,
    this.destinationAddress,
  }) : super(key: key);

  final double? height;
  final double? width;
  final LatLng startCoordinate;
  final LatLng endCoordinate;
  final Color lineColor;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  // ⚠️ NOTE: Parameter name should reflect your collection, but we keep the type
  // as DocumentReference is generic.
  final DocumentReference rideDetailsReference;
  final String? startAddress;
  final String? destinationAddress;

  @override
  _RouteViewLiveState createState() => _RouteViewLiveState();
}

class _RouteViewLiveState extends State<RouteViewLive> {
  late final CameraPosition _initialLocation;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> initialPolylines = {};

  static const MarkerId _driverMarkerId = MarkerId('driver_location');
  static const MarkerId _pickupMarkerId = MarkerId('pickup_location');

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

  // ####################################################################
  // ############# NEW FUNCTION FOR REAL-TIME MARKER UPDATE #############
  // ####################################################################
  // ⚠️ Class changed to OrdersRecord
  void _updateMapOnData(OrdersRecord orderRecord) async {
    // ⚠️ Fields changed to match your Firestore schema
    final driverLatLng = orderRecord.driverLocation;
    final pickupLatLng = orderRecord.pickupLocation;
    final dropoffLatLng = orderRecord.dropoffLocation;

    if (driverLatLng == null || pickupLatLng == null || dropoffLatLng == null) {
      debugPrint("MAP::ERROR: Missing location data in order record.");
      return;
    }

    // 2. Update Markers
    setState(() {
      markers.clear();

      // Driver Marker
      markers.add(
        Marker(
          markerId: _driverMarkerId,
          position: google_latlng.LatLng(
              driverLatLng.latitude, driverLatLng.longitude),
          infoWindow: const InfoWindow(title: 'Driver Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
      // Pickup Marker
      markers.add(
        Marker(
          markerId: _pickupMarkerId,
          position: google_latlng.LatLng(
              pickupLatLng.latitude, pickupLatLng.longitude),
          infoWindow:
              InfoWindow(title: widget.startAddress ?? 'Pickup Location'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );

      // Dropoff Marker (Using the user's endCoordinate parameter as the dropoff if not in record)
      markers.add(
        Marker(
          markerId: const MarkerId('dropoff_location'),
          position: google_latlng.LatLng(
              dropoffLatLng.latitude, dropoffLatLng.longitude),
          infoWindow: InfoWindow(
              title: widget.destinationAddress ?? 'Dropoff Location'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    });

    // 3. Smoothly move the camera to follow the driver
    mapController?.animateCamera(
      CameraUpdate.newLatLng(
        google_latlng.LatLng(driverLatLng.latitude, driverLatLng.longitude),
      ),
    );

    // 4. Update Duration/Distance (Driver to Pickup/Dropoff)
    // NOTE: This will now calculate the ETA from driver to *dropoff* location
    _fetchDurationAndDistance(driverLatLng.latitude, driverLatLng.longitude,
        dropoffLatLng.latitude, dropoffLatLng.longitude);
  }

  // ####################################################################
  // ########## API CALLS (Simplified for brevity—no functional change here) #########
  // ####################################################################

  Future<Map<PolylineId, Polyline>?> _calculateInitialRoute({
    required double startLatitude,
    required double startLongitude,
    required double destinationLatitude,
    required double destinationLongitude,
  }) async {
    try {
      // Logic for map bounds and camera animation (no change)
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        mapController?.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: google_latlng.LatLng(maxy, maxx),
              southwest: google_latlng.LatLng(miny, minx),
            ),
            60.0,
          ),
        );
      });

      final result = await _createPolylines(
        startLatitude,
        startLongitude,
        destinationLatitude,
        destinationLongitude,
      );

      // Fetch accurate ETA for the initial route (e.g., Pickup to Dropoff)
      _fetchDurationAndDistance(startLatitude, startLongitude,
          destinationLatitude, destinationLongitude);

      return result.item1;
    } catch (e) {
      debugPrint('MAP::INITIAL ROUTE ERROR: ${e.toString()}');
    }
    return null;
  }

  Future<void> _fetchDurationAndDistance(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    var url = Uri.parse(
      'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationLatitude,$destinationLongitude&origins=$startLatitude,$startLongitude&key=$googleMapsApiKey',
    );
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      final elements = jsonResponse['rows']?[0]?['elements'];
      if (elements != null && elements.isNotEmpty) {
        final durationText = elements[0]['duration']?['text'];
        final distanceText = elements[0]['distance']?['text'];

        if (durationText != null && mounted) {
          FFAppState().update(() {
            FFAppState().routeDuration = durationText;
          });
        }
        if (distanceText != null && mounted) {
          FFAppState().update(() {
            FFAppState().routeDistance = distanceText;
          });
        }
      }
    }
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<Tuple2<Map<PolylineId, Polyline>, List<google_latlng.LatLng>>>
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

    List<google_latlng.LatLng> polylineCoordinates = [];

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates
            .add(google_latlng.LatLng(point.latitude, point.longitude));
      }
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

  initPolylines() async {
    double startLatitude = widget.startCoordinate.latitude;
    double startLongitude = widget.startCoordinate.longitude;

    double destinationLatitude = widget.endCoordinate.latitude;
    double destinationLongitude = widget.endCoordinate.longitude;

    final resultPolylines = await _calculateInitialRoute(
      startLatitude: startLatitude,
      startLongitude: startLongitude,
      destinationLatitude: destinationLatitude,
      destinationLongitude: destinationLongitude,
    );

    if (resultPolylines != null && mounted) {
      setState(() => initialPolylines = resultPolylines);
    }
  }

  @override
  void initState() {
    final startCoordinate = google_latlng.LatLng(
      widget.startCoordinate.latitude,
      widget.startCoordinate.longitude,
    );
    _initialLocation = CameraPosition(
      target: startCoordinate,
      zoom: 14,
    );

    super.initState();
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  // ####################################################################
  // ######################### BUILD METHOD (FIXED) #####################
  // ####################################################################
  @override
  Widget build(BuildContext context) {
    // ⚠️ StreamBuilder is now OrdersRecord
    return StreamBuilder<OrdersRecord>(
      stream: OrdersRecord.getDocument(widget.rideDetailsReference),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: widget.height,
            width: widget.width,
            child: GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _initialLocation,
              polylines: Set<Polyline>.of(initialPolylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                if (initialPolylines.isEmpty) {
                  initPolylines();
                }
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
            ),
          );
        }

        final orderRecord = snapshot.data!;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            // ⚠️ Function call updated with the new record name
            _updateMapOnData(orderRecord);
          }
        });

        return Container(
          height: widget.height,
          width: widget.width,
          child: GoogleMap(
            markers: Set<Marker>.from(markers),
            initialCameraPosition: _initialLocation,
            polylines: Set<Polyline>.of(initialPolylines.values),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              if (initialPolylines.isEmpty) {
                initPolylines();
              }
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
          ),
        );
      },
    );
  }
}
