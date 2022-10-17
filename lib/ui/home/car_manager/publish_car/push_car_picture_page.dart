import 'package:cloud_car/model/car/car_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/new_push_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_manage_photo_widget.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_report_photo_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/car_manage_photos/car_manage_photo_widget.dart';
import 'package:flutter/material.dart';


class PushCarPicturePage extends StatefulWidget {
  final NewPublishCarInfo newPublishCarInfo;

  const PushCarPicturePage({
  super.key, required this.newPublishCarInfo,
  });

  @override
  State<PushCarPicturePage> createState() => _PushCarPicturePageState();
}

class _PushCarPicturePageState extends State<PushCarPicturePage> {

  final ValueNotifier<CarPhotoModel> carPhotoModel =
  ValueNotifier(CarPhotoModel.init);

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
                child: PushCarManagePhotoWidget(model: carPhotoModel.value.photos)),
            30.hb,
            CloudBottomButton(
              onTap: () {
                Get.to(()=>const PushReportPhotoPage());
                // if (carPhotoModel.value.photos.defectPhotos.isEmpty ||
                //     carPhotoModel.value.photos.interiorPhotos.isEmpty||carPhotoModel.value.photos.carPhotos.isEmpty){
                //   CloudToast.show('每种照片至少上传一张');
                // }else{
                //   // Get.to(
                //   //       () => PublishCarInfoPage(
                //   //     businessPushModel: businessPushModel,
                //   //     carPhotoModel: carPhotoModel,
                //   //     consignmentContractModel: widget.consignmentContractModel,
                //   //     orderId: widget.orderId,
                //   //   ),
                //   // );
                //   Get.to(()=>const PushReportPhotoPage());
                // }

              },
              text: '下一步',
            )
          ],
        ),
      ),
    );
  }
}
