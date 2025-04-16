import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleDBRecord extends FirestoreRecord {
  VehicleDBRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "DriverID" field.
  DocumentReference? _driverID;
  DocumentReference? get driverID => _driverID;
  bool hasDriverID() => _driverID != null;

  // "TruckID" field.
  String? _truckID;
  String get truckID => _truckID ?? '';
  bool hasTruckID() => _truckID != null;

  // "PlateNumber" field.
  String? _plateNumber;
  String get plateNumber => _plateNumber ?? '';
  bool hasPlateNumber() => _plateNumber != null;

  // "Capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "InsuaranceID" field.
  String? _insuaranceID;
  String get insuaranceID => _insuaranceID ?? '';
  bool hasInsuaranceID() => _insuaranceID != null;

  // "InsuaranceCompany_Details" field.
  String? _insuaranceCompanyDetails;
  String get insuaranceCompanyDetails => _insuaranceCompanyDetails ?? '';
  bool hasInsuaranceCompanyDetails() => _insuaranceCompanyDetails != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "TruckType" field.
  String? _truckType;
  String get truckType => _truckType ?? '';
  bool hasTruckType() => _truckType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _driverID = snapshotData['DriverID'] as DocumentReference?;
    _truckID = snapshotData['TruckID'] as String?;
    _plateNumber = snapshotData['PlateNumber'] as String?;
    _capacity = castToType<int>(snapshotData['Capacity']);
    _insuaranceID = snapshotData['InsuaranceID'] as String?;
    _insuaranceCompanyDetails =
        snapshotData['InsuaranceCompany_Details'] as String?;
    _status = snapshotData['Status'] as String?;
    _truckType = snapshotData['TruckType'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('VehicleDB')
          : FirebaseFirestore.instance.collectionGroup('VehicleDB');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('VehicleDB').doc(id);

  static Stream<VehicleDBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehicleDBRecord.fromSnapshot(s));

  static Future<VehicleDBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehicleDBRecord.fromSnapshot(s));

  static VehicleDBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehicleDBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehicleDBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehicleDBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehicleDBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehicleDBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehicleDBRecordData({
  DocumentReference? driverID,
  String? truckID,
  String? plateNumber,
  int? capacity,
  String? insuaranceID,
  String? insuaranceCompanyDetails,
  String? status,
  String? truckType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DriverID': driverID,
      'TruckID': truckID,
      'PlateNumber': plateNumber,
      'Capacity': capacity,
      'InsuaranceID': insuaranceID,
      'InsuaranceCompany_Details': insuaranceCompanyDetails,
      'Status': status,
      'TruckType': truckType,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehicleDBRecordDocumentEquality implements Equality<VehicleDBRecord> {
  const VehicleDBRecordDocumentEquality();

  @override
  bool equals(VehicleDBRecord? e1, VehicleDBRecord? e2) {
    return e1?.driverID == e2?.driverID &&
        e1?.truckID == e2?.truckID &&
        e1?.plateNumber == e2?.plateNumber &&
        e1?.capacity == e2?.capacity &&
        e1?.insuaranceID == e2?.insuaranceID &&
        e1?.insuaranceCompanyDetails == e2?.insuaranceCompanyDetails &&
        e1?.status == e2?.status &&
        e1?.truckType == e2?.truckType;
  }

  @override
  int hash(VehicleDBRecord? e) => const ListEquality().hash([
        e?.driverID,
        e?.truckID,
        e?.plateNumber,
        e?.capacity,
        e?.insuaranceID,
        e?.insuaranceCompanyDetails,
        e?.status,
        e?.truckType
      ]);

  @override
  bool isValidKey(Object? o) => o is VehicleDBRecord;
}
