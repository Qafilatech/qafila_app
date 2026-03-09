import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssignmentsRecord extends FirestoreRecord {
  AssignmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "assignment_id" field.
  String? _assignmentId;
  String get assignmentId => _assignmentId ?? '';
  bool hasAssignmentId() => _assignmentId != null;

  // "order_id" field.
  DocumentReference? _orderId;
  DocumentReference? get orderId => _orderId;
  bool hasOrderId() => _orderId != null;

  // "driver_id" field.
  DocumentReference? _driverId;
  DocumentReference? get driverId => _driverId;
  bool hasDriverId() => _driverId != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "truck_id" field.
  DocumentReference? _truckId;
  DocumentReference? get truckId => _truckId;
  bool hasTruckId() => _truckId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "assigned_at" field.
  DateTime? _assignedAt;
  DateTime? get assignedAt => _assignedAt;
  bool hasAssignedAt() => _assignedAt != null;

  // "order_coordinates" field.
  List<LatLng>? _orderCoordinates;
  List<LatLng> get orderCoordinates => _orderCoordinates ?? const [];
  bool hasOrderCoordinates() => _orderCoordinates != null;

  // "cargo_type" field.
  String? _cargoType;
  String get cargoType => _cargoType ?? '';
  bool hasCargoType() => _cargoType != null;

  // "order_addresses" field.
  List<String>? _orderAddresses;
  List<String> get orderAddresses => _orderAddresses ?? const [];
  bool hasOrderAddresses() => _orderAddresses != null;

  void _initializeFields() {
    _assignmentId = snapshotData['assignment_id'] as String?;
    _orderId = snapshotData['order_id'] as DocumentReference?;
    _driverId = snapshotData['driver_id'] as DocumentReference?;
    _driverName = snapshotData['driver_name'] as String?;
    _truckId = snapshotData['truck_id'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _assignedAt = snapshotData['assigned_at'] as DateTime?;
    _orderCoordinates = getDataList(snapshotData['order_coordinates']);
    _cargoType = snapshotData['cargo_type'] as String?;
    _orderAddresses = getDataList(snapshotData['order_addresses']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Assignments');

  static Stream<AssignmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AssignmentsRecord.fromSnapshot(s));

  static Future<AssignmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AssignmentsRecord.fromSnapshot(s));

  static AssignmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AssignmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AssignmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AssignmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AssignmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AssignmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAssignmentsRecordData({
  String? assignmentId,
  DocumentReference? orderId,
  DocumentReference? driverId,
  String? driverName,
  DocumentReference? truckId,
  String? status,
  DateTime? assignedAt,
  String? cargoType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'assignment_id': assignmentId,
      'order_id': orderId,
      'driver_id': driverId,
      'driver_name': driverName,
      'truck_id': truckId,
      'status': status,
      'assigned_at': assignedAt,
      'cargo_type': cargoType,
    }.withoutNulls,
  );

  return firestoreData;
}

class AssignmentsRecordDocumentEquality implements Equality<AssignmentsRecord> {
  const AssignmentsRecordDocumentEquality();

  @override
  bool equals(AssignmentsRecord? e1, AssignmentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.assignmentId == e2?.assignmentId &&
        e1?.orderId == e2?.orderId &&
        e1?.driverId == e2?.driverId &&
        e1?.driverName == e2?.driverName &&
        e1?.truckId == e2?.truckId &&
        e1?.status == e2?.status &&
        e1?.assignedAt == e2?.assignedAt &&
        listEquality.equals(e1?.orderCoordinates, e2?.orderCoordinates) &&
        e1?.cargoType == e2?.cargoType &&
        listEquality.equals(e1?.orderAddresses, e2?.orderAddresses);
  }

  @override
  int hash(AssignmentsRecord? e) => const ListEquality().hash([
        e?.assignmentId,
        e?.orderId,
        e?.driverId,
        e?.driverName,
        e?.truckId,
        e?.status,
        e?.assignedAt,
        e?.orderCoordinates,
        e?.cargoType,
        e?.orderAddresses
      ]);

  @override
  bool isValidKey(Object? o) => o is AssignmentsRecord;
}
