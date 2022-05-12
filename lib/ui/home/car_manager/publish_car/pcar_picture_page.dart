import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/car/inner_model/car_manage_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_info_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/car_manage_photos/car_manage_photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class CarPicturePage extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;

  const CarPicturePage({Key? key, required this.consignmentContractModel})
      : super(key: key);

  @override
  State<CarPicturePage> createState() => _CarPicturePageState();
}

class _CarPicturePageState extends State<CarPicturePage> {
  final CarManagePhotoModel _photos = const CarManagePhotoModel(
      carPhotos: [], interiorPhotos: [], defectPhotos: [], dataPhotos: []);

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
            Expanded(child: CarManagePhotoWidget(model: _photos)),
            30.hb,
            CloudBottomButton(
              onTap: () {
                Get.to(
                  () => PublishCarInfoPage(
                      consignmentContractModel:  widget.consignmentContractModel
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
