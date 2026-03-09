// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ThatCurvedNavBar extends StatefulWidget {
  ThatCurvedNavBar(
      {required this.height,
      required this.width,
      required this.keyValue,
      required this.firstIcon,
      required this.secondIcon,
      this.thirdIcon,
      this.fourthIcon,
      this.fifthIcon,
      this.color,
      this.backgroundColor,
      this.buttonBackgroundColor,
      required this.onTap});

  final double height;
  final double width;
  final String keyValue;
  final Widget firstIcon;
  final Widget secondIcon;
  final Widget? thirdIcon;
  final Widget? fourthIcon;
  final Widget? fifthIcon;
  final Color? color;
  final Color? buttonBackgroundColor;
  final Color? backgroundColor;
  final Future Function() onTap;

  @override
  _ThatCurvedNavBarState createState() => _ThatCurvedNavBarState();
}

class _ThatCurvedNavBarState extends State<ThatCurvedNavBar> {
  int _page = FFAppState().pageIndex;
  late final Key _key;

  List<Widget> _buildNavItems() {
    return [
      widget.firstIcon,
      widget.secondIcon,
      if (widget.thirdIcon != null) widget.thirdIcon!,
      if (widget.fourthIcon != null) widget.fourthIcon!,
      if (widget.fifthIcon != null) widget.fifthIcon!,
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _key = Key(widget.keyValue);
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _key,
      index: FFAppState().pageIndex,
      items: _buildNavItems(),
      color: widget.color ?? Colors.white,
      buttonBackgroundColor: widget.buttonBackgroundColor ?? Colors.white,
      backgroundColor: widget.backgroundColor ?? Colors.blueAccent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) async {
        FFAppState().update(() => FFAppState().pageIndex = index);
        await widget.onTap();
        setState(() {
          _page = index;
        });
      },
      letIndexChange: (index) => true,
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
