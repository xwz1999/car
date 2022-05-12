import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_picture_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_contract/contract_begin_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/publish_car_info_widget.dart';

class CheckPushPage extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;
  // final PublishCarInfo publishCarInfo;

  const CheckPushPage(
      {Key? key, required this.consignmentContractModel, })
      : super(key: key);

  @override
  State<CheckPushPage> createState() => _CheckPushPageState();
}

class _CheckPushPageState extends State<CheckPushPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 420.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/push_car_top.png'),
                  ),
                ),
                child: Scaffold(
                  appBar: AppBar(
                    leading: const CloudBackButton(
                      isSpecial: true,
                    ),
                    backgroundColor: Colors.transparent,
                    title: Text('车辆发布',
                        style: TextStyle(
                            color: BaseStyle.color111111,
                            fontSize: BaseStyle.fontSize36,
                            fontWeight: FontWeight.bold)),
                  ),
                  backgroundColor: Colors.transparent,
                  extendBody: true,
                  body: Container(
                    padding: EdgeInsets.only(left: 80.w),
                    width: double.infinity,
                    height: 140.h,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '系统估值',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ).paddingOnly(top: 10.w),
                        20.wb,
                        Text(
                          (num.parse(widget.consignmentContractModel.value.evaluationPrice!)  / 10000).toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.wb,
                        '万'.text.color(Colors.red).bold.size(41.sp).make(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 410.h),
                child: Container(
                  padding: EdgeInsets.all(30.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      PublishCarInfoWidget(
                        fontColor: Colors.black,
                        publishCarInfo: widget.consignmentContractModel.value.publishCarInfo!,
                      ),
                      30.heightBox,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if ( widget.consignmentContractModel.value.publishCarInfo!.carSource == 1) {
                              Get.to(() => CarPicturePage(
                                  consignmentContractModel:  widget.consignmentContractModel));
                            } else {
                              Get.to(() => ContractBeginPage(
                                consignmentContractModel:  widget.consignmentContractModel,
                                  ));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: Text(
                            widget.consignmentContractModel.value.publishCarInfo!.carSource == 2
                                ? '发起合同'
                                : '发布车辆',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                            ),
                          ),
                        ),
                      ),
                      widget.consignmentContractModel.value.publishCarInfo!.carSource == 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                '已签订合同？'
                                    .text
                                    .color(Colors.black.withOpacity(0.45))
                                    .textStyle(const TextStyle(
                                        decoration: TextDecoration.none))
                                    .normal
                                    .size(20.sp)
                                    .make(),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => CarPicturePage(
                                        consignmentContractModel:  widget.consignmentContractModel));
                                  },
                                  child: '继续发布车辆'
                                      .text
                                      .color(Colors.blue)
                                      .textStyle(const TextStyle(
                                          decoration: TextDecoration.none))
                                      .normal
                                      .size(20.sp)
                                      .make(),
                                ).paddingZero
                              ],
                            )
                          : 1.heightBox,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
