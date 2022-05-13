import 'package:cloud_car/model/car/business_push_model.dart';
import 'package:cloud_car/model/car/car_photo_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/car/inner_model/car_manage_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_info_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/car_manage_photos/car_manage_photo_widget.dart';
import 'package:flutter/material.dart';

import '../../../../widget/button/cloud_back_button.dart';

class CarPicturePage extends StatefulWidget {
  ///是否是个人寄卖车辆
  final bool isPersonal;

  ///个人发布车辆只需一个orderId
  final int? orderId;

  ///个人和车商发布车辆都需要估价信息
  final ConsignmentContractModel consignmentContractModel;

  const CarPicturePage({
    Key? key,
    this.orderId,
    required this.consignmentContractModel,
    required this.isPersonal,
  }) : super(key: key);

  @override
  State<CarPicturePage> createState() => _CarPicturePageState();
}

class _CarPicturePageState extends State<CarPicturePage> {
  final ValueNotifier<BusinessPushModel> businessPushModel =
      ValueNotifier(BusinessPushModel.init);

  final ValueNotifier<CarPhotoModel> carPhotoModel =
      ValueNotifier(CarPhotoModel.init);

  @override
  void initState() {
    ///车商直卖的情况
    if (!widget.isPersonal) {
      businessPushModel.value.priceId = widget.consignmentContractModel.priceId;
    }

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
                child: CarManagePhotoWidget(model: carPhotoModel.value.photos)),
            30.hb,
            CloudBottomButton(
              onTap: () {
                if (carPhotoModel.value.photos.dataPhotos.isEmpty ||
                    carPhotoModel.value.photos.defectPhotos.isEmpty ||
                    carPhotoModel.value.photos.interiorPhotos.isEmpty||carPhotoModel.value.photos.carPhotos.isEmpty){
                  CloudToast.show('每种照片至少上传一张');
                }else{
                  Get.to(
                        () => PublishCarInfoPage(
                      businessPushModel: businessPushModel,
                      carPhotoModel: carPhotoModel,
                      consignmentContractModel: widget.consignmentContractModel,
                      orderId: widget.orderId,
                    ),
                  );
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
