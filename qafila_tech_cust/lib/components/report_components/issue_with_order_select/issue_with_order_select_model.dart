import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'issue_with_order_select_widget.dart' show IssueWithOrderSelectWidget;
import 'package:flutter/material.dart';

class IssueWithOrderSelectModel
    extends FlutterFlowModel<IssueWithOrderSelectWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for OrderDropDown widget.
  String? orderDropDownValue;
  FormFieldController<String>? orderDropDownValueController;
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
