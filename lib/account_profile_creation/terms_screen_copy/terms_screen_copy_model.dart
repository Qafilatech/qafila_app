import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/terms_section/terms_section_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'terms_screen_copy_widget.dart' show TermsScreenCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TermsScreenCopyModel extends FlutterFlowModel<TermsScreenCopyWidget> {
  ///  Local state fields for this page.

  bool termsAgree = false;

  ///  State fields for stateful widgets in this page.

  // Model for TermsSection component.
  late TermsSectionModel termsSectionModel;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;

  @override
  void initState(BuildContext context) {
    termsSectionModel = createModel(context, () => TermsSectionModel());
  }

  @override
  void dispose() {
    termsSectionModel.dispose();
  }
}
