import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class SwiperPaginationWidget extends SwiperPlugin {
  ///color ,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color? color;

  ///color when active,if set null , will be Theme.of(context).primaryColor
  final Color? activeColor;

  ////font size
  final double fontSize;

  ///font size when active
  final double activeFontSize;

  final Key? key;

  const SwiperPaginationWidget(
      {this.color,
        this.fontSize: 20.0,
        this.key,
        this.activeColor,
        this.activeFontSize: 35.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig? config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;

    if (Axis.vertical == config!.scrollDirection) {
      return Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Text(
            "${config.activeIndex! + 1}",
            style: TextStyle(color: activeColor, fontSize: activeFontSize),
          ),
           Text(
            "/",
            style: TextStyle(color: color, fontSize: fontSize),
          ),
           Text(
            "${config.itemCount}",
            style: TextStyle(color: color, fontSize: fontSize),
          )
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8.w,horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          color: const Color(0xFF000000).withOpacity(0.5)
        ),
        child: Row(
          key: key,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Text(
              "${config.activeIndex! + 1}",
              style: TextStyle(color: activeColor, fontSize: activeFontSize),
            ),
             Text(
              " / ${config.itemCount}",
              style: TextStyle(color: color, fontSize: fontSize),
            )
          ],
        ),
      );
    }
  }
}