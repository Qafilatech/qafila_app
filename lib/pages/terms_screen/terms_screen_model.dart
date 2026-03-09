import '/components/appbar_component/appbar_component_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/terms_section/terms_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'terms_screen_widget.dart' show TermsScreenWidget;
import 'package:flutter/material.dart';

class TermsScreenModel extends FlutterFlowModel<TermsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // Model for TermsSection component.
  late TermsSectionModel termsSectionModel;
  // Model for AppbarComponent component.
  late AppbarComponentModel appbarComponentModel;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    termsSectionModel = createModel(context, () => TermsSectionModel());
    appbarComponentModel = createModel(context, () => AppbarComponentModel());
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    termsSectionModel.dispose();
    appbarComponentModel.dispose();
  }
}
