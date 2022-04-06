import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

abstract class ThatcarWidget extends StatefulWidget {
  final String title;
  final String text;
  final String stat;
  const ThatcarWidget(
      {Key? key, required this.title, required this.text, required this.stat})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
    );
  }

  getThatcar() {
    return Column(
      children: [
        title == "叫车车辆信息"
            ? Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28),
                  ),
                  Container(
                    width: 104.w,
                    height: 40.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        color: stat.substring(0, 1) == "待"
                            ? const Color(0xFFFE8029).withOpacity(0.01)
                            : const Color(0xFF027AFF).withOpacity(0.01)),
                    child: Text(stat),
                  )
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
