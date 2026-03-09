import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'large_delivery_screen_widget.dart' show LargeDeliveryScreenWidget;
import 'package:flutter/material.dart';

class LargeDeliveryScreenModel
    extends FlutterFlowModel<LargeDeliveryScreenWidget> {
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

  bool refridge = false;

  bool flatbed = false;

  bool boxtruck = false;

  bool semi = false;

  bool tanker = false;

  bool carrier = false;

  bool electric = false;

  bool dump = false;

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

  bool locationSetFrom = false;

  bool locationSetTo = false;

  String pickUpAddress = 'null';

  String dropOffAddress = 'null';

  bool popUp = false;

  List<String> cargoList = [];
  void addToCargoList(String item) => cargoList.add(item);
  void removeFromCargoList(String item) => cargoList.remove(item);
  void removeAtIndexFromCargoList(int index) => cargoList.removeAt(index);
  void insertAtIndexInCargoList(int index, String item) =>
      cargoList.insert(index, item);
  void updateCargoListAtIndex(int index, Function(String) updateFn) =>
      cargoList[index] = updateFn(cargoList[index]);

  bool livestock = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (Geocoding WEB)] action in Icon widget.
  ApiCallResponse? apiResultxxq;
  // Stores action output result for [Backend Call - API (Geocoding IOS)] action in Icon widget.
  ApiCallResponse? apiResultxxu;
  // Stores action output result for [Backend Call - API (Geocoding Andoid)] action in Icon widget.
  ApiCallResponse? apiResultqtp;
  // Stores action output result for [Backend Call - API (Geocoding WEB)] action in Icon widget.
  ApiCallResponse? apiResultxxqCopy;
  // Stores action output result for [Backend Call - API (Geocoding IOS)] action in Icon widget.
  ApiCallResponse? apiResultxxuCopy;
  // Stores action output result for [Backend Call - API (Geocoding Andoid)] action in Icon widget.
  ApiCallResponse? apiResultqtpCopy;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // Stores action output result for [Bottom Sheet - favSave] action in ToggleIcon widget.
  String? titleFav;
  // Stores action output result for [Backend Call - Create Document] action in ToggleIcon widget.
  FavoriteLocationsRecord? newFav;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in SlidableActionWidget widget.
  String? newAddyName;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in SlidableActionWidget widget.
  String? newAddyName2;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for CountControllerAssist widget.
  int? countControllerAssistValue;
  bool isDataUploading_uploadData79o1 = false;
  FFUploadedFile uploadedLocalFile_uploadData79o1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData79o1 = '';

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for SwitchReceivingParty widget.
  bool? switchReceivingPartyValue;
  // State field(s) for TextFieldnamer widget.
  FocusNode? textFieldnamerFocusNode;
  TextEditingController? textFieldnamerTextController;
  String? Function(BuildContext, String?)?
      textFieldnamerTextControllerValidator;
  // State field(s) for TextFieldnumber widget.
  FocusNode? textFieldnumberFocusNode;
  TextEditingController? textFieldnumberTextController;
  String? Function(BuildContext, String?)?
      textFieldnumberTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - API (Geocoding Andoid)] action in IconButton widget.
  ApiCallResponse? apiResultzqa1;
  // Stores action output result for [Backend Call - API (Geocoding IOS)] action in IconButton widget.
  ApiCallResponse? apiResultzqa;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? rideref;
  // Stores action output result for [Custom Action - getRoadRoute] action in Button widget.
  List<LatLng>? routeHelp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldnamerFocusNode?.dispose();
    textFieldnamerTextController?.dispose();

    textFieldnumberFocusNode?.dispose();
    textFieldnumberTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
