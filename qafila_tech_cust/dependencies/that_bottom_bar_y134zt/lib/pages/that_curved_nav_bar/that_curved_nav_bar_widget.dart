import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'that_curved_nav_bar_model.dart';
export 'that_curved_nav_bar_model.dart';

class ThatCurvedNavBarWidget extends StatefulWidget {
  const ThatCurvedNavBarWidget({super.key});

  @override
  State<ThatCurvedNavBarWidget> createState() => _ThatCurvedNavBarWidgetState();
}

class _ThatCurvedNavBarWidgetState extends State<ThatCurvedNavBarWidget> {
  late ThatCurvedNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThatCurvedNavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 121.0,
      child: custom_widgets.ThatCurvedNavBar(
        width: double.infinity,
        height: 121.0,
        color: FlutterFlowTheme.of(context).tertiary,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        buttonBackgroundColor: FlutterFlowTheme.of(context).tertiary,
        firstIcon: Icon(
          Icons.home_filled,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        secondIcon: Icon(
          Icons.explore_rounded,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        thirdIcon: Icon(
          Icons.settings,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        fourthIcon: Icon(
          Icons.person_2,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        fifthIcon: Icon(
          Icons.space_dashboard_rounded,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        keyValue: FFAppConstants.bottomKey,
        onTap: () async {
          if (FFAppState().pageIndex == 0) {
            context.goNamed(
              HomePageWidget.routeName,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else {
            if (FFAppState().pageIndex == 1) {
              context.goNamed(
                Page2Widget.routeName,
                extra: <String, dynamic>{
                  '__transition_info__': TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else {
              if (FFAppState().pageIndex == 2) {
                context.goNamed(
                  Page3Widget.routeName,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              }
            }
          }
        },
      ),
    );
  }
}
