import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverDataRecord extends FirestoreRecord {
  DriverDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driver_id" field.
  String? _driverId;
  String get driverId => _driverId ?? '';
  bool hasDriverId() => _driverId != null;

  // "business_id" field.
  DocumentReference? _businessId;
  DocumentReference? get businessId => _businessId;
  bool hasBusinessId() => _businessId != null;

  // "license_number" field.
  String? _licenseNumber;
  String get licenseNumber => _licenseNumber ?? '';
  bool hasLicenseNumber() => _licenseNumber != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "driver_type" field.
  String? _driverType;
  String get driverType => _driverType ?? '';
  bool hasDriverType() => _driverType != null;

  // "rating_avg" field.
  double? _ratingAvg;
  double get ratingAvg => _ratingAvg ?? 0.0;
  bool hasRatingAvg() => _ratingAvg != null;

  // "rating_count" field.
  int? _ratingCount;
  int get ratingCount => _ratingCount ?? 0;
  bool hasRatingCount() => _ratingCount != null;

  // "preferred_delivery_modes" field.
  String? _preferredDeliveryModes;
  String get preferredDeliveryModes => _preferredDeliveryModes ?? '';
  bool hasPreferredDeliveryModes() => _preferredDeliveryModes != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "attachment_url" field.
  String? _attachmentUrl;
  String get attachmentUrl => _attachmentUrl ?? '';
  bool hasAttachmentUrl() => _attachmentUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _driverId = snapshotData['driver_id'] as String?;
    _businessId = snapshotData['business_id'] as DocumentReference?;
    _licenseNumber = snapshotData['license_number'] as String?;
    _status = snapshotData['status'] as String?;
    _driverType = snapshotData['driver_type'] as String?;
    _ratingAvg = castToType<double>(snapshotData['rating_avg']);
    _ratingCount = castToType<int>(snapshotData['rating_count']);
    _preferredDeliveryModes =
        snapshotData['preferred_delivery_modes'] as String?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _attachmentUrl = snapshotData['attachment_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('DriverData')
          : FirebaseFirestore.instance.collectionGroup('DriverData');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('DriverData').doc(id);

  static Stream<DriverDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriverDataRecord.fromSnapshot(s));

  static Future<DriverDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriverDataRecord.fromSnapshot(s));

  static DriverDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DriverDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriverDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriverDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriverDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriverDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriverDataRecordData({
  String? driverId,
  DocumentReference? businessId,
  String? licenseNumber,
  String? status,
  String? driverType,
  double? ratingAvg,
  int? ratingCount,
  String? preferredDeliveryModes,
  bool? isVerified,
  String? attachmentUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driver_id': driverId,
      'business_id': businessId,
      'license_number': licenseNumber,
      'status': status,
      'driver_type': driverType,
      'rating_avg': ratingAvg,
      'rating_count': ratingCount,
      'preferred_delivery_modes': preferredDeliveryModes,
      'is_verified': isVerified,
      'attachment_url': attachmentUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriverDataRecordDocumentEquality implements Equality<DriverDataRecord> {
  const DriverDataRecordDocumentEquality();

  @override
  bool equals(DriverDataRecord? e1, DriverDataRecord? e2) {
    return e1?.driverId == e2?.driverId &&
        e1?.businessId == e2?.businessId &&
        e1?.licenseNumber == e2?.licenseNumber &&
        e1?.status == e2?.status &&
        e1?.driverType == e2?.driverType &&
        e1?.ratingAvg == e2?.ratingAvg &&
        e1?.ratingCount == e2?.ratingCount &&
        e1?.preferredDeliveryModes == e2?.preferredDeliveryModes &&
        e1?.isVerified == e2?.isVerified &&
        e1?.attachmentUrl == e2?.attachmentUrl;
  }

  @override
  int hash(DriverDataRecord? e) => const ListEquality().hash([
        e?.driverId,
        e?.businessId,
        e?.licenseNumber,
        e?.status,
        e?.driverType,
        e?.ratingAvg,
        e?.ratingCount,
        e?.preferredDeliveryModes,
        e?.isVerified,
        e?.attachmentUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is DriverDataRecord;
}
