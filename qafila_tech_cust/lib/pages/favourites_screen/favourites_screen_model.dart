import '/backend/backend.dart';
import '/components/appbar_component/appbar_component_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favourites_screen_widget.dart' show FavouritesScreenWidget;
import 'package:flutter/material.dart';

class FavouritesScreenModel extends FlutterFlowModel<FavouritesScreenWidget> {
  ///  Local state fields for this page.

  bool fullListShown = true;

  ///  State fields for stateful widgets in this page.

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<FavoriteLocationsRecord> simpleSearchResults = [];
  // Model for AppbarComponent component.
  late AppbarComponentModel appbarComponentModel;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    appbarComponentModel = createModel(context, () => AppbarComponentModel());
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    appbarComponentModel.dispose();
  }
}
