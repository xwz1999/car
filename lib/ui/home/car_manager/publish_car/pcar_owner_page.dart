import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_license_page.dart';
import 'package:cloud_car/utils/headers.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';
import '../direct_sale/edit_item_widget.dart';

class CarOwnerPage extends StatefulWidget {
  const CarOwnerPage({Key? key}) : super(key: key);

  @override
  State<CarOwnerPage> createState() => _CarOwnerPageState();
}

class _CarOwnerPageState extends State<CarOwnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('车辆发布',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0x99eeeeee),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(30.w),
                  child:
                      '车主信息'.text.size(32.sp).bold.color(Colors.black).make(),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 30.w, right: 30.w, bottom: 40.h),
                  color: Colors.white,
                  child: Column(
                    children: [
                      EditItemWidget(
                        topIcon: true,
                        title: '车主姓名',
                        value: '李四',
                        canChange: false,
                        callback: (String content) {},
                      ),
                      EditItemWidget(
                        topIcon: true,
                        title: '身份证号',
                        value: '333333333333333',
                        canChange: false,
                        callback: (String content) {},
                      ),
                      EditItemWidget(
                        topIcon: true,
                        title: '手机号码',
                        value: '12345678909',
                        canChange: false,
                        callback: (String content) {},
                      ),
                      EditItemWidget(
                        topIcon: true,
                        title: '银行卡号',
                        value: '1234567890',
                        canChange: false,
                        callback: (String content) {},
                      ),
                      EditItemWidget(
                        topIcon: true,
                        title: '开户行',
                        value: '中国银行xx支行',
                        canChange: false,
                        callback: (String content) {},
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Column(
                          children: [
                            _takePhoto(
                              '身份证照',
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Stack(
                                      children: [
                                        Assets.images.carPersonHead
                                            .image(width: 200.w, height: 150.h),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Stack(
                                      children: [
                                        Assets.images.carPersonBack
                                            .image(width: 200.w, height: 150.h),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            30.hb,
                            _takePhoto(
                              '半身照',
                              GestureDetector(
                                child: Stack(
                                  children: [
                                    Assets.images.carPersonPhoto
                                        .image(width: 200.w, height: 150.h),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                30.heightBox,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const CarLicensePage());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: '下一步'.text.size(30.sp).color(Colors.white).make(),
                  ),
                ).paddingOnly(left: 30.w, right: 30.w, bottom: 30.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _takePhoto(
    String title,
    Widget content,
  ) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
              10.wb,
              SizedBox(
                width: 160.w,
                child: title.text
                    .size(30.sp)
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
            ],
          ),
          15.heightBox,
          content,
        ],
      ),
    );
  }
}
