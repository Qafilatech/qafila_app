import '/components/appbar_component/appbar_component_widget.dart';
import '/components/favourites/favourites_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool orderCount = false;

  ///  State fields for stateful widgets in this page.

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // Model for AppbarComponent component.
  late AppbarComponentModel appbarComponentModel;
  // Stores action output result for [Custom Action - detectOS] action in Container widget.
  String? detectedOS;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Custom Action - getRoadRoute] action in Container widget.
  List<LatLng>? routeHelp;
  // Models for favourites dynamic component.
  late FlutterFlowDynamicModels<FavouritesModel> favouritesModels;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    appbarComponentModel = createModel(context, () => AppbarComponentModel());
    favouritesModels = FlutterFlowDynamicModels(() => FavouritesModel());
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    appbarComponentModel.dispose();
    favouritesModels.dispose();
  }
}
