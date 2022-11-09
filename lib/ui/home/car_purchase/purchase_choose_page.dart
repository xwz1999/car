import 'package:cloud_car/model/contract/purchase_photo_model.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/choose_customer_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_info_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_push_car_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class PurchaseChoosePage extends StatefulWidget {
  final PurchaseCarInfo purchaseCarInfo;
  final PurchaseInfo purchaseInfo;
  final PurchasePhotoModel reportPhotoModel;
  const PurchaseChoosePage({super.key, required this.purchaseCarInfo, required this.purchaseInfo, required this.reportPhotoModel,});

  @override
  State<PurchaseChoosePage> createState() => _PurchaseChoosePageState();
}

class _PurchaseChoosePageState extends State<PurchaseChoosePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('收购合同',
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
              child: '收购客户'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              padding: EdgeInsets.all(30.w),
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ChooseCustomerPage(
                    callback: (CustomerListModel model) {
                      widget.purchaseCarInfo.customerId = model.id;
                      widget.purchaseCarInfo.customer = model.nickname;
                      setState(() {});
                    },
                  ));
                },
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      '*'
                          .text
                          .size(30.sp)
                          .color(Colors.red)
                          .make()
                          .paddingOnly(top: 5),
                      10.wb,
                      SizedBox(
                        width: 160.w,
                        child: '选择客户'
                            .text
                            .size(32.sp)
                            .color(const Color(0xFF999999))
                            .make(),
                      ),
                      (widget.purchaseCarInfo.customer!
                                  .isEmpty
                              ? '请选择卖车客户'
                              : widget.purchaseCarInfo.customer!)
                          .text
                          .size(30.sp)
                          .color(Colors.black.withOpacity(widget.purchaseCarInfo.customer!
                                  .isEmpty
                              ? 0.25
                              : 0.85))
                          .make(),
                      const Spacer(),
                      Icon(
                        CupertinoIcons.chevron_right,
                        color: Colors.black.withOpacity(0.45),
                        size: 28.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  if (widget.purchaseCarInfo.customerId ==
                      null) {
                    CloudToast.show('请先选择客户');
                  } else {
                    Get.to(()=>PurchaseInfoPage(purchaseCarInfo: widget.purchaseCarInfo, purchaseInfo: widget.purchaseInfo, reportPhotoModel: widget.reportPhotoModel,));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingAll(30.w),
          ],
        ),
      ),
    );
  }
}
