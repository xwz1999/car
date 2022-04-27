import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../base/base_style.dart';
import '../../../../widget/button/cloud_back_button.dart';
import '../direct_sale/edit_item_widget.dart';
import '../publish_finish_page.dart';

class CarPricePage extends StatefulWidget {
  const CarPricePage({Key? key}) : super(key: key);

  @override
  State<CarPricePage> createState() => _CarPricePageState();
}

class _CarPricePageState extends State<CarPricePage> {
  TextEditingController showPriceController =TextEditingController();
  TextEditingController evaPriceController =TextEditingController();
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
              child: '价格信息'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 40.h),
              color: Colors.white,
              child: Column(
                children: [
                  EditItemWidget(
                    topIcon: true,
                    title: '展示价格',
                    value: showPriceController.text,
                    canChange: true,
                    callback: (String content) {},
                    endText: '万元',
                  ),
                  EditItemWidget(
                    topIcon: true,
                    title: '系统估价',
                    value: evaPriceController.text,
                    canChange: true,
                    callback: (String content) {},
                    endText: '万元',
                  ),
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const PublishFinishPage());
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'
                    .text
                    .size(30.sp)
                    .color(Colors.white)
                    .make(),
              ),
            ).paddingAll(30.h),
          ],
        ),
      ),
    );
  }
}
