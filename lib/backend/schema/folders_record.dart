import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoldersRecord extends FirestoreRecord {
  FoldersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "folderTitle" field.
  String? _folderTitle;
  String get folderTitle => _folderTitle ?? '';
  bool hasFolderTitle() => _folderTitle != null;

  // "chats_ref" field.
  List<DocumentReference>? _chatsRef;
  List<DocumentReference> get chatsRef => _chatsRef ?? const [];
  bool hasChatsRef() => _chatsRef != null;

  // "createdBy_ref" field.
  DocumentReference? _createdByRef;
  DocumentReference? get createdByRef => _createdByRef;
  bool hasCreatedByRef() => _createdByRef != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _folderTitle = snapshotData['folderTitle'] as String?;
    _chatsRef = getDataList(snapshotData['chats_ref']);
    _createdByRef = snapshotData['createdBy_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Folders');

  static Stream<FoldersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoldersRecord.fromSnapshot(s));

  static Future<FoldersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoldersRecord.fromSnapshot(s));

  static FoldersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoldersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoldersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoldersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoldersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoldersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoldersRecordData({
  DateTime? date,
  String? folderTitle,
  DocumentReference? createdByRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'folderTitle': folderTitle,
      'createdBy_ref': createdByRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoldersRecordDocumentEquality implements Equality<FoldersRecord> {
  const FoldersRecordDocumentEquality();

  @override
  bool equals(FoldersRecord? e1, FoldersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.folderTitle == e2?.folderTitle &&
        listEquality.equals(e1?.chatsRef, e2?.chatsRef) &&
        e1?.createdByRef == e2?.createdByRef;
  }

  @override
  int hash(FoldersRecord? e) => const ListEquality()
      .hash([e?.date, e?.folderTitle, e?.chatsRef, e?.createdByRef]);

  @override
  bool isValidKey(Object? o) => o is FoldersRecord;
}
