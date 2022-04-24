import 'package:cloud_car/constants/app_theme.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
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
  final bool normal;
  final String? title;
  final List<Widget> actions;
  final Color? appBarBackColor;
  final PreferredSizeWidget? appBarBottom;

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
  })  : normal = false,
        title = '',
        actions = const [],
        appBarBackColor = Colors.white,
        appBarBottom = null,
        super(key: key);

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
        normal = false,
        title = '',
        actions = const [],
        appBarBackColor = Colors.white,
        appBarBottom = null,
        super(key: key);

  const CloudScaffold.normal(
      {Key? key,
      this.body,
      this.appbar,
      this.bodyColor = const Color(0xFFF9F9F9),
      this.bottomNavi,
      this.fab,
      this.systemStyle = SystemStyle.initial,
      this.extendBody = false,
      this.path,
      this.title,
      this.appBarBackColor = Colors.white,
      this.appBarBottom,
      this.actions = const []})
      : normal = true,
        assert(title != null || appbar != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return !normal
        ? AnnotatedRegion<SystemUiOverlayStyle>(
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
          )
        : AnnotatedRegion<SystemUiOverlayStyle>(
            value: systemStyle,
            child: Scaffold(
              backgroundColor: bodyColor,
              extendBodyBehindAppBar: extendBody,
              extendBody: extendBody,
              body: body,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(88.w),
                child: title == null
                    ? appbar!
                    : AppBar(
                        backgroundColor:
                            extendBody ? Colors.transparent : appBarBackColor,
                        leading: const CloudBackButton(),
                        title: Text(title!),
                        actions: actions,
                      ),
              ),
              bottomNavigationBar: bottomNavi,
              floatingActionButton: fab,
            ),
          );
  }
}
