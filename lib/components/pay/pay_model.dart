import '/flutter_flow/flutter_flow_util.dart';
import 'pay_widget.dart' show PayWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PayModel extends FlutterFlowModel<PayWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for cardNumber widget.
  FocusNode? cardNumberFocusNode;
  TextEditingController? cardNumberTextController;
  late MaskTextInputFormatter cardNumberMask;
  String? Function(BuildContext, String?)? cardNumberTextControllerValidator;
  // State field(s) for dateField widget.
  FocusNode? dateFieldFocusNode;
  TextEditingController? dateFieldTextController;
  late MaskTextInputFormatter dateFieldMask;
  String? Function(BuildContext, String?)? dateFieldTextControllerValidator;
  // State field(s) for PinField widget.
  FocusNode? pinFieldFocusNode;
  TextEditingController? pinFieldTextController;
  late bool pinFieldVisibility;
  late MaskTextInputFormatter pinFieldMask;
  String? Function(BuildContext, String?)? pinFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    pinFieldVisibility = false;
  }

  @override
  void dispose() {
    cardNumberFocusNode?.dispose();
    cardNumberTextController?.dispose();

    dateFieldFocusNode?.dispose();
    dateFieldTextController?.dispose();

    pinFieldFocusNode?.dispose();
    pinFieldTextController?.dispose();
  }
}
