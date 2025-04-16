import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssignmentRecord extends FirestoreRecord {
  AssignmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "driver_number" field.
  String? _driverNumber;
  String get driverNumber => _driverNumber ?? '';
  bool hasDriverNumber() => _driverNumber != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "driver_email" field.
  String? _driverEmail;
  String get driverEmail => _driverEmail ?? '';
  bool hasDriverEmail() => _driverEmail != null;

  // "driver_truck" field.
  String? _driverTruck;
  String get driverTruck => _driverTruck ?? '';
  bool hasDriverTruck() => _driverTruck != null;

  // "truck_uid" field.
  String? _truckUid;
  String get truckUid => _truckUid ?? '';
  bool hasTruckUid() => _truckUid != null;

  // "order_ID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _driverName = snapshotData['driver_name'] as String?;
    _driverNumber = snapshotData['driver_number'] as String?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _driverEmail = snapshotData['driver_email'] as String?;
    _driverTruck = snapshotData['driver_truck'] as String?;
    _truckUid = snapshotData['truck_uid'] as String?;
    _orderID = snapshotData['order_ID'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('assignment')
          : FirebaseFirestore.instance.collectionGroup('assignment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('assignment').doc(id);

  static Stream<AssignmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AssignmentRecord.fromSnapshot(s));

  static Future<AssignmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AssignmentRecord.fromSnapshot(s));

  static AssignmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AssignmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AssignmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AssignmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AssignmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AssignmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAssignmentRecordData({
  String? driverName,
  String? driverNumber,
  LatLng? driverLocation,
  String? driverUid,
  String? driverEmail,
  String? driverTruck,
  String? truckUid,
  String? orderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driver_name': driverName,
      'driver_number': driverNumber,
      'driver_location': driverLocation,
      'driver_uid': driverUid,
      'driver_email': driverEmail,
      'driver_truck': driverTruck,
      'truck_uid': truckUid,
      'order_ID': orderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class AssignmentRecordDocumentEquality implements Equality<AssignmentRecord> {
  const AssignmentRecordDocumentEquality();

  @override
  bool equals(AssignmentRecord? e1, AssignmentRecord? e2) {
    return e1?.driverName == e2?.driverName &&
        e1?.driverNumber == e2?.driverNumber &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.driverUid == e2?.driverUid &&
        e1?.driverEmail == e2?.driverEmail &&
        e1?.driverTruck == e2?.driverTruck &&
        e1?.truckUid == e2?.truckUid &&
        e1?.orderID == e2?.orderID;
  }

  @override
  int hash(AssignmentRecord? e) => const ListEquality().hash([
        e?.driverName,
        e?.driverNumber,
        e?.driverLocation,
        e?.driverUid,
        e?.driverEmail,
        e?.driverTruck,
        e?.truckUid,
        e?.orderID
      ]);

  @override
  bool isValidKey(Object? o) => o is AssignmentRecord;
}
