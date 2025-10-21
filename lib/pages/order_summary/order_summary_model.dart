import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'order_summary_widget.dart' show OrderSummaryWidget;
import 'package:flutter/material.dart';

class OrderSummaryModel extends FlutterFlowModel<OrderSummaryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for amentities widget.
  FormFieldController<List<String>>? amentitiesValueController;
  List<String>? get amentitiesValues => amentitiesValueController?.value;
  set amentitiesValues(List<String>? val) =>
      amentitiesValueController?.value = val;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
