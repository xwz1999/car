import 'package:cloud_car/model/car/business_push_model.dart';
import 'package:cloud_car/model/car/car_photo_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';
import '../direct_sale/edit_item_widget.dart';
import 'publish_finish_page.dart';

class CarPricePage extends StatefulWidget {
  final int? orderId;

  final ValueNotifier<BusinessPushModel> businessPushModel;

  final ValueNotifier<CarPhotoModel> carPhotoModel;

  final ConsignmentContractModel consignmentContractModel;

  const CarPricePage({Key? key,
    this.orderId,
    required this.businessPushModel,
    required this.carPhotoModel,
    required this.consignmentContractModel})
      : super(key: key);

  @override
  State<CarPricePage> createState() => _CarPricePageState();
}

class _CarPricePageState extends State<CarPricePage> {

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
              child: '价格信息'.text
                  .size(32.sp)
                  .bold
                  .color(Colors.black)
                  .make(),
            ),
            Container(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 40.h),
              color: Colors.white,
              child: Column(
                children: [
                  EditItemWidget(
                    topIcon: true,
                    title: '展示价格',
                    value: widget.businessPushModel.value.other.price == null
                        ? ''
                        : (widget.businessPushModel.value.other.price! / 10000)
                        .toString(),
                    canChange: true,
                    callback: (String content) {
                      widget.businessPushModel.value.other.price =
                      (num.parse(content) * 10000);
                    },
                    endText: '万元',
                  ),
                  EditItemWidget(
                    topIcon: true,
                    title: '系统估价',
                    value: (num.parse(
                        widget.consignmentContractModel.evaluationPrice!) /
                        10000).toString(),
                    canChange: false,
                    callback: (String content) {

                    },
                    endText: '万元',
                  ),
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  var cancel = CloudToast.loading;

                  if (widget.orderId == null) {
                    //车商
                    var success = await CarFunc.dealerPushCar(
                        businessPushModel: widget.businessPushModel.value,
                        carPhotoModel: widget.carPhotoModel.value);
                    cancel();
                    if(success){
                      Get.to(() => const PublishFinishPage());
                    }else{
                      CloudToast.show('车辆发布失败');
                    }
                  }else{
                    cancel();
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
