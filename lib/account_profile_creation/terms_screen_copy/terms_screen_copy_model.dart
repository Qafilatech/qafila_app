import '/components/terms_section/terms_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'terms_screen_copy_widget.dart' show TermsScreenCopyWidget;
import 'package:flutter/material.dart';

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
