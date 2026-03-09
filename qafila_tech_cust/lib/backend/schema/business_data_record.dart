import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessDataRecord extends FirestoreRecord {
  BusinessDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "business_id" field.
  String? _businessId;
  String get businessId => _businessId ?? '';
  bool hasBusinessId() => _businessId != null;

  // "business_CR" field.
  String? _businessCR;
  String get businessCR => _businessCR ?? '';
  bool hasBusinessCR() => _businessCR != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "business_address" field.
  String? _businessAddress;
  String get businessAddress => _businessAddress ?? '';
  bool hasBusinessAddress() => _businessAddress != null;

  // "business_coordinates" field.
  LatLng? _businessCoordinates;
  LatLng? get businessCoordinates => _businessCoordinates;
  bool hasBusinessCoordinates() => _businessCoordinates != null;

  // "business_type" field.
  String? _businessType;
  String get businessType => _businessType ?? '';
  bool hasBusinessType() => _businessType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _businessId = snapshotData['business_id'] as String?;
    _businessCR = snapshotData['business_CR'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _businessAddress = snapshotData['business_address'] as String?;
    _businessCoordinates = snapshotData['business_coordinates'] as LatLng?;
    _businessType = snapshotData['business_type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('BusinessData')
          : FirebaseFirestore.instance.collectionGroup('BusinessData');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('BusinessData').doc(id);

  static Stream<BusinessDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessDataRecord.fromSnapshot(s));

  static Future<BusinessDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessDataRecord.fromSnapshot(s));

  static BusinessDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessDataRecordData({
  String? businessId,
  String? businessCR,
  String? businessName,
  String? businessAddress,
  LatLng? businessCoordinates,
  String? businessType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business_id': businessId,
      'business_CR': businessCR,
      'business_name': businessName,
      'business_address': businessAddress,
      'business_coordinates': businessCoordinates,
      'business_type': businessType,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessDataRecordDocumentEquality
    implements Equality<BusinessDataRecord> {
  const BusinessDataRecordDocumentEquality();

  @override
  bool equals(BusinessDataRecord? e1, BusinessDataRecord? e2) {
    return e1?.businessId == e2?.businessId &&
        e1?.businessCR == e2?.businessCR &&
        e1?.businessName == e2?.businessName &&
        e1?.businessAddress == e2?.businessAddress &&
        e1?.businessCoordinates == e2?.businessCoordinates &&
        e1?.businessType == e2?.businessType;
  }

  @override
  int hash(BusinessDataRecord? e) => const ListEquality().hash([
        e?.businessId,
        e?.businessCR,
        e?.businessName,
        e?.businessAddress,
        e?.businessCoordinates,
        e?.businessType
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessDataRecord;
}
