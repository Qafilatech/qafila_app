import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailableDriversRecord extends FirestoreRecord {
  AvailableDriversRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driver_id" field.
  String? _driverId;
  String get driverId => _driverId ?? '';
  bool hasDriverId() => _driverId != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "last_location_update" field.
  DateTime? _lastLocationUpdate;
  DateTime? get lastLocationUpdate => _lastLocationUpdate;
  bool hasLastLocationUpdate() => _lastLocationUpdate != null;

  void _initializeFields() {
    _driverId = snapshotData['driver_id'] as String?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _lastLocationUpdate = snapshotData['last_location_update'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AvailableDrivers');

  static Stream<AvailableDriversRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvailableDriversRecord.fromSnapshot(s));

  static Future<AvailableDriversRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AvailableDriversRecord.fromSnapshot(s));

  static AvailableDriversRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvailableDriversRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvailableDriversRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvailableDriversRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvailableDriversRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvailableDriversRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvailableDriversRecordData({
  String? driverId,
  LatLng? driverLocation,
  DateTime? lastLocationUpdate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driver_id': driverId,
      'driver_location': driverLocation,
      'last_location_update': lastLocationUpdate,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvailableDriversRecordDocumentEquality
    implements Equality<AvailableDriversRecord> {
  const AvailableDriversRecordDocumentEquality();

  @override
  bool equals(AvailableDriversRecord? e1, AvailableDriversRecord? e2) {
    return e1?.driverId == e2?.driverId &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.lastLocationUpdate == e2?.lastLocationUpdate;
  }

  @override
  int hash(AvailableDriversRecord? e) => const ListEquality()
      .hash([e?.driverId, e?.driverLocation, e?.lastLocationUpdate]);

  @override
  bool isValidKey(Object? o) => o is AvailableDriversRecord;
}
