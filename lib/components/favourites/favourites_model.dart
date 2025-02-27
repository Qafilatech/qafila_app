import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favourites_widget.dart' show FavouritesWidget;
import 'package:flutter/material.dart';

class FavouritesModel extends FlutterFlowModel<FavouritesWidget> {
  ///  Local state fields for this component.

  bool? status;

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
