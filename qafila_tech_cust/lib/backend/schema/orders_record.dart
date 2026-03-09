import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "customer_id" field.
  DocumentReference? _customerId;
  DocumentReference? get customerId => _customerId;
  bool hasCustomerId() => _customerId != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "business_id" field.
  String? _businessId;
  String get businessId => _businessId ?? '';
  bool hasBusinessId() => _businessId != null;

  // "cargo_type" field.
  String? _cargoType;
  String get cargoType => _cargoType ?? '';
  bool hasCargoType() => _cargoType != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "pickup_time" field.
  DateTime? _pickupTime;
  DateTime? get pickupTime => _pickupTime;
  bool hasPickupTime() => _pickupTime != null;

  // "dropoff_time" field.
  DateTime? _dropoffTime;
  DateTime? get dropoffTime => _dropoffTime;
  bool hasDropoffTime() => _dropoffTime != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "coordinates" field.
  List<LatLng>? _coordinates;
  List<LatLng> get coordinates => _coordinates ?? const [];
  bool hasCoordinates() => _coordinates != null;

  // "addresses" field.
  List<String>? _addresses;
  List<String> get addresses => _addresses ?? const [];
  bool hasAddresses() => _addresses != null;

  // "is_driver_assigned" field.
  bool? _isDriverAssigned;
  bool get isDriverAssigned => _isDriverAssigned ?? false;
  bool hasIsDriverAssigned() => _isDriverAssigned != null;

  // "assigned_driver_id" field.
  DocumentReference? _assignedDriverId;
  DocumentReference? get assignedDriverId => _assignedDriverId;
  bool hasAssignedDriverId() => _assignedDriverId != null;

  // "assignment_status" field.
  String? _assignmentStatus;
  String get assignmentStatus => _assignmentStatus ?? '';
  bool hasAssignmentStatus() => _assignmentStatus != null;

  // "payment_amount" field.
  double? _paymentAmount;
  double get paymentAmount => _paymentAmount ?? 0.0;
  bool hasPaymentAmount() => _paymentAmount != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "payment_status" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "paid_at" field.
  DateTime? _paidAt;
  DateTime? get paidAt => _paidAt;
  bool hasPaidAt() => _paidAt != null;

  // "review_given" field.
  bool? _reviewGiven;
  bool get reviewGiven => _reviewGiven ?? false;
  bool hasReviewGiven() => _reviewGiven != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "current_pickup_index" field.
  int? _currentPickupIndex;
  int get currentPickupIndex => _currentPickupIndex ?? 0;
  bool hasCurrentPickupIndex() => _currentPickupIndex != null;

  // "order_type" field.
  String? _orderType;
  String get orderType => _orderType ?? '';
  bool hasOrderType() => _orderType != null;

  // "required_vehicle" field.
  String? _requiredVehicle;
  String get requiredVehicle => _requiredVehicle ?? '';
  bool hasRequiredVehicle() => _requiredVehicle != null;

  // "completed_on" field.
  DateTime? _completedOn;
  DateTime? get completedOn => _completedOn;
  bool hasCompletedOn() => _completedOn != null;

  // "schedule_type" field.
  String? _scheduleType;
  String get scheduleType => _scheduleType ?? '';
  bool hasScheduleType() => _scheduleType != null;

  // "package_type" field.
  String? _packageType;
  String get packageType => _packageType ?? '';
  bool hasPackageType() => _packageType != null;

  // "assembly_type" field.
  String? _assemblyType;
  String get assemblyType => _assemblyType ?? '';
  bool hasAssemblyType() => _assemblyType != null;

  // "handle_type" field.
  List<String>? _handleType;
  List<String> get handleType => _handleType ?? const [];
  bool hasHandleType() => _handleType != null;

  // "assistance_count" field.
  int? _assistanceCount;
  int get assistanceCount => _assistanceCount ?? 0;
  bool hasAssistanceCount() => _assistanceCount != null;

  // "cargo_units" field.
  int? _cargoUnits;
  int get cargoUnits => _cargoUnits ?? 0;
  bool hasCargoUnits() => _cargoUnits != null;

  // "cargo_remarks" field.
  String? _cargoRemarks;
  String get cargoRemarks => _cargoRemarks ?? '';
  bool hasCargoRemarks() => _cargoRemarks != null;

  // "order_attachment" field.
  String? _orderAttachment;
  String get orderAttachment => _orderAttachment ?? '';
  bool hasOrderAttachment() => _orderAttachment != null;

  // "schedule_for" field.
  DateTime? _scheduleFor;
  DateTime? get scheduleFor => _scheduleFor;
  bool hasScheduleFor() => _scheduleFor != null;

  // "accepted_on" field.
  DateTime? _acceptedOn;
  DateTime? get acceptedOn => _acceptedOn;
  bool hasAcceptedOn() => _acceptedOn != null;

  // "pickupLocation" field.
  LatLng? _pickupLocation;
  LatLng? get pickupLocation => _pickupLocation;
  bool hasPickupLocation() => _pickupLocation != null;

  // "dropoffLocation" field.
  LatLng? _dropoffLocation;
  LatLng? get dropoffLocation => _dropoffLocation;
  bool hasDropoffLocation() => _dropoffLocation != null;

  // "review_remarks" field.
  String? _reviewRemarks;
  String get reviewRemarks => _reviewRemarks ?? '';
  bool hasReviewRemarks() => _reviewRemarks != null;

  // "order_Complete_Confirm" field.
  bool? _orderCompleteConfirm;
  bool get orderCompleteConfirm => _orderCompleteConfirm ?? false;
  bool hasOrderCompleteConfirm() => _orderCompleteConfirm != null;

  // "customer_number" field.
  String? _customerNumber;
  String get customerNumber => _customerNumber ?? '';
  bool hasCustomerNumber() => _customerNumber != null;

  // "receiving_party" field.
  String? _receivingParty;
  String get receivingParty => _receivingParty ?? '';
  bool hasReceivingParty() => _receivingParty != null;

  // "cargoConditionPickup" field.
  List<String>? _cargoConditionPickup;
  List<String> get cargoConditionPickup => _cargoConditionPickup ?? const [];
  bool hasCargoConditionPickup() => _cargoConditionPickup != null;

  // "cargoConditionDropoff" field.
  List<String>? _cargoConditionDropoff;
  List<String> get cargoConditionDropoff => _cargoConditionDropoff ?? const [];
  bool hasCargoConditionDropoff() => _cargoConditionDropoff != null;

  // "cargoConditionState" field.
  String? _cargoConditionState;
  String get cargoConditionState => _cargoConditionState ?? '';
  bool hasCargoConditionState() => _cargoConditionState != null;

  // "cargoConditionNotes" field.
  String? _cargoConditionNotes;
  String get cargoConditionNotes => _cargoConditionNotes ?? '';
  bool hasCargoConditionNotes() => _cargoConditionNotes != null;

  // "cargoConditionPickupConfirm" field.
  bool? _cargoConditionPickupConfirm;
  bool get cargoConditionPickupConfirm => _cargoConditionPickupConfirm ?? false;
  bool hasCargoConditionPickupConfirm() => _cargoConditionPickupConfirm != null;

  // "cargoConditionDropoffConfirm" field.
  bool? _cargoConditionDropoffConfirm;
  bool get cargoConditionDropoffConfirm =>
      _cargoConditionDropoffConfirm ?? false;
  bool hasCargoConditionDropoffConfirm() =>
      _cargoConditionDropoffConfirm != null;

  // "cargoConditionStateDrop" field.
  String? _cargoConditionStateDrop;
  String get cargoConditionStateDrop => _cargoConditionStateDrop ?? '';
  bool hasCargoConditionStateDrop() => _cargoConditionStateDrop != null;

  // "cargoConditionNotesDrop" field.
  String? _cargoConditionNotesDrop;
  String get cargoConditionNotesDrop => _cargoConditionNotesDrop ?? '';
  bool hasCargoConditionNotesDrop() => _cargoConditionNotesDrop != null;

  // "cargoConditionPicked" field.
  bool? _cargoConditionPicked;
  bool get cargoConditionPicked => _cargoConditionPicked ?? false;
  bool hasCargoConditionPicked() => _cargoConditionPicked != null;

  // "cargoConditionDropped" field.
  bool? _cargoConditionDropped;
  bool get cargoConditionDropped => _cargoConditionDropped ?? false;
  bool hasCargoConditionDropped() => _cargoConditionDropped != null;

  // "receivingParty_Number" field.
  String? _receivingPartyNumber;
  String get receivingPartyNumber => _receivingPartyNumber ?? '';
  bool hasReceivingPartyNumber() => _receivingPartyNumber != null;

  void _initializeFields() {
    _orderId = snapshotData['order_id'] as String?;
    _customerId = snapshotData['customer_id'] as DocumentReference?;
    _customerName = snapshotData['customer_name'] as String?;
    _businessId = snapshotData['business_id'] as String?;
    _cargoType = snapshotData['cargo_type'] as String?;
    _status = snapshotData['status'] as String?;
    _pickupTime = snapshotData['pickup_time'] as DateTime?;
    _dropoffTime = snapshotData['dropoff_time'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _coordinates = getDataList(snapshotData['coordinates']);
    _addresses = getDataList(snapshotData['addresses']);
    _isDriverAssigned = snapshotData['is_driver_assigned'] as bool?;
    _assignedDriverId =
        snapshotData['assigned_driver_id'] as DocumentReference?;
    _assignmentStatus = snapshotData['assignment_status'] as String?;
    _paymentAmount = castToType<double>(snapshotData['payment_amount']);
    _paymentMethod = snapshotData['payment_method'] as String?;
    _paymentStatus = snapshotData['payment_status'] as String?;
    _paidAt = snapshotData['paid_at'] as DateTime?;
    _reviewGiven = snapshotData['review_given'] as bool?;
    _rating = castToType<int>(snapshotData['rating']);
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _currentPickupIndex = castToType<int>(snapshotData['current_pickup_index']);
    _orderType = snapshotData['order_type'] as String?;
    _requiredVehicle = snapshotData['required_vehicle'] as String?;
    _completedOn = snapshotData['completed_on'] as DateTime?;
    _scheduleType = snapshotData['schedule_type'] as String?;
    _packageType = snapshotData['package_type'] as String?;
    _assemblyType = snapshotData['assembly_type'] as String?;
    _handleType = getDataList(snapshotData['handle_type']);
    _assistanceCount = castToType<int>(snapshotData['assistance_count']);
    _cargoUnits = castToType<int>(snapshotData['cargo_units']);
    _cargoRemarks = snapshotData['cargo_remarks'] as String?;
    _orderAttachment = snapshotData['order_attachment'] as String?;
    _scheduleFor = snapshotData['schedule_for'] as DateTime?;
    _acceptedOn = snapshotData['accepted_on'] as DateTime?;
    _pickupLocation = snapshotData['pickupLocation'] as LatLng?;
    _dropoffLocation = snapshotData['dropoffLocation'] as LatLng?;
    _reviewRemarks = snapshotData['review_remarks'] as String?;
    _orderCompleteConfirm = snapshotData['order_Complete_Confirm'] as bool?;
    _customerNumber = snapshotData['customer_number'] as String?;
    _receivingParty = snapshotData['receiving_party'] as String?;
    _cargoConditionPickup = getDataList(snapshotData['cargoConditionPickup']);
    _cargoConditionDropoff = getDataList(snapshotData['cargoConditionDropoff']);
    _cargoConditionState = snapshotData['cargoConditionState'] as String?;
    _cargoConditionNotes = snapshotData['cargoConditionNotes'] as String?;
    _cargoConditionPickupConfirm =
        snapshotData['cargoConditionPickupConfirm'] as bool?;
    _cargoConditionDropoffConfirm =
        snapshotData['cargoConditionDropoffConfirm'] as bool?;
    _cargoConditionStateDrop =
        snapshotData['cargoConditionStateDrop'] as String?;
    _cargoConditionNotesDrop =
        snapshotData['cargoConditionNotesDrop'] as String?;
    _cargoConditionPicked = snapshotData['cargoConditionPicked'] as bool?;
    _cargoConditionDropped = snapshotData['cargoConditionDropped'] as bool?;
    _receivingPartyNumber = snapshotData['receivingParty_Number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? orderId,
  DocumentReference? customerId,
  String? customerName,
  String? businessId,
  String? cargoType,
  String? status,
  DateTime? pickupTime,
  DateTime? dropoffTime,
  DateTime? createdAt,
  bool? isDriverAssigned,
  DocumentReference? assignedDriverId,
  String? assignmentStatus,
  double? paymentAmount,
  String? paymentMethod,
  String? paymentStatus,
  DateTime? paidAt,
  bool? reviewGiven,
  int? rating,
  LatLng? driverLocation,
  int? currentPickupIndex,
  String? orderType,
  String? requiredVehicle,
  DateTime? completedOn,
  String? scheduleType,
  String? packageType,
  String? assemblyType,
  int? assistanceCount,
  int? cargoUnits,
  String? cargoRemarks,
  String? orderAttachment,
  DateTime? scheduleFor,
  DateTime? acceptedOn,
  LatLng? pickupLocation,
  LatLng? dropoffLocation,
  String? reviewRemarks,
  bool? orderCompleteConfirm,
  String? customerNumber,
  String? receivingParty,
  String? cargoConditionState,
  String? cargoConditionNotes,
  bool? cargoConditionPickupConfirm,
  bool? cargoConditionDropoffConfirm,
  String? cargoConditionStateDrop,
  String? cargoConditionNotesDrop,
  bool? cargoConditionPicked,
  bool? cargoConditionDropped,
  String? receivingPartyNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order_id': orderId,
      'customer_id': customerId,
      'customer_name': customerName,
      'business_id': businessId,
      'cargo_type': cargoType,
      'status': status,
      'pickup_time': pickupTime,
      'dropoff_time': dropoffTime,
      'created_at': createdAt,
      'is_driver_assigned': isDriverAssigned,
      'assigned_driver_id': assignedDriverId,
      'assignment_status': assignmentStatus,
      'payment_amount': paymentAmount,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
      'paid_at': paidAt,
      'review_given': reviewGiven,
      'rating': rating,
      'driver_location': driverLocation,
      'current_pickup_index': currentPickupIndex,
      'order_type': orderType,
      'required_vehicle': requiredVehicle,
      'completed_on': completedOn,
      'schedule_type': scheduleType,
      'package_type': packageType,
      'assembly_type': assemblyType,
      'assistance_count': assistanceCount,
      'cargo_units': cargoUnits,
      'cargo_remarks': cargoRemarks,
      'order_attachment': orderAttachment,
      'schedule_for': scheduleFor,
      'accepted_on': acceptedOn,
      'pickupLocation': pickupLocation,
      'dropoffLocation': dropoffLocation,
      'review_remarks': reviewRemarks,
      'order_Complete_Confirm': orderCompleteConfirm,
      'customer_number': customerNumber,
      'receiving_party': receivingParty,
      'cargoConditionState': cargoConditionState,
      'cargoConditionNotes': cargoConditionNotes,
      'cargoConditionPickupConfirm': cargoConditionPickupConfirm,
      'cargoConditionDropoffConfirm': cargoConditionDropoffConfirm,
      'cargoConditionStateDrop': cargoConditionStateDrop,
      'cargoConditionNotesDrop': cargoConditionNotesDrop,
      'cargoConditionPicked': cargoConditionPicked,
      'cargoConditionDropped': cargoConditionDropped,
      'receivingParty_Number': receivingPartyNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.orderId == e2?.orderId &&
        e1?.customerId == e2?.customerId &&
        e1?.customerName == e2?.customerName &&
        e1?.businessId == e2?.businessId &&
        e1?.cargoType == e2?.cargoType &&
        e1?.status == e2?.status &&
        e1?.pickupTime == e2?.pickupTime &&
        e1?.dropoffTime == e2?.dropoffTime &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.coordinates, e2?.coordinates) &&
        listEquality.equals(e1?.addresses, e2?.addresses) &&
        e1?.isDriverAssigned == e2?.isDriverAssigned &&
        e1?.assignedDriverId == e2?.assignedDriverId &&
        e1?.assignmentStatus == e2?.assignmentStatus &&
        e1?.paymentAmount == e2?.paymentAmount &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.paidAt == e2?.paidAt &&
        e1?.reviewGiven == e2?.reviewGiven &&
        e1?.rating == e2?.rating &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.currentPickupIndex == e2?.currentPickupIndex &&
        e1?.orderType == e2?.orderType &&
        e1?.requiredVehicle == e2?.requiredVehicle &&
        e1?.completedOn == e2?.completedOn &&
        e1?.scheduleType == e2?.scheduleType &&
        e1?.packageType == e2?.packageType &&
        e1?.assemblyType == e2?.assemblyType &&
        listEquality.equals(e1?.handleType, e2?.handleType) &&
        e1?.assistanceCount == e2?.assistanceCount &&
        e1?.cargoUnits == e2?.cargoUnits &&
        e1?.cargoRemarks == e2?.cargoRemarks &&
        e1?.orderAttachment == e2?.orderAttachment &&
        e1?.scheduleFor == e2?.scheduleFor &&
        e1?.acceptedOn == e2?.acceptedOn &&
        e1?.pickupLocation == e2?.pickupLocation &&
        e1?.dropoffLocation == e2?.dropoffLocation &&
        e1?.reviewRemarks == e2?.reviewRemarks &&
        e1?.orderCompleteConfirm == e2?.orderCompleteConfirm &&
        e1?.customerNumber == e2?.customerNumber &&
        e1?.receivingParty == e2?.receivingParty &&
        listEquality.equals(
            e1?.cargoConditionPickup, e2?.cargoConditionPickup) &&
        listEquality.equals(
            e1?.cargoConditionDropoff, e2?.cargoConditionDropoff) &&
        e1?.cargoConditionState == e2?.cargoConditionState &&
        e1?.cargoConditionNotes == e2?.cargoConditionNotes &&
        e1?.cargoConditionPickupConfirm == e2?.cargoConditionPickupConfirm &&
        e1?.cargoConditionDropoffConfirm == e2?.cargoConditionDropoffConfirm &&
        e1?.cargoConditionStateDrop == e2?.cargoConditionStateDrop &&
        e1?.cargoConditionNotesDrop == e2?.cargoConditionNotesDrop &&
        e1?.cargoConditionPicked == e2?.cargoConditionPicked &&
        e1?.cargoConditionDropped == e2?.cargoConditionDropped &&
        e1?.receivingPartyNumber == e2?.receivingPartyNumber;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.orderId,
        e?.customerId,
        e?.customerName,
        e?.businessId,
        e?.cargoType,
        e?.status,
        e?.pickupTime,
        e?.dropoffTime,
        e?.createdAt,
        e?.coordinates,
        e?.addresses,
        e?.isDriverAssigned,
        e?.assignedDriverId,
        e?.assignmentStatus,
        e?.paymentAmount,
        e?.paymentMethod,
        e?.paymentStatus,
        e?.paidAt,
        e?.reviewGiven,
        e?.rating,
        e?.driverLocation,
        e?.currentPickupIndex,
        e?.orderType,
        e?.requiredVehicle,
        e?.completedOn,
        e?.scheduleType,
        e?.packageType,
        e?.assemblyType,
        e?.handleType,
        e?.assistanceCount,
        e?.cargoUnits,
        e?.cargoRemarks,
        e?.orderAttachment,
        e?.scheduleFor,
        e?.acceptedOn,
        e?.pickupLocation,
        e?.dropoffLocation,
        e?.reviewRemarks,
        e?.orderCompleteConfirm,
        e?.customerNumber,
        e?.receivingParty,
        e?.cargoConditionPickup,
        e?.cargoConditionDropoff,
        e?.cargoConditionState,
        e?.cargoConditionNotes,
        e?.cargoConditionPickupConfirm,
        e?.cargoConditionDropoffConfirm,
        e?.cargoConditionStateDrop,
        e?.cargoConditionNotesDrop,
        e?.cargoConditionPicked,
        e?.cargoConditionDropped,
        e?.receivingPartyNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
