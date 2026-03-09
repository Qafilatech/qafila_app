// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import '/backend/supabase/supabase.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import "package:community_testing_ryusdv/backend/schema/enums/enums.dart"
    as community_testing_ryusdv_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class MovingDriverIndicator extends StatefulWidget {
  const MovingDriverIndicator({
    super.key,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    this.borderRadius = 8.0,
  });

  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  State<MovingDriverIndicator> createState() => _MovingDriverIndicatorState();
}

class _MovingDriverIndicatorState extends State<MovingDriverIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 4.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: LinearProgressIndicator(
          // Use your app's Primary color if none is provided
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.color ?? FlutterFlowTheme.of(context).primary,
          ),
          backgroundColor: widget.backgroundColor ??
              FlutterFlowTheme.of(context).alternate.withOpacity(0.3),
        ),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
