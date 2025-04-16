import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/address_edit/address_edit_widget.dart';
import '/components/contact/contact_widget.dart';
import '/components/fav_save/fav_save_widget.dart';
import '/components/pay/pay_widget.dart';
import '/components/report_components/report_issue_menu/report_issue_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'delivery_screen_large_widget.dart' show DeliveryScreenLargeWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class DeliveryScreenLargeModel
    extends FlutterFlowModel<DeliveryScreenLargeWidget> {
  ///  Local state fields for this page.

  bool cargoDef = false;

  bool orderSum = false;

  bool payment = false;

  DateTime? scheduleTime;

  String? scheduleType = '';

  bool locationStatus = false;

  String? locationAddress;

  String? locationType;

  LatLng? pickUp;

  LatLng? dropOff;

  bool routeDef = true;

  int? dropCount = 0;

  double? progressBar = 0.2;

  bool furniture = false;

  bool food = false;

  bool clothes = false;

  bool appliance = false;

  bool documents = false;

  bool pallet = false;

  bool boxed = false;

  bool unpackegd = false;

  bool pickuptruck = false;

  bool flatbed = false;

  bool boxtruck = false;

  bool wheel12 = false;

  bool wheel18 = false;

  bool crate = false;

  bool electric = false;

  bool van = false;

  List<LatLng> locList = [];
  void addToLocList(LatLng item) => locList.add(item);
  void removeFromLocList(LatLng item) => locList.remove(item);
  void removeAtIndexFromLocList(int index) => locList.removeAt(index);
  void insertAtIndexInLocList(int index, LatLng item) =>
      locList.insert(index, item);
  void updateLocListAtIndex(int index, Function(LatLng) updateFn) =>
      locList[index] = updateFn(locList[index]);

  List<String> locListAddy = [];
  void addToLocListAddy(String item) => locListAddy.add(item);
  void removeFromLocListAddy(String item) => locListAddy.remove(item);
  void removeAtIndexFromLocListAddy(int index) => locListAddy.removeAt(index);
  void insertAtIndexInLocListAddy(int index, String item) =>
      locListAddy.insert(index, item);
  void updateLocListAddyAtIndex(int index, Function(String) updateFn) =>
      locListAddy[index] = updateFn(locListAddy[index]);

  bool summary = false;

  bool upload = false;

  bool material = false;

  bool machinery = false;

  bool others = false;

  List<String> locListEdit = [];
  void addToLocListEdit(String item) => locListEdit.add(item);
  void removeFromLocListEdit(String item) => locListEdit.remove(item);
  void removeAtIndexFromLocListEdit(int index) => locListEdit.removeAt(index);
  void insertAtIndexInLocListEdit(int index, String item) =>
      locListEdit.insert(index, item);
  void updateLocListEditAtIndex(int index, Function(String) updateFn) =>
      locListEdit[index] = updateFn(locListEdit[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - API (Geocoding IOS)] action in IconButton widget.
  ApiCallResponse? apiResultzqa;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // Stores action output result for [Bottom Sheet - favSave] action in ToggleIcon widget.
  String? titleFav;
  // Stores action output result for [Backend Call - Create Document] action in ToggleIcon widget.
  SavedLocationsRecord? newFav;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in SlidableActionWidget widget.
  String? newAddyName;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  // State field(s) for CommentsTextField widget.
  FocusNode? commentsTextFieldFocusNode;
  TextEditingController? commentsTextFieldTextController;
  String? Function(BuildContext, String?)?
      commentsTextFieldTextControllerValidator;
  // State field(s) for ChoiceChipsAP widget.
  FormFieldController<List<String>>? choiceChipsAPValueController;
  String? get choiceChipsAPValue =>
      choiceChipsAPValueController?.value?.firstOrNull;
  set choiceChipsAPValue(String? val) =>
      choiceChipsAPValueController?.value = val != null ? [val] : [];
  // State field(s) for CountControllerAssist widget.
  int? countControllerAssistValue;
  // State field(s) for SwitchReceivingParty widget.
  bool? switchReceivingPartyValue;
  // Models for contactRecievingParty.
  late FlutterFlowDynamicModels<ContactModel> contactRecievingPartyModels;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RideRecord? rideref;

  @override
  void initState(BuildContext context) {
    contactRecievingPartyModels =
        FlutterFlowDynamicModels(() => ContactModel());
  }

  @override
  void dispose() {
    commentsTextFieldFocusNode?.dispose();
    commentsTextFieldTextController?.dispose();

    contactRecievingPartyModels.dispose();
  }
}
