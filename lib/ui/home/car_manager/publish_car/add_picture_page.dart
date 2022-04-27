import 'package:cloud_car/utils/headers.dart';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

import '../../../../widget/picker/choose_car_picture.dart';

class AddPicturePage extends StatefulWidget {
  final int pageNum;
  const AddPicturePage({Key? key, required this.pageNum}) : super(key: key);

  @override
  State<AddPicturePage> createState() => _AddPicturePageState();
}

class _AddPicturePageState extends State<AddPicturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('车辆图片管理',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: '确定'.text.size(16).bold.color(Colors.blue).make()),
        ],
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
          children: [
            Divider(
              height: 1.h,
            ),
            ChooseCarPicWidget(
              callBack: (name) {
                setState(() {});
              },
              items: const [
                '车辆照片',
                '内饰照片',
                '缺陷照片',
                '资料照片',
              ],
              pageNum: widget.pageNum,
            ),
          ],
        ),
      ),
    );
  }
}
