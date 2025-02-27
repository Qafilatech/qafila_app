import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubcategoryRecord extends FirestoreRecord {
  SubcategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('subcategory')
          : FirebaseFirestore.instance.collectionGroup('subcategory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('subcategory').doc(id);

  static Stream<SubcategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubcategoryRecord.fromSnapshot(s));

  static Future<SubcategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubcategoryRecord.fromSnapshot(s));

  static SubcategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubcategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubcategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubcategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubcategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubcategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubcategoryRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubcategoryRecordDocumentEquality implements Equality<SubcategoryRecord> {
  const SubcategoryRecordDocumentEquality();

  @override
  bool equals(SubcategoryRecord? e1, SubcategoryRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(SubcategoryRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is SubcategoryRecord;
}
