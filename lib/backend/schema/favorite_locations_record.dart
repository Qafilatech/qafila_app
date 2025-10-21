import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoriteLocationsRecord extends FirestoreRecord {
  FavoriteLocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "location_status" field.
  bool? _locationStatus;
  bool get locationStatus => _locationStatus ?? false;
  bool hasLocationStatus() => _locationStatus != null;

  // "location_name" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "location_coordinates" field.
  List<LatLng>? _locationCoordinates;
  List<LatLng> get locationCoordinates => _locationCoordinates ?? const [];
  bool hasLocationCoordinates() => _locationCoordinates != null;

  // "location_addresses" field.
  List<String>? _locationAddresses;
  List<String> get locationAddresses => _locationAddresses ?? const [];
  bool hasLocationAddresses() => _locationAddresses != null;

  // "location_type" field.
  String? _locationType;
  String get locationType => _locationType ?? '';
  bool hasLocationType() => _locationType != null;

  // "location_dropCount" field.
  int? _locationDropCount;
  int get locationDropCount => _locationDropCount ?? 0;
  bool hasLocationDropCount() => _locationDropCount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _locationStatus = snapshotData['location_status'] as bool?;
    _locationName = snapshotData['location_name'] as String?;
    _locationCoordinates = getDataList(snapshotData['location_coordinates']);
    _locationAddresses = getDataList(snapshotData['location_addresses']);
    _locationType = snapshotData['location_type'] as String?;
    _locationDropCount = castToType<int>(snapshotData['location_dropCount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('FavoriteLocations')
          : FirebaseFirestore.instance.collectionGroup('FavoriteLocations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('FavoriteLocations').doc(id);

  static Stream<FavoriteLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoriteLocationsRecord.fromSnapshot(s));

  static Future<FavoriteLocationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FavoriteLocationsRecord.fromSnapshot(s));

  static FavoriteLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoriteLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoriteLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoriteLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoriteLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoriteLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoriteLocationsRecordData({
  bool? locationStatus,
  String? locationName,
  String? locationType,
  int? locationDropCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location_status': locationStatus,
      'location_name': locationName,
      'location_type': locationType,
      'location_dropCount': locationDropCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoriteLocationsRecordDocumentEquality
    implements Equality<FavoriteLocationsRecord> {
  const FavoriteLocationsRecordDocumentEquality();

  @override
  bool equals(FavoriteLocationsRecord? e1, FavoriteLocationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.locationStatus == e2?.locationStatus &&
        e1?.locationName == e2?.locationName &&
        listEquality.equals(e1?.locationCoordinates, e2?.locationCoordinates) &&
        listEquality.equals(e1?.locationAddresses, e2?.locationAddresses) &&
        e1?.locationType == e2?.locationType &&
        e1?.locationDropCount == e2?.locationDropCount;
  }

  @override
  int hash(FavoriteLocationsRecord? e) => const ListEquality().hash([
        e?.locationStatus,
        e?.locationName,
        e?.locationCoordinates,
        e?.locationAddresses,
        e?.locationType,
        e?.locationDropCount
      ]);

  @override
  bool isValidKey(Object? o) => o is FavoriteLocationsRecord;
}
