import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  Local state fields for this page.

  int? totalPagesCount = 3;

  bool hideButtonText = false;

  List<String> titleList = [
    'Real-time updates',
    'Smarter Savings',
    'Safe and Secure'
  ];
  void addToTitleList(String item) => titleList.add(item);
  void removeFromTitleList(String item) => titleList.remove(item);
  void removeAtIndexFromTitleList(int index) => titleList.removeAt(index);
  void insertAtIndexInTitleList(int index, String item) =>
      titleList.insert(index, item);
  void updateTitleListAtIndex(int index, Function(String) updateFn) =>
      titleList[index] = updateFn(titleList[index]);

  List<String> subtitleList = [
    'Track your expenses and savings in real time.',
    'Stay on top of your finances with intuitive tools and insights.',
    'Your money and data are protected with advanced security.'
  ];
  void addToSubtitleList(String item) => subtitleList.add(item);
  void removeFromSubtitleList(String item) => subtitleList.remove(item);
  void removeAtIndexFromSubtitleList(int index) => subtitleList.removeAt(index);
  void insertAtIndexInSubtitleList(int index, String item) =>
      subtitleList.insert(index, item);
  void updateSubtitleListAtIndex(int index, Function(String) updateFn) =>
      subtitleList[index] = updateFn(subtitleList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  /// Action that happens when a user presses a button on a last slide.
  Future lastSlideAction(BuildContext context) async {}
}
