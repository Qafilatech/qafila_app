import '/flutter_flow/flutter_flow_util.dart';
import 'other_issue_menu_widget.dart' show OtherIssueMenuWidget;
import 'package:flutter/material.dart';

class OtherIssueMenuModel extends FlutterFlowModel<OtherIssueMenuWidget> {
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
