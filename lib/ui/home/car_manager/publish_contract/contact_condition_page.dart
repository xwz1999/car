import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_info_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_picture_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';
import '../../../tab_navigator.dart';
import '../publish_finish_page.dart';

class ContactCondition extends StatefulWidget {
  const ContactCondition({Key? key}) : super(key: key);

  @override
  State<ContactCondition> createState() => _ContactConditionState();
}

class _ContactConditionState extends State<ContactCondition> {
  final TextEditingController _appearanceController= TextEditingController();
  final TextEditingController _interiorController= TextEditingController();
  final TextEditingController _statusController= TextEditingController();
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
              child: '车况描述'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(30.w),
              child: Column(
                children: [
                  _showDescription('外观', _appearanceController),
                  _showDescription('内饰', _interiorController),
                  _showDescription('工况', _statusController),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.w),
              child: '服务费'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(30.w),
              child: Row(
                children: [
                  '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
                  10.wb,
                  SizedBox(
                    width: 160.w,
                    child: '服务费比例'.text
                        .size(28.sp)
                        .normal
                        .textStyle(const TextStyle(decoration: TextDecoration.none))
                        .color(Colors.black.withOpacity(0.45))
                        .make(),
                  ),
                  Expanded(
                    child: '5%'.text
                        .size(28.sp)
                        .normal
                        .textStyle(const TextStyle(decoration: TextDecoration.none))
                        .color(Colors.black.withOpacity(0.45))
                        .make(),

                  ),
                  24.wb,
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const TabNavigator());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingOnly(left: 30.w,right: 30.w),
          ],
        ),
      ),
    );
  }

  _showDescription(
      String title,
      TextEditingController _contentController,
      ) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      color: Colors.transparent,
      child: Row(
        children: [
          '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 160.w,
            child: title.text
                .size(28.sp)
                .normal
                .textStyle(const TextStyle(decoration: TextDecoration.none))
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              onChanged: (text) => setState(() {}),
              autofocus: false,
              controller: _contentController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '请输入',
                  hintStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black.withOpacity(0.25),
                  )),
            ),
          ),
          24.wb,
        ],
      ),
    );
  }
}
