import '/flutter_flow/flutter_flow_util.dart';
import 'fav_save_widget.dart' show FavSaveWidget;
import 'package:flutter/material.dart';

class FavSaveModel extends FlutterFlowModel<FavSaveWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
