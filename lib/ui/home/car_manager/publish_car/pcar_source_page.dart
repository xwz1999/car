import 'package:cloud_car/model/car/business_push_model.dart';
import 'package:cloud_car/model/car/car_photo_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_license_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_owner_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class CarSourcePage extends StatefulWidget {
  final int? orderId;

  final ValueNotifier<BusinessPushModel> businessPushModel;

  final ValueNotifier<CarPhotoModel> carPhotoModel;

  final ConsignmentContractModel consignmentContractModel;

  const CarSourcePage(
      {Key? key,
      this.orderId,
      required this.businessPushModel,
      required this.carPhotoModel,
      required this.consignmentContractModel})
      : super(key: key);

  @override
  State<CarSourcePage> createState() => _CarSourcePageState();
}

class _CarSourcePageState extends State<CarSourcePage> {
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
              child: '来源信息'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 40.h),
              color: Colors.white,
              child: Column(
                children: [
                  EditItemWidget(
                    topIcon: true,
                    title: '车辆来源',
                    value: widget.orderId == null ? '车商' : '个人直卖',
                    canChange: false,
                    callback: (String content) {},
                  ),
                  EditItemWidget(
                    topIcon: true,
                    title: '上架人',
                    value: UserTool.userProvider.userInfo.nickname,
                    canChange: false,
                    callback: (String content) {},
                  ),
                  EditItemWidget(
                    topIcon: true,
                    title: '门店',
                    value: '云云问车',
                    canChange: false,
                    callback: (String content) {},
                  ),
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ///个人直卖到这里直接提交

                  ///车商还需填写信息
                  Get.to(() => CarLicensePage(
                        carPhotoModel: widget.carPhotoModel,
                        consignmentContractModel:
                            widget.consignmentContractModel,
                        businessPushModel: widget.businessPushModel,
                        orderId: widget.orderId,
                      ));
                  //Get.to(() => const CarOwnerPage());
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
