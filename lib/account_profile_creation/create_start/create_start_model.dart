import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_start_widget.dart' show CreateStartWidget;
import 'package:flutter/material.dart';

class CreateStartModel extends FlutterFlowModel<CreateStartWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4qjyiiao' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ggkkmxrq' /* Incorrect email format. */,
      );
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3qs2g4bj' /* Password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'uwzl5c00' /* Password needs to be longer th... */,
      );
    }

    return null;
  }

  // State field(s) for Cpassword widget.
  FocusNode? cpasswordFocusNode;
  TextEditingController? cpasswordTextController;
  late bool cpasswordVisibility;
  String? Function(BuildContext, String?)? cpasswordTextControllerValidator;
  String? _cpasswordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o16y7c3h' /* Confirm Password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'ri04xoyq' /* Password needs to be longer th... */,
      );
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? emailcheck;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidate;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    cpasswordVisibility = false;
    cpasswordTextControllerValidator = _cpasswordTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    cpasswordFocusNode?.dispose();
    cpasswordTextController?.dispose();
  }
}
