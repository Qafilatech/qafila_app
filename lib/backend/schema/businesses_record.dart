import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessesRecord extends FirestoreRecord {
  BusinessesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "business_id" field.
  String? _businessId;
  String get businessId => _businessId ?? '';
  bool hasBusinessId() => _businessId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "company_address" field.
  String? _companyAddress;
  String get companyAddress => _companyAddress ?? '';
  bool hasCompanyAddress() => _companyAddress != null;

  // "company_coordinates" field.
  LatLng? _companyCoordinates;
  LatLng? get companyCoordinates => _companyCoordinates;
  bool hasCompanyCoordinates() => _companyCoordinates != null;

  // "company_CR" field.
  String? _companyCR;
  String get companyCR => _companyCR ?? '';
  bool hasCompanyCR() => _companyCR != null;

  // "business_type" field.
  String? _businessType;
  String get businessType => _businessType ?? '';
  bool hasBusinessType() => _businessType != null;

  void _initializeFields() {
    _businessId = snapshotData['business_id'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _companyName = snapshotData['company_name'] as String?;
    _companyAddress = snapshotData['company_address'] as String?;
    _companyCoordinates = snapshotData['company_coordinates'] as LatLng?;
    _companyCR = snapshotData['company_CR'] as String?;
    _businessType = snapshotData['business_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Businesses');

  static Stream<BusinessesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessesRecord.fromSnapshot(s));

  static Future<BusinessesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessesRecord.fromSnapshot(s));

  static BusinessesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessesRecordData({
  String? businessId,
  DocumentReference? userId,
  String? companyName,
  String? companyAddress,
  LatLng? companyCoordinates,
  String? companyCR,
  String? businessType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business_id': businessId,
      'user_id': userId,
      'company_name': companyName,
      'company_address': companyAddress,
      'company_coordinates': companyCoordinates,
      'company_CR': companyCR,
      'business_type': businessType,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessesRecordDocumentEquality implements Equality<BusinessesRecord> {
  const BusinessesRecordDocumentEquality();

  @override
  bool equals(BusinessesRecord? e1, BusinessesRecord? e2) {
    return e1?.businessId == e2?.businessId &&
        e1?.userId == e2?.userId &&
        e1?.companyName == e2?.companyName &&
        e1?.companyAddress == e2?.companyAddress &&
        e1?.companyCoordinates == e2?.companyCoordinates &&
        e1?.companyCR == e2?.companyCR &&
        e1?.businessType == e2?.businessType;
  }

  @override
  int hash(BusinessesRecord? e) => const ListEquality().hash([
        e?.businessId,
        e?.userId,
        e?.companyName,
        e?.companyAddress,
        e?.companyCoordinates,
        e?.companyCR,
        e?.businessType
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessesRecord;
}
