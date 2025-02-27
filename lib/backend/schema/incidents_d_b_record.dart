import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IncidentsDBRecord extends FirestoreRecord {
  IncidentsDBRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  // "subcategory" field.
  DocumentReference? _subcategory;
  DocumentReference? get subcategory => _subcategory;
  bool hasSubcategory() => _subcategory != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _category = snapshotData['category'] as DocumentReference?;
    _subcategory = snapshotData['subcategory'] as DocumentReference?;
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
  String? title,
  String? description,
  DocumentReference? category,
  DocumentReference? subcategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'category': category,
      'subcategory': subcategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class IncidentsDBRecordDocumentEquality implements Equality<IncidentsDBRecord> {
  const IncidentsDBRecordDocumentEquality();

  @override
  bool equals(IncidentsDBRecord? e1, IncidentsDBRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        e1?.subcategory == e2?.subcategory;
  }

  @override
  int hash(IncidentsDBRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.category, e?.subcategory]);

  @override
  bool isValidKey(Object? o) => o is IncidentsDBRecord;
}
