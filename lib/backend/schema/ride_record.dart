import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideRecord extends FirestoreRecord {
  RideRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_uid" field.
  String? _userUid;
  String get userUid => _userUid ?? '';
  bool hasUserUid() => _userUid != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "user_address" field.
  String? _userAddress;
  String get userAddress => _userAddress ?? '';
  bool hasUserAddress() => _userAddress != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "is_driver_assigned" field.
  bool? _isDriverAssigned;
  bool get isDriverAssigned => _isDriverAssigned ?? false;
  bool hasIsDriverAssigned() => _isDriverAssigned != null;

  // "created_on" field.
  DateTime? _createdOn;
  DateTime? get createdOn => _createdOn;
  bool hasCreatedOn() => _createdOn != null;

  // "cargoType" field.
  String? _cargoType;
  String get cargoType => _cargoType ?? '';
  bool hasCargoType() => _cargoType != null;

  // "cargoAmount" field.
  int? _cargoAmount;
  int get cargoAmount => _cargoAmount ?? 0;
  bool hasCargoAmount() => _cargoAmount != null;

  // "vehicleType" field.
  String? _vehicleType;
  String get vehicleType => _vehicleType ?? '';
  bool hasVehicleType() => _vehicleType != null;

  // "orderPrice" field.
  double? _orderPrice;
  double get orderPrice => _orderPrice ?? 0.0;
  bool hasOrderPrice() => _orderPrice != null;

  // "orderStatus" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "order_ID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  // "scheduleTime" field.
  DateTime? _scheduleTime;
  DateTime? get scheduleTime => _scheduleTime;
  bool hasScheduleTime() => _scheduleTime != null;

  // "scheduleType" field.
  String? _scheduleType;
  String get scheduleType => _scheduleType ?? '';
  bool hasScheduleType() => _scheduleType != null;

  // "completedOn" field.
  DateTime? _completedOn;
  DateTime? get completedOn => _completedOn;
  bool hasCompletedOn() => _completedOn != null;

  // "orderType" field.
  String? _orderType;
  String get orderType => _orderType ?? '';
  bool hasOrderType() => _orderType != null;

  // "orderRating" field.
  int? _orderRating;
  int get orderRating => _orderRating ?? 0;
  bool hasOrderRating() => _orderRating != null;

  // "orderAcceptedOn" field.
  DateTime? _orderAcceptedOn;
  DateTime? get orderAcceptedOn => _orderAcceptedOn;
  bool hasOrderAcceptedOn() => _orderAcceptedOn != null;

  // "orderDistance" field.
  double? _orderDistance;
  double get orderDistance => _orderDistance ?? 0.0;
  bool hasOrderDistance() => _orderDistance != null;

  // "orderImage" field.
  String? _orderImage;
  String get orderImage => _orderImage ?? '';
  bool hasOrderImage() => _orderImage != null;

  // "orderPickedUp" field.
  bool? _orderPickedUp;
  bool get orderPickedUp => _orderPickedUp ?? false;
  bool hasOrderPickedUp() => _orderPickedUp != null;

  // "pickedUpAt" field.
  DateTime? _pickedUpAt;
  DateTime? get pickedUpAt => _pickedUpAt;
  bool hasPickedUpAt() => _pickedUpAt != null;

  // "driverContact" field.
  String? _driverContact;
  String get driverContact => _driverContact ?? '';
  bool hasDriverContact() => _driverContact != null;

  // "packageType" field.
  String? _packageType;
  String get packageType => _packageType ?? '';
  bool hasPackageType() => _packageType != null;

  // "packageInfo" field.
  List<String>? _packageInfo;
  List<String> get packageInfo => _packageInfo ?? const [];
  bool hasPackageInfo() => _packageInfo != null;

  // "packageAssembly" field.
  String? _packageAssembly;
  String get packageAssembly => _packageAssembly ?? '';
  bool hasPackageAssembly() => _packageAssembly != null;

  // "receivingParty" field.
  String? _receivingParty;
  String get receivingParty => _receivingParty ?? '';
  bool hasReceivingParty() => _receivingParty != null;

  // "receivingPartyContact" field.
  List<int>? _receivingPartyContact;
  List<int> get receivingPartyContact => _receivingPartyContact ?? const [];
  bool hasReceivingPartyContact() => _receivingPartyContact != null;

  // "orderDetails" field.
  String? _orderDetails;
  String get orderDetails => _orderDetails ?? '';
  bool hasOrderDetails() => _orderDetails != null;

  // "coordinates" field.
  List<LatLng>? _coordinates;
  List<LatLng> get coordinates => _coordinates ?? const [];
  bool hasCoordinates() => _coordinates != null;

  // "addresses" field.
  List<String>? _addresses;
  List<String> get addresses => _addresses ?? const [];
  bool hasAddresses() => _addresses != null;

  // "assistance" field.
  int? _assistance;
  int get assistance => _assistance ?? 0;
  bool hasAssistance() => _assistance != null;

  // "driverPhoto_url" field.
  String? _driverPhotoUrl;
  String get driverPhotoUrl => _driverPhotoUrl ?? '';
  bool hasDriverPhotoUrl() => _driverPhotoUrl != null;

  void _initializeFields() {
    _userUid = snapshotData['user_uid'] as String?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _userAddress = snapshotData['user_address'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _driverName = snapshotData['driver_name'] as String?;
    _isDriverAssigned = snapshotData['is_driver_assigned'] as bool?;
    _createdOn = snapshotData['created_on'] as DateTime?;
    _cargoType = snapshotData['cargoType'] as String?;
    _cargoAmount = castToType<int>(snapshotData['cargoAmount']);
    _vehicleType = snapshotData['vehicleType'] as String?;
    _orderPrice = castToType<double>(snapshotData['orderPrice']);
    _orderStatus = snapshotData['orderStatus'] as String?;
    _orderID = snapshotData['order_ID'] as String?;
    _scheduleTime = snapshotData['scheduleTime'] as DateTime?;
    _scheduleType = snapshotData['scheduleType'] as String?;
    _completedOn = snapshotData['completedOn'] as DateTime?;
    _orderType = snapshotData['orderType'] as String?;
    _orderRating = castToType<int>(snapshotData['orderRating']);
    _orderAcceptedOn = snapshotData['orderAcceptedOn'] as DateTime?;
    _orderDistance = castToType<double>(snapshotData['orderDistance']);
    _orderImage = snapshotData['orderImage'] as String?;
    _orderPickedUp = snapshotData['orderPickedUp'] as bool?;
    _pickedUpAt = snapshotData['pickedUpAt'] as DateTime?;
    _driverContact = snapshotData['driverContact'] as String?;
    _packageType = snapshotData['packageType'] as String?;
    _packageInfo = getDataList(snapshotData['packageInfo']);
    _packageAssembly = snapshotData['packageAssembly'] as String?;
    _receivingParty = snapshotData['receivingParty'] as String?;
    _receivingPartyContact = getDataList(snapshotData['receivingPartyContact']);
    _orderDetails = snapshotData['orderDetails'] as String?;
    _coordinates = getDataList(snapshotData['coordinates']);
    _addresses = getDataList(snapshotData['addresses']);
    _assistance = castToType<int>(snapshotData['assistance']);
    _driverPhotoUrl = snapshotData['driverPhoto_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ride');

  static Stream<RideRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RideRecord.fromSnapshot(s));

  static Future<RideRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RideRecord.fromSnapshot(s));

  static RideRecord fromSnapshot(DocumentSnapshot snapshot) => RideRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RideRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RideRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RideRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RideRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRideRecordData({
  String? userUid,
  LatLng? driverLocation,
  String? driverUid,
  String? userAddress,
  String? userName,
  String? driverName,
  bool? isDriverAssigned,
  DateTime? createdOn,
  String? cargoType,
  int? cargoAmount,
  String? vehicleType,
  double? orderPrice,
  String? orderStatus,
  String? orderID,
  DateTime? scheduleTime,
  String? scheduleType,
  DateTime? completedOn,
  String? orderType,
  int? orderRating,
  DateTime? orderAcceptedOn,
  double? orderDistance,
  String? orderImage,
  bool? orderPickedUp,
  DateTime? pickedUpAt,
  String? driverContact,
  String? packageType,
  String? packageAssembly,
  String? receivingParty,
  String? orderDetails,
  int? assistance,
  String? driverPhotoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_uid': userUid,
      'driver_location': driverLocation,
      'driver_uid': driverUid,
      'user_address': userAddress,
      'user_name': userName,
      'driver_name': driverName,
      'is_driver_assigned': isDriverAssigned,
      'created_on': createdOn,
      'cargoType': cargoType,
      'cargoAmount': cargoAmount,
      'vehicleType': vehicleType,
      'orderPrice': orderPrice,
      'orderStatus': orderStatus,
      'order_ID': orderID,
      'scheduleTime': scheduleTime,
      'scheduleType': scheduleType,
      'completedOn': completedOn,
      'orderType': orderType,
      'orderRating': orderRating,
      'orderAcceptedOn': orderAcceptedOn,
      'orderDistance': orderDistance,
      'orderImage': orderImage,
      'orderPickedUp': orderPickedUp,
      'pickedUpAt': pickedUpAt,
      'driverContact': driverContact,
      'packageType': packageType,
      'packageAssembly': packageAssembly,
      'receivingParty': receivingParty,
      'orderDetails': orderDetails,
      'assistance': assistance,
      'driverPhoto_url': driverPhotoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class RideRecordDocumentEquality implements Equality<RideRecord> {
  const RideRecordDocumentEquality();

  @override
  bool equals(RideRecord? e1, RideRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userUid == e2?.userUid &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.driverUid == e2?.driverUid &&
        e1?.userAddress == e2?.userAddress &&
        e1?.userName == e2?.userName &&
        e1?.driverName == e2?.driverName &&
        e1?.isDriverAssigned == e2?.isDriverAssigned &&
        e1?.createdOn == e2?.createdOn &&
        e1?.cargoType == e2?.cargoType &&
        e1?.cargoAmount == e2?.cargoAmount &&
        e1?.vehicleType == e2?.vehicleType &&
        e1?.orderPrice == e2?.orderPrice &&
        e1?.orderStatus == e2?.orderStatus &&
        e1?.orderID == e2?.orderID &&
        e1?.scheduleTime == e2?.scheduleTime &&
        e1?.scheduleType == e2?.scheduleType &&
        e1?.completedOn == e2?.completedOn &&
        e1?.orderType == e2?.orderType &&
        e1?.orderRating == e2?.orderRating &&
        e1?.orderAcceptedOn == e2?.orderAcceptedOn &&
        e1?.orderDistance == e2?.orderDistance &&
        e1?.orderImage == e2?.orderImage &&
        e1?.orderPickedUp == e2?.orderPickedUp &&
        e1?.pickedUpAt == e2?.pickedUpAt &&
        e1?.driverContact == e2?.driverContact &&
        e1?.packageType == e2?.packageType &&
        listEquality.equals(e1?.packageInfo, e2?.packageInfo) &&
        e1?.packageAssembly == e2?.packageAssembly &&
        e1?.receivingParty == e2?.receivingParty &&
        listEquality.equals(
            e1?.receivingPartyContact, e2?.receivingPartyContact) &&
        e1?.orderDetails == e2?.orderDetails &&
        listEquality.equals(e1?.coordinates, e2?.coordinates) &&
        listEquality.equals(e1?.addresses, e2?.addresses) &&
        e1?.assistance == e2?.assistance &&
        e1?.driverPhotoUrl == e2?.driverPhotoUrl;
  }

  @override
  int hash(RideRecord? e) => const ListEquality().hash([
        e?.userUid,
        e?.driverLocation,
        e?.driverUid,
        e?.userAddress,
        e?.userName,
        e?.driverName,
        e?.isDriverAssigned,
        e?.createdOn,
        e?.cargoType,
        e?.cargoAmount,
        e?.vehicleType,
        e?.orderPrice,
        e?.orderStatus,
        e?.orderID,
        e?.scheduleTime,
        e?.scheduleType,
        e?.completedOn,
        e?.orderType,
        e?.orderRating,
        e?.orderAcceptedOn,
        e?.orderDistance,
        e?.orderImage,
        e?.orderPickedUp,
        e?.pickedUpAt,
        e?.driverContact,
        e?.packageType,
        e?.packageInfo,
        e?.packageAssembly,
        e?.receivingParty,
        e?.receivingPartyContact,
        e?.orderDetails,
        e?.coordinates,
        e?.addresses,
        e?.assistance,
        e?.driverPhotoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is RideRecord;
}
