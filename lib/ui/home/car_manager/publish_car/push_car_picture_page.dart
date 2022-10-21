import 'package:cloud_car/model/car/car_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/new_push_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_manage_photo_widget.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_report_photo_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/report_photo_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/car_manage_photos/car_manage_photo_widget.dart';
import 'package:flutter/material.dart';


class PushCarPicturePage extends StatefulWidget {
  final NewPublishCarInfo newPublishCarInfo;
  final PushPhotoModel carPhotoModel;
  final ReportPhotoModel reportPhotoModel;
  const PushCarPicturePage({
  super.key, required this.newPublishCarInfo, required this.carPhotoModel, required this.reportPhotoModel,
  });

  @override
  State<PushCarPicturePage> createState() => _PushCarPicturePageState();
}

class _PushCarPicturePageState extends State<PushCarPicturePage> {

  // final ValueNotifier<PushPhotoModel> carPhotoModel =
  // ValueNotifier(PushPhotoModel.init);
  //
  // final ValueNotifier<ReportPhotoModel> reportPhotoModel =
  // ValueNotifier(ReportPhotoModel.init);
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
                child: PushCarManagePhotoWidget(model: widget.carPhotoModel)),
            30.hb,
            CloudBottomButton(
              onTap: () {

                int carPhotosLength = 0;
                int interiorPhotosLength = 0;
                int defectPhotosLength = 0;

                for(int i=0;i<widget.carPhotoModel.carPhotos!.length;i++){
                  if(widget.carPhotoModel.carPhotos![i].photo!=null){
                    carPhotosLength++;
                  }
                }
                for(int i=0;i<widget.carPhotoModel.interiorPhotos!.length;i++){
                  if(widget.carPhotoModel.interiorPhotos![i].photo!=null){
                    interiorPhotosLength++;
                  }
                }
                for(int i=0;i<widget.carPhotoModel.defectPhotos!.length;i++){
                  if(widget.carPhotoModel.defectPhotos![i].photo!=null){
                    defectPhotosLength++;
                  }
                }


                if (carPhotosLength<=0||interiorPhotosLength<=0||defectPhotosLength<=0){
                  CloudToast.show('每种照片至少上传一张');
                }else{
                  Get.to(()=> PushReportPhotoPage(pushPhotoModel: widget.carPhotoModel,
                    newPublishCarInfo: widget.newPublishCarInfo,reportPhotoModel: widget.reportPhotoModel,));
                }

              },
              text: '下一步',
            )
          ],
        ),
      ),
    );
  }
}
