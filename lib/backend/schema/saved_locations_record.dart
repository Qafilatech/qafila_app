import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedLocationsRecord extends FirestoreRecord {
  SavedLocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "locationStatus" field.
  bool? _locationStatus;
  bool get locationStatus => _locationStatus ?? false;
  bool hasLocationStatus() => _locationStatus != null;

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "locationCoordinates" field.
  List<LatLng>? _locationCoordinates;
  List<LatLng> get locationCoordinates => _locationCoordinates ?? const [];
  bool hasLocationCoordinates() => _locationCoordinates != null;

  // "locationAddrress" field.
  List<String>? _locationAddrress;
  List<String> get locationAddrress => _locationAddrress ?? const [];
  bool hasLocationAddrress() => _locationAddrress != null;

  // "locationType" field.
  String? _locationType;
  String get locationType => _locationType ?? '';
  bool hasLocationType() => _locationType != null;

  // "dropCount" field.
  int? _dropCount;
  int get dropCount => _dropCount ?? 0;
  bool hasDropCount() => _dropCount != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _locationStatus = snapshotData['locationStatus'] as bool?;
    _locationName = snapshotData['locationName'] as String?;
    _locationCoordinates = getDataList(snapshotData['locationCoordinates']);
    _locationAddrress = getDataList(snapshotData['locationAddrress']);
    _locationType = snapshotData['locationType'] as String?;
    _dropCount = castToType<int>(snapshotData['dropCount']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SavedLocations');

  static Stream<SavedLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedLocationsRecord.fromSnapshot(s));

  static Future<SavedLocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavedLocationsRecord.fromSnapshot(s));

  static SavedLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavedLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavedLocationsRecordData({
  bool? locationStatus,
  String? locationName,
  String? locationType,
  int? dropCount,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'locationStatus': locationStatus,
      'locationName': locationName,
      'locationType': locationType,
      'dropCount': dropCount,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SavedLocationsRecordDocumentEquality
    implements Equality<SavedLocationsRecord> {
  const SavedLocationsRecordDocumentEquality();

  @override
  bool equals(SavedLocationsRecord? e1, SavedLocationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.locationStatus == e2?.locationStatus &&
        e1?.locationName == e2?.locationName &&
        listEquality.equals(e1?.locationCoordinates, e2?.locationCoordinates) &&
        listEquality.equals(e1?.locationAddrress, e2?.locationAddrress) &&
        e1?.locationType == e2?.locationType &&
        e1?.dropCount == e2?.dropCount &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(SavedLocationsRecord? e) => const ListEquality().hash([
        e?.locationStatus,
        e?.locationName,
        e?.locationCoordinates,
        e?.locationAddrress,
        e?.locationType,
        e?.dropCount,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is SavedLocationsRecord;
}
