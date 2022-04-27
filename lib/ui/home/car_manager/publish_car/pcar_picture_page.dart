import 'package:cloud_car/ui/home/car_manager/publish_car/add_picture_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_info_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_finish_page.dart';
import 'package:cloud_car/ui/home/car_manager/push_car_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../base/base_style.dart';
import '../../../../widget/button/cloud_back_button.dart';

class CarPicturePage extends StatefulWidget {
  final PublishCarInfo  publishCarInfo;
  const CarPicturePage({Key? key, required this.publishCarInfo}) : super(key: key);

  @override
  State<CarPicturePage> createState() => _CarPicturePageState();
}

class _CarPicturePageState extends State<CarPicturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('发布车辆',
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
        child: Wrap(
          spacing: 30.w,
          runSpacing: 30.w,
          alignment: WrapAlignment.start,
          children: [
            _addCarPicture('车辆照片',0),
            _addCarPicture('内饰照片',1),
            _addCarPicture('缺陷照片',2),
            _addCarPicture('资料照片',3),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => PublishCarInfoPage(publishCarInfo: widget.publishCarInfo,));
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
            ),
          ],
        ).paddingAll(30.w),
      ),
    );
  }

  _addCarPicture(
    String bottom,
      int page,
  ) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>  AddPicturePage(pageNum: page,));
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              width: 210.w,
              height: 158.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Assets.images.addcar,
                ),
              ),
            ),
            10.hb,
            bottom.text.size(30.sp).bold.make(),
          ],
        ),
      ),
    );
  }
}
