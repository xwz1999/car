import 'package:cloud_car/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleDropScaffold extends StatelessWidget {
  ///沉浸式带背景的APPBar
  ///path未背景图的path
  final Widget? body;
  final Widget? appbar;
  final Color bodyColor;
  final Widget? bottomNavi;
  final FloatingActionButton? fab;
  final bool extendBody;
  final String? path;
  final Widget? drawer;

  final SystemUiOverlayStyle systemStyle;

  const TitleDropScaffold({
    super.key,
    this.body,
    this.appbar,
    this.bodyColor = const Color(0xFFF9F9F9),
    this.bottomNavi,
    this.fab,
    this.systemStyle = SystemStyle.initial,
    this.extendBody = false,
    this.path, this.drawer,
  });

  // const TitleDropScaffold.white({
  //   Key? key,
  //   this.body,
  //   this.bottomNavi,
  //   this.fab,
  //   this.systemStyle = SystemStyle.initial,
  //   this.extendBody = false,
  //   this.appbar,
  //   this.path, this.drawer,
  // })  : bodyColor = Colors.white,
  //       super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemStyle,
      child: Scaffold(
        key: key,
        backgroundColor: bodyColor,
        extendBodyBehindAppBar: extendBody,
        extendBody: extendBody,
        body:  Stack(

          children: [

            body ?? const SizedBox(),
            appbar ?? const SizedBox(),
          ],
        ),
        bottomNavigationBar: bottomNavi,
        floatingActionButton: fab,
        endDrawer: drawer,
      ),
    );
  }
}
