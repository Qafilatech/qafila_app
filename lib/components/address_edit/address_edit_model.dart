import '/flutter_flow/flutter_flow_util.dart';
import 'address_edit_widget.dart' show AddressEditWidget;
import 'package:flutter/material.dart';

class AddressEditModel extends FlutterFlowModel<AddressEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
