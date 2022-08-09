import 'dart:io';

import 'package:cloud_car/model/car/business_push_model.dart';
import 'package:cloud_car/model/car/car_photo_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_source_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class CarReportPage extends StatefulWidget {
  final int? orderId;

  final ValueNotifier<BusinessPushModel> businessPushModel;

  final ValueNotifier<CarPhotoModel> carPhotoModel;

  final ConsignmentContractModel consignmentContractModel;

  const CarReportPage(
      {super.key,
      this.orderId,
      required this.businessPushModel,
      required this.carPhotoModel,
      required this.consignmentContractModel});

  @override
  State<CarReportPage> createState() => _CarReportPageState();
}

class _CarReportPageState extends State<CarReportPage> {
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
              child: '车辆报告'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      '*'
                          .text
                          .size(30.sp)
                          .color(Colors.red)
                          .make()
                          .paddingOnly(top: 5),
                      10.wb,
                      '漆面数据'
                          .text
                          .size(30.sp)
                          .color(Colors.black.withOpacity(0.45))
                          .make(),
                      '(请上传JPG或PDF格式)'
                          .text
                          .size(24.sp)
                          .color(Colors.black.withOpacity(0.45))
                          .make(),
                    ],
                  ),
                  20.hb,
                  MultiImagePickWidget(
                      width: 216.w,
                      height: 160.w,
                      spacing: 15.w,
                      maxCount: 6,
                      photos: widget.carPhotoModel.value.report.paintsFile!,
                      onChanged: (files) {
                        widget.carPhotoModel.value.report.paintsFile =
                            files.cast<File>();
                        // for (var item in files) {
                        //   widget.carPhotoModel.value.report.paintsFile!
                        //       .add(item);
                        // }
                        setState(() {});
                        //_files = files;
                        // print(
                        //     "aaaa+${widget.carPhotoModel.value.report.paintsFile}");
                      }),
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (widget.carPhotoModel.value.report.paintsFile != null) {
                    widget.carPhotoModel.value.report.paints!.clear();
                    for (var i = 0;
                        i <
                            widget
                                .carPhotoModel.value.report.paintsFile!.length;
                        i++) {
                      if (widget.carPhotoModel.value.report.paintsFile!
                              .runtimeType !=
                          String) {
                        var url = await apiClient.uploadImage(
                            widget.carPhotoModel.value.report.paintsFile![i]);
                        widget.carPhotoModel.value.report.paints!.add(url);
                      }
                    }
                    if(widget.carPhotoModel.value.report.paints!.isNotEmpty){
                      Get.to(() => CarSourcePage(
                        consignmentContractModel:
                        widget.consignmentContractModel,
                        carPhotoModel: widget.carPhotoModel,
                        businessPushModel: widget.businessPushModel,
                        orderId: widget.orderId,
                      ));
                    }else {
                      CloudToast.show('请先上传漆面数据');
                    }

                  } else {
                    CloudToast.show('请先上传漆面数据');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingAll(30.h),
          ],
        ),
      ),
    );
  }
}
