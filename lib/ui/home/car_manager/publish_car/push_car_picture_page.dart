
import 'package:cloud_car/ui/home/car_manager/publish_car/new_push_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_manage_photo_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_manage_photo_widget.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

class PushCarPicturePage extends StatefulWidget {
  final NewPublishCarInfo newPublishCarInfo;
  final PushPhotoModel carPhotoModel;
  // final ReportPhotoModel reportPhotoModel;

  const PushCarPicturePage({
    super.key,
    required this.newPublishCarInfo,
    required this.carPhotoModel,
    // required this.reportPhotoModel,
  });

  @override
  State<PushCarPicturePage> createState() => _PushCarPicturePageState();
}

class _PushCarPicturePageState extends State<PushCarPicturePage> {
  // final List<String> _titles = ['车辆照片', '内饰照片', '缺陷照片','报告数据','维保数据'];
  // final List<String> _titles = ['车辆照片', '内饰照片', '缺陷照片', '车辆数据'];

  @override
  void initState() {
    super.initState();
  }

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
      body: Padding(
        padding: EdgeInsets.all(30.w),
        child: Column(
          children: [
            Expanded(
                child: PushCarManagePhotoWidget(
              model: widget.carPhotoModel,
              // reportPhotoModel: widget.reportPhotoModel,
              newPublishCarInfo: widget.newPublishCarInfo,
            )),
            30.hb,
            CloudBottomButton(
              onTap: () {

                // Get.to(
                //   PushCarManagePhotoPage(
                //     tabs: _titles,
                //     model: widget.carPhotoModel,
                //     initIndex: 0,
                //     // reportPhotoModel: widget.reportPhotoModel,
                //     newPublishCarInfo: widget.newPublishCarInfo,
                //   ),
                // );
                Get.to(
                  PushCarManagePhotoPage(
                    tabs:  const ['车辆照片', '内饰照片', '缺陷照片', '车辆数据'],
                    model: widget.carPhotoModel,
                    initIndex: 0,
                    // reportPhotoModel: widget.reportPhotoModel,
                    newPublishCarInfo: widget.newPublishCarInfo,
                  ),
                );
              },
              text: '下一步',
            )
          ],
        ),
      ),
    );
  }
}
