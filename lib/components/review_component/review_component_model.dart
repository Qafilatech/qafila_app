import '/flutter_flow/flutter_flow_util.dart';
import 'review_component_widget.dart' show ReviewComponentWidget;
import 'package:flutter/material.dart';

class ReviewComponentModel extends FlutterFlowModel<ReviewComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - riderRatingg] action in Button widget.
  double? riderRating;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
