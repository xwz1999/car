
import 'dart:ffi';
import 'package:cloud_car/ui/home/car_manager/check_pushcar_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/picker/car_picker_box.dart';

class EvainfoPage extends StatefulWidget {
  const EvainfoPage({Key? key}) : super(key: key);

  @override
  State<EvainfoPage> createState() => _EvainfoPageState();
}

class _EvainfoPageState extends State<EvainfoPage> {
  final String? _transfer = ''; //过户次数
  final String? _paint = ''; //油漆面
  final String? _metal = ''; //钣金面
  final String? _replace = ''; //更换件
  final String? _transmission = ''; //变速箱
  final String? _accident = ''; //重大事故
  final String? _maintain = ''; //4s保养
  final String? _kilometers = ''; //真实公里数

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('填写估价信息',
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
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(30.w),
              child: '奥迪A3 2020款 35 TFSI 进取型'
                  .text
                  .size(32.sp)
                  .bold
                  .color(Colors.black)
                  .make(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.w),
              child: Container(
                width: double.infinity,
                height: 780.h,
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          10.wb,
                          SizedBox(
                            width: 160.w,
                            child: '车身颜色'
                                .text
                                .size(30.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make(),
                          ),
                          Expanded(
                              child: '白色'
                                  .text
                                  .size(30.sp)
                                  .color(Colors.black)
                                  .make()),
                          24.wb,
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          10.wb,
                          SizedBox(
                            width: 160.w,
                            child: '首次上牌'
                                .text
                                .size(30.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make(),
                          ),
                          Expanded(
                              child: '2020-03'
                                  .text
                                  .size(30.sp)
                                  .color(Colors.black)
                                  .make()),
                          24.wb,
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          10.wb,
                          SizedBox(
                            child: '行驶里程'
                                .text
                                .size(30.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make(),
                          ),
                          40.wb,
                          Expanded(
                              child: '3.0'
                                  .text
                                  .size(30.sp)
                                  .color(Colors.black)
                                  .make()),
                          24.wb,
                          '万公里'.text.size(30.sp).make(),
                        ],
                      ),
                    ),
                    _function('过户次数', () {}, _transfer!, '请选择', Container()),
                    _function('油漆面修复', () {}, _paint!, '请选择', Container()),
                    _function('钣金面修复', () {}, _metal!, '请选择', Container()),
                    _function('更换件情况', () {}, _replace!, '请选择', Container()),
                    _function(
                        '变速箱情况', () {}, _transmission!, '请选择', Container()),
                    _function('重大事故', () {}, _accident!, '请选择', Container()),
                    _function(
                        '全程4s按时保养', () {}, _maintain!, '请选择', Container()),
                    _function(
                        '有无更改真实公里数', () {}, _kilometers!, '请选择', Container()),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const CheckPushPage());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '马上估价'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingOnly(top: 1000.h, left: 40.w, right: 40.w),
          ],
        ),
      ),
    );
  }

  _function(
    String title,
    VoidCallback onTap,
    String content,
    String msg,
    Widget child,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
      child: GestureDetector(
        onTap: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return CarPickerBox(
                title: title,
                onPressed: () {
                  Get.back();
                  setState(() {});
                },
                child: child,
              );
            },
          );
        },
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              10.wb,
              SizedBox(
                child: title.text
                    .size(30.sp)
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              40.wb,
              (content.isEmpty ? msg : content)
                  .text
                  .size(30.sp)
                  .color(
                      Colors.black.withOpacity(content.isEmpty ? 0.25 : 0.85))
                  .make(),
              const Spacer(),
              Icon(
                CupertinoIcons.chevron_right,
                color: Colors.black.withOpacity(0.45),
                size: 28.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
