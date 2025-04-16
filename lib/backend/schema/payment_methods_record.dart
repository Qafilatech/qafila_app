import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// storing users card details
class PaymentMethodsRecord extends FirestoreRecord {
  PaymentMethodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PaymentType" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  bool hasPaymentType() => _paymentType != null;

  // "CardNumber" field.
  int? _cardNumber;
  int get cardNumber => _cardNumber ?? 0;
  bool hasCardNumber() => _cardNumber != null;

  // "CardStatus" field.
  bool? _cardStatus;
  bool get cardStatus => _cardStatus ?? false;
  bool hasCardStatus() => _cardStatus != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "ExpiryDate" field.
  int? _expiryDate;
  int get expiryDate => _expiryDate ?? 0;
  bool hasExpiryDate() => _expiryDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _paymentType = snapshotData['PaymentType'] as String?;
    _cardNumber = castToType<int>(snapshotData['CardNumber']);
    _cardStatus = snapshotData['CardStatus'] as bool?;
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _active = snapshotData['active'] as bool?;
    _expiryDate = castToType<int>(snapshotData['ExpiryDate']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PaymentMethods')
          : FirebaseFirestore.instance.collectionGroup('PaymentMethods');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PaymentMethods').doc(id);

  static Stream<PaymentMethodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentMethodsRecord.fromSnapshot(s));

  static Future<PaymentMethodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentMethodsRecord.fromSnapshot(s));

  static PaymentMethodsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentMethodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentMethodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentMethodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentMethodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentMethodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentMethodsRecordData({
  String? paymentType,
  int? cardNumber,
  bool? cardStatus,
  DateTime? createdAt,
  bool? active,
  int? expiryDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PaymentType': paymentType,
      'CardNumber': cardNumber,
      'CardStatus': cardStatus,
      'CreatedAt': createdAt,
      'active': active,
      'ExpiryDate': expiryDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentMethodsRecordDocumentEquality
    implements Equality<PaymentMethodsRecord> {
  const PaymentMethodsRecordDocumentEquality();

  @override
  bool equals(PaymentMethodsRecord? e1, PaymentMethodsRecord? e2) {
    return e1?.paymentType == e2?.paymentType &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.cardStatus == e2?.cardStatus &&
        e1?.createdAt == e2?.createdAt &&
        e1?.active == e2?.active &&
        e1?.expiryDate == e2?.expiryDate;
  }

  @override
  int hash(PaymentMethodsRecord? e) => const ListEquality().hash([
        e?.paymentType,
        e?.cardNumber,
        e?.cardStatus,
        e?.createdAt,
        e?.active,
        e?.expiryDate
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentMethodsRecord;
}
