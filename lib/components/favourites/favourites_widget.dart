import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'favourites_model.dart';
export 'favourites_model.dart';

class FavouritesWidget extends StatefulWidget {
  const FavouritesWidget({
    super.key,
    this.locations,
    required this.fevRef,
    String? orderType,
    String? title,
  })  : this.orderType = orderType ?? 'n/a',
        this.title = title ?? 'n/a';

  final List<LatLng>? locations;
  final DocumentReference? fevRef;
  final String orderType;
  final String title;

  @override
  State<FavouritesWidget> createState() => _FavouritesWidgetState();
}

class _FavouritesWidgetState extends State<FavouritesWidget> {
  late FavouritesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouritesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      height: 180.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 4.0, 6.0),
            child: Container(
              width: 5.0,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 4.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Stack(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Container(
                          width: 150.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) =>
                                _model.googleMapsCenter = latLng,
                            initialLocation: _model.googleMapsCenter ??=
                                widget.locations!.firstOrNull!,
                            markers: (widget.locations ?? [])
                                .map(
                                  (marker) => FlutterFlowMarker(
                                    marker.serialize(),
                                    marker,
                                  ),
                                )
                                .toList(),
                            markerColor: GoogleMarkerColor.violet,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14.0,
                            allowInteraction: false,
                            allowZoom: false,
                            showZoomControls: false,
                            showLocation: false,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.clear,
                            color: FlutterFlowTheme.of(context).error,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await widget.fevRef!.delete();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Icon(
                          Icons.location_pin,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          widget.orderType,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: AutoSizeText(
                    widget.title,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
