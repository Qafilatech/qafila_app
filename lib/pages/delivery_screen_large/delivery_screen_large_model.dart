import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/contact/contact_widget.dart';
import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'delivery_screen_large_widget.dart' show DeliveryScreenLargeWidget;
import 'package:flutter/material.dart';

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
  FavouriteLocationsRecord? newFav;
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
  // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
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
