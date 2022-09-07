import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../ui/home/car_manager/publish_car/push_car_page.dart';

class PublishCarInfoWidget extends StatefulWidget {
  final Color fontColor;
  final PublishCarInfo publishCarInfo;
  const PublishCarInfoWidget({super.key, required this.fontColor, required this.publishCarInfo});

  @override
  State<PublishCarInfoWidget> createState() => _PublishCarInfoWidgetState();
}

class _PublishCarInfoWidgetState extends State<PublishCarInfoWidget> {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        _showarea('车架号', widget.publishCarInfo.viNum!,widget.fontColor),
        _showarea('品牌车型', widget.publishCarInfo.carName!,widget.fontColor),
        _showarea('所在地区', widget.publishCarInfo.locationCity!,widget.fontColor),
        _showarea('首次上牌', widget.publishCarInfo.licensingDateStr,widget.fontColor),
        // _showarea('车牌号', widget.publishCarInfo.carNum!,widget.fontColor),
        _showarea('发动机号', widget.publishCarInfo.engineNum!,widget.fontColor),
        _showarea('车身颜色', widget.publishCarInfo.carColor!,widget.fontColor),
        Container(
          padding: EdgeInsets.only(top: 20.w, bottom: 5.w),
          color: Colors.transparent,
          child: Row(
            children: [
              '*'
                  .text
                  .size(28.sp)
                  .color(Colors.red)
                  .normal
                  .textStyle(const TextStyle(decoration: TextDecoration.none))
                  .make()
                  .paddingOnly(top: 5),
              10.wb,
              SizedBox(
                width: 170.w,
                child: '表显里程'
                    .text
                    .size(28.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: widget.publishCarInfo.mileage!
                    .text
                    .size(28.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(widget.fontColor)
                    .make(),
              ),
              24.wb,
              '万公里'
                  .text
                  .size(28.sp)
                  .normal
                  .textStyle(const TextStyle(decoration: TextDecoration.none))
                  .color(Colors.black.withOpacity(0.8))
                  .make(),
            ],
          ),
        ),
      ],
    );
  }

  _showarea(
      String title,
      String content,
      Color fontColor,
      ) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      color: Colors.transparent,
      child: Row(
        children: [
          '*'
              .text
              .size(28.sp)
              .normal
              .textStyle(const TextStyle(decoration: TextDecoration.none))
              .color(Colors.red)
              .make()
              .paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 170.w,
            child: title.text
                .size(28.sp)
                .normal
                .textStyle(const TextStyle(decoration: TextDecoration.none))
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: content.text
                .size(28.sp)
                .normal
                .textStyle(const TextStyle(decoration: TextDecoration.none))
                .color(fontColor)
                .make(),
          ),
          24.wb,
        ],
      ),
    );
  }
}
