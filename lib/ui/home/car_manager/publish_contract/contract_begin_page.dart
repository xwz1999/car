import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/choose_customer_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_contract/contract_purchase_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class ContractBeginPage extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;

  const ContractBeginPage({super.key, required this.consignmentContractModel});

  @override
  State<ContractBeginPage> createState() => _ContractBeginPageState();
}

class _ContractBeginPageState extends State<ContractBeginPage> {
  // ///寄卖合同model
  // final ValueNotifier<ConsignmentContractModel> consignmentContractModel = ValueNotifier(
  //     ConsignmentContractModel(masterInfo: MasterInfo()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('寄卖合同',
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
              child: '寄卖客户'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              padding: EdgeInsets.all(30.w),
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ChooseCustomerPage(
                        callback: (CustomerListModel model) {
                          widget.consignmentContractModel.value.customerName =
                              model.nickname;
                          widget.consignmentContractModel.value.customerId =
                              model.id;
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
                            .color(Colors.black.withOpacity(0.45))
                            .make(),
                      ),
                      (widget.consignmentContractModel.value.customerName!
                                  .isEmpty
                              ? '请选择卖车客户'
                              : widget
                                  .consignmentContractModel.value.customerName!)
                          .text
                          .size(32.sp)
                          .color(Colors.black.withOpacity(widget
                                  .consignmentContractModel
                                  .value
                                  .customerName!
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
                  if (widget.consignmentContractModel.value.customerId ==
                      null) {
                    CloudToast.show('请先选择客户');
                  } else {
                    Get.to(() => ContractPurchase(
                          consignmentContractModel:
                              widget.consignmentContractModel,
                        ));
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
