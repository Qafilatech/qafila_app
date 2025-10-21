import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrucksRecord extends FirestoreRecord {
  TrucksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "truck_id" field.
  String? _truckId;
  String get truckId => _truckId ?? '';
  bool hasTruckId() => _truckId != null;

  // "business_id" field.
  DocumentReference? _businessId;
  DocumentReference? get businessId => _businessId;
  bool hasBusinessId() => _businessId != null;

  // "plate_number" field.
  String? _plateNumber;
  String get plateNumber => _plateNumber ?? '';
  bool hasPlateNumber() => _plateNumber != null;

  // "capacity" field.
  String? _capacity;
  String get capacity => _capacity ?? '';
  bool hasCapacity() => _capacity != null;

  // "insurance_id" field.
  String? _insuranceId;
  String get insuranceId => _insuranceId ?? '';
  bool hasInsuranceId() => _insuranceId != null;

  // "insurance_company_details" field.
  String? _insuranceCompanyDetails;
  String get insuranceCompanyDetails => _insuranceCompanyDetails ?? '';
  bool hasInsuranceCompanyDetails() => _insuranceCompanyDetails != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "vehicle_type" field.
  String? _vehicleType;
  String get vehicleType => _vehicleType ?? '';
  bool hasVehicleType() => _vehicleType != null;

  // "is_favorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  // "truck_photo" field.
  String? _truckPhoto;
  String get truckPhoto => _truckPhoto ?? '';
  bool hasTruckPhoto() => _truckPhoto != null;

  // "vehicle_detail" field.
  String? _vehicleDetail;
  String get vehicleDetail => _vehicleDetail ?? '';
  bool hasVehicleDetail() => _vehicleDetail != null;

  // "driver_id" field.
  DocumentReference? _driverId;
  DocumentReference? get driverId => _driverId;
  bool hasDriverId() => _driverId != null;

  void _initializeFields() {
    _truckId = snapshotData['truck_id'] as String?;
    _businessId = snapshotData['business_id'] as DocumentReference?;
    _plateNumber = snapshotData['plate_number'] as String?;
    _capacity = snapshotData['capacity'] as String?;
    _insuranceId = snapshotData['insurance_id'] as String?;
    _insuranceCompanyDetails =
        snapshotData['insurance_company_details'] as String?;
    _status = snapshotData['status'] as String?;
    _vehicleType = snapshotData['vehicle_type'] as String?;
    _isFavorite = snapshotData['is_favorite'] as bool?;
    _truckPhoto = snapshotData['truck_photo'] as String?;
    _vehicleDetail = snapshotData['vehicle_detail'] as String?;
    _driverId = snapshotData['driver_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Trucks');

  static Stream<TrucksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrucksRecord.fromSnapshot(s));

  static Future<TrucksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrucksRecord.fromSnapshot(s));

  static TrucksRecord fromSnapshot(DocumentSnapshot snapshot) => TrucksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrucksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrucksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrucksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrucksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrucksRecordData({
  String? truckId,
  DocumentReference? businessId,
  String? plateNumber,
  String? capacity,
  String? insuranceId,
  String? insuranceCompanyDetails,
  String? status,
  String? vehicleType,
  bool? isFavorite,
  String? truckPhoto,
  String? vehicleDetail,
  DocumentReference? driverId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'truck_id': truckId,
      'business_id': businessId,
      'plate_number': plateNumber,
      'capacity': capacity,
      'insurance_id': insuranceId,
      'insurance_company_details': insuranceCompanyDetails,
      'status': status,
      'vehicle_type': vehicleType,
      'is_favorite': isFavorite,
      'truck_photo': truckPhoto,
      'vehicle_detail': vehicleDetail,
      'driver_id': driverId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrucksRecordDocumentEquality implements Equality<TrucksRecord> {
  const TrucksRecordDocumentEquality();

  @override
  bool equals(TrucksRecord? e1, TrucksRecord? e2) {
    return e1?.truckId == e2?.truckId &&
        e1?.businessId == e2?.businessId &&
        e1?.plateNumber == e2?.plateNumber &&
        e1?.capacity == e2?.capacity &&
        e1?.insuranceId == e2?.insuranceId &&
        e1?.insuranceCompanyDetails == e2?.insuranceCompanyDetails &&
        e1?.status == e2?.status &&
        e1?.vehicleType == e2?.vehicleType &&
        e1?.isFavorite == e2?.isFavorite &&
        e1?.truckPhoto == e2?.truckPhoto &&
        e1?.vehicleDetail == e2?.vehicleDetail &&
        e1?.driverId == e2?.driverId;
  }

  @override
  int hash(TrucksRecord? e) => const ListEquality().hash([
        e?.truckId,
        e?.businessId,
        e?.plateNumber,
        e?.capacity,
        e?.insuranceId,
        e?.insuranceCompanyDetails,
        e?.status,
        e?.vehicleType,
        e?.isFavorite,
        e?.truckPhoto,
        e?.vehicleDetail,
        e?.driverId
      ]);

  @override
  bool isValidKey(Object? o) => o is TrucksRecord;
}
