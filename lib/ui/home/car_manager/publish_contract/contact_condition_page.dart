import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class ContactCondition extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;
  const ContactCondition({super.key, required this.consignmentContractModel});

  @override
  State<ContactCondition> createState() => _ContactConditionState();
}

class _ContactConditionState extends State<ContactCondition> {
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
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(30.w),
              child: '车况描述'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 34.w,bottom: 40.w),
              child: Column(
                children: [
                  EditItemWidget(
                    titleWidth: 120.w,
                    title: '外观',
                    value:  widget.consignmentContractModel.value.exterior??'',
                    callback: (String content) {
                      widget.consignmentContractModel.value.exterior = content ;
                    },
                  ),
                  EditItemWidget(
                    titleWidth: 120.w,
                    title: '内饰',
                    value:  widget.consignmentContractModel.value.interiorTrim??'',
                    callback: (String content) {
                      widget.consignmentContractModel.value.interiorTrim = content ;
                    },
                  ),
                  EditItemWidget(
                    titleWidth: 120.w,
                    title: '工况',
                    value:  widget.consignmentContractModel.value.workingCondition??'',
                    callback: (String content) {
                      widget.consignmentContractModel.value.workingCondition = content ;
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.w),
              child: '服务费'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 34.w,bottom: 40.w),
              child: EditItemWidget(
                title: '服务费比列',
                keyboardType:TextInputType.number ,
                value: widget.consignmentContractModel.value.serviceFeeRate==null?'':  (num.parse(widget.consignmentContractModel.value.serviceFeeRate ??'0')*100 ).toString() ,
                callback: (String content) {
                  widget.consignmentContractModel.value.serviceFeeRate = (num.parse(content)/100).toString() ;
                },
                endText: '%',
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()async {
                  if(widget.consignmentContractModel.value.exterior==null||widget.consignmentContractModel.value.interiorTrim==null||
                  widget.consignmentContractModel.value.workingCondition==null||widget.consignmentContractModel.value.serviceFeeRate==null
                  ){
                    CloudToast.show('请先完善合同信息');
                  }else{



                    var cancel = CloudToast.loading;
                    widget.consignmentContractModel.value.masterInfo.idCardBack =
                    await apiClient.uploadImage(widget.consignmentContractModel.value.idBack!.first);

                    widget.consignmentContractModel.value.masterInfo.idCardFront =
                    await apiClient.uploadImage(widget.consignmentContractModel.value.idFront!.first);

                    widget.consignmentContractModel.value.masterInfo.photo =
                    await apiClient.uploadImage(widget.consignmentContractModel.value.bust!.first);


                    bool success = await CarFunc.addConsignment(widget.consignmentContractModel.value);
                    cancel();

                    if(success){
                      CloudToast.show('合同发布成功');
                      Get.close(5);///关闭估价和发布合同的所有页面 跳转到寄卖订单列表

                    }else{
                      CloudToast.show('合同发布失败');
                    }
                  }


                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '发起合同'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingOnly(left: 30.w, right: 30.w),
          ],
        ),
      ),
    );
  }

  // _showDescription(
  //   String title,
  //   TextEditingController contentController,
  // ) {
  //   return Container(
  //     padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
  //     color: Colors.transparent,
  //     child: Row(
  //       children: [
  //         '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
  //         10.wb,
  //         SizedBox(
  //           width: 160.w,
  //           child: title.text
  //               .size(28.sp)
  //               .normal
  //               .textStyle(const TextStyle(decoration: TextDecoration.none))
  //               .color(Colors.black.withOpacity(0.45))
  //               .make(),
  //         ),
  //         Expanded(
  //           child: TextField(
  //             textAlign: TextAlign.start,
  //             onChanged: (text) => setState(() {}),
  //             autofocus: false,
  //             controller: contentController,
  //             decoration: InputDecoration(
  //                 contentPadding: EdgeInsets.zero,
  //                 isDense: true,
  //                 border: InputBorder.none,
  //                 hintText: '请输入',
  //                 hintStyle: TextStyle(
  //                   fontSize: 30.sp,
  //                   color: Colors.black.withOpacity(0.25),
  //                 )),
  //           ),
  //         ),
  //         24.wb,
  //       ],
  //     ),
  //   );
  // }
}
