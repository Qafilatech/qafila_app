import '/flutter_flow/flutter_flow_util.dart';
import 'contact_list_widget.dart' show ContactListWidget;
import 'package:flutter/material.dart';

class ContactListModel extends FlutterFlowModel<ContactListWidget> {
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
