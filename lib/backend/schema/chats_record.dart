import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "createdby" field.
  DocumentReference? _createdby;
  DocumentReference? get createdby => _createdby;
  bool hasCreatedby() => _createdby != null;

  // "chatTitle" field.
  String? _chatTitle;
  String get chatTitle => _chatTitle ?? '';
  bool hasChatTitle() => _chatTitle != null;

  // "recentUpdate" field.
  DateTime? _recentUpdate;
  DateTime? get recentUpdate => _recentUpdate;
  bool hasRecentUpdate() => _recentUpdate != null;

  // "Members_ref" field.
  List<DocumentReference>? _membersRef;
  List<DocumentReference> get membersRef => _membersRef ?? const [];
  bool hasMembersRef() => _membersRef != null;

  // "folders_ref" field.
  DocumentReference? _foldersRef;
  DocumentReference? get foldersRef => _foldersRef;
  bool hasFoldersRef() => _foldersRef != null;

  // "chat_photo" field.
  String? _chatPhoto;
  String get chatPhoto => _chatPhoto ?? '';
  bool hasChatPhoto() => _chatPhoto != null;

  // "recent_message_ref" field.
  DocumentReference? _recentMessageRef;
  DocumentReference? get recentMessageRef => _recentMessageRef;
  bool hasRecentMessageRef() => _recentMessageRef != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _createdby = snapshotData['createdby'] as DocumentReference?;
    _chatTitle = snapshotData['chatTitle'] as String?;
    _recentUpdate = snapshotData['recentUpdate'] as DateTime?;
    _membersRef = getDataList(snapshotData['Members_ref']);
    _foldersRef = snapshotData['folders_ref'] as DocumentReference?;
    _chatPhoto = snapshotData['chat_photo'] as String?;
    _recentMessageRef =
        snapshotData['recent_message_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DateTime? date,
  DocumentReference? createdby,
  String? chatTitle,
  DateTime? recentUpdate,
  DocumentReference? foldersRef,
  String? chatPhoto,
  DocumentReference? recentMessageRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'createdby': createdby,
      'chatTitle': chatTitle,
      'recentUpdate': recentUpdate,
      'folders_ref': foldersRef,
      'chat_photo': chatPhoto,
      'recent_message_ref': recentMessageRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.createdby == e2?.createdby &&
        e1?.chatTitle == e2?.chatTitle &&
        e1?.recentUpdate == e2?.recentUpdate &&
        listEquality.equals(e1?.membersRef, e2?.membersRef) &&
        e1?.foldersRef == e2?.foldersRef &&
        e1?.chatPhoto == e2?.chatPhoto &&
        e1?.recentMessageRef == e2?.recentMessageRef;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.createdby,
        e?.chatTitle,
        e?.recentUpdate,
        e?.membersRef,
        e?.foldersRef,
        e?.chatPhoto,
        e?.recentMessageRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
