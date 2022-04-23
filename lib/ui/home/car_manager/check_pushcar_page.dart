import 'package:cloud_car/ui/home/car_manager/publish_contract/contract_begin_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/cloud_back_button.dart';

class CheckPushPage extends StatefulWidget {
  const CheckPushPage({Key? key}) : super(key: key);

  @override
  State<CheckPushPage> createState() => _CheckPushPageState();
}

class _CheckPushPageState extends State<CheckPushPage> {
  String? carNum = 'LGJB3476524683243';
  String? carShape = '奥迪A3';
  String? carDate = '2020-03';
  String? licenseNum = '浙B236Y';
  String? engineNum = '647382';
  String? carColor = '蓝色';
  String? carRoute = '8.12';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 350.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/push_car_top.png'),
                  ),
                ),
                child: Scaffold(
                  appBar: AppBar(
                    leading: const CloudBackButton(
                      isSpecial: true,
                    ),
                    backgroundColor: Colors.transparent,
                    title: Text('车辆发布',
                        style: TextStyle(
                            color: BaseStyle.color111111,
                            fontSize: BaseStyle.fontSize36,
                            fontWeight: FontWeight.bold)),
                  ),
                  backgroundColor: Colors.transparent,
                  extendBody: true,
                  body: Container(
                    padding: EdgeInsets.only(left: 80.w),
                    width: double.infinity,
                    height: 140.h,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Wrap(
                          children: [
                            const Text(
                              '系统估值',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ).paddingOnly(top: 10.w),
                            20.wb,
                            const Text(
                              '13.57',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            5.wb,
                            '万'.text.color(Colors.red).bold.size(41.sp).make(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 340.h),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  width: double.infinity,
                  height: 800.h,
                  child: showPushCar(Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
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
              .textStyle(TextStyle(decoration: TextDecoration.none))
              .color(Colors.red)
              .make()
              .paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 160.w,
            child: title.text
                .size(28.sp)
                .normal
                .textStyle(TextStyle(decoration: TextDecoration.none))
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: content.text
                .size(28.sp)
                .normal
                .textStyle(TextStyle(decoration: TextDecoration.none))
                .color(fontColor)
                .make(),
          ),
          24.wb,
        ],
      ),
    );
  }

  Column showPushCar(Color fontColor) {
    return Column(
      children: [
        _showarea('车架号', carNum!,fontColor),
        _showarea('品牌车型', carShape!,fontColor),
        _showarea('首次上牌', carDate!,fontColor),
        _showarea('车牌号', licenseNum!,fontColor),
        _showarea('发动机号', engineNum!,fontColor),
        _showarea('车身颜色', carColor!,fontColor),
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
                  .textStyle(TextStyle(decoration: TextDecoration.none))
                  .make()
                  .paddingOnly(top: 5),
              10.wb,
              SizedBox(
                width: 160.w,
                child: '表显里程'
                    .text
                    .size(30.sp)
                    .normal
                    .textStyle(TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: carRoute!.text
                    .size(30.sp)
                    .normal
                    .textStyle(TextStyle(decoration: TextDecoration.none))
                    .color(fontColor)
                    .make(),
              ),
              24.wb,
              '万公里'
                  .text
                  .size(30.sp)
                  .normal
                  .textStyle(TextStyle(decoration: TextDecoration.none))
                  .color(Colors.black.withOpacity(0.8))
                  .make(),
            ],
          ),
        ),
        30.heightBox,
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => const ContractBeginPage());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: '发起合同'.text.size(30.sp).color(Colors.white).make(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            '已签订合同？'
                .text
                .color(Colors.black.withOpacity(0.45))
                .textStyle(const TextStyle(decoration: TextDecoration.none))
                .normal
                .size(20.sp)
                .make(),
            TextButton(
              onPressed: () {},
              child: '继续发布车辆'
                  .text
                  .color(Colors.blue)
                  .textStyle(const TextStyle(decoration: TextDecoration.none))
                  .normal
                  .size(20.sp)
                  .make(),
            ).paddingZero
          ],
        )
      ],
    );
  }
}
