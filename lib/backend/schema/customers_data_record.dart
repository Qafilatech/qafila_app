import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomersDataRecord extends FirestoreRecord {
  CustomersDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_id" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  bool hasCustomerId() => _customerId != null;

  // "current_residence_coordinates" field.
  LatLng? _currentResidenceCoordinates;
  LatLng? get currentResidenceCoordinates => _currentResidenceCoordinates;
  bool hasCurrentResidenceCoordinates() => _currentResidenceCoordinates != null;

  // "current_residence_address" field.
  String? _currentResidenceAddress;
  String get currentResidenceAddress => _currentResidenceAddress ?? '';
  bool hasCurrentResidenceAddress() => _currentResidenceAddress != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _customerId = snapshotData['customer_id'] as String?;
    _currentResidenceCoordinates =
        snapshotData['current_residence_coordinates'] as LatLng?;
    _currentResidenceAddress =
        snapshotData['current_residence_address'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Customers_Data')
          : FirebaseFirestore.instance.collectionGroup('Customers_Data');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Customers_Data').doc(id);

  static Stream<CustomersDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomersDataRecord.fromSnapshot(s));

  static Future<CustomersDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomersDataRecord.fromSnapshot(s));

  static CustomersDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomersDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomersDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomersDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomersDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomersDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomersDataRecordData({
  String? customerId,
  LatLng? currentResidenceCoordinates,
  String? currentResidenceAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_id': customerId,
      'current_residence_coordinates': currentResidenceCoordinates,
      'current_residence_address': currentResidenceAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomersDataRecordDocumentEquality
    implements Equality<CustomersDataRecord> {
  const CustomersDataRecordDocumentEquality();

  @override
  bool equals(CustomersDataRecord? e1, CustomersDataRecord? e2) {
    return e1?.customerId == e2?.customerId &&
        e1?.currentResidenceCoordinates == e2?.currentResidenceCoordinates &&
        e1?.currentResidenceAddress == e2?.currentResidenceAddress;
  }

  @override
  int hash(CustomersDataRecord? e) => const ListEquality().hash([
        e?.customerId,
        e?.currentResidenceCoordinates,
        e?.currentResidenceAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomersDataRecord;
}
