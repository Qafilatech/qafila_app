import '/components/appbar_component/appbar_component_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'payment_screen_widget.dart' show PaymentScreenWidget;
import 'package:flutter/material.dart';

class PaymentScreenModel extends FlutterFlowModel<PaymentScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // Model for AppbarComponent component.
  late AppbarComponentModel appbarComponentModel;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    appbarComponentModel = createModel(context, () => AppbarComponentModel());
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    appbarComponentModel.dispose();
  }
}
