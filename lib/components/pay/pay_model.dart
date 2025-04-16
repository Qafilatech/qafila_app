import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'pay_widget.dart' show PayWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PayModel extends FlutterFlowModel<PayWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for cardNumber widget.
  FocusNode? cardNumberFocusNode;
  TextEditingController? cardNumberTextController;
  final cardNumberMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? cardNumberTextControllerValidator;
  // State field(s) for dateField widget.
  FocusNode? dateFieldFocusNode;
  TextEditingController? dateFieldTextController;
  final dateFieldMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? dateFieldTextControllerValidator;
  // State field(s) for PinField widget.
  FocusNode? pinFieldFocusNode;
  TextEditingController? pinFieldTextController;
  late bool pinFieldVisibility;
  final pinFieldMask = MaskTextInputFormatter(mask: '####');
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
