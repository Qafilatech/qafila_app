import 'package:flutter/material.dart';
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

  List<LatLng> _testlatlngs = [
    LatLng(47.4979, 19.0402),
    LatLng(51.5074, 0.1278),
    LatLng(48.8566, 2.3522),
    LatLng(52.52, 13.405)
  ];
  List<LatLng> get testlatlngs => _testlatlngs;
  set testlatlngs(List<LatLng> value) {
    _testlatlngs = value;
  }

  void addToTestlatlngs(LatLng value) {
    testlatlngs.add(value);
  }

  void removeFromTestlatlngs(LatLng value) {
    testlatlngs.remove(value);
  }

  void removeAtIndexFromTestlatlngs(int index) {
    testlatlngs.removeAt(index);
  }

  void updateTestlatlngsAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    testlatlngs[index] = updateFn(_testlatlngs[index]);
  }

  void insertAtIndexInTestlatlngs(int index, LatLng value) {
    testlatlngs.insert(index, value);
  }
}
