import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_manager/publish_contract/contract_owner_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class ContractPurchase extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;
  const ContractPurchase({super.key, required this.consignmentContractModel});

  @override
  State<ContractPurchase> createState() => _ContractPurchaseState();
}

class _ContractPurchaseState extends State<ContractPurchase> {


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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(30.w),
                  child: '采购信息'.text.size(32.sp).bold.color(Colors.black).make(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
                  color: Colors.white,
                  child: showPushCar(Colors.black.withOpacity(0.45)),
                ),
                30.heightBox,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(widget.consignmentContractModel.value.sellPrice!.isEmpty){
                        CloudToast.show('请先输入售价');
                      }else{
                        Get.to(() =>  ContractOwnerPage(consignmentContractModel: widget.consignmentContractModel,));
                      }

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: '下一步'.text.size(30.sp).color(Colors.white).make(),
                  ),
                ).paddingOnly(left: 30.w,right: 30.w,bottom: 30.h),
              ],
            ),
          ],
        ),

      ),
    );
  }

  _showarea(
    String title,
    String? content,
    Color fontColor,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      color: Colors.transparent,
      child: Row(
        children: [
          '*'
              .text
              .size(28.sp)
              .normal
              .textStyle(const TextStyle(decoration: TextDecoration.none))
              .color(Colors.red)
              .make()
              .paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 160.w,
            child: title.text
                .size(28.sp)
                .normal
                .textStyle(const TextStyle(decoration: TextDecoration.none))
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: (content??'').text
                .size(28.sp)
                .normal
                .textStyle(const TextStyle(decoration: TextDecoration.none))
                .color(fontColor)
                .make(),
          ),
          24.wb,
        ],
      ),
    );
  }

  Column showPushCar(Color fontColor) {
   // print(widget.consignmentContractModel.value.sellPrice);
    return Column(
      children: [
        _showarea('车架号', widget.consignmentContractModel.value.publishCarInfo!.viNum, fontColor),
        _showarea('品牌车型',  widget.consignmentContractModel.value.publishCarInfo!.carName, fontColor),
        _showarea('所在地区',  widget.consignmentContractModel.value.publishCarInfo!.locationCity, fontColor),
        _showarea('首次上牌',  widget.consignmentContractModel.value.publishCarInfo!.licensingDateStr, fontColor),
        // _showarea('车牌号',  widget.consignmentContractModel.value.publishCarInfo!.carNum, fontColor),
        _showarea('发动机号',  widget.consignmentContractModel.value.publishCarInfo!.engineNum, fontColor),
        _showarea('车身颜色',  widget.consignmentContractModel.value.publishCarInfo!.carColor, fontColor),
        Container(
          padding: EdgeInsets.only(top: 20.h),
          color: Colors.transparent,
          child: Row(
            children: [
              '*'
                  .text
                  .size(28.sp)
                  .color(Colors.red)
                  .normal
                  .textStyle(const TextStyle(decoration: TextDecoration.none))
                  .make()
                  .paddingOnly(top: 5),
              10.wb,
              SizedBox(
                width: 160.w,
                child: '表显里程'
                    .text
                    .size(28.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child:  (widget.consignmentContractModel.value.publishCarInfo!.mileage??'').text
                    .size(28.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(fontColor)
                    .make(),
              ),
              24.wb,
              '万公里'
                  .text
                  .size(28.sp)
                  .normal
                  .textStyle(const TextStyle(decoration: TextDecoration.none))
                  .color(Colors.black.withOpacity(0.8))
                  .make(),
            ],
          ),
        ),

        EditItemWidget(
          keyboardType: TextInputType.number ,
          titleWidth: 160.w,
          title: '出售标价',
          endText: '万元',
          value: widget.consignmentContractModel.value.sellPrice.isEmptyOrNull?'':  (double.parse(widget.consignmentContractModel.value.sellPrice!)/10000 ).toString(),
          callback: (String content) {
            widget.consignmentContractModel.value.sellPrice = (double.parse(content)*10000 ).toString() ;
          },
        ),
        20.hb,

        Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          color: Colors.transparent,
          child: Row(
            children: [
              23.wb,
              SizedBox(
                width: 160.w,
                child: '采购人'
                    .text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: UserTool.userProvider.userInfo.nickname
                    .text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black)
                    .make(),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          color: Colors.transparent,
          child: Row(
            children: [
              23.wb,
              SizedBox(
                width: 160.w,
                child: '门店'
                    .text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: '云云问车'
                    .text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black)
                    .make(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
