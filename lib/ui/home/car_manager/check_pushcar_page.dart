import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_picture_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_contract/contract_begin_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/publish_car_info_widget.dart';

class CheckPushPage extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;

  // final PublishCarInfo publishCarInfo;

  const CheckPushPage({
    super.key,
    required this.consignmentContractModel,
  });

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
                height: 320.h,
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
                    padding: EdgeInsets.only(left: 62.w,top: 50.w),
                    width: double.infinity,
                    height: 140.h,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
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
                              (num.parse(widget.consignmentContractModel.value
                                          .evaluationPrice!)*1.05 /
                                      10000)
                                  .toStringAsFixed(2),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             Text(
                              '预计到手价：',
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 20.sp,
                              ),
                            ).paddingOnly(top: 0.w),

                            Text(
                              (num.parse(widget.consignmentContractModel.value
                                  .evaluationPrice!) /
                                  10000)
                                  .toString(),
                              style:  TextStyle(
                                fontSize:20.sp,
                                color: const Color(0xFF333333),
                              ),
                            ),

                            '万'.text.color(const Color(0xFF333333),).size(20.sp).make(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 310.h),
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
                        publishCarInfo: widget
                            .consignmentContractModel.value.publishCarInfo!,
                      ),
                      30.heightBox,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (UserTool.userProvider.userInfo.businessId ==
                                1) {
                              ///车商发布车辆
                              Get.to(() => CarPicturePage(
                                    consignmentContractModel:
                                        widget.consignmentContractModel.value,
                                    isPersonal: false,
                                  ));
                            } else {
                              ///个人发布车辆先填合同  合同确认后再进行发布操作
                              Get.to(() => ContractBeginPage(
                                    consignmentContractModel:
                                        widget.consignmentContractModel,
                                  ));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: Text(
                            UserTool.userProvider.userInfo.businessAscription!=BusinessAscription.yywc
                                ? '发起合同'
                                : '发布车辆',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                            ),
                          ),
                        ),
                      ),
                      // if (UserTool.userProvider.userInfo.businessId != 1)
                      //   RichText(
                      //     text: TextSpan(
                      //       text: '已签订合同？继续发布车辆',
                      //       style: TextStyle(
                      //         color: Colors.blueAccent,
                      //         fontSize: 20.sp,
                      //       ),
                      //       recognizer: TapGestureRecognizer()..onTap=(){
                      //          Get.to(()=>);
                      //       }
                      //     ),
                      //   )
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
