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
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter_map/flutter_map.dart'; // LatLngBounds is here now
import 'package:latlong2/latlong.dart' as latlng2;

/// --- FF LatLng -> latlong2.LatLng conversion ---
extension FFtoLL on LatLng {
  latlng2.LatLng get asLL => latlng2.LatLng(latitude, longitude);
}

List<latlng2.LatLng> _ffListToLL(List<LatLng> list) =>
    list.map((e) => e.asLL).toList();

class CustomOpenStreetMap extends StatefulWidget {
  const CustomOpenStreetMap({
    super.key,
    this.width,
    this.height,
    required this.latLngListFF,
    required this.markerNameList,
    required this.idList,
    required this.onMarkerTap,
    this.userCoordinatesFF,
    required this.noItemsMessage,
    required this.largeFontSize,
    required this.fontSize,
    required this.tooltipBackgroundColor,
    required this.tooltipTextColor,
    required this.onVisibleIdsChanged,
    required this.markerColor,
    required this.routeColor,
    this.routePointsFF,
    this.initialZoom = 12.0,
    this.zoomThreshold = 16.0,
  });

  final double? width;
  final double? height;
  final List<LatLng> latLngListFF;
  final LatLng? userCoordinatesFF;
  final List<LatLng>? routePointsFF;
  final List<String> markerNameList;
  final List<int> idList;
  final Future Function(int id) onMarkerTap;
  final String noItemsMessage;
  final double largeFontSize;
  final double fontSize;
  final Color tooltipBackgroundColor;
  final Color tooltipTextColor;
  final Color markerColor;
  final Color routeColor;
  final Future Function(List<int> visibleIds) onVisibleIdsChanged;
  final double initialZoom;
  final double zoomThreshold;

  @override
  State<CustomOpenStreetMap> createState() => _CustomOpenStreetMapState();
}

class _CustomOpenStreetMapState extends State<CustomOpenStreetMap> {
  late final MapController _mapController;
  late List<Marker> _markers;
  late double _currentZoom;

  List<latlng2.LatLng> get _latLngList => _ffListToLL(widget.latLngListFF);
  List<latlng2.LatLng> get _routePoints =>
      _ffListToLL(widget.routePointsFF ?? []);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _markers = [];
    _currentZoom = widget.initialZoom;

    if (_validateLists()) {
      _initializeMarkers();
    }
  }

  @override
  void didUpdateWidget(CustomOpenStreetMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateMarkers();

    // Check if points changed to trigger re-zoom
    if (widget.latLngListFF != oldWidget.latLngListFF ||
        widget.userCoordinatesFF != oldWidget.userCoordinatesFF ||
        widget.routePointsFF != oldWidget.routePointsFF) {
      _fitMapToPoints();
    }
  }

  bool _validateLists() {
    return _latLngList.length == widget.markerNameList.length &&
        _latLngList.length == widget.idList.length &&
        _latLngList.isNotEmpty;
  }

  void _fitMapToPoints() {
    if (!mounted) return;

    final allPoints = <latlng2.LatLng>[];
    allPoints.addAll(_latLngList);
    if (widget.userCoordinatesFF != null) {
      allPoints.add(widget.userCoordinatesFF!.asLL);
    }
    allPoints.addAll(_routePoints);

    if (allPoints.isEmpty) return;

    // FIX 1: Use LatLngBounds directly (it is part of flutter_map, not latlong2)
    final bounds = LatLngBounds.fromPoints(allPoints);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.fitCamera(
        CameraFit.bounds(
          bounds: bounds,
          padding: const EdgeInsets.all(50.0),
        ),
      );
    });
  }

  void _initializeMarkers() {
    _updateMarkers();
    _fitMapToPoints();
  }

  void _updateMarkers() {
    if (!mounted || !_validateLists()) return;

    final showText = _currentZoom >= widget.zoomThreshold;
    final newMarkers = <Marker>[];

    if (widget.userCoordinatesFF != null) {
      newMarkers.add(Marker(
        point: widget.userCoordinatesFF!.asLL,
        width: 45,
        height: 45,
        child: Icon(Icons.directions_car, color: Colors.blue[800], size: 40),
      ));
    }

    for (var i = 0; i < _latLngList.length; i++) {
      newMarkers.add(showText ? _createLabelMarker(i) : _createBaseMarker(i));
    }

    setState(() => _markers = newMarkers);
  }

  Marker _createBaseMarker(int index) {
    return Marker(
      point: _latLngList[index],
      width: 40,
      height: 40,
      child: GestureDetector(
        onTap: () => widget.onMarkerTap(widget.idList[index]),
        child: Icon(Icons.location_on, color: widget.markerColor, size: 40),
      ),
    );
  }

  Marker _createLabelMarker(int index) {
    return Marker(
      point: _latLngList[index],
      width: 120,
      height: 70,
      child: GestureDetector(
        onTap: () => widget.onMarkerTap(widget.idList[index]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: widget.tooltipBackgroundColor,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
              ),
              child: Text(
                widget.markerNameList[index],
                style: TextStyle(
                    color: widget.tooltipTextColor,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.location_on, color: widget.markerColor, size: 35),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _latLngList.isNotEmpty
              ? _latLngList.first
              : const latlng2.LatLng(0, 0),
          initialZoom: widget.initialZoom,
          onPositionChanged: (pos, hasGesture) {
            if (_currentZoom != pos.zoom) {
              setState(() => _currentZoom = pos.zoom);
              _updateMarkers();
            }
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          if (_routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: _routePoints,
                  color: widget.routeColor,
                  strokeWidth: 5.0,
                  // FIX 2: Removed isPolylineGradient (not supported in v8)
                ),
              ],
            ),
          MarkerLayer(markers: _markers),
          const RichAttributionWidget(
            attributions: [TextSourceAttribution('OpenStreetMap contributors')],
          ),
        ],
      ),
    );
  }
}
