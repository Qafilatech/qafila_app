import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/contact/contact_widget.dart';
import '/components/fav_save_widget.dart';
import '/components/report_components/report_issue_menu/report_issue_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/locate_ride_page/locate_ride_page_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'delivery_screen_large_model.dart';
export 'delivery_screen_large_model.dart';

class DeliveryScreenLargeWidget extends StatefulWidget {
  const DeliveryScreenLargeWidget({
    super.key,
    this.favCoordinates,
    this.favAddress,
    bool? favStatus,
    this.dropCount,
  }) : this.favStatus = favStatus ?? false;

  /// after clicking on fav btn
  final List<LatLng>? favCoordinates;

  final List<String>? favAddress;
  final bool favStatus;
  final int? dropCount;

  static String routeName = 'DeliveryScreen-large';
  static String routePath = '/deliveryScreenLarge';

  @override
  State<DeliveryScreenLargeWidget> createState() =>
      _DeliveryScreenLargeWidgetState();
}

class _DeliveryScreenLargeWidgetState extends State<DeliveryScreenLargeWidget>
    with TickerProviderStateMixin {
  late DeliveryScreenLargeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryScreenLargeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);
      await requestPermission(photoLibraryPermission);
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.commentsTextFieldTextController ??= TextEditingController();
    _model.commentsTextFieldFocusNode ??= FocusNode();

    _model.switchReceivingPartyValue = true;
    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(3.0, 3.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitThreeBounce(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: FlutterFlowGoogleMap(
                  controller: _model.googleMapsController1,
                  onCameraIdle: (latLng) =>
                      safeSetState(() => _model.googleMapsCenter1 = latLng),
                  initialLocation: _model.googleMapsCenter1 ??=
                      _model.pickUp == null
                          ? currentUserLocationValue!
                          : _model.pickUp!,
                  markers: ((widget.favStatus
                              ? widget.favCoordinates
                              : _model.locList) ??
                          [])
                      .map(
                        (marker) => FlutterFlowMarker(
                          marker.serialize(),
                          marker,
                        ),
                      )
                      .toList(),
                  markerColor: GoogleMarkerColor.red,
                  mapType: MapType.normal,
                  style: GoogleMapStyle.standard,
                  initialZoom: 14.0,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: false,
                  showLocation: true,
                  showCompass: false,
                  showMapToolbar: true,
                  showTraffic: false,
                  centerMapOnMarkerTap: true,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.05),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Icon(
                    Icons.location_pin,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 40.0,
                  ),
                ),
              ),
              PointerInterceptor(
                intercepting: isWeb,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_model.cargoDef == true)
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.cargoDef = false;
                              _model.routeDef = true;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).height,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 140.0, 16.0, 30.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 16.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'pq7mg2n4' /* Specify your cargo */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 26.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'awhvf1et' /* What are you shipping? */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              icon: Icon(
                                                Icons.info_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 18.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 4.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          1.0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.furniture
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                      ),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.furniture =
                                                          !_model.furniture;
                                                      safeSetState(() {});
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/pngwing.com_(3).PNG',
                                                            width: 85.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'l39hxc32' /* Furniture */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        -1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.electric
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                    ),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.electric =
                                                        !_model.electric;
                                                    safeSetState(() {});
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.asset(
                                                            'assets/images/pngwing.com_(21).PNG',
                                                            width: 85.0,
                                                            height: 75.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'stk3q97x' /* Electronics */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        -1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.appliance
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                    ),
                                                  ),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.appliance =
                                                        !_model.appliance;
                                                    safeSetState(() {});
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/pngwing.com_(11).PNG',
                                                          width: 85.0,
                                                          height: 75.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            't8m84jdz' /* Appliances */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        -1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.appliance
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                    ),
                                                  ),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.material =
                                                        !_model.material;
                                                    safeSetState(() {});
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/pngwing.com_(24).png',
                                                          width: 85.0,
                                                          height: 75.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'b9n0e8xj' /* Materials */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        -1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.appliance
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                    ),
                                                  ),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.machinery =
                                                        !_model.machinery;
                                                    safeSetState(() {});
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/pngfind.com-machine-png-1317622.PNG',
                                                          width: 85.0,
                                                          height: 75.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'q4vtn0is' /* Machinery */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        -1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.appliance
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                    ),
                                                  ),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.others =
                                                        !_model.others;
                                                    safeSetState(() {});
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/kindpng_2806848.PNG',
                                                          width: 85.0,
                                                          height: 75.0,
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '3f1pylli' /* Other */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kxompp2u' /* How is it packaged? */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              icon: Icon(
                                                Icons.info_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 18.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 165.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      -1.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      1.0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.boxed
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.boxed =
                                                          !_model.boxed;
                                                      _model.unpackegd = false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'aa50mg9q' /* Packed */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: Image.asset(
                                                              'assets/images/pngwing.com_(14).PNG',
                                                              width: 85.0,
                                                              height: 75.0,
                                                              fit: BoxFit.fill,
                                                              alignment:
                                                                  Alignment(
                                                                      1.0, 0.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 165.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      -1.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      1.0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.unpackegd
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.boxed = false;
                                                      _model.unpackegd =
                                                          !_model.unpackegd;
                                                      safeSetState(() {});
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'n3fwjnwb' /* Unpackaged */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/frv.PNG',
                                                            width: 85.0,
                                                            height: 75.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5t1rxggu' /* How many packages? */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              icon: Icon(
                                                Icons.info_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 18.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                Icon(
                                              Icons.remove_rounded,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                Icon(
                                              Icons.add_rounded,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            count: _model
                                                .countControllerValue ??= 0,
                                            updateCount: (count) =>
                                                safeSetState(() => _model
                                                        .countControllerValue =
                                                    count),
                                            stepSize: 1,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'wzvravq5' /* Handeling Instructions */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              icon: Icon(
                                                Icons.info_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 18.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '2m6qoy8i' /* Perishable */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '8rpsoy5n' /* Hazerdous */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'kqgwx99r' /* Oversize/Heavy */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '6x0z1a7j' /* Keep Upright/ Do Not Tilt */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'lp2xo42k' /* Do Not Stack */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              't67swnv1' /* Keep Dry */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'pb525ud3' /* Fragile */,
                                            ))
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.choiceChipsValues = val),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      letterSpacing: 0.0,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            iconSize: 16.0,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 4.0, 10.0, 4.0),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            iconSize: 16.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          chipSpacing: 10.0,
                                          rowSpacing: 8.0,
                                          multiselect: true,
                                          initialized:
                                              _model.choiceChipsValues != null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          wrapped: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 100.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 18.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8msqnpf8' /* Upload a picture of your cargo */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (_model.uploadedFileUrl != '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child:
                                                                Image.network(
                                                              _model
                                                                  .uploadedFileUrl,
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '6j8asixd' /* Image Uploaded! */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.check_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 24.0,
                                                    ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 12.0))
                                                      .addToStart(
                                                          SizedBox(width: 24.0))
                                                      .addToEnd(SizedBox(
                                                          width: 24.0)),
                                                ),
                                              ),
                                            badges.Badge(
                                              badgeContent: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '05c80113' /* 1 */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              showBadge: _model.upload,
                                              shape: badges.BadgeShape.circle,
                                              badgeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              elevation: 4.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              position:
                                                  badges.BadgePosition.topEnd(),
                                              animationType: badges
                                                  .BadgeAnimationType.scale,
                                              toAnimate: true,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Uploading file...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Success!');
                                                      } else {
                                                        safeSetState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Failed to upload data');
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'oma0hv2w' /* Upload Image */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 335.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation']!,
                              hasBeenTriggered: hasContainerTriggered),
                        ),
                      ),
                    if (_model.routeDef == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).secondary
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 2.0, 2.0, 2.0),
                                    child: FlutterFlowPlacePicker(
                                      iOSGoogleMapsApiKey:
                                          'AIzaSyBMwBGynKTbtb1lutB-9BvMXxTmrNYoN7s',
                                      androidGoogleMapsApiKey:
                                          'AIzaSyCX-tNBeRrqwCim7XsOr1FMzQOHG12CphE',
                                      webGoogleMapsApiKey:
                                          'AIzaSyB1LAg6t2HCKT2K0C6P5mR5gqmpeWIkG5I',
                                      onSelect: (place) async {
                                        safeSetState(() =>
                                            _model.placePickerValue = place);
                                      },
                                      defaultText:
                                          FFLocalizations.of(context).getText(
                                        'jldodtd4' /* Search Location */,
                                      ),
                                      icon: Icon(
                                        Icons.place,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 16.0,
                                      ),
                                      buttonOptions: FFButtonOptions(
                                        width: 250.0,
                                        height: 50.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 2.0, 2.0, 2.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 90.0,
                                      buttonSize: 50.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      disabledColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      disabledIconColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      icon: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      onPressed: ((_model.dropCount! >= 4) ||
                                              (_model.placePickerValue == null))
                                          ? null
                                          : () async {
                                              _model.apiResultzqa =
                                                  await GeocodingIOSCall.call(
                                                lat: valueOrDefault<double>(
                                                  functions
                                                      .latlngSplit(_model
                                                          .googleMapsCenter1)
                                                      .firstOrNull,
                                                  0.0,
                                                ),
                                                lng: valueOrDefault<double>(
                                                  functions
                                                      .latlngSplit(_model
                                                          .googleMapsCenter1)
                                                      .lastOrNull,
                                                  0.0,
                                                ),
                                              );

                                              if ((_model.apiResultzqa
                                                      ?.succeeded ??
                                                  true)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Location is set successfully',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                );
                                                _model.addToLocList(
                                                    _model.googleMapsCenter1!);
                                                _model.pickUp =
                                                    _model.googleMapsCenter1;
                                                _model.dropCount =
                                                    _model.dropCount! + 1;
                                                _model.addToLocListAddy(
                                                    valueOrDefault<String>(
                                                  (GeocodingIOSCall
                                                          .formattedAddress(
                                                    (_model.apiResultzqa
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.elementAtOrNull(3))
                                                      ?.toString(),
                                                  'null',
                                                ));
                                                safeSetState(() {});
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Failed to set location address',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.3, 1.0],
                                    begin: AlignmentDirectional(-1.0, -0.87),
                                    end: AlignmentDirectional(1.0, 0.87),
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Visibility(
                                  visible: _model.routeDef,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.0, 1.0, 1.0, 1.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 90.0,
                                        buttonSize: 50.0,
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        disabledIconColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        icon: Icon(
                                          Icons.location_searching_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 24.0,
                                        ),
                                        onPressed: (_model
                                                    .placePickerValue.latLng ==
                                                null)
                                            ? null
                                            : () async {
                                                await _model
                                                    .googleMapsController1
                                                    .future
                                                    .then(
                                                  (c) => c.animateCamera(
                                                    CameraUpdate.newLatLng(
                                                        _model
                                                            .placePickerValue
                                                            .latLng
                                                            .toGoogleMaps()),
                                                  ),
                                                );
                                                                                            },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (_model.routeDef == true)
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        height: valueOrDefault<double>(
                          () {
                            if (_model.dropCount == 0) {
                              return 190.0;
                            } else if (widget.favStatus) {
                              return 320.0;
                            } else {
                              return valueOrDefault<double>(
                                _model.dropCount == 1
                                    ? 260.0
                                    : valueOrDefault<double>(
                                        _model.dropCount == 2 ? 320.0 : 320.0,
                                        320.0,
                                      ),
                                260.0,
                              );
                            }
                          }(),
                          190.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 18.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '47j3ofgz' /* Schedule Delivery: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 8.0, 8.0),
                                          child: Container(
                                            width: 130.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.schedule_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 2.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.dropDownValue ??=
                                                            'Now',
                                                      ),
                                                      options:
                                                          List<String>.from(
                                                              ['Now', 'Later']),
                                                      optionLabels: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'pzcfk9ph' /* Now */,
                                                        ),
                                                        dateTimeFormat(
                                                                      "M/d H:mm",
                                                                      _model
                                                                          .datePicked,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ) !=
                                                                    ''
                                                            ? dateTimeFormat(
                                                                "M/d h:mm a",
                                                                _model
                                                                    .datePicked,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : 'Later'
                                                      ],
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .dropDownValue =
                                                            val);
                                                        if (_model
                                                                .dropDownValue ==
                                                            'Later') {
                                                          final _datePickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                getCurrentTimestamp,
                                                            firstDate:
                                                                getCurrentTimestamp,
                                                            lastDate:
                                                                DateTime(2050),
                                                            builder: (context,
                                                                child) {
                                                              return wrapInMaterialDatePickerTheme(
                                                                context,
                                                                child!,
                                                                headerBackgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                headerForegroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                headerTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              32.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                pickerBackgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                pickerForegroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                selectedDateTimeBackgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                selectedDateTimeForegroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                actionButtonForegroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                iconSize: 24.0,
                                                              );
                                                            },
                                                          );

                                                          TimeOfDay?
                                                              _datePickedTime;
                                                          if (_datePickedDate !=
                                                              null) {
                                                            _datePickedTime =
                                                                await showTimePicker(
                                                              context: context,
                                                              initialTime: TimeOfDay
                                                                  .fromDateTime(
                                                                      getCurrentTimestamp),
                                                              builder: (context,
                                                                  child) {
                                                                return wrapInMaterialTimePickerTheme(
                                                                  context,
                                                                  child!,
                                                                  headerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  headerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  headerTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            32.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                  pickerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  pickerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  selectedDateTimeBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  selectedDateTimeForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  actionButtonForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  iconSize:
                                                                      24.0,
                                                                );
                                                              },
                                                            );
                                                          }

                                                          if (_datePickedDate !=
                                                                  null &&
                                                              _datePickedTime !=
                                                                  null) {
                                                            safeSetState(() {
                                                              _model.datePicked =
                                                                  DateTime(
                                                                _datePickedDate
                                                                    .year,
                                                                _datePickedDate
                                                                    .month,
                                                                _datePickedDate
                                                                    .day,
                                                                _datePickedTime!
                                                                    .hour,
                                                                _datePickedTime
                                                                    .minute,
                                                              );
                                                            });
                                                          } else if (_model
                                                                  .datePicked !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked =
                                                                  getCurrentTimestamp;
                                                            });
                                                          }
                                                          _model.scheduleTime =
                                                              _model.datePicked;
                                                          _model.scheduleType =
                                                              _model
                                                                  .dropDownValue;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.scheduleTime =
                                                              _model.datePicked;
                                                          _model.scheduleType =
                                                              _model
                                                                  .dropDownValue;
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      width: 100.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '5s0ds7em' /* Please select... */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 2.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                      labelText: '',
                                                      labelTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Visibility(
                                          visible: _model.locList.isNotEmpty,
                                          child: ToggleIcon(
                                            onPressed: () async {
                                              safeSetState(() =>
                                                  _model.locationStatus =
                                                      !_model.locationStatus);
                                              var _shouldSetState = false;
                                              if (widget.favStatus) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: FavSaveWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model.titleFav =
                                                        value));

                                                _shouldSetState = true;

                                                var favouriteLocationsRecordReference =
                                                    FavouriteLocationsRecord
                                                        .createDoc(
                                                            currentUserReference!);
                                                await favouriteLocationsRecordReference
                                                    .set({
                                                  ...createFavouriteLocationsRecordData(
                                                    locationStatus: true,
                                                    locationName:
                                                        _model.titleFav,
                                                    locationType:
                                                        'Heavy Delivery',
                                                    dropCount: _model.dropCount,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'locationCoordinates':
                                                          convertToGeoPointList(
                                                              _model.locList),
                                                      'locationAddrress':
                                                          _model.locListAddy,
                                                    },
                                                  ),
                                                });
                                                _model.newFav =
                                                    FavouriteLocationsRecord
                                                        .getDocumentFromData({
                                                  ...createFavouriteLocationsRecordData(
                                                    locationStatus: true,
                                                    locationName:
                                                        _model.titleFav,
                                                    locationType:
                                                        'Heavy Delivery',
                                                    dropCount: _model.dropCount,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'locationCoordinates':
                                                          convertToGeoPointList(
                                                              _model.locList),
                                                      'locationAddrress':
                                                          _model.locListAddy,
                                                    },
                                                  ),
                                                }, favouriteLocationsRecordReference);
                                                _shouldSetState = true;
                                              } else {
                                                if (_model.newFav?.reference !=
                                                    null) {
                                                  await _model.newFav!.reference
                                                      .delete();
                                                }
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            value: _model.locationStatus,
                                            onIcon: Icon(
                                              Icons.favorite_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            ),
                                            offIcon: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 200.0,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 70.0),
                                child: Builder(
                                  builder: (context) {
                                    final locationList = ((widget.favStatus
                                                    ? widget.favAddress
                                                    : _model.locListAddy)
                                                ?.toList() ??
                                            [])
                                        .take(4)
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: locationList.length,
                                      itemBuilder:
                                          (context, locationListIndex) {
                                        final locationListItem =
                                            locationList[locationListIndex];
                                        return Slidable(
                                          endActionPane: ActionPane(
                                            motion: const ScrollMotion(),
                                            extentRatio: 0.25,
                                            children: [
                                              SlidableAction(
                                                label:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '2h7oxn3p' /* Delete */,
                                                ),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                icon: Icons
                                                    .delete_outline_rounded,
                                                onPressed: (_) async {
                                                  _model
                                                      .removeAtIndexFromLocList(
                                                          locationListIndex);
                                                  _model
                                                      .removeAtIndexFromLocListAddy(
                                                          locationListIndex);
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ],
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.pin_drop,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              title: Text(
                                                locationListIndex.toString() ==
                                                        '0'
                                                    ? 'From'
                                                    : 'To',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                locationListItem,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.chevron_right_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              dense: false,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                    if (valueOrDefault<bool>(
                      _model.summary == true,
                      false,
                    ))
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x25090F13),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 130.0, 16.0, 100.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      _model.summary = false;
                                      _model.orderSum = true;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                      ),
                                    ),
                                    child: FlutterFlowGoogleMap(
                                      controller: _model.googleMapsController2,
                                      onCameraIdle: (latLng) =>
                                          _model.googleMapsCenter2 = latLng,
                                      initialLocation:
                                          _model.googleMapsCenter2 ??=
                                              _model.locList.lastOrNull!,
                                      markers: _model.locList
                                          .map(
                                            (marker) => FlutterFlowMarker(
                                              marker.serialize(),
                                              marker,
                                            ),
                                          )
                                          .toList(),
                                      markerColor: GoogleMarkerColor.violet,
                                      mapType: MapType.normal,
                                      style: GoogleMapStyle.standard,
                                      initialZoom: 14.0,
                                      allowInteraction: false,
                                      allowZoom: false,
                                      showZoomControls: false,
                                      showLocation: true,
                                      showCompass: false,
                                      showMapToolbar: false,
                                      showTraffic: false,
                                      centerMapOnMarkerTap: false,
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 10.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ws2aar8e' /* Order Summary */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 26.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.person,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  _model
                                                      .countControllerAssistValue,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.box,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  _model.countControllerValue,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '8pjxy8o8' /* Route details */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final summaryList =
                                        _model.locListAddy.toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: summaryList.length,
                                      itemBuilder: (context, summaryListIndex) {
                                        final summaryListItem =
                                            summaryList[summaryListIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 6.0, 16.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  summaryListIndex.toString() ==
                                                          '0'
                                                      ? 'Pick up -'
                                                      : 'Drop off -',
                                                  'nill',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  summaryListItem,
                                                  'nill',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Divider(
                                  height: 16.0,
                                  thickness: 1.0,
                                  color: Color(0xFFC7C7C7),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'o3m0g0ab' /* Cargo details */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 6.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'knp55wwe' /* Selected Cargo - */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Wrap(
                                        spacing: 2.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              _model.furniture == true
                                                  ? 'Furniture'
                                                  : valueOrDefault<String>(
                                                      _model.food == true
                                                          ? 'Food Items'
                                                          : valueOrDefault<
                                                              String>(
                                                              _model.clothes ==
                                                                      true
                                                                  ? 'Clothes'
                                                                  : valueOrDefault<
                                                                      String>(
                                                                      _model.appliance ==
                                                                              true
                                                                          ? 'Appliances'
                                                                          : valueOrDefault<
                                                                              String>(
                                                                              _model.documents == true
                                                                                  ? 'Documents'
                                                                                  : valueOrDefault<String>(
                                                                                      _model.electric == true ? 'Electronics' : 'N/A',
                                                                                      'N/A',
                                                                                    ),
                                                                              'N/A',
                                                                            ),
                                                                      'N/A',
                                                                    ),
                                                              'N/A',
                                                            ),
                                                      'N/A',
                                                    ),
                                              'N/A',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'm2grua8g' /* Package Type - */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          _model.pallet == true
                                              ? 'Pallet'
                                              : valueOrDefault<String>(
                                                  _model.boxed == true
                                                      ? 'Boxed'
                                                      : valueOrDefault<String>(
                                                          _model.unpackegd ==
                                                                  true
                                                              ? 'Unpackaged'
                                                              : 'N/A',
                                                          'N/A',
                                                        ),
                                                  'N/A',
                                                ),
                                          'N/A',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '24ugn6kx' /* Handling Instructions - */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          functions.listOfChoiceChips(_model
                                              .choiceChipsValues
                                              ?.toList()),
                                          'N/A',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'wktoyust' /* Vehicle Type - */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          _model.pickuptruck == true
                                              ? 'Pickup Truck'
                                              : valueOrDefault<String>(
                                                  _model.flatbed == true
                                                      ? 'Flatbed Truck'
                                                      : valueOrDefault<String>(
                                                          _model.boxtruck ==
                                                                  true
                                                              ? 'Box Truck'
                                                              : valueOrDefault<
                                                                  String>(
                                                                  _model.wheel12 ==
                                                                          true
                                                                      ? 'Semi-Trailer Truck'
                                                                      : valueOrDefault<
                                                                          String>(
                                                                          _model.wheel18 == true
                                                                              ? '18-Wheeler Truck'
                                                                              : valueOrDefault<String>(
                                                                                  _model.van == true ? 'Van' : 'N/A',
                                                                                  'N/A',
                                                                                ),
                                                                          'N/A',
                                                                        ),
                                                                  'N/A',
                                                                ),
                                                          'N/A',
                                                        ),
                                                  'N/A',
                                                ),
                                          'N/A',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '8r3p1dmg' /* Assembly - */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          _model.choiceChipsAPValue,
                                          'n/a',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'mab2ynl3' /* Additional Information */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 30.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model
                                          .commentsTextFieldTextController,
                                      focusNode:
                                          _model.commentsTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.commentsTextFieldTextController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'zm3c3hay' /* Please fill in any information... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0x745A5C60),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        suffixIcon: _model
                                                .commentsTextFieldTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .commentsTextFieldTextController
                                                      ?.clear();
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  size: 22,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 5,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .commentsTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (valueOrDefault<bool>(
                      _model.orderSum == true,
                      false,
                    ))
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 150.0, 16.0, 110.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            _model.orderSum = false;
                                            _model.cargoDef = true;
                                            safeSetState(() {});
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '1czs7apx' /* Additional Information */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h7x101pa' /* What type of vehicle do you ne... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            icon: Icon(
                                              Icons.info_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 18.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                1.0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.van
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.pickuptruck =
                                                            false;
                                                        _model.van = true;
                                                        _model.flatbed = false;
                                                        _model.boxtruck = false;
                                                        _model.wheel12 = false;
                                                        _model.wheel18 = false;
                                                        safeSetState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/pngwing.com_(23).PNG',
                                                                width: 85.0,
                                                                height: 67.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'midy2a9x' /* Minivan */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'c8mavuy9' /* 20-30 OMR */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                1.0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.flatbed
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.pickuptruck =
                                                            false;
                                                        _model.van = false;
                                                        _model.flatbed = true;
                                                        _model.boxtruck = false;
                                                        _model.wheel12 = false;
                                                        _model.wheel18 = false;
                                                        safeSetState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/pngwing.com_(19).PNG',
                                                              width: 85.0,
                                                              height: 75.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '2hajqba6' /* Flatbed */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0dd6f68o' /* 30-40 OMR */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                1.0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.boxtruck
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.pickuptruck =
                                                            false;
                                                        _model.van = false;
                                                        _model.flatbed = false;
                                                        _model.boxtruck = true;
                                                        _model.wheel12 = false;
                                                        _model.wheel18 = false;
                                                        safeSetState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/pngwing.com_(16).PNG',
                                                                width: 85.0,
                                                                height: 75.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                                alignment:
                                                                    Alignment(
                                                                        1.0,
                                                                        0.0),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'kkr3w3ve' /* Boxtruck */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6n5vdpzo' /* 40-50 OMR */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                1.0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.wheel12
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.pickuptruck =
                                                            false;
                                                        _model.van = false;
                                                        _model.flatbed = false;
                                                        _model.boxtruck = false;
                                                        _model.wheel12 = true;
                                                        _model.wheel18 = false;
                                                        safeSetState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/pngwing.com_(18).PNG',
                                                                width: 85.0,
                                                                height: 75.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'neu3zhus' /* Semi-Trailer */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'l2gyva9j' /* 50-60 ORM */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                1.0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.wheel18
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.pickuptruck =
                                                            false;
                                                        _model.van = false;
                                                        _model.flatbed = false;
                                                        _model.boxtruck = false;
                                                        _model.wheel12 = false;
                                                        _model.wheel18 = true;
                                                        safeSetState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/pngwing.com_(17).PNG',
                                                              width: 85.0,
                                                              height: 75.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'pdp4k6mv' /* 18-Wheeler */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'cchbr5k8' /* 60-70 OMR */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qjyym4by' /* Does your cargo need to be ass... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            icon: Icon(
                                              Icons.info_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 18.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '1qqnfxgi' /* Assembly on Pick-up */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '1m8c92jr' /* Assembly on Drop-off */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'lqrn6q85' /* Assembly on both */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'vqzf501e' /* No Assembly Required */,
                                                ))
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .choiceChipsAPValue =
                                                      val?.firstOrNull),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                iconSize: 16.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 4.0,
                                                            10.0, 4.0),
                                                elevation: 0.0,
                                                borderWidth: 2.0,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 16.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 4.0,
                                                            10.0, 4.0),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              chipSpacing: 8.0,
                                              rowSpacing: 8.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.choiceChipsAPValue !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsAPValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nbvlxpne' /* Assembly on Pick-up */,
                                                  )
                                                ],
                                              ),
                                              wrapped: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ydw2uysn' /* How many helpers do you need? */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            icon: Icon(
                                              Icons.info_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 18.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              Icon(
                                            Icons.remove_rounded,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 24.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              Icon(
                                            Icons.add_rounded,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 24.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          count: _model
                                              .countControllerAssistValue ??= 0,
                                          updateCount: (count) => safeSetState(
                                              () => _model
                                                      .countControllerAssistValue =
                                                  count),
                                          stepSize: 1,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 6.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ovvf1ufz' /* Who will be receiving the pack... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            icon: Icon(
                                              Icons.info_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 18.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '5sd2nogc' /* Receiving Party:  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    _model.switchReceivingPartyValue!
                                                        ? 'Me'
                                                        : 'Other(s)',
                                                    'Me',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Switch.adaptive(
                                            value: _model
                                                .switchReceivingPartyValue!,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                      .switchReceivingPartyValue =
                                                  newValue);
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (!_model.switchReceivingPartyValue!)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final contactList = _model
                                                .locListAddy
                                                .toList()
                                                .take(4)
                                                .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: contactList.length,
                                              itemBuilder:
                                                  (context, contactListIndex) {
                                                final contactListItem =
                                                    contactList[
                                                        contactListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 8.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .contactRecievingPartyModels
                                                        .getModel(
                                                      contactListItem,
                                                      contactListIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ContactWidget(
                                                      key: Key(
                                                        'Key3zj_${contactListItem}',
                                                      ),
                                                      labelz: contactListItem,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_model.payment == true)
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 140.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Container(
                                      width: 60.0,
                                      height: 4.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F4F8),
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.arrow_back,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  _model.payment = false;
                                                  _model.summary = true;
                                                  safeSetState(() {});
                                                },
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'adorqgvx' /* Checkout */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'n1gmfyy9' /* Fill in the information below ... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 24.0,
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: FlutterFlowCreditCardForm(
                                        formKey: _model.creditCardFormKey,
                                        creditCardModel: _model.creditCardInfo,
                                        obscureNumber: true,
                                        obscureCvv: true,
                                        spacing: 10.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        inputDecoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 4.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                          child: CheckboxListTile(
                                            value: _model
                                                .checkboxListTileValue ??= true,
                                            onChanged: (newValue) async {
                                              safeSetState(() =>
                                                  _model.checkboxListTileValue =
                                                      newValue!);
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mwlokmib' /* Save card details */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bjo3d0cv' /* Your details can be used for l... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'ieoh5hw8' /* Apple Pay */,
                                        ),
                                        icon: FaIcon(
                                          FontAwesomeIcons.apple,
                                          color: Colors.white,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 270.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF14181B),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'vfpfjp5i' /* Pay w/Paypal */,
                                        ),
                                        icon: FaIcon(
                                          FontAwesomeIcons.paypal,
                                          color: Colors.white,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 270.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF14181B),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'eakk7oer' /* Or use an option above */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          valueOrDefault<Color>(
                            (_model.cargoDef == true) ||
                                    (_model.orderSum == true) ||
                                    (_model.payment == true)
                                ? FlutterFlowTheme.of(context).accent1
                                : Color(0x00507583),
                            FlutterFlowTheme.of(context).accent1,
                          ),
                          valueOrDefault<Color>(
                            (_model.cargoDef == true) ||
                                    (_model.orderSum == true) ||
                                    (_model.payment == true)
                                ? FlutterFlowTheme.of(context).accent2
                                : Color(0x0018AA99),
                            FlutterFlowTheme.of(context).accent2,
                          )
                        ],
                        stops: [
                          0.0,
                          valueOrDefault<double>(
                            (_model.cargoDef == true) ||
                                    (_model.orderSum == true) ||
                                    (_model.payment == true)
                                ? 0.5
                                : 1.0,
                            0.5,
                          ),
                          1.0
                        ],
                        begin: AlignmentDirectional(
                            computeGradientAlignmentX(valueOrDefault<double>(
                              (_model.cargoDef == true) ||
                                      (_model.orderSum == true) ||
                                      (_model.payment == true)
                                  ? 315.0
                                  : 0.0,
                              315.0,
                            )),
                            computeGradientAlignmentY(valueOrDefault<double>(
                              (_model.cargoDef == true) ||
                                      (_model.orderSum == true) ||
                                      (_model.payment == true)
                                  ? 315.0
                                  : 0.0,
                              315.0,
                            ))),
                        end: AlignmentDirectional(
                            -1 *
                                computeGradientAlignmentX(
                                    valueOrDefault<double>(
                                  (_model.cargoDef == true) ||
                                          (_model.orderSum == true) ||
                                          (_model.payment == true)
                                      ? 315.0
                                      : 0.0,
                                  315.0,
                                )),
                            -1 *
                                computeGradientAlignmentY(
                                    valueOrDefault<double>(
                                  (_model.cargoDef == true) ||
                                          (_model.orderSum == true) ||
                                          (_model.payment == true)
                                      ? 315.0
                                      : 0.0,
                                  315.0,
                                ))),
                      ),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Container(
                      width: 100.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            (_model.cargoDef == true) ||
                                    (_model.orderSum == true) ||
                                    (_model.payment == true)
                                ? valueOrDefault<Color>(
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Color(0x00101518)
                                        : Color(0x00FFFFFF),
                                    Color(0x00FFFFFF),
                                  )
                                : Colors.transparent,
                            (_model.cargoDef == true) ||
                                    (_model.orderSum == true) ||
                                    (_model.payment == true)
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : Colors.transparent
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 12.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    icon: Icon(
                                      Icons.home,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5jar5v66' /* Delivery */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 25.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent2,
                                    borderRadius: 12.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidBell,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      scaffoldKey.currentState!.openEndDrawer();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent2,
                                    borderRadius: 12.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    icon: Icon(
                                      Icons.report,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: 450.0,
                                                child: ReportIssueMenuWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Container(
                    width: double.infinity,
                    height: _model.payment == true ? 210.0 : 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Divider(
                          height: 2.0,
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        if (valueOrDefault<bool>(
                          _model.payment == true,
                          false,
                        ))
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 12.0, 18.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'rvjxgh84' /* Base Price - */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          functions.priceCalcu(
                                              0.258,
                                              _model
                                                  .countControllerAssistValue!,
                                              'large',
                                              valueOrDefault<double>(
                                                functions
                                                    .routeDistanceCalcMulti(
                                                        _model.locList
                                                            .toList()),
                                                0.0,
                                              )),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: 'OMR',
                                        ),
                                        '0.0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 12.0, 18.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '46pfr1s1' /* Service Charge - */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '6j3ir5j1' /*  5% */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 4.0, 18.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8ruiu9fb' /* Total */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 36.0,
                                          icon: Icon(
                                            Icons.info_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          valueOrDefault<double>(
                                                functions.priceCalcu(
                                                    0.258,
                                                    _model
                                                        .countControllerAssistValue!,
                                                    'large',
                                                    valueOrDefault<double>(
                                                      functions
                                                          .routeDistanceCalcMulti(
                                                              _model.locList
                                                                  .toList()),
                                                      0.0,
                                                    )),
                                                0.0,
                                              ) *
                                              (1 + (5 / 100)),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: 'OMR',
                                        ),
                                        '0.0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 30.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 12.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(24.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: LinearPercentIndicator(
                                percent: _model.progressBar!,
                                width: 340.0,
                                lineHeight: 12.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).secondary,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).accent4,
                                barRadius: Radius.circular(100.0),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (_model.routeDef == true) {
                                  _model.routeDef = false;
                                  _model.cargoDef = true;
                                  _model.payment = false;
                                  _model.orderSum = false;
                                  _model.summary = false;
                                  safeSetState(() {});
                                  _model.progressBar = 0.4;
                                  safeSetState(() {});
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation'] !=
                                      null) {
                                    safeSetState(
                                        () => hasContainerTriggered = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  if (_model.cargoDef == true) {
                                    _model.payment = false;
                                    _model.cargoDef = false;
                                    _model.routeDef = false;
                                    _model.orderSum = true;
                                    _model.summary = false;
                                    safeSetState(() {});
                                    _model.progressBar = 0.6;
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    if (_model.orderSum == true) {
                                      _model.payment = false;
                                      _model.cargoDef = false;
                                      _model.routeDef = false;
                                      _model.orderSum = false;
                                      _model.summary = true;
                                      safeSetState(() {});
                                      _model.progressBar = 0.8;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      if (_model.summary == true) {
                                        _model.payment = true;
                                        _model.cargoDef = false;
                                        _model.routeDef = false;
                                        _model.orderSum = false;
                                        _model.summary = false;
                                        safeSetState(() {});
                                        _model.progressBar = 1.0;
                                        safeSetState(() {});
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        if (_model.payment == true) {
                                          var rideRecordReference =
                                              RideRecord.collection.doc();
                                          await rideRecordReference.set({
                                            ...createRideRecordData(
                                              userUid: currentUserUid,
                                              userAddress: currentUserEmail,
                                              userName: currentUserDisplayName,
                                              createdOn:
                                                  dateTimeFromSecondsSinceEpoch(
                                                      valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                0,
                                              )),
                                              cargoType: valueOrDefault<String>(
                                                _model.furniture == true
                                                    ? 'Furniture'
                                                    : valueOrDefault<String>(
                                                        _model.electric == true
                                                            ? 'Electronics'
                                                            : valueOrDefault<
                                                                String>(
                                                                _model.appliance ==
                                                                        true
                                                                    ? 'Appliances'
                                                                    : 'N/A',
                                                                'N/A',
                                                              ),
                                                        'N/A',
                                                      ),
                                                'N/A',
                                              ),
                                              cargoAmount:
                                                  _model.countControllerValue,
                                              vehicleType:
                                                  valueOrDefault<String>(
                                                _model.flatbed == true
                                                    ? 'Flatbed'
                                                    : valueOrDefault<String>(
                                                        _model.boxtruck == true
                                                            ? 'Boxtruck'
                                                            : valueOrDefault<
                                                                String>(
                                                                _model.wheel12 ==
                                                                        true
                                                                    ? 'Semi-Truck'
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        _model.wheel18 ==
                                                                                true
                                                                            ? '18-Wheeler'
                                                                            : 'N/A',
                                                                        'N/A',
                                                                      ),
                                                                'N/A',
                                                              ),
                                                        'N/A',
                                                      ),
                                                'N/A',
                                              ),
                                              assistance: _model
                                                  .countControllerAssistValue,
                                              orderPrice:
                                                  valueOrDefault<double>(
                                                functions.priceCalcu(
                                                    0.258,
                                                    _model
                                                        .countControllerAssistValue!,
                                                    'large',
                                                    valueOrDefault<double>(
                                                      functions
                                                          .routeDistanceCalcMulti(
                                                              _model.locList
                                                                  .toList()),
                                                      0.0,
                                                    )),
                                                0.0,
                                              ),
                                              orderStatus: 'Active',
                                              orderID: valueOrDefault<String>(
                                                functions.orderidcreate(),
                                                'N/A',
                                              ),
                                              scheduleTime: _model.datePicked,
                                              scheduleType:
                                                  _model.dropDownValue,
                                              packageType:
                                                  valueOrDefault<String>(
                                                _model.boxed == true
                                                    ? 'Boxed'
                                                    : valueOrDefault<String>(
                                                        _model.unpackegd == true
                                                            ? 'Unpackaged'
                                                            : valueOrDefault<
                                                                String>(
                                                                _model.pallet ==
                                                                        true
                                                                    ? 'Pallet'
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        _model.crate ==
                                                                                true
                                                                            ? 'Wooden Crate'
                                                                            : 'N/A',
                                                                        'N/A',
                                                                      ),
                                                                'N/A',
                                                              ),
                                                        'N/A',
                                                      ),
                                                'N/A',
                                              ),
                                              receivingParty:
                                                  valueOrDefault<String>(
                                                _model.switchReceivingPartyValue!
                                                    ? currentPhoneNumber
                                                    : 'Other',
                                                'N/A',
                                              ),
                                              orderDetails: _model
                                                  .commentsTextFieldTextController
                                                  .text,
                                              orderDistance:
                                                  valueOrDefault<double>(
                                                functions
                                                    .routeDistanceCalcMulti(
                                                        _model.locList
                                                            .toList()),
                                                0.0,
                                              ),
                                              isDriverAssigned: false,
                                              orderType: 'Heavy',
                                              packageAssembly:
                                                  _model.choiceChipsAPValue,
                                              orderImage:
                                                  _model.uploadedFileUrl,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'packageInfo':
                                                    _model.choiceChipsValues,
                                                'coordinates':
                                                    convertToGeoPointList(
                                                        _model.locList),
                                                'receivingPartyContact': _model
                                                    .contactRecievingPartyModels
                                                    .getValues(
                                                  (m) => m.textController.text,
                                                ),
                                                'addresses': _model.locListAddy,
                                              },
                                            ),
                                          });
                                          _model.rideref =
                                              RideRecord.getDocumentFromData({
                                            ...createRideRecordData(
                                              userUid: currentUserUid,
                                              userAddress: currentUserEmail,
                                              userName: currentUserDisplayName,
                                              createdOn:
                                                  dateTimeFromSecondsSinceEpoch(
                                                      valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                0,
                                              )),
                                              cargoType: valueOrDefault<String>(
                                                _model.furniture == true
                                                    ? 'Furniture'
                                                    : valueOrDefault<String>(
                                                        _model.electric == true
                                                            ? 'Electronics'
                                                            : valueOrDefault<
                                                                String>(
                                                                _model.appliance ==
                                                                        true
                                                                    ? 'Appliances'
                                                                    : 'N/A',
                                                                'N/A',
                                                              ),
                                                        'N/A',
                                                      ),
                                                'N/A',
                                              ),
                                              cargoAmount:
                                                  _model.countControllerValue,
                                              vehicleType:
                                                  valueOrDefault<String>(
                                                _model.flatbed == true
                                                    ? 'Flatbed'
                                                    : valueOrDefault<String>(
                                                        _model.boxtruck == true
                                                            ? 'Boxtruck'
                                                            : valueOrDefault<
                                                                String>(
                                                                _model.wheel12 ==
                                                                        true
                                                                    ? 'Semi-Truck'
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        _model.wheel18 ==
                                                                                true
                                                                            ? '18-Wheeler'
                                                                            : 'N/A',
                                                                        'N/A',
                                                                      ),
                                                                'N/A',
                                                              ),
                                                        'N/A',
                                                      ),
                                                'N/A',
                                              ),
                                              assistance: _model
                                                  .countControllerAssistValue,
                                              orderPrice:
                                                  valueOrDefault<double>(
                                                functions.priceCalcu(
                                                    0.258,
                                                    _model
                                                        .countControllerAssistValue!,
                                                    'large',
                                                    valueOrDefault<double>(
                                                      functions
                                                          .routeDistanceCalcMulti(
                                                              _model.locList
                                                                  .toList()),
                                                      0.0,
                                                    )),
                                                0.0,
                                              ),
                                              orderStatus: 'Active',
                                              orderID: valueOrDefault<String>(
                                                functions.orderidcreate(),
                                                'N/A',
                                              ),
                                              scheduleTime: _model.datePicked,
                                              scheduleType:
                                                  _model.dropDownValue,
                                              packageType:
                                                  valueOrDefault<String>(
                                                _model.boxed == true
                                                    ? 'Boxed'
                                                    : valueOrDefault<String>(
                                                        _model.unpackegd == true
                                                            ? 'Unpackaged'
                                                            : valueOrDefault<
                                                                String>(
                                                                _model.pallet ==
                                                                        true
                                                                    ? 'Pallet'
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        _model.crate ==
                                                                                true
                                                                            ? 'Wooden Crate'
                                                                            : 'N/A',
                                                                        'N/A',
                                                                      ),
                                                                'N/A',
                                                              ),
                                                        'N/A',
                                                      ),
                                                'N/A',
                                              ),
                                              receivingParty:
                                                  valueOrDefault<String>(
                                                _model.switchReceivingPartyValue!
                                                    ? currentPhoneNumber
                                                    : 'Other',
                                                'N/A',
                                              ),
                                              orderDetails: _model
                                                  .commentsTextFieldTextController
                                                  .text,
                                              orderDistance:
                                                  valueOrDefault<double>(
                                                functions
                                                    .routeDistanceCalcMulti(
                                                        _model.locList
                                                            .toList()),
                                                0.0,
                                              ),
                                              isDriverAssigned: false,
                                              orderType: 'Heavy',
                                              packageAssembly:
                                                  _model.choiceChipsAPValue,
                                              orderImage:
                                                  _model.uploadedFileUrl,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'packageInfo':
                                                    _model.choiceChipsValues,
                                                'coordinates':
                                                    convertToGeoPointList(
                                                        _model.locList),
                                                'receivingPartyContact': _model
                                                    .contactRecievingPartyModels
                                                    .getValues(
                                                  (m) => m.textController.text,
                                                ),
                                                'addresses': _model.locListAddy,
                                              },
                                            ),
                                          }, rideRecordReference);
                                          _shouldSetState = true;
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LocateRidePageWidget(
                                                rideDetailsReference:
                                                    _model.rideref?.reference,
                                              ),
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }
                                    }
                                  }
                                }

                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '9kzk3esc' /* Next */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
