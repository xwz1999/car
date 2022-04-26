import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PublishCarInfoWidget extends StatefulWidget {
  final Color fontColor;
  const PublishCarInfoWidget({Key? key, required this.fontColor}) : super(key: key);

  @override
  State<PublishCarInfoWidget> createState() => _PublishCarInfoWidgetState();
}

class _PublishCarInfoWidgetState extends State<PublishCarInfoWidget> {
  String? carNum = 'LGJB3476524683243';
  String? carShape = '奥迪A3';
  String? carDate = '2020-03';
  String? licenseNum = '浙B236Y';
  String? engineNum = '647382';
  String? carColor = '蓝色';
  String? carRoute = '8.12';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _showarea('车架号', carNum!,widget.fontColor),
        _showarea('品牌车型', carShape!,widget.fontColor),
        _showarea('首次上牌', carDate!,widget.fontColor),
        _showarea('车牌号', licenseNum!,widget.fontColor),
        _showarea('发动机号', engineNum!,widget.fontColor),
        _showarea('车身颜色', carColor!,widget.fontColor),
        Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          color: Colors.transparent,
          child: Row(
            children: [
              '*'
                  .text
                  .size(30.sp)
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
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: carRoute!.text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(widget.fontColor)
                    .make(),
              ),
              24.wb,
              '万公里'
                  .text
                  .size(30.sp)
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
