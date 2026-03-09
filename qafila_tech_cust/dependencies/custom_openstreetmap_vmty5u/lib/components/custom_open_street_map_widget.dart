import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_open_street_map_model.dart';
export 'custom_open_street_map_model.dart';

class CustomOpenStreetMapWidget extends StatefulWidget {
  const CustomOpenStreetMapWidget({
    super.key,
    required this.latlngs,
    required this.names,
    required this.ids,
    required this.onmarkertap,
    required this.usercordinate,
    required this.noitemsmsg,
    required this.largefontsize,
    required this.fontsize,
    required this.tooltipBackgroundColor,
    required this.tooltipTextColor,
    required this.markerColor,
    required this.initialZoom,
    required this.zoomThreshold,
  });

  final List<LatLng>? latlngs;
  final List<String>? names;
  final List<int>? ids;
  final Future Function(int id)? onmarkertap;
  final LatLng? usercordinate;
  final String? noitemsmsg;
  final double? largefontsize;
  final double? fontsize;
  final Color? tooltipBackgroundColor;
  final Color? tooltipTextColor;
  final Color? markerColor;
  final double? initialZoom;
  final double? zoomThreshold;

  @override
  State<CustomOpenStreetMapWidget> createState() =>
      _CustomOpenStreetMapWidgetState();
}

class _CustomOpenStreetMapWidgetState extends State<CustomOpenStreetMapWidget> {
  late CustomOpenStreetMapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomOpenStreetMapModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: custom_widgets.CustomOpenStreetMap(
        width: double.infinity,
        height: double.infinity,
        noItemsMessage: widget!.noitemsmsg!,
        largeFontSize: widget!.largefontsize!,
        fontSize: widget!.fontsize!,
        tooltipBackgroundColor: widget!.tooltipBackgroundColor!,
        tooltipTextColor: widget!.tooltipTextColor!,
        markerColor: widget!.markerColor!,
        initialZoom: widget!.initialZoom!,
        zoomThreshold: widget!.zoomThreshold!,
        latLngListFF: widget!.latlngs!,
        markerNameList: widget!.names!,
        idList: widget!.ids!,
        userCoordinatesFF: widget!.usercordinate,
        onMarkerTap: (id) async {
          await widget.onmarkertap?.call(
            id,
          );
        },
        onVisibleIdsChanged: (visibleIds) async {
          _model.visibleids = visibleIds.toList().cast<int>();
          _model.updatePage(() {});
        },
      ),
    );
  }
}
