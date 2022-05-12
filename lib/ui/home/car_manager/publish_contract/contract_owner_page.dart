import 'dart:io';

import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/single_image_pick_widget.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';
import 'contract_license_page.dart';

class ContractOwnerPage extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;

  const ContractOwnerPage({Key? key, required this.consignmentContractModel})
      : super(key: key);

  @override
  State<ContractOwnerPage> createState() => _ContractOwnerPageState();
}

class _ContractOwnerPageState extends State<ContractOwnerPage> {
  // bool _chooseOwner = true;

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
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       top: 20.h, bottom: 20.h, left: 30.w, right: 30.w),
                      //   color: Colors.transparent,
                      //   child: Row(
                      //     children: [
                      //       '*'
                      //           .text
                      //           .size(30.sp)
                      //           .color(Colors.red)
                      //           .normal
                      //           .textStyle(const TextStyle(
                      //           decoration: TextDecoration.none))
                      //           .make()
                      //           .paddingOnly(top: 5),
                      //       10.wb,
                      //       SizedBox(
                      //         width: 160.w,
                      //         child: '车主类别'
                      //             .text
                      //             .size(30.sp)
                      //             .normal
                      //             .textStyle(const TextStyle(
                      //             decoration: TextDecoration.none))
                      //             .color(Colors.black.withOpacity(0.45))
                      //             .make(),
                      //       ),
                      //       Expanded(
                      //         child: Row(
                      //           children: [
                      //             GestureDetector(
                      //               onTap: () {
                      //                 _chooseOwner = !_chooseOwner;
                      //                 setState(() {});
                      //               },
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.min,
                      //                 mainAxisAlignment: MainAxisAlignment.center,
                      //                 children: [
                      //                   Container(
                      //                       width: 50.w,
                      //                       height: 50.w,
                      //                       padding: EdgeInsets.only(
                      //                           top: 6.w, right: 5.w),
                      //                       child: !_chooseOwner
                      //                           ? const Icon(CupertinoIcons.circle,
                      //                           size: 18,
                      //                           color: Color(0xFFdddddd))
                      //                           : const Icon(
                      //                           CupertinoIcons
                      //                               .checkmark_alt_circle_fill,
                      //                           size: 18,
                      //                           color: Colors.blue)),
                      //                   RichText(
                      //                     text: TextSpan(
                      //                       text: "个人寄卖",
                      //                       style: TextStyle(
                      //                           color: Colors.black,
                      //                           fontSize: 30.sp),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             GestureDetector(
                      //               onTap: () {
                      //                 _chooseOwner = !_chooseOwner;
                      //                 setState(() {});
                      //               },
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.min,
                      //                 mainAxisAlignment: MainAxisAlignment.center,
                      //                 children: [
                      //                   Container(
                      //                       width: 50.w,
                      //                       height: 50.w,
                      //                       padding: EdgeInsets.only(
                      //                           top: 6.w, right: 5.w),
                      //                       child: _chooseOwner
                      //                           ? const Icon(CupertinoIcons.circle,
                      //                           size: 18,
                      //                           color: Color(0xFFdddddd))
                      //                           : const Icon(
                      //                           CupertinoIcons
                      //                               .checkmark_alt_circle_fill,
                      //                           size: 18,
                      //                           color: Colors.blue)),
                      //                   RichText(
                      //                     text: TextSpan(
                      //                       text: "公司车辆",
                      //                       style: TextStyle(
                      //                           color: Colors.black,
                      //                           fontSize: 30.sp),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
          value: widget.consignmentContractModel.value.masterInfo.idCard ?? "",
          callback: (String content) {
            widget.consignmentContractModel.value.masterInfo.idCard = content;
          },
        ),
        EditItemWidget(
          title: '手机号码',
          value: widget.consignmentContractModel.value.masterInfo.phone ?? "",
          callback: (String content) {
            widget.consignmentContractModel.value.masterInfo.phone = content;
          },
        ),
        EditItemWidget(
          title: '银行卡号',
          value:
              widget.consignmentContractModel.value.masterInfo.bankCard ?? "",
          callback: (String content) {
            widget.consignmentContractModel.value.masterInfo.bankCard =
                content;
          },
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
        30.hb,
        _takePhoto(
          '半身照',
          Row(
            children: [
              SingleImagePickWidget(
                width: 216.w,
                height: 160.w,
                onChanged: (files) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  widget.consignmentContractModel.value.bust = files;
                  setState(() {

                  });
                },
                imageView: Image.asset(
                  Assets.images.carPersonPhoto.path,
                  fit: BoxFit.fill,
                ),
                files: widget.consignmentContractModel.value.bust,
              ),
            ],
          ),
        ),

      ],
    );
  }

  // Widget companyInfo() {
  //   return Column(
  //     children: [
  //       _noIcon('公司名称', _companyController),
  //       30.hb,
  //       _noIcon('信用代码', _creditCodeController),
  //       30.hb,
  //       _noIcon('联系方式', _phoneController),
  //       30.hb,
  //       _noIcon('开户行', _depositBankController),
  //       _haveIcon('银行卡号', _bankNumController, () {}),
  //       _takePhoto(
  //         '营业执照',
  //         GestureDetector(
  //           child: SizedBox(
  //             child:
  //                 Assets.images.carCompany.image(width: 200.w, height: 150.h),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // _haveIcon(
  //   String title,
  //   TextEditingController _contentController,
  //   VoidCallback _onTap,
  // ) {
  //   return Container(
  //     color: Colors.transparent,
  //     child: Row(
  //       children: [
  //         '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
  //         10.wb,
  //         SizedBox(
  //           width: 160.w,
  //           child: title.text
  //               .size(30.sp)
  //               .color(Colors.black.withOpacity(0.45))
  //               .make(),
  //         ),
  //         Expanded(
  //           child: TextField(
  //             textAlign: TextAlign.start,
  //             onChanged: (text) => setState(() {}),
  //             autofocus: false,
  //             controller: _contentController,
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
  //         IconButton(
  //           onPressed: _onTap,
  //           icon:ImageIcon(
  //             Assets.icons.scan,
  //             size: 35.w,
  //             color: Colors.black38,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // _noIcon(
  //   String title,
  //   TextEditingController _contentController,
  // ) {
  //   return Container(
  //     color: Colors.transparent,
  //     child: Row(
  //       children: [
  //         '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
  //         10.wb,
  //         SizedBox(
  //           width: 160.w,
  //           child: title.text
  //               .size(30.sp)
  //               .color(Colors.black.withOpacity(0.45))
  //               .make(),
  //         ),
  //         Expanded(
  //           child: TextField(
  //             textAlign: TextAlign.start,
  //             onChanged: (text) => setState(() {}),
  //             autofocus: false,
  //             controller: _contentController,
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

  _takePhoto(
    String title,
    Widget content,
  ) {
    return Container(
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
