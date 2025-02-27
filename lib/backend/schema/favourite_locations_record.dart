import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavouriteLocationsRecord extends FirestoreRecord {
  FavouriteLocationsRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _locationStatus = snapshotData['locationStatus'] as bool?;
    _locationName = snapshotData['locationName'] as String?;
    _locationCoordinates = getDataList(snapshotData['locationCoordinates']);
    _locationAddrress = getDataList(snapshotData['locationAddrress']);
    _locationType = snapshotData['locationType'] as String?;
    _dropCount = castToType<int>(snapshotData['dropCount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('favouriteLocations')
          : FirebaseFirestore.instance.collectionGroup('favouriteLocations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('favouriteLocations').doc(id);

  static Stream<FavouriteLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavouriteLocationsRecord.fromSnapshot(s));

  static Future<FavouriteLocationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FavouriteLocationsRecord.fromSnapshot(s));

  static FavouriteLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavouriteLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavouriteLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavouriteLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavouriteLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavouriteLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavouriteLocationsRecordData({
  bool? locationStatus,
  String? locationName,
  String? locationType,
  int? dropCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'locationStatus': locationStatus,
      'locationName': locationName,
      'locationType': locationType,
      'dropCount': dropCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavouriteLocationsRecordDocumentEquality
    implements Equality<FavouriteLocationsRecord> {
  const FavouriteLocationsRecordDocumentEquality();

  @override
  bool equals(FavouriteLocationsRecord? e1, FavouriteLocationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.locationStatus == e2?.locationStatus &&
        e1?.locationName == e2?.locationName &&
        listEquality.equals(e1?.locationCoordinates, e2?.locationCoordinates) &&
        listEquality.equals(e1?.locationAddrress, e2?.locationAddrress) &&
        e1?.locationType == e2?.locationType &&
        e1?.dropCount == e2?.dropCount;
  }

  @override
  int hash(FavouriteLocationsRecord? e) => const ListEquality().hash([
        e?.locationStatus,
        e?.locationName,
        e?.locationCoordinates,
        e?.locationAddrress,
        e?.locationType,
        e?.dropCount
      ]);

  @override
  bool isValidKey(Object? o) => o is FavouriteLocationsRecord;
}
