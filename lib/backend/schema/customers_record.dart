import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomersRecord extends FirestoreRecord {
  CustomersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "orderID" field.
  DocumentReference? _orderID;
  DocumentReference? get orderID => _orderID;
  bool hasOrderID() => _orderID != null;

  // "NotificationRef" field.
  DocumentReference? _notificationRef;
  DocumentReference? get notificationRef => _notificationRef;
  bool hasNotificationRef() => _notificationRef != null;

  // "FavAddresses" field.
  DocumentReference? _favAddresses;
  DocumentReference? get favAddresses => _favAddresses;
  bool hasFavAddresses() => _favAddresses != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _firstName = snapshotData['FirstName'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _orderID = snapshotData['orderID'] as DocumentReference?;
    _notificationRef = snapshotData['NotificationRef'] as DocumentReference?;
    _favAddresses = snapshotData['FavAddresses'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Customers')
          : FirebaseFirestore.instance.collectionGroup('Customers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Customers').doc(id);

  static Stream<CustomersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomersRecord.fromSnapshot(s));

  static Future<CustomersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomersRecord.fromSnapshot(s));

  static CustomersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomersRecordData({
  String? photoUrl,
  String? uid,
  String? firstName,
  String? lastName,
  DocumentReference? orderID,
  DocumentReference? notificationRef,
  DocumentReference? favAddresses,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo_url': photoUrl,
      'uid': uid,
      'FirstName': firstName,
      'LastName': lastName,
      'orderID': orderID,
      'NotificationRef': notificationRef,
      'FavAddresses': favAddresses,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomersRecordDocumentEquality implements Equality<CustomersRecord> {
  const CustomersRecordDocumentEquality();

  @override
  bool equals(CustomersRecord? e1, CustomersRecord? e2) {
    return e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.orderID == e2?.orderID &&
        e1?.notificationRef == e2?.notificationRef &&
        e1?.favAddresses == e2?.favAddresses;
  }

  @override
  int hash(CustomersRecord? e) => const ListEquality().hash([
        e?.photoUrl,
        e?.uid,
        e?.firstName,
        e?.lastName,
        e?.orderID,
        e?.notificationRef,
        e?.favAddresses
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomersRecord;
}
