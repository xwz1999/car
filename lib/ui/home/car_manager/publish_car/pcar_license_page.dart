import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_price_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../base/base_style.dart';
import '../../../../widget/button/cloud_back_button.dart';
import '../direct_sale/edit_item_widget.dart';

class CarLicensePage extends StatefulWidget {
  const CarLicensePage({Key? key}) : super(key: key);

  @override
  State<CarLicensePage> createState() => _CarLicensePageState();
}

class _CarLicensePageState extends State<CarLicensePage> {
  late bool _chooseTraffic = true;
  bool _chooseCommerce = true;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30.w),
              child: '牌证信息'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              padding: EdgeInsets.only(left:30.w,right: 30.w,bottom: 30.w),
              color: Colors.white,
              child: Column(
                children: [
                  EditItemWidget(
                    topIcon: false,
                    title: '过户次数',
                    value: '',
                    canChange: true,
                    callback: (String content) {},
                    endText: '次',
                  ),
                  EditItemWidget(
                    topIcon: false,
                    title: '钥匙数量',
                    value: '',
                    canChange: true,
                    callback: (String content) {},
                    endText: '把',
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 30.h,  left: 5.w, right: 30.w),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        '*'
                            .text
                            .size(30.sp)
                            .color(Colors.red)
                            .normal
                            .textStyle(const TextStyle(
                            decoration: TextDecoration.none))
                            .make()
                            .paddingOnly(top: 5),
                        10.wb,
                        SizedBox(
                          width: 160.w,
                          child: '交强险'
                              .text
                              .size(30.sp)
                              .normal
                              .textStyle(const TextStyle(
                              decoration: TextDecoration.none))
                              .color(Colors.black.withOpacity(0.45))
                              .make(),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _chooseTraffic = !_chooseTraffic;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50.w,
                                        height: 50.w,
                                        padding: EdgeInsets.only(
                                            top: 6.w, right: 5.w),
                                        child: !_chooseTraffic
                                            ? const Icon(CupertinoIcons.circle,
                                            size: 18,
                                            color: Color(0xFFdddddd))
                                            : const Icon(
                                            CupertinoIcons
                                                .checkmark_alt_circle_fill,
                                            size: 18,
                                            color: Colors.blue)),
                                    RichText(
                                      text: TextSpan(
                                        text: "有",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              30.widthBox,
                              GestureDetector(
                                onTap: () {
                                  _chooseTraffic = !_chooseTraffic;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50.w,
                                        height: 50.w,
                                        padding: EdgeInsets.only(
                                            top: 6.w, right: 5.w),
                                        child: _chooseTraffic
                                            ? const Icon(CupertinoIcons.circle,
                                            size: 18,
                                            color: Color(0xFFdddddd))
                                            : const Icon(
                                            CupertinoIcons
                                                .checkmark_alt_circle_fill,
                                            size: 18,
                                            color: Colors.blue)),
                                    RichText(
                                      text: TextSpan(
                                        text: "无",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  EditItemWidget(
                    topIcon: false,
                    title: '交强险到期',
                    value: '',
                    canChange: true,
                    callback: (String content) {},
                    endIcon: Image.asset(
                      Assets.icons.icGoto.path,
                      width: 32.w,
                      height: 32.w,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 30.h, left: 5.w, right: 30.w),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        '*'
                            .text
                            .size(30.sp)
                            .color(Colors.red)
                            .normal
                            .textStyle(const TextStyle(
                            decoration: TextDecoration.none))
                            .make()
                            .paddingOnly(top: 5),
                        10.wb,
                        SizedBox(
                          width: 160.w,
                          child: '商业险'
                              .text
                              .size(30.sp)
                              .normal
                              .textStyle(const TextStyle(
                              decoration: TextDecoration.none))
                              .color(Colors.black.withOpacity(0.45))
                              .make(),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _chooseCommerce = !_chooseCommerce;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50.w,
                                        height: 50.w,
                                        padding: EdgeInsets.only(
                                            top: 6.w, right: 5.w),
                                        child: !_chooseCommerce
                                            ? const Icon(CupertinoIcons.circle,
                                            size: 18,
                                            color: Color(0xFFdddddd))
                                            : const Icon(
                                            CupertinoIcons
                                                .checkmark_alt_circle_fill,
                                            size: 18,
                                            color: Colors.blue)),
                                    RichText(
                                      text: TextSpan(
                                        text: "有",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              30.widthBox,
                              GestureDetector(
                                onTap: () {
                                  _chooseCommerce = !_chooseCommerce;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50.w,
                                        height: 50.w,
                                        padding: EdgeInsets.only(
                                            top: 6.w, right: 5.w),
                                        child: _chooseCommerce
                                            ? const Icon(CupertinoIcons.circle,
                                            size: 18,
                                            color: Color(0xFFdddddd))
                                            : const Icon(
                                            CupertinoIcons
                                                .checkmark_alt_circle_fill,
                                            size: 18,
                                            color: Colors.blue)),
                                    RichText(
                                      text: TextSpan(
                                        text: "无",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  EditItemWidget(
                    topIcon: false,
                    title: '商业险到期',
                    value: '',
                    canChange: true,
                    callback: (String content) {},
                    endIcon: Image.asset(
                      Assets.icons.icGoto.path,
                      width: 32.w,
                      height: 32.w,
                    ),
                  ),
                  EditItemWidget(
                    topIcon: false,
                    title: '商业险金额',
                    value: '',
                    canChange: true,
                    callback: (String content) {},
                    endText: '元',
                  ),
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const CarPricePage());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingOnly(left: 30.w,right: 30.w,bottom: 30.h),
          ],
        ),
      ),
    );
  }
}
