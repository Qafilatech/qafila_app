import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriversRecord extends FirestoreRecord {
  DriversRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "TruckPhoto_url" field.
  String? _truckPhotoUrl;
  String get truckPhotoUrl => _truckPhotoUrl ?? '';
  bool hasTruckPhotoUrl() => _truckPhotoUrl != null;

  // "LicenseNumber" field.
  String? _licenseNumber;
  String get licenseNumber => _licenseNumber ?? '';
  bool hasLicenseNumber() => _licenseNumber != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "DriverType" field.
  String? _driverType;
  String get driverType => _driverType ?? '';
  bool hasDriverType() => _driverType != null;

  // "Assignments" field.
  DocumentReference? _assignments;
  DocumentReference? get assignments => _assignments;
  bool hasAssignments() => _assignments != null;

  // "VehicleID" field.
  DocumentReference? _vehicleID;
  DocumentReference? get vehicleID => _vehicleID;
  bool hasVehicleID() => _vehicleID != null;

  // "Specializations" field.
  String? _specializations;
  String get specializations => _specializations ?? '';
  bool hasSpecializations() => _specializations != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _firstName = snapshotData['FirstName'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _truckPhotoUrl = snapshotData['TruckPhoto_url'] as String?;
    _licenseNumber = snapshotData['LicenseNumber'] as String?;
    _status = snapshotData['Status'] as String?;
    _driverType = snapshotData['DriverType'] as String?;
    _assignments = snapshotData['Assignments'] as DocumentReference?;
    _vehicleID = snapshotData['VehicleID'] as DocumentReference?;
    _specializations = snapshotData['Specializations'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Drivers')
          : FirebaseFirestore.instance.collectionGroup('Drivers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Drivers').doc(id);

  static Stream<DriversRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriversRecord.fromSnapshot(s));

  static Future<DriversRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriversRecord.fromSnapshot(s));

  static DriversRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DriversRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriversRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriversRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriversRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriversRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriversRecordData({
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? editedTime,
  String? firstName,
  String? lastName,
  String? truckPhotoUrl,
  String? licenseNumber,
  String? status,
  String? driverType,
  DocumentReference? assignments,
  DocumentReference? vehicleID,
  String? specializations,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'edited_time': editedTime,
      'FirstName': firstName,
      'LastName': lastName,
      'TruckPhoto_url': truckPhotoUrl,
      'LicenseNumber': licenseNumber,
      'Status': status,
      'DriverType': driverType,
      'Assignments': assignments,
      'VehicleID': vehicleID,
      'Specializations': specializations,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriversRecordDocumentEquality implements Equality<DriversRecord> {
  const DriversRecordDocumentEquality();

  @override
  bool equals(DriversRecord? e1, DriversRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.editedTime == e2?.editedTime &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.truckPhotoUrl == e2?.truckPhotoUrl &&
        e1?.licenseNumber == e2?.licenseNumber &&
        e1?.status == e2?.status &&
        e1?.driverType == e2?.driverType &&
        e1?.assignments == e2?.assignments &&
        e1?.vehicleID == e2?.vehicleID &&
        e1?.specializations == e2?.specializations;
  }

  @override
  int hash(DriversRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.editedTime,
        e?.firstName,
        e?.lastName,
        e?.truckPhotoUrl,
        e?.licenseNumber,
        e?.status,
        e?.driverType,
        e?.assignments,
        e?.vehicleID,
        e?.specializations
      ]);

  @override
  bool isValidKey(Object? o) => o is DriversRecord;
}
