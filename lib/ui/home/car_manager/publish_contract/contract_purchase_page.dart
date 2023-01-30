import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_manager/publish_contract/contract_license_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constants/enums.dart';
import '../../../../widget/button/cloud_back_button.dart';
import '../../../../widget/picker/cloud_list_picker_widget.dart';

class ContractPurchase extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;

  const ContractPurchase({super.key, required this.consignmentContractModel});

  @override
  State<ContractPurchase> createState() => _ContractPurchaseState();
}

class _ContractPurchaseState extends State<ContractPurchase> {
  TextEditingController textEditingController = TextEditingController();
  final TextEditingController _carNumController = TextEditingController();

  List<String> get carNatureOfUseList =>
      CarNatureOfUse.values.map((e) => e.typeStr).toList();

  @override
  void initState() {
    textEditingController.text =
        (double.parse(widget.consignmentContractModel.value.evaluationPrice!) *
                1.05 /
                10000)
            .toStringAsFixed(2);

    widget.consignmentContractModel.value.sellPrice =
        (double.parse(widget.consignmentContractModel.value.evaluationPrice!) *
                1.05)
            .toString();
    super.initState();
  }

  @override
  void dispose() {
    _carNumController.dispose();
    super.dispose();
  }

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
                  child:
                      '采购信息'.text.size(32.sp).bold.color(Colors.black).make(),
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
                      if (widget
                          .consignmentContractModel.value.sellPrice!.isEmpty) {
                        CloudToast.show('请先输入售价');
                      } else if (widget.consignmentContractModel.value
                          .publishCarInfo!.carNum!.isEmpty) {
                        CloudToast.show('请先输入车牌信息');
                      } else if (widget
                              .consignmentContractModel.value.useCharacter ==
                          null) {
                        CloudToast.show('请先输入使用性质');
                      } else {
                        // Get.to(() =>  ContractOwnerPage(consignmentContractModel: widget.consignmentContractModel,));
                        Get.to(() => ContractLicencePage(
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
                ).paddingOnly(left: 30.w, right: 30.w, bottom: 30.h),
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
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(color: const Color(0xFFF6F6F6), width: 2.w))),
      child: Row(
        children: [
          '*'
              .text
              .size(32.sp)
              .normal
              .textStyle(const TextStyle(decoration: TextDecoration.none))
              .color(Colors.red)
              .make()
              .paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 180.w,
            child: title.text
                .size(32.sp)
                .normal
                .textStyle(const TextStyle(decoration: TextDecoration.none))
                .color(const Color(0xFF999999))
                .make(),
          ),
          Expanded(
            child: (content ?? '')
                .text
                .size(30.sp)
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
        _showarea(
            '车架号',
            widget.consignmentContractModel.value.publishCarInfo!.viNum,
            fontColor),
        _showarea(
            '品牌车型',
            widget.consignmentContractModel.value.publishCarInfo!.carName,
            fontColor),
        _showarea(
            '所在地区',
            widget.consignmentContractModel.value.publishCarInfo!.locationCity,
            fontColor),
        _showarea(
            '首次上牌',
            widget.consignmentContractModel.value.publishCarInfo!
                .licensingDateStr,
            fontColor),
        // _showarea('车牌号',  widget.consignmentContractModel.value.publishCarInfo!.carNum, fontColor),
        _showarea(
            '发动机号',
            widget.consignmentContractModel.value.publishCarInfo!.engineNum,
            fontColor),
        _showarea(
            '车身颜色',
            widget.consignmentContractModel.value.publishCarInfo!.carColor,
            fontColor),
        Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.w),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  bottom:
                      BorderSide(color: const Color(0xFFF6F6F6), width: 2.w))),
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
                width: 180.w,
                child: '表显里程'
                    .text
                    .size(32.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: ((num.parse(widget.consignmentContractModel.value
                                    .publishCarInfo!.mileage!) /
                                10000)
                            .toString() ??
                        '')
                    .text
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
            title: '车牌号',
            tips: '请输入车牌号',
            titleColor: Colors.black.withOpacity(0.45),
            controller: _carNumController,
            topIcon: true,
            paddingStart: 0.5,
            callback: (text) {
              widget.consignmentContractModel.value.publishCarInfo!.carNum =
                  text;
            }),
        _function(
          '使用性质',
          () async {
            await showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.w))),
              builder: (context) {
                return CloudListPickerWidget(
                    title: '使用性质',
                    items: carNatureOfUseList,
                    initIndex:
                        widget.consignmentContractModel.value.useCharacter,
                    onConfirm: (str, index) {
                      widget.consignmentContractModel.value.useCharacter =
                          index;

                      Get.back();
                      setState(() {});
                    });
              },
            );
          },

          CarNatureOfUse.getValue(
                  widget.consignmentContractModel.value.useCharacter ?? 0)
              .typeStr,
          // widget.consignmentContractModel.value.publishCarInfo!.carNatureOfUseEM
          //     .typeStr,
          '请选择',
        ),

        EditItemWidget(
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
          ],
          titleWidth: 180.w,
          titleColor: const Color(0xFF999999),
          title: '出售标价',
          endText: '万元',
          controller: textEditingController,
          //value: widget.consignmentContractModel.value.sellPrice.isEmptyOrNull?'':  (double.parse(widget.consignmentContractModel.value.sellPrice!)/10000 ).toString(),
          callback: (String content) {
            widget.consignmentContractModel.value.sellPrice =
                (double.parse(content) * 10000).toString();
          },
        ),

        Container(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  bottom:
                      BorderSide(color: const Color(0xFFF6F6F6), width: 2.w))),
          child: Row(
            children: [
              23.wb,
              SizedBox(
                width: 180.w,
                child: '采购人'
                    .text
                    .size(30.sp)
                    .normal
                    .textStyle(const TextStyle(decoration: TextDecoration.none))
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: UserTool.userProvider.userInfo.nickname.text
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
                width: 180.w,
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

  _function(String title, VoidCallback onTap, String? content, String msg,
      {double? titleWidth}) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: EditItemWidget(
          titleColor: const Color(0xFF999999),
          title: title,
          titleWidth: titleWidth,
          tips: msg,
          value: content ?? '',
          topIcon: true,
          paddingStart: 20,
          canChange: false,
          callback: (String content) {},
          endIcon: Image.asset(
            Assets.icons.icGoto.path,
            width: 32.w,
            height: 32.w,
          ),
        ),
      ),
    );
  }
}
