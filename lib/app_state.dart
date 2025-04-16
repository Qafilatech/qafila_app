import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }

  LatLng? _pickUpLocation = LatLng(23.5804904, 58.325034);
  LatLng? get pickUpLocation => _pickUpLocation;
  set pickUpLocation(LatLng? value) {
    _pickUpLocation = value;
  }

  LatLng? _dropOffLocation = LatLng(23.5804904, 58.325034);
  LatLng? get dropOffLocation => _dropOffLocation;
  set dropOffLocation(LatLng? value) {
    _dropOffLocation = value;
  }

  String _pickUpName = '-';
  String get pickUpName => _pickUpName;
  set pickUpName(String value) {
    _pickUpName = value;
  }

  String _dropOffName = '-';
  String get dropOffName => _dropOffName;
  set dropOffName(String value) {
    _dropOffName = value;
  }

  int _cargoWeight = 0;
  int get cargoWeight => _cargoWeight;
  set cargoWeight(int value) {
    _cargoWeight = value;
  }

  int _cargoAmount = 0;
  int get cargoAmount => _cargoAmount;
  set cargoAmount(int value) {
    _cargoAmount = value;
  }

  bool _assistance = false;
  bool get assistance => _assistance;
  set assistance(bool value) {
    _assistance = value;
  }

  String _vehicleType = '-';
  String get vehicleType => _vehicleType;
  set vehicleType(String value) {
    _vehicleType = value;
  }

  String _cargoTypes = '-';
  String get cargoTypes => _cargoTypes;
  set cargoTypes(String value) {
    _cargoTypes = value;
  }

  String _orderID = '-';
  String get orderID => _orderID;
  set orderID(String value) {
    _orderID = value;
  }

  double _orderPrice = 0.0;
  double get orderPrice => _orderPrice;
  set orderPrice(double value) {
    _orderPrice = value;
  }

  bool _locationStatus = false;
  bool get locationStatus => _locationStatus;
  set locationStatus(bool value) {
    _locationStatus = value;
  }
}
