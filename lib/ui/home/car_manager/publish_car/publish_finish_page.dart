import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';
import '../../../tab_navigator.dart';

class PublishFinishPage extends StatefulWidget {
  final String title;
  final String remindText;
  const PublishFinishPage({super.key,  this.title='车辆发布',this.remindText='提交成功，等待平台审核'});

  @override
  State<PublishFinishPage> createState() => _PublishFinishPageState();
}

class _PublishFinishPageState extends State<PublishFinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text(widget.title,
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
          color: Colors.white,
        ),
        child: Column(
          children: [
            40.heightBox,
            Assets.icons.successful.image(width: 200.w,height: 200.h),
            20.heightBox,
            widget.remindText.text.bold.size(32.sp).make(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const TabNavigator());
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.blue),
                ),
                child: '返回工作台'
                    .text
                    .size(30.sp)
                    .color(Colors.white)
                    .make(),
              ),
            ).paddingAll(40.h),
          ],
        ),
      ),
    );
  }
}
