import 'package:cloud_car/ui/home/car_manager/publish_contract/contract_owner_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class ContractPurchase extends StatefulWidget {
  const ContractPurchase({Key? key}) : super(key: key);

  @override
  State<ContractPurchase> createState() => _ContractPurchaseState();
}

class _ContractPurchaseState extends State<ContractPurchase> {
  String? carNum = 'LGJB3476524683243';
  String? carShape = '奥迪A3';
  String? carDate = '2020-03';
  String? licenseNum = '浙B236Y';
  String? engineNum = '647382';
  String? carColor = '蓝色';
  String? carRoute = '8.12';

  final TextEditingController _searchController = TextEditingController();

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
                  Get.to(() => const ContractOwnerPage());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingOnly(left: 30.w,right: 30.w),
          ],
        ),
      ),
    );
  }

  _showarea(
    String title,
    String content,
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
            child: content.text
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
    return Column(
      children: [
        _showarea('车架号', carNum!, fontColor),
        _showarea('品牌车型', carShape!, fontColor),
        _showarea('首次上牌', carDate!, fontColor),
        _showarea('车牌号', licenseNum!, fontColor),
        _showarea('发动机号', engineNum!, fontColor),
        _showarea('车身颜色', carColor!, fontColor),
        Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          color: Colors.transparent,
          child: Row(
            children: [
              '*'
                  .text
                  .size(30.sp)
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
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: carRoute!.text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(fontColor)
                    .make(),
              ),
              24.wb,
              '万公里'
                  .text
                  .size(30.sp)
                  .normal
                  .textStyle(const TextStyle(decoration: TextDecoration.none))
                  .color(Colors.black.withOpacity(0.8))
                  .make(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          color: Colors.transparent,
          child: Row(
            children: [
              '*'
                  .text
                  .size(30.sp)
                  .color(Colors.red)
                  .normal
                  .textStyle(const TextStyle(decoration: TextDecoration.none))
                  .make()
                  .paddingOnly(top: 5),
              10.wb,
              SizedBox(
                width: 160.w,
                child: '出售标价'
                    .text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.start,
                  onChanged: (text) => setState(() {}),
                  autofocus: false,
                  controller: _searchController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: '请输入',
                      hintStyle: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.black.withOpacity(0.25),
                      )),
                ),
              ),
              24.wb,
              '万元'
                  .text
                  .size(30.sp)
                  .normal
                  .textStyle(const TextStyle(decoration: TextDecoration.none))
                  .color(Colors.black.withOpacity(0.8))
                  .make(),
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
                child: '采购人'
                    .text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: '张三'
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
