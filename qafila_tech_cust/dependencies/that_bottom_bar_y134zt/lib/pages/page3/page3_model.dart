import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/that_curved_nav_bar/that_curved_nav_bar_widget.dart';
import 'dart:ui';
import 'page3_widget.dart' show Page3Widget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Page3Model extends FlutterFlowModel<Page3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for ThatCurvedNavBar component.
  late ThatCurvedNavBarModel thatCurvedNavBarModel;

  @override
  void initState(BuildContext context) {
    thatCurvedNavBarModel = createModel(context, () => ThatCurvedNavBarModel());
  }

  @override
  void dispose() {
    thatCurvedNavBarModel.dispose();
  }
}
