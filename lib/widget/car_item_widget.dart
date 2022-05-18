import 'dart:core';

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import 'cloud_image_network_widget.dart';

class CarItemWidget extends StatelessWidget {
  final String name;
  final String price;
  final String time;
  final String distance;
  final String? standard;
  final String url;

  final EdgeInsetsGeometry widgetPadding;

  const CarItemWidget({
    super.key,
    required this.name,
    required this.price,
    required this.time,
    required this.distance,
    this.standard,
    required this.url,
    required this.widgetPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: kForeGroundColor,
      ),
      padding: widgetPadding,
      margin:EdgeInsets.only(top: 24.w),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 240.w, height: 180.w,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                child: CloudImageNetworkWidget.car(
                  urls: [url],
                ),
              ),
            ),
          ),
          24.wb,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111111),
                        )),
                16.hb,
                Row(
                  children: [
                    _getTextView(time),
                    16.wb,
                    _getTextView(distance),
                    16.wb,
                    // _getTextView(standard),
                  ],
                ),
                20.hb,
                RichText(
                  text: TextSpan(
                      text: price,
                      style: TextStyle(
                          color: const Color(0xFFFF3B02),
                          fontSize: BaseStyle.fontSize36,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: ' 万',
                            style: TextStyle(
                                color: const Color(0xFFFF3B02),
                                fontSize: BaseStyle.fontSize28,
                                fontWeight: FontWeight.normal)),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getTextView(String text) {
    return text.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF1F2F4),
                borderRadius: BorderRadius.all(Radius.circular(2.w))),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF4F5A74),
                fontSize: 20.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        : const SizedBox();
  }
}
