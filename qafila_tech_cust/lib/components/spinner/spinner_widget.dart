import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'spinner_model.dart';
export 'spinner_model.dart';

class SpinnerWidget extends StatefulWidget {
  const SpinnerWidget({super.key});

  @override
  State<SpinnerWidget> createState() => _SpinnerWidgetState();
}

class _SpinnerWidgetState extends State<SpinnerWidget> {
  late SpinnerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpinnerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        child: custom_widgets.CustomProgressIndicator(
          width: 50.0,
          height: 50.0,
          color: FlutterFlowTheme.of(context).secondary,
          strokeWidth: 4.0,
        ),
      ),
    );
  }
}
