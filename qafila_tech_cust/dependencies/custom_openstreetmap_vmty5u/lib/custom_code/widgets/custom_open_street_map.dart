// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng2;

/// --- FF LatLng -> latlong2.LatLng konverzió ---
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
    this.initialZoom = 10.0,
    this.zoomThreshold = 16.0,
  });

  final double? width;
  final double? height;

  /// A külvilág felé **FF LatLng** a bemenet
  final List<LatLng> latLngListFF;
  final LatLng? userCoordinatesFF;

  /// További paraméterek
  final List<String> markerNameList;
  final List<int> idList;
  final Future Function(int id) onMarkerTap;
  final String noItemsMessage;
  final double largeFontSize;
  final double fontSize;
  final Color tooltipBackgroundColor;
  final Color tooltipTextColor;
  final Future Function(List<int> visibleIds) onVisibleIdsChanged;
  final Color markerColor;
  final double initialZoom;
  final double zoomThreshold;

  @override
  State<CustomOpenStreetMap> createState() => _CustomOpenStreetMapState();
}

class _CustomOpenStreetMapState extends State<CustomOpenStreetMap>
    with WidgetsBindingObserver {
  late final MapController _mapController;
  late List<Marker> _markers;
  static const _defaultCameraLocation = latlng2.LatLng(47.985028, 22.51705);
  late double _currentZoom;
  late double _previousZoom;
  late double _zoomThreshold;
  latlng2.LatLng _currentCenter = _defaultCameraLocation;
  Timer? _debounceTimer;
  Timer? _visibleMarkersDebounceTimer;
  Timer? _mapMoveDebounceTimer;
  bool _isMoving = false;
  bool _isDarkMode = false;
  bool _isMapStable = true;

  List<latlng2.LatLng> get _latLngList => _ffListToLL(widget.latLngListFF);
  latlng2.LatLng? get _userCoordinates => widget.userCoordinatesFF?.asLL;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _markers = [];
    WidgetsBinding.instance.addObserver(this);

    _currentZoom = widget.initialZoom;
    _previousZoom = widget.initialZoom;
    _zoomThreshold = widget.zoomThreshold;

    if (_validateLists()) {
      _initializeMarkers();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateVisibleMarkers();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newIsDarkMode = Theme.of(context).brightness == Brightness.dark;
    if (_isDarkMode != newIsDarkMode) {
      setState(() {
        _isDarkMode = newIsDarkMode;
        _updateMarkers();
      });
    }
  }

  @override
  void didUpdateWidget(CustomOpenStreetMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_latLngList != _ffListToLL(oldWidget.latLngListFF) ||
        widget.markerNameList != oldWidget.markerNameList ||
        widget.idList != oldWidget.idList ||
        _userCoordinates != oldWidget.userCoordinatesFF?.asLL ||
        widget.tooltipBackgroundColor != oldWidget.tooltipBackgroundColor ||
        widget.tooltipTextColor != oldWidget.tooltipTextColor ||
        widget.markerColor != oldWidget.markerColor) {
      if (_validateLists()) {
        _updateMarkersWithDebounce();
        _updateVisibleMarkersWithDebounce();
      } else {
        _updateVisibleMarkersWithDebounce();
      }
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _visibleMarkersDebounceTimer?.cancel();
    _mapMoveDebounceTimer?.cancel();
    _mapController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool _validateLists() {
    return _latLngList.length == widget.markerNameList.length &&
        _latLngList.length == widget.idList.length &&
        _latLngList.isNotEmpty;
  }

  void _initializeMarkers() {
    _markers = [];
    if (_userCoordinates != null) {
      _markers.add(_createUserMarker());
    }
    _updateMarkers();
  }

  Marker _createUserMarker() {
    return Marker(
      point: _userCoordinates!,
      width: 40,
      height: 40,
      child: Icon(
        Icons.location_pin,
        color: _isDarkMode ? Colors.redAccent : Colors.red,
        size: 40,
      ),
    );
  }

  void _updateMarkersWithDebounce() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 50), () {
      if (mounted) {
        _updateMarkers();
      }
    });
  }

  void _updateVisibleMarkersWithDebounce() {
    _visibleMarkersDebounceTimer?.cancel();
    _visibleMarkersDebounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted && _isMapStable) {
        _updateVisibleMarkers();
      }
    });
  }

  void _updateMarkers() {
    if (!mounted || !_validateLists()) return;

    final showText = _currentZoom >= _zoomThreshold;
    final newMarkers = <Marker>[];

    if (_userCoordinates != null) {
      newMarkers.add(_createUserMarker());
    }

    for (var i = 0; i < _latLngList.length; i++) {
      if (showText) {
        newMarkers.add(_createLabelMarker(i));
      } else {
        newMarkers.add(_createBaseMarker(i));
      }
    }

    if (mounted) {
      setState(() => _markers = newMarkers);
    }
  }

  Marker _createBaseMarker(int index) {
    final markerIcon = Icon(
      Icons.location_pin,
      color: widget.markerColor,
      size: 40,
    );

    final markerChild = Tooltip(
      message: widget.markerNameList[index],
      preferBelow: true,
      textStyle: TextStyle(
        color: widget.tooltipTextColor,
        fontSize: widget.fontSize,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: widget.tooltipBackgroundColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: markerIcon,
    );

    return Marker(
      point: _latLngList[index],
      width: 40,
      height: 40,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => widget.onMarkerTap(widget.idList[index]),
          child: markerChild,
        ),
      ),
    );
  }

  Marker _createLabelMarker(int index) {
    final textStyle = TextStyle(
      color: widget.markerColor,
      fontSize: widget.fontSize,
      fontWeight: FontWeight.bold,
    );

    final textPainter = TextPainter(
      text: TextSpan(text: widget.markerNameList[index], style: textStyle),
      textDirection: ui.TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout();

    final textWidth = textPainter.width;
    final textHeight = textPainter.height;

    return Marker(
      point: _latLngList[index],
      width: textWidth,
      height: textHeight + 40,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => widget.onMarkerTap(widget.idList[index]),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Icon(
                  Icons.location_pin,
                  color: widget.markerColor,
                  size: 40,
                ),
              ),
              Positioned(
                bottom: 40,
                child: Container(
                  alignment: Alignment.center,
                  width: textWidth,
                  child: Text(
                    widget.markerNameList[index],
                    style: textStyle,
                    softWrap: false,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPositionChanged(MapCamera position, bool hasGesture) {
    _currentCenter = position.center;
    _currentZoom = position.zoom;

    if (hasGesture) {
      _isMoving = true;
      _isMapStable = false;

      _mapMoveDebounceTimer?.cancel();
      _mapMoveDebounceTimer = Timer(const Duration(milliseconds: 200), () {
        _isMapStable = true;
        _updateVisibleMarkersWithDebounce();
      });
    }

    final crossedThreshold =
        (_previousZoom < _zoomThreshold && _currentZoom >= _zoomThreshold) ||
            (_previousZoom >= _zoomThreshold && _currentZoom < _zoomThreshold);

    final zoomChanged = (_currentZoom != _previousZoom);

    if (crossedThreshold) {
      _updateMarkersWithDebounce();
    }

    if (zoomChanged) {
      _previousZoom = _currentZoom;
    }

    if (!hasGesture && _isMoving) {
      _isMoving = false;
      _isMapStable = true;
      _updateMarkersWithDebounce();
      _updateVisibleMarkersWithDebounce();
    }
  }

  Future<void> _updateVisibleMarkers() async {
    if (!_isMapStable) return;

    final visibleIds = <int>[];

    if (!_validateLists()) {
      await widget.onVisibleIdsChanged(visibleIds);
      return;
    }

    final bounds = _mapController.camera.visibleBounds;

    for (var i = 0; i < _latLngList.length; i++) {
      final isVisible = bounds.contains(_latLngList[i]);
      if (isVisible) {
        visibleIds.add(widget.idList[i]);
      }
    }

    await widget.onVisibleIdsChanged(visibleIds);
  }

  void _zoomIn() {
    setState(() {
      _isMapStable = false;
      _currentZoom = (_currentZoom + 1).clamp(0.0, 18.0);
      _mapController.move(_currentCenter, _currentZoom);
      _updateMarkersWithDebounce();
    });

    _mapMoveDebounceTimer?.cancel();
    _mapMoveDebounceTimer = Timer(const Duration(milliseconds: 200), () {
      _isMapStable = true;
      _updateVisibleMarkersWithDebounce();
    });
  }

  void _zoomOut() {
    setState(() {
      _isMapStable = false;
      _currentZoom = (_currentZoom - 1).clamp(0.0, 18.0);
      _mapController.move(_currentCenter, _currentZoom);
      _updateMarkersWithDebounce();
    });

    _mapMoveDebounceTimer?.cancel();
    _mapMoveDebounceTimer = Timer(const Duration(milliseconds: 200), () {
      _isMapStable = true;
      _updateVisibleMarkersWithDebounce();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget tileLayer = TileLayer(
      urlTemplate: _isDarkMode
          ? 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png'
          : 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
      subdomains: const ['a', 'b', 'c'],
      retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
    );

    if (_isDarkMode) {
      tileLayer = ColorFiltered(
        colorFilter: const ColorFilter.matrix(<double>[
          0.39,
          0.34,
          0.27,
          0,
          40,
          0.35,
          0.31,
          0.24,
          0,
          30,
          0.27,
          0.23,
          0.20,
          0,
          10,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: tileLayer,
      );
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: _validateLists()
          ? Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _defaultCameraLocation,
                    initialZoom: _currentZoom,
                    onPositionChanged: _onPositionChanged,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                    ),
                  ),
                  children: [
                    tileLayer,
                    MarkerLayer(markers: _markers),
                  ],
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Column(
                    children: [
                      FloatingActionButton(
                        mini: true,
                        onPressed: _isMapStable ? _zoomIn : null,
                        child: const Icon(Icons.add),
                        backgroundColor:
                            _isDarkMode ? Colors.grey[800] : Colors.white,
                        foregroundColor:
                            _isDarkMode ? Colors.white : Colors.black,
                      ),
                      const SizedBox(height: 8),
                      FloatingActionButton(
                        mini: true,
                        onPressed: _isMapStable ? _zoomOut : null,
                        child: const Icon(Icons.remove),
                        backgroundColor:
                            _isDarkMode ? Colors.grey[800] : Colors.white,
                        foregroundColor:
                            _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                widget.noItemsMessage.isNotEmpty
                    ? widget.noItemsMessage
                    : 'No items to display',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.markerColor,
                  fontSize: widget.largeFontSize,
                ),
              ),
            ),
    );
  }
}
