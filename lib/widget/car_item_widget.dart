import 'dart:core';

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CarItemWidget extends StatelessWidget {
  final String name;
  final String price;
  final String time;
  final String distance;
  final String standard;
  final String url;
  final EdgeInsetsGeometry widgetPadding;

  const CarItemWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.time,
    required this.distance,
    required this.standard,
    required this.url, required this.widgetPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: kForeGroundColor,
      ),
      padding: widgetPadding,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //头像
            width: 240.w, height: 180.w,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                child: url.contains('http')
                    ? FadeInImage.assetNetwork(
                        image: url,
                        fit: BoxFit.cover,
                        placeholder: '',
                      )
                    : Image.asset(url),
              ),
            ),
          ),
          24.wb,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: BaseStyle.color111111,
                    fontSize: BaseStyle.fontSize28,

                  ),
                ),
                16.hb,
                Row(
                  children: [
                    _getTextView(time),
                    16.wb,
                    _getTextView(distance),
                    16.wb,
                    _getTextView(standard),
                  ],
                ),
                24.hb,
                Text(
                  price,
                  style: TextStyle(

                    color: const Color(0xFFFF3B02),
                    fontSize: BaseStyle.fontSize36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getTextView(String text) {
    return Container(
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
    );
  }
}
