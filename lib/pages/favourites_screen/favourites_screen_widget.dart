import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/appbar_component/appbar_component_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'favourites_screen_model.dart';
export 'favourites_screen_model.dart';

class FavouritesScreenWidget extends StatefulWidget {
  const FavouritesScreenWidget({super.key});

  static String routeName = 'FavouritesScreen';
  static String routePath = 'favouritesScreen';

  @override
  State<FavouritesScreenWidget> createState() => _FavouritesScreenWidgetState();
}

class _FavouritesScreenWidgetState extends State<FavouritesScreenWidget> {
  late FavouritesScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouritesScreenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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

    return StreamBuilder<List<FavoriteLocationsRecord>>(
      stream: queryFavoriteLocationsRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        List<FavoriteLocationsRecord>
            favouritesScreenFavoriteLocationsRecordList = snapshot.data!;

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
                Container(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 70.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 100),
                                  () async {
                                    safeSetState(() {
                                      _model.simpleSearchResults = TextSearch(
                                        favouritesScreenFavoriteLocationsRecordList
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record,
                                                      [record.locationName]),
                                            )
                                            .toList(),
                                      )
                                          .search(_model.textController.text)
                                          .map((r) => r.object)
                                          .toList();
                                      ;
                                    });
                                    _model.fullListShown = false;
                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '8gkp8zj4' /* Search.. */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                  suffixIcon: _model
                                          .textController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textController?.clear();
                                            safeSetState(() {
                                              _model.simpleSearchResults =
                                                  TextSearch(
                                                favouritesScreenFavoriteLocationsRecordList
                                                    .map(
                                                      (record) => TextSearchItem
                                                          .fromTerms(record, [
                                                        record.locationName
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                      .search(_model
                                                          .textController.text)
                                                      .map((r) => r.object)
                                                      .toList();
                                              ;
                                            });
                                            _model.fullListShown = false;
                                            safeSetState(() {});
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
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          if (!_model.fullListShown)
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Builder(
                                builder: (context) {
                                  final savedList =
                                      _model.simpleSearchResults.toList();
                                  if (savedList.isEmpty) {
                                    return Center(
                                      child: EmptyWidget(
                                        title: 'No Saved Locations',
                                        desc:
                                            'You have not saved any favorite locations yet. Start ordering to save a location.',
                                        icon: Icon(
                                          Icons.favorite,
                                        ),
                                      ),
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: savedList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 8.0),
                                    itemBuilder: (context, savedListIndex) {
                                      final savedListItem =
                                          savedList[savedListIndex];
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      savedListItem
                                                          .locationName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        'Number of Destinations: ${valueOrDefault<String>(
                                                          savedListItem
                                                              .locationDropCount
                                                              .toString(),
                                                          '0',
                                                        )}',
                                                        'n/a',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        'Order Type: ${savedListItem.locationType}',
                                                        'n/a',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    icon: Icon(
                                                      Icons.edit_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      if (savedListItem
                                                              .locationType ==
                                                          'Heavy') {
                                                        if (isWeb) {
                                                          context.pushNamed(
                                                            LargeDeliveryScreenWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'favCoordinates':
                                                                  serializeParam(
                                                                savedListItem
                                                                    .locationCoordinates,
                                                                ParamType
                                                                    .LatLng,
                                                                isList: true,
                                                              ),
                                                              'favAddress':
                                                                  serializeParam(
                                                                savedListItem
                                                                    .locationAddresses,
                                                                ParamType
                                                                    .String,
                                                                isList: true,
                                                              ),
                                                              'favStatus':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                              'dropCount':
                                                                  serializeParam(
                                                                savedListItem
                                                                    .locationDropCount,
                                                                ParamType.int,
                                                              ),
                                                              'detectedOS':
                                                                  serializeParam(
                                                                isWeb
                                                                    .toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (isiOS) {
                                                            context.pushNamed(
                                                              LargeDeliveryScreenWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'favCoordinates':
                                                                    serializeParam(
                                                                  savedListItem
                                                                      .locationCoordinates,
                                                                  ParamType
                                                                      .LatLng,
                                                                  isList: true,
                                                                ),
                                                                'favAddress':
                                                                    serializeParam(
                                                                  savedListItem
                                                                      .locationAddresses,
                                                                  ParamType
                                                                      .String,
                                                                  isList: true,
                                                                ),
                                                                'favStatus':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                                'dropCount':
                                                                    serializeParam(
                                                                  savedListItem
                                                                      .locationDropCount,
                                                                  ParamType.int,
                                                                ),
                                                                'detectedOS':
                                                                    serializeParam(
                                                                  isiOS
                                                                      .toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            if (isAndroid) {
                                                              context.pushNamed(
                                                                LargeDeliveryScreenWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'favCoordinates':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationCoordinates,
                                                                    ParamType
                                                                        .LatLng,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                  'favAddress':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationAddresses,
                                                                    ParamType
                                                                        .String,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                  'favStatus':
                                                                      serializeParam(
                                                                    true,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'dropCount':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationDropCount,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'detectedOS':
                                                                      serializeParam(
                                                                    isAndroid
                                                                        .toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                LargeDeliveryScreenWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'favCoordinates':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationCoordinates,
                                                                    ParamType
                                                                        .LatLng,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                  'favAddress':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationAddresses,
                                                                    ParamType
                                                                        .String,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                  'favStatus':
                                                                      serializeParam(
                                                                    true,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'dropCount':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationDropCount,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'detectedOS':
                                                                      serializeParam(
                                                                    'NULL',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          }
                                                        }
                                                      }
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    icon: Icon(
                                                      Icons.delete_outline,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Delete Saved Location'),
                                                                    content: Text(
                                                                        'You are about to delete a saved location. Are you sure you wish to continue?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        await savedListItem
                                                            .reference
                                                            .delete();
                                                        return;
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if (_model.fullListShown)
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Builder(
                                builder: (context) {
                                  final savedList =
                                      favouritesScreenFavoriteLocationsRecordList
                                          .toList();
                                  if (savedList.isEmpty) {
                                    return Center(
                                      child: EmptyWidget(
                                        title: 'No Saved Locations',
                                        desc:
                                            'You have not saved any favorite locations yet. Start ordering to save a location.',
                                        icon: Icon(
                                          Icons.favorite,
                                        ),
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: savedList.length,
                                    itemBuilder: (context, savedListIndex) {
                                      final savedListItem =
                                          savedList[savedListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          savedListItem
                                                              .locationName,
                                                          'N/A',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          'Number of Destinations: ${valueOrDefault<String>(
                                                            savedListItem
                                                                .locationDropCount
                                                                .toString(),
                                                            '0',
                                                          )}',
                                                          'n/a',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          'Order Type: ${valueOrDefault<String>(
                                                            savedListItem
                                                                .locationType,
                                                            'N/A',
                                                          )}',
                                                          'n/a',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      icon: Icon(
                                                        Icons.edit_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (savedListItem
                                                                .locationType ==
                                                            'Heavy') {
                                                          if (isWeb) {
                                                            context.pushNamed(
                                                              LargeDeliveryScreenWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'favCoordinates':
                                                                    serializeParam(
                                                                  savedListItem
                                                                      .locationCoordinates,
                                                                  ParamType
                                                                      .LatLng,
                                                                  isList: true,
                                                                ),
                                                                'favAddress':
                                                                    serializeParam(
                                                                  savedListItem
                                                                      .locationAddresses,
                                                                  ParamType
                                                                      .String,
                                                                  isList: true,
                                                                ),
                                                                'favStatus':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                                'dropCount':
                                                                    serializeParam(
                                                                  savedListItem
                                                                      .locationDropCount,
                                                                  ParamType.int,
                                                                ),
                                                                'detectedOS':
                                                                    serializeParam(
                                                                  isWeb
                                                                      .toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            if (isiOS) {
                                                              context.pushNamed(
                                                                LargeDeliveryScreenWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'favCoordinates':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationCoordinates,
                                                                    ParamType
                                                                        .LatLng,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                  'favAddress':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationAddresses,
                                                                    ParamType
                                                                        .String,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                  'favStatus':
                                                                      serializeParam(
                                                                    true,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'dropCount':
                                                                      serializeParam(
                                                                    savedListItem
                                                                        .locationDropCount,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'detectedOS':
                                                                      serializeParam(
                                                                    isiOS
                                                                        .toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              if (isAndroid) {
                                                                context
                                                                    .pushNamed(
                                                                  LargeDeliveryScreenWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'favCoordinates':
                                                                        serializeParam(
                                                                      savedListItem
                                                                          .locationCoordinates,
                                                                      ParamType
                                                                          .LatLng,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'favAddress':
                                                                        serializeParam(
                                                                      savedListItem
                                                                          .locationAddresses,
                                                                      ParamType
                                                                          .String,
                                                                      isList:
                                                                          true,
                                                                    ),
                                                                    'favStatus':
                                                                        serializeParam(
                                                                      true,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'dropCount':
                                                                        serializeParam(
                                                                      savedListItem
                                                                          .locationDropCount,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'detectedOS':
                                                                        serializeParam(
                                                                      isAndroid
                                                                          .toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            }
                                                          }
                                                        }
                                                      },
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      icon: Icon(
                                                        Icons.delete_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Delete Saved Location'),
                                                                      content: Text(
                                                                          'You are about to delete a saved location. Are you sure you wish to continue?'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Cancel'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Confirm'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          await savedListItem
                                                              .reference
                                                              .delete();
                                                          return;
                                                        } else {
                                                          return;
                                                        }
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ],
                                            ),
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOutQuint,
                    width: MediaQuery.sizeOf(context).width,
                    height: 70.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 60.0,
                        child: that_bottom_bar_y134zt_custom_widgets
                            .ThatCurvedNavBar(
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
                                if (that_bottom_bar_y134zt_app_state
                                            .FFAppState()
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
                    pageTitle: 'Favorites',
                    menuButtonAction: () async {
                      context.safePop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
