import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IncidentsRecord extends FirestoreRecord {
  IncidentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "incident_id" field.
  String? _incidentId;
  String get incidentId => _incidentId ?? '';
  bool hasIncidentId() => _incidentId != null;

  // "order_id" field.
  DocumentReference? _orderId;
  DocumentReference? get orderId => _orderId;
  bool hasOrderId() => _orderId != null;

  // "customer_id" field.
  DocumentReference? _customerId;
  DocumentReference? get customerId => _customerId;
  bool hasCustomerId() => _customerId != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "incident_category" field.
  String? _incidentCategory;
  String get incidentCategory => _incidentCategory ?? '';
  bool hasIncidentCategory() => _incidentCategory != null;

  // "incident_subcategory" field.
  String? _incidentSubcategory;
  String get incidentSubcategory => _incidentSubcategory ?? '';
  bool hasIncidentSubcategory() => _incidentSubcategory != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "user_comments" field.
  String? _userComments;
  String get userComments => _userComments ?? '';
  bool hasUserComments() => _userComments != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "resolved_at" field.
  DateTime? _resolvedAt;
  DateTime? get resolvedAt => _resolvedAt;
  bool hasResolvedAt() => _resolvedAt != null;

  // "incident_image" field.
  List<String>? _incidentImage;
  List<String> get incidentImage => _incidentImage ?? const [];
  bool hasIncidentImage() => _incidentImage != null;

  void _initializeFields() {
    _incidentId = snapshotData['incident_id'] as String?;
    _orderId = snapshotData['order_id'] as DocumentReference?;
    _customerId = snapshotData['customer_id'] as DocumentReference?;
    _customerName = snapshotData['customer_name'] as String?;
    _incidentCategory = snapshotData['incident_category'] as String?;
    _incidentSubcategory = snapshotData['incident_subcategory'] as String?;
    _description = snapshotData['description'] as String?;
    _userComments = snapshotData['user_comments'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _resolvedAt = snapshotData['resolved_at'] as DateTime?;
    _incidentImage = getDataList(snapshotData['incident_image']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Incidents');

  static Stream<IncidentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IncidentsRecord.fromSnapshot(s));

  static Future<IncidentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IncidentsRecord.fromSnapshot(s));

  static IncidentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IncidentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IncidentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IncidentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IncidentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IncidentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIncidentsRecordData({
  String? incidentId,
  DocumentReference? orderId,
  DocumentReference? customerId,
  String? customerName,
  String? incidentCategory,
  String? incidentSubcategory,
  String? description,
  String? userComments,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  DateTime? resolvedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'incident_id': incidentId,
      'order_id': orderId,
      'customer_id': customerId,
      'customer_name': customerName,
      'incident_category': incidentCategory,
      'incident_subcategory': incidentSubcategory,
      'description': description,
      'user_comments': userComments,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'resolved_at': resolvedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class IncidentsRecordDocumentEquality implements Equality<IncidentsRecord> {
  const IncidentsRecordDocumentEquality();

  @override
  bool equals(IncidentsRecord? e1, IncidentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.incidentId == e2?.incidentId &&
        e1?.orderId == e2?.orderId &&
        e1?.customerId == e2?.customerId &&
        e1?.customerName == e2?.customerName &&
        e1?.incidentCategory == e2?.incidentCategory &&
        e1?.incidentSubcategory == e2?.incidentSubcategory &&
        e1?.description == e2?.description &&
        e1?.userComments == e2?.userComments &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.resolvedAt == e2?.resolvedAt &&
        listEquality.equals(e1?.incidentImage, e2?.incidentImage);
  }

  @override
  int hash(IncidentsRecord? e) => const ListEquality().hash([
        e?.incidentId,
        e?.orderId,
        e?.customerId,
        e?.customerName,
        e?.incidentCategory,
        e?.incidentSubcategory,
        e?.description,
        e?.userComments,
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.resolvedAt,
        e?.incidentImage
      ]);

  @override
  bool isValidKey(Object? o) => o is IncidentsRecord;
}
