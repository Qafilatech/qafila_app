import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IncidentsDBRecord extends FirestoreRecord {
  IncidentsDBRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "IncidentID" field.
  String? _incidentID;
  String get incidentID => _incidentID ?? '';
  bool hasIncidentID() => _incidentID != null;

  // "IncidentCategory" field.
  String? _incidentCategory;
  String get incidentCategory => _incidentCategory ?? '';
  bool hasIncidentCategory() => _incidentCategory != null;

  // "IncidentSubCategory" field.
  String? _incidentSubCategory;
  String get incidentSubCategory => _incidentSubCategory ?? '';
  bool hasIncidentSubCategory() => _incidentSubCategory != null;

  // "OrderID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "DriverID" field.
  String? _driverID;
  String get driverID => _driverID ?? '';
  bool hasDriverID() => _driverID != null;

  // "UserComments" field.
  String? _userComments;
  String get userComments => _userComments ?? '';
  bool hasUserComments() => _userComments != null;

  // "IncidentDescription" field.
  String? _incidentDescription;
  String get incidentDescription => _incidentDescription ?? '';
  bool hasIncidentDescription() => _incidentDescription != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "UpdatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "ResolvedAt" field.
  DateTime? _resolvedAt;
  DateTime? get resolvedAt => _resolvedAt;
  bool hasResolvedAt() => _resolvedAt != null;

  // "IncidentStatus" field.
  String? _incidentStatus;
  String get incidentStatus => _incidentStatus ?? '';
  bool hasIncidentStatus() => _incidentStatus != null;

  void _initializeFields() {
    _incidentID = snapshotData['IncidentID'] as String?;
    _incidentCategory = snapshotData['IncidentCategory'] as String?;
    _incidentSubCategory = snapshotData['IncidentSubCategory'] as String?;
    _orderID = snapshotData['OrderID'] as String?;
    _userID = snapshotData['UserID'] as String?;
    _driverID = snapshotData['DriverID'] as String?;
    _userComments = snapshotData['UserComments'] as String?;
    _incidentDescription = snapshotData['IncidentDescription'] as String?;
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _updatedAt = snapshotData['UpdatedAt'] as DateTime?;
    _resolvedAt = snapshotData['ResolvedAt'] as DateTime?;
    _incidentStatus = snapshotData['IncidentStatus'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('IncidentsDB');

  static Stream<IncidentsDBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IncidentsDBRecord.fromSnapshot(s));

  static Future<IncidentsDBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IncidentsDBRecord.fromSnapshot(s));

  static IncidentsDBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IncidentsDBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IncidentsDBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IncidentsDBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IncidentsDBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IncidentsDBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIncidentsDBRecordData({
  String? incidentID,
  String? incidentCategory,
  String? incidentSubCategory,
  String? orderID,
  String? userID,
  String? driverID,
  String? userComments,
  String? incidentDescription,
  DateTime? createdAt,
  DateTime? updatedAt,
  DateTime? resolvedAt,
  String? incidentStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'IncidentID': incidentID,
      'IncidentCategory': incidentCategory,
      'IncidentSubCategory': incidentSubCategory,
      'OrderID': orderID,
      'UserID': userID,
      'DriverID': driverID,
      'UserComments': userComments,
      'IncidentDescription': incidentDescription,
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt,
      'ResolvedAt': resolvedAt,
      'IncidentStatus': incidentStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class IncidentsDBRecordDocumentEquality implements Equality<IncidentsDBRecord> {
  const IncidentsDBRecordDocumentEquality();

  @override
  bool equals(IncidentsDBRecord? e1, IncidentsDBRecord? e2) {
    return e1?.incidentID == e2?.incidentID &&
        e1?.incidentCategory == e2?.incidentCategory &&
        e1?.incidentSubCategory == e2?.incidentSubCategory &&
        e1?.orderID == e2?.orderID &&
        e1?.userID == e2?.userID &&
        e1?.driverID == e2?.driverID &&
        e1?.userComments == e2?.userComments &&
        e1?.incidentDescription == e2?.incidentDescription &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.resolvedAt == e2?.resolvedAt &&
        e1?.incidentStatus == e2?.incidentStatus;
  }

  @override
  int hash(IncidentsDBRecord? e) => const ListEquality().hash([
        e?.incidentID,
        e?.incidentCategory,
        e?.incidentSubCategory,
        e?.orderID,
        e?.userID,
        e?.driverID,
        e?.userComments,
        e?.incidentDescription,
        e?.createdAt,
        e?.updatedAt,
        e?.resolvedAt,
        e?.incidentStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is IncidentsDBRecord;
}
