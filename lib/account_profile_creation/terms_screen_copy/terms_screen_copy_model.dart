import '/backend/api_requests/api_calls.dart';
import '/components/appbar_component/appbar_component_widget.dart';
import '/components/terms_section/terms_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'terms_screen_copy_widget.dart' show TermsScreenCopyWidget;
import 'package:flutter/material.dart';

class TermsScreenCopyModel extends FlutterFlowModel<TermsScreenCopyWidget> {
  ///  Local state fields for this page.

  bool termsAgree = false;

  ///  State fields for stateful widgets in this page.

  // Model for AppbarComponent component.
  late AppbarComponentModel appbarComponentModel;
  // Model for TermsSection component.
  late TermsSectionModel termsSectionModel;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Stores action output result for [Backend Call - API (signup)] action in Button widget.
  ApiCallResponse? apiSignup;

  @override
  void initState(BuildContext context) {
    appbarComponentModel = createModel(context, () => AppbarComponentModel());
    termsSectionModel = createModel(context, () => TermsSectionModel());
  }

  @override
  void dispose() {
    appbarComponentModel.dispose();
    termsSectionModel.dispose();
  }
}
