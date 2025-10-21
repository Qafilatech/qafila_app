import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favourites_screen_widget.dart' show FavouritesScreenWidget;
import 'package:flutter/material.dart';

class FavouritesScreenModel extends FlutterFlowModel<FavouritesScreenWidget> {
  ///  Local state fields for this page.

  bool fullListShown = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<FavoriteLocationsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
