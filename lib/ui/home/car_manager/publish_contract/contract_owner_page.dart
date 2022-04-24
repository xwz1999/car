import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class ContractOwnerPage extends StatefulWidget {
  const ContractOwnerPage({Key? key}) : super(key: key);

  @override
  State<ContractOwnerPage> createState() => _ContractOwnerPageState();
}

class _ContractOwnerPageState extends State<ContractOwnerPage> {
  bool _chooseOwner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('寄卖合同',
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
              child: '车主信息'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h,left: 30.w,right: 30.w),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        '*'
                            .text
                            .size(30.sp)
                            .color(Colors.red)
                            .normal
                            .textStyle(
                                TextStyle(decoration: TextDecoration.none))
                            .make()
                            .paddingOnly(top: 5),
                        10.wb,
                        SizedBox(
                          width: 160.w,
                          child: '车主类别'
                              .text
                              .size(30.sp)
                              .normal
                              .textStyle(
                                  TextStyle(decoration: TextDecoration.none))
                              .color(Colors.black.withOpacity(0.45))
                              .make(),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _chooseOwner = !_chooseOwner;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50.w,
                                        height: 50.w,
                                        padding:
                                        EdgeInsets.only(top: 6.w, right: 5.w),
                                        child: !_chooseOwner
                                            ? const Icon(CupertinoIcons.circle,
                                            size: 18, color: Color(0xFFdddddd))
                                            : const Icon(
                                            CupertinoIcons.checkmark_alt_circle_fill,
                                            size: 18,
                                            color: Colors.blue)),
                                    RichText(
                                      text: TextSpan(
                                        text: "个人寄卖",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12 * 2.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _chooseOwner = !_chooseOwner;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50.w,
                                        height: 50.w,
                                        padding:
                                        EdgeInsets.only(top: 6.w, right: 5.w),
                                        child: _chooseOwner
                                            ? const Icon(CupertinoIcons.circle,
                                            size: 18, color: Color(0xFFdddddd))
                                            : const Icon(
                                            CupertinoIcons.checkmark_alt_circle_fill,
                                            size: 18,
                                            color: Colors.blue)),
                                    RichText(
                                      text: TextSpan(
                                        text: "公司车辆",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12 * 2.sp),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
