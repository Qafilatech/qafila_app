import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<int> ids = [0, 1, 2, 3];
  void addToIds(int item) => ids.add(item);
  void removeFromIds(int item) => ids.remove(item);
  void removeAtIndexFromIds(int index) => ids.removeAt(index);
  void insertAtIndexInIds(int index, int item) => ids.insert(index, item);
  void updateIdsAtIndex(int index, Function(int) updateFn) =>
      ids[index] = updateFn(ids[index]);

  List<String> names = ['Budapest', 'London', 'Paris', 'Berlin'];
  void addToNames(String item) => names.add(item);
  void removeFromNames(String item) => names.remove(item);
  void removeAtIndexFromNames(int index) => names.removeAt(index);
  void insertAtIndexInNames(int index, String item) =>
      names.insert(index, item);
  void updateNamesAtIndex(int index, Function(String) updateFn) =>
      names[index] = updateFn(names[index]);

  List<int> seenplacesids = [];
  void addToSeenplacesids(int item) => seenplacesids.add(item);
  void removeFromSeenplacesids(int item) => seenplacesids.remove(item);
  void removeAtIndexFromSeenplacesids(int index) =>
      seenplacesids.removeAt(index);
  void insertAtIndexInSeenplacesids(int index, int item) =>
      seenplacesids.insert(index, item);
  void updateSeenplacesidsAtIndex(int index, Function(int) updateFn) =>
      seenplacesids[index] = updateFn(seenplacesids[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
