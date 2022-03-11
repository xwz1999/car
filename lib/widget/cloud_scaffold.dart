import 'package:cloud_car/constants/app_theme.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloudScaffold extends StatelessWidget {
  ///沉浸式带背景的APPBar
  ///path未背景图的path
  final Widget? body;
  final Widget? appbar;
  final Color bodyColor;
  final Widget? bottomNavi;
  final FloatingActionButton? fab;
  final bool extendBody;
  final String? path;

  final SystemUiOverlayStyle systemStyle;

  const CloudScaffold({
    Key? key,
    this.body,
    this.appbar,
    this.bodyColor = const Color(0xFFF9F9F9),
    this.bottomNavi,
    this.fab,
    this.systemStyle = SystemStyle.initial,
    this.extendBody = false,
    this.path,
  }) : super(key: key);

  const CloudScaffold.white({
    Key? key,
    this.body,
    this.bottomNavi,
    this.fab,
    this.systemStyle = SystemStyle.initial,
    this.extendBody = false,
    this.appbar,
    this.path,
  })  : bodyColor = Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemStyle,
      child: Scaffold(
        backgroundColor: bodyColor,
        extendBodyBehindAppBar: extendBody,
        extendBody: extendBody,
        body: Stack(
          children: [
            Positioned(
                child: Image.asset(
              path != null ? (path!) : Assets.images.homeBg.path,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                appbar ?? const SizedBox(),
                body ?? const SizedBox(),
              ],
            )
          ],
        ),
        bottomNavigationBar: bottomNavi,
        floatingActionButton: fab,
      ),
    );
  }
}
