import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'custom_open_street_map_widget.dart' show CustomOpenStreetMapWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomOpenStreetMapModel
    extends FlutterFlowModel<CustomOpenStreetMapWidget> {
  ///  Local state fields for this component.

  List<int> visibleids = [];
  void addToVisibleids(int item) => visibleids.add(item);
  void removeFromVisibleids(int item) => visibleids.remove(item);
  void removeAtIndexFromVisibleids(int index) => visibleids.removeAt(index);
  void insertAtIndexInVisibleids(int index, int item) =>
      visibleids.insert(index, item);
  void updateVisibleidsAtIndex(int index, Function(int) updateFn) =>
      visibleids[index] = updateFn(visibleids[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
