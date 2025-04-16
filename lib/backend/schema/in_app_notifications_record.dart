import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InAppNotificationsRecord extends FirestoreRecord {
  InAppNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notifTitle" field.
  String? _notifTitle;
  String get notifTitle => _notifTitle ?? '';
  bool hasNotifTitle() => _notifTitle != null;

  // "timeDate" field.
  DateTime? _timeDate;
  DateTime? get timeDate => _timeDate;
  bool hasTimeDate() => _timeDate != null;

  // "rideReference" field.
  DocumentReference? _rideReference;
  DocumentReference? get rideReference => _rideReference;
  bool hasRideReference() => _rideReference != null;

  // "NotificationSubtitle" field.
  String? _notificationSubtitle;
  String get notificationSubtitle => _notificationSubtitle ?? '';
  bool hasNotificationSubtitle() => _notificationSubtitle != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notifTitle = snapshotData['notifTitle'] as String?;
    _timeDate = snapshotData['timeDate'] as DateTime?;
    _rideReference = snapshotData['rideReference'] as DocumentReference?;
    _notificationSubtitle = snapshotData['NotificationSubtitle'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('inAppNotifications')
          : FirebaseFirestore.instance.collectionGroup('inAppNotifications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('inAppNotifications').doc(id);

  static Stream<InAppNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InAppNotificationsRecord.fromSnapshot(s));

  static Future<InAppNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InAppNotificationsRecord.fromSnapshot(s));

  static InAppNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InAppNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InAppNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InAppNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InAppNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InAppNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInAppNotificationsRecordData({
  String? notifTitle,
  DateTime? timeDate,
  DocumentReference? rideReference,
  String? notificationSubtitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notifTitle': notifTitle,
      'timeDate': timeDate,
      'rideReference': rideReference,
      'NotificationSubtitle': notificationSubtitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class InAppNotificationsRecordDocumentEquality
    implements Equality<InAppNotificationsRecord> {
  const InAppNotificationsRecordDocumentEquality();

  @override
  bool equals(InAppNotificationsRecord? e1, InAppNotificationsRecord? e2) {
    return e1?.notifTitle == e2?.notifTitle &&
        e1?.timeDate == e2?.timeDate &&
        e1?.rideReference == e2?.rideReference &&
        e1?.notificationSubtitle == e2?.notificationSubtitle;
  }

  @override
  int hash(InAppNotificationsRecord? e) => const ListEquality().hash(
      [e?.notifTitle, e?.timeDate, e?.rideReference, e?.notificationSubtitle]);

  @override
  bool isValidKey(Object? o) => o is InAppNotificationsRecord;
}
