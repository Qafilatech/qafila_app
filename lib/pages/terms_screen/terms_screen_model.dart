import '/components/terms_section/terms_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'terms_screen_widget.dart' show TermsScreenWidget;
import 'package:flutter/material.dart';

class TermsScreenModel extends FlutterFlowModel<TermsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TermsSection component.
  late TermsSectionModel termsSectionModel;

  @override
  void initState(BuildContext context) {
    termsSectionModel = createModel(context, () => TermsSectionModel());
  }

  @override
  void dispose() {
    termsSectionModel.dispose();
  }
}
