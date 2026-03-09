import '/components/appbar_component/appbar_component_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/terms_section/terms_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:community_testing_ryusdv/app_state.dart'
    as community_testing_ryusdv_app_state;
import 'package:custom_openstreetmap_vmty5u/app_state.dart'
    as custom_openstreetmap_vmty5u_app_state;
import 'package:that_bottom_bar_y134zt/app_state.dart'
    as that_bottom_bar_y134zt_app_state;
import 'package:that_bottom_bar_y134zt/custom_code/widgets/index.dart'
    as that_bottom_bar_y134zt_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'terms_screen_model.dart';
export 'terms_screen_model.dart';

class TermsScreenWidget extends StatefulWidget {
  const TermsScreenWidget({super.key});

  static String routeName = 'TermsScreen';
  static String routePath = 'termsScreen';

  @override
  State<TermsScreenWidget> createState() => _TermsScreenWidgetState();
}

class _TermsScreenWidgetState extends State<TermsScreenWidget> {
  late TermsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<custom_openstreetmap_vmty5u_app_state.FFAppState>();
    context.watch<community_testing_ryusdv_app_state.FFAppState>();
    context.watch<that_bottom_bar_y134zt_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.menuDrawerModel,
            updateCallback: () => safeSetState(() {}),
            child: MenuDrawerWidget(),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 140.0, 0.0, 70.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primaryBackground,
                      FlutterFlowTheme.of(context).secondaryBackground
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.termsSectionModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TermsSectionWidget(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInOutQuint,
                width: MediaQuery.sizeOf(context).width,
                height: 70.0,
                decoration: BoxDecoration(
                  color: Color(0x00101518),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60.0,
                    child:
                        that_bottom_bar_y134zt_custom_widgets.ThatCurvedNavBar(
                      width: MediaQuery.sizeOf(context).width,
                      height: 60.0,
                      keyValue: 'page',
                      firstIcon: Icon(
                        Icons.home_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      secondIcon: Icon(
                        Icons.person,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      thirdIcon: Icon(
                        Icons.history,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      backgroundColor: Color(0x00182026),
                      buttonBackgroundColor:
                          FlutterFlowTheme.of(context).secondary,
                      onTap: () async {
                        if (that_bottom_bar_y134zt_app_state.FFAppState()
                                .pageIndex
                                .toString() ==
                            '0') {
                          context.goNamed(
                            HomeWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          );

                          return;
                        } else {
                          if (that_bottom_bar_y134zt_app_state.FFAppState()
                                  .pageIndex
                                  .toString() ==
                              '1') {
                            context.goNamed(
                              UserProfileWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 300),
                                ),
                              },
                            );

                            return;
                          } else {
                            if (that_bottom_bar_y134zt_app_state.FFAppState()
                                    .pageIndex
                                    .toString() ==
                                '2') {
                              context.goNamed(
                                OrderHistoryWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );

                              return;
                            } else {
                              return;
                            }
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.appbarComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: AppbarComponentWidget(
                pageTitle: 'Terms & Condition',
                menuButtonAction: () async {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
