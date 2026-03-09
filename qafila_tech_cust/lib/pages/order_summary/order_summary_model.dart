import '/components/appbar_component/appbar_component_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'order_summary_widget.dart' show OrderSummaryWidget;
import 'package:flutter/material.dart';

class OrderSummaryModel extends FlutterFlowModel<OrderSummaryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppbarComponent component.
  late AppbarComponentModel appbarComponentModel;
  // State field(s) for amentities widget.
  FormFieldController<List<String>>? amentitiesValueController;
  List<String>? get amentitiesValues => amentitiesValueController?.value;
  set amentitiesValues(List<String>? val) =>
      amentitiesValueController?.value = val;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - getRoadRoute] action in ButtonTrack widget.
  List<LatLng>? routeHelp;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;

  @override
  void initState(BuildContext context) {
    appbarComponentModel = createModel(context, () => AppbarComponentModel());
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    appbarComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    menuDrawerModel.dispose();
  }
}
