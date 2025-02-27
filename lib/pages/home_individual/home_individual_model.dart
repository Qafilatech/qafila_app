import '/components/favourites/favourites_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_individual_widget.dart' show HomeIndividualWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeIndividualModel extends FlutterFlowModel<HomeIndividualWidget> {
  ///  Local state fields for this page.

  bool orderCount = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for favourites dynamic component.
  late FlutterFlowDynamicModels<FavouritesModel> favouritesModels;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    favouritesModels = FlutterFlowDynamicModels(() => FavouritesModel());
  }

  @override
  void dispose() {
    favouritesModels.dispose();
    tabBarController?.dispose();
  }
}
