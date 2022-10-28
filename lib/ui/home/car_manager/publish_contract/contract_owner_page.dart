import 'dart:io';

import 'package:cloud_car/model/car/bank_card_info_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/car/id_card_info_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/single_image_pick_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';
import 'contract_license_page.dart';

class ContractOwnerPage extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;

  const ContractOwnerPage({super.key, required this.consignmentContractModel});

  @override
  State<ContractOwnerPage> createState() => _ContractOwnerPageState();
}

class _ContractOwnerPageState extends State<ContractOwnerPage> {
  // bool _chooseOwner = true;

  final TextEditingController ownerIdController = TextEditingController();

  final TextEditingController bankNumController = TextEditingController();

  @override
  void dispose() {

    ownerIdController.dispose();

    bankNumController.dispose();

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
                  padding: EdgeInsets.only(
                      top: 30.h, left: 30.w, right: 30.w, bottom: 15.h),
                  child:
                      '车主信息'.text.size(32.sp).bold.color(Colors.black).make(),
                ),
                ColoredBox(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              left: 30.w, right: 30.w, bottom: 30.w,),
                          child:
                              personInfo() //_chooseOwner ? personInfo() : companyInfo(),
                          )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if( widget.consignmentContractModel.value.masterInfo.name==null||
                widget.consignmentContractModel.value.masterInfo.idCard==null||
                widget.consignmentContractModel.value.masterInfo.phone==null||
                widget.consignmentContractModel.value.masterInfo.bank==null||
                widget.consignmentContractModel.value.masterInfo.bankCard==null||
                widget.consignmentContractModel.value.idFront==null||
                widget.consignmentContractModel.value.idBack==null||
            widget.consignmentContractModel.value.bust==null
            ){

              CloudToast.show('请先完善车主信息');

            }else{
              Get.to(() =>  ContractLicencePage(consignmentContractModel: widget.consignmentContractModel,));
            }


          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: '下一步'.text.size(30.sp).color(Colors.white).make(),
        ),
      ).paddingAll(20.w),
    );
  }

  Widget personInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditItemWidget(
          title: '车主姓名',
          value: widget.consignmentContractModel.value.masterInfo.name ?? "",
          callback: (String content) {
            widget.consignmentContractModel.value.masterInfo.name = content;
          },
        ),
        EditItemWidget(
          title: '身份证号',
          controller: ownerIdController,
          callback: (String content) {
            widget.consignmentContractModel.value.masterInfo.idCard = content;
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(18)
          ],
          endIcon: GestureDetector(
            onTap: ()async{
              File? file= await CloudImagePicker.pickSingleImage(title: '选择图片');
              if (file != null) {
                setState(() {});
                var cancel = CloudToast.loading;
                String urls = await apiClient.uploadImage(file);
                IdCardInfoModel? carInfoModel = await CarFunc.idCardOCR(urls);
                if (carInfoModel != null) {
                  widget.consignmentContractModel.value.masterInfo.idCard = carInfoModel.number;
                  ownerIdController.text =  carInfoModel.number;
                }
                cancel();
                setState(() {

                });
              }
            },
            child: Image.asset(
              Assets.icons.scan.path,
              width: 32.w,
              height: 32.w,
            ),
          ),
        ),
        EditItemWidget(
          title: '手机号码',
          value: widget.consignmentContractModel.value.masterInfo.phone ?? "",
          inputFormatters: [
            LengthLimitingTextInputFormatter(11)
          ],
          callback: (String content) {
            widget.consignmentContractModel.value.masterInfo.phone = content;
          },
        ),
        EditItemWidget(
          title: '银行卡号',
          controller: bankNumController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(19)
          ],
          callback: (String content) {
            widget.consignmentContractModel.value.masterInfo.bankCard =
                content;
          },
          endIcon: GestureDetector(
            onTap: ()async{
              File? file= await CloudImagePicker.pickSingleImage(title: '选择图片');
              if (file != null) {
                setState(() {});
                var cancel = CloudToast.loading;
                String urls = await apiClient.uploadImage(file);
                BankCardInfoModel? bankCardInfoModel = await CarFunc.bankCardOCR(urls);
                if (bankCardInfoModel != null) {
                  widget.consignmentContractModel.value.masterInfo.bankCard = bankCardInfoModel.bankCardNo;

                  bankNumController.text = bankCardInfoModel.bankCardNo;

                  widget.consignmentContractModel.value.masterInfo.bank = bankCardInfoModel.bankName;

                }
                cancel();
                setState(() {

                });
              }
            },
            child: Image.asset(
              Assets.icons.scan.path,
              width: 32.w,
              height: 32.w,
            ),
          ),
        ),
        EditItemWidget(
          title: '开户行',
          value: widget.consignmentContractModel.value.masterInfo.bank ?? "",
          callback: (String content) {
            widget.consignmentContractModel.value.masterInfo.bank = content;
          },
        ),
        30.hb,
        _takePhoto(
          '身份证照',
          Row(
            children: [
              SingleImagePickWidget(
                width: 216.w,
                height: 160.w,
                onChanged: (files) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  widget.consignmentContractModel.value.idFront = files;
                  setState(() {

                  });
                },
                imageView: Image.asset(
                  Assets.images.carPersonHead.path,
                  fit: BoxFit.fill,
                ),
                files: widget.consignmentContractModel.value.idFront,
              ),
              20.wb,
              SingleImagePickWidget(
                width: 216.w,
                height: 160.w,
                onChanged: (files) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  widget.consignmentContractModel.value.idBack = files;
                  setState(() {

                  });
                },
                imageView: Image.asset(
                  Assets.images.carPersonBack.path,
                  fit: BoxFit.fill,
                ),
                files: widget.consignmentContractModel.value.idBack,
              ),
            ],
          ),
        ),
        // 30.hb,
        // _takePhoto(
        //   '半身照',
        //   Row(
        //     children: [
        //       SingleImagePickWidget(
        //         width: 216.w,
        //         height: 160.w,
        //         onChanged: (files) {
        //           FocusManager.instance.primaryFocus?.unfocus();
        //           widget.consignmentContractModel.value.bust = files;
        //           setState(() {
        //
        //           });
        //         },
        //         imageView: Image.asset(
        //           Assets.images.carPersonPhoto.path,
        //           fit: BoxFit.fill,
        //         ),
        //         files: widget.consignmentContractModel.value.bust,
        //       ),
        //     ],
        //   ),
        // ),

      ],
    );
  }



  _takePhoto(
    String title,
    Widget content,
  ) {
    return ColoredBox(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
              10.wb,
              SizedBox(
                width: 160.w,
                child: title.text
                    .size(30.sp)
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
            ],
          ),
          15.heightBox,
          content,
        ],
      ),
    );
  }
}
