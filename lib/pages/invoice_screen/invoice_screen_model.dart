import '/components/appbar_component/appbar_component_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invoice_screen_widget.dart' show InvoiceScreenWidget;
import 'package:flutter/material.dart';

class InvoiceScreenModel extends FlutterFlowModel<InvoiceScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppbarComponent component.
  late AppbarComponentModel appbarComponentModel;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;

  @override
  void initState(BuildContext context) {
    appbarComponentModel = createModel(context, () => AppbarComponentModel());
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    appbarComponentModel.dispose();
    menuDrawerModel.dispose();
  }
}
