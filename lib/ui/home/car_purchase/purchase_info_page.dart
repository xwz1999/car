import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/car/bank_card_info_model.dart';
import 'package:cloud_car/model/car/id_card_info_model.dart';
import 'package:cloud_car/model/contract/purchase_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_photo_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_push_car_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class PurchaseInfoPage extends StatefulWidget {
  final PurchaseCarInfo purchaseCarInfo;
  final PurchaseInfo purchaseInfo;
  final PurchasePhotoModel reportPhotoModel;
  const PurchaseInfoPage({super.key, required this.purchaseCarInfo, required this.purchaseInfo, required this.reportPhotoModel});

  @override
  _PurchaseInfoPageState createState() => _PurchaseInfoPageState();
}

class _PurchaseInfoPageState extends State<PurchaseInfoPage> {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerIdController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController bankNumController = TextEditingController();
  final TextEditingController bankController = TextEditingController();

  // final TextEditingController signingAddressController = TextEditingController();

  final TextEditingController transactionAmountController = TextEditingController();
  // final TextEditingController depositAmountController = TextEditingController();
  final TextEditingController downPaymentAmountController = TextEditingController();
  final TextEditingController balanceAmountBackupController = TextEditingController();

  // final TextEditingController deliveryPlaceController = TextEditingController();
  // final TextEditingController transferTaxController = TextEditingController();
  // final TextEditingController handlingFeeController = TextEditingController();
  // final TextEditingController serviceChargeController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  final TextEditingController downPaymentNumController = TextEditingController();
  final TextEditingController balanceAmountBackupNumController = TextEditingController();


  bool get canTap {
    if (ownerIdController.text.trim().isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }
    if (ownerNameController.text.trim().isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }
    if (phoneNumController.text.trim().isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }
    if (bankNumController.text.trim().isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }
    if (bankController.text.trim().isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }




    if (transactionAmountController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入成交金额');
      return false;
    }
    if (downPaymentNumController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入首付占比');
      return false;
    }
    if (downPaymentAmountController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入首付金额');
      return false;
    }
    if (balanceAmountBackupController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入尾款金额');
      return false;
    }

    if (balanceAmountBackupNumController.text.trim().isEmpty) {
      BotToast.showText(text: '请先输入尾款占比');
      return false;
    }
    if(  widget.purchaseInfo.deliveryDate==null){
      BotToast.showText(text: '请先选择交付日期');
      return false;
    }


    if(  widget.purchaseInfo.remark==''){
      BotToast.showText(text: '请先输入车况描述');
      return false;
    }

    widget.purchaseInfo.ownerId = ownerIdController.text;
    widget.purchaseInfo.ownerName = ownerNameController.text;

    widget.purchaseInfo.phoneNum = phoneNumController.text;
    widget.purchaseInfo.bankNum = bankNumController.text;
    widget.purchaseInfo.bank = bankController.text;

    widget.purchaseInfo.transactionAmount = transactionAmountController.text;
    widget.purchaseInfo.downPaymentAmount = downPaymentAmountController.text;
    widget.purchaseInfo.downPaymentNum = downPaymentNumController.text;
    widget.purchaseInfo.balanceAmountBackup = balanceAmountBackupController.text;
    widget.purchaseInfo.balanceAmountBackupNum = balanceAmountBackupNumController.text;

    //widget.purchaseInfo.remark = remarkController.text;


    return true;
  }


  List<ChooseItem> formalitiesList = [
    ChooseItem(name: '行驶证'),
    ChooseItem(name: '登记证书'),
    ChooseItem(name: '购置税凭证'),
    ChooseItem(name: '年检凭证'),
    ChooseItem(name: '原始购车发票或过户交易发票'),
    ChooseItem(name: '保险单正本及保险卡'),
    ChooseItem(name: '车主身份证明'),
  ];

  @override
  void dispose() {
    ownerNameController.dispose();
    ownerIdController.dispose();
    phoneNumController.dispose();
    bankNumController.dispose();
    bankController.dispose();
    // signingAddressController.dispose();
    transactionAmountController.dispose();
    downPaymentAmountController.dispose();
    balanceAmountBackupController.dispose();
    remarkController.dispose();
    downPaymentNumController.dispose();
    balanceAmountBackupNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: Colors.white,
        title: Text('车辆收购',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(32.w),child:  '车主信息'.text.size(36.sp).color(const Color(0xFF999999)).make(),),
          Container(
            padding: EdgeInsets.only(left: 32.w,right: 12.w),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,),
            child: _ownerInfo()
          ),
          Padding(padding: EdgeInsets.all(32.w),child:  '车款与交验车'.text.size(36.sp).color(const Color(0xFF999999)).make(),),
          Container(
              padding: EdgeInsets.only(left: 32.w,right: 12.w),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,),
              child: _priceInfo()
          ),
          Padding(padding: EdgeInsets.all(32.w),child:  '车况描述'.text.size(36.sp).color(const Color(0xFF999999)).make(),),
          Container(
              padding: EdgeInsets.only(left: 32.w,right: 32.w),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,),
              child: _remark()
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (!canTap) {
                  return;
                }
                Get.to(()=>PurchasePhotoPage(purchaseInfo: widget.purchaseInfo,
                    purchaseCarInfo: widget.purchaseCarInfo, reportPhotoModel: widget.reportPhotoModel));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: '下一步'.text.size(30.sp).color(Colors.white).make(),
            ),
          ).paddingAll(30.w),
        ],
      ),
    );
  }

  _remark(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     // Container(
        //     //   margin: EdgeInsets.only(top: 30.w,right: 5.w),
        //     //   child: Text(
        //     //     '*',
        //     //     style: TextStyle(
        //     //       fontSize: 28.sp,
        //     //       color: const Color(0xFFE62222),
        //     //     ),
        //     //   ),
        //     // ),
        //     // 10.wb,
        //     Container(
        //       padding: EdgeInsets.only(top: 12.w),
        //       width: 150.w,
        //       child: Text('车况描述',
        //           style: TextStyle(
        //             color: BaseStyle.color999999,
        //             fontSize: BaseStyle.fontSize28,)),
        //     )
        //   ],
        // )
        // ,
        22.hb,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0.w),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(color: BaseStyle.colordddddd,width: 2.w)
          ),
          padding: EdgeInsets.symmetric(vertical: 16.w,horizontal: 20.w),
          height: 200.w,
          child: TextField(
            maxLines: 50,
            keyboardType: TextInputType.text,
            onEditingComplete: () {

            },
            onChanged: (text) {
              widget.purchaseInfo.remark = text;
            },

            style: TextStyle(
              color: BaseStyle.color333333,
              fontSize: BaseStyle.fontSize28,),
            controller: remarkController,
            decoration: InputDecoration(

              contentPadding: EdgeInsets.zero,
              filled: true,
              isDense: true,
              fillColor: Colors.white,
              hintText: "请输入",
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
              border: InputBorder.none,
            ),
          ),
        ),
        32.hb,
      ],
    );
  }

  _priceInfo(){
    var transactionAmount = EditItemWidget(
      topIcon: false,
      title: '成交金额',
      paddingStart: 0.w,
      tips: '请输入',
      controller: transactionAmountController,
      endText: '元',
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      callback: (text){
        if(text.isNotEmpty&&downPaymentNumController.text.isNotEmpty){
          num amount = num.parse(text);
          num downPaymentNum = num.parse(downPaymentNumController.text);

          downPaymentAmountController.text = (amount * downPaymentNum/100).toStringAsFixed(2);
          balanceAmountBackupNumController.text = (100-downPaymentNum).toStringAsFixed(2);
          balanceAmountBackupController.text =(( amount * (100-downPaymentNum))/100).toStringAsFixed(2);
          setState(() {

          });
        }
      },
    );
    // var depositAmount = EditItemWidget(
    //   topIcon: false,
    //   title: '定金金额',
    //   paddingStart: 0.w,
    //   tips: '请输入',
    //   controller: depositAmountController,
    //   endText: '元',
    // );
    var downPaymentAmount = EditItemWidget(
      topIcon: false,
      title: '首付金额',
      paddingStart: 0.w,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      tips: '请输入',
      controller: downPaymentAmountController,
      endText: '元',
    );
    var balanceAmount = EditItemWidget(
      topIcon: false,
      title: '尾款金额',
      paddingStart: 0.w,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      tips: '请输入',
      controller: balanceAmountBackupController,
      endText: '元',
    );

    var downPaymentNum = EditItemWidget(
      topIcon: false,
      title: '首付占比',
      paddingStart: 0.w,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      tips: '请输入',
      controller: downPaymentNumController,
      endText: '%',
      callback: (text){
        if(text.isNotEmpty&&transactionAmountController.text.isNotEmpty){
          num downPaymentNum = num.parse(text);
          num  amount = num.parse(transactionAmountController.text);

          downPaymentAmountController.text = (amount * downPaymentNum/100).toStringAsFixed(2);
          balanceAmountBackupNumController.text = (100-downPaymentNum).toStringAsFixed(2);
          balanceAmountBackupController.text =(( amount * (100-downPaymentNum))/100).toStringAsFixed(2);
          setState(() {

          });
        }
      },
    );

    var balanceAmountBackupNum = EditItemWidget(
      topIcon: false,
      title: '尾款占比',
      paddingStart: 0.w,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      tips: '请输入',
      controller: balanceAmountBackupNumController,
      endText: '%',
    );


    // var deliveryPlace = EditItemWidget(
    //   topIcon: false,
    //   title: '交付地点',
    //   paddingStart: 0.w,
    //   tips: '请输入',
    //   controller: deliveryPlaceController,
    // );

    // var transferTax = EditItemWidget(
    //   topIcon: false,
    //   title: '过户税',
    //   paddingStart: 0.w,
    //   tips: '请输入',
    //   controller: transferTaxController,
    //   endText: '元',
    // );
    // var handlingFee = EditItemWidget(
    //   topIcon: false,
    //   title: '代办手续费',
    //   paddingStart: 0.w,
    //   tips: '请输入',
    //   controller: handlingFeeController,
    //   endText: '元',
    // );
    // var serviceCharge = EditItemWidget(
    //   topIcon: false,
    //   title: '服务费',
    //   paddingStart: 0.w,
    //   tips: '请输入',
    //   controller: serviceChargeController,
    //   endText: '元',
    // );


    return Column(
      children: [
        transactionAmount,
        downPaymentNum,
        downPaymentAmount,


        balanceAmountBackupNum,
        balanceAmount,

        _function(
          '交付时间',
              () async {
            var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime(DateTime.now().year+100));
            widget.purchaseInfo.deliveryDate = firstDate;
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {});
          },
          widget.purchaseInfo.deliveryDateStr,
          '请选择',
        ),
        // _function(
        //   '手续证件',
        //       () async {
        //     await showModalBottomSheet(
        //       context: context,
        //       shape: RoundedRectangleBorder(
        //           borderRadius:
        //           BorderRadius.vertical(top: Radius.circular(16.w))),
        //       builder: (context) {
        //         return CloudGridPickerWidget.wrap(
        //             title: '手续证件',
        //             items: formalitiesList.map((e) => e.name).toList(),
        //             onConfirm: (strList, indexList) {
        //
        //               for(var item in strList){
        //                 if(widget.purchaseInfo.formalities!=''){
        //                   widget.purchaseInfo.formalities = '${widget.purchaseInfo.formalities!}/$item';
        //                 }else{
        //                   widget.purchaseInfo.formalities = item;
        //                 }
        //
        //               }
        //               Get.back();
        //               FocusManager.instance.primaryFocus?.unfocus();
        //               setState(() {});
        //             });
        //       },
        //     );
        //   },
        //   widget.purchaseInfo.formalities,
        //   '请选择',
        // ),

      ],
    );
  }

   _ownerInfo() {
    var ownerName = EditItemWidget(
      title: '车主姓名',
      tips: '请输入',
      controller: ownerNameController,
      topIcon: false,
      paddingStart: 0.w,
    );
    var ownerId = EditItemWidget(
      title: '身份证号',
      tips: '请输入',
      controller: ownerIdController,
      topIcon: false,
      paddingStart: 0.w,
      endIcon: GestureDetector(
        onTap: ()async{
          File? file= await CloudImagePicker.pickSingleImage(title: '选择图片');
          if (file != null) {
            setState(() {});
            var cancel = CloudToast.loading;
            String urls = await apiClient.uploadImage(file);
            IdCardInfoModel? carInfoModel = await CarFunc.idCardOCR(urls);
            if (carInfoModel != null) {
              widget.purchaseInfo.ownerId = carInfoModel.number;
              ownerIdController.text = carInfoModel.number;
              widget.purchaseInfo.ownerName = carInfoModel.name;
              ownerNameController.text = carInfoModel.name;
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
    );

    var phoneNum = EditItemWidget(
      title: '手机号码',
      tips: '请输入',
      controller: phoneNumController,
      topIcon: false,
      paddingStart: 0.w,
    );

    var bankNum = EditItemWidget(
      title: '银行卡号',
      tips: '请输入',
      controller: bankNumController,
      topIcon: false,
      paddingStart: 0.w,
      endIcon: GestureDetector(
        onTap: ()async{
          File? file= await CloudImagePicker.pickSingleImage(title: '选择图片');
          if (file != null) {
            setState(() {});
            var cancel = CloudToast.loading;
            String urls = await apiClient.uploadImage(file);
            BankCardInfoModel? bankCardInfoModel = await CarFunc.bankCardOCR(urls);
            if (bankCardInfoModel != null) {
              widget.purchaseInfo.bankNum = bankCardInfoModel.bankCardNo;
              bankNumController.text = bankCardInfoModel.bankCardNo;
              widget.purchaseInfo.bank = bankCardInfoModel.bankName;
              bankController.text = bankCardInfoModel.bankName;

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
    );

    var bank = EditItemWidget(
      title: '银行',
      tips: '请输入',
      controller: bankController,
      topIcon: false,
      paddingStart: 0.w,
    );



    // var signingAddress = EditItemWidget(
    //   title: '签约地点',
    //   tips: '请输入',
    //   controller: signingAddressController,
    //   topIcon: false,
    //   paddingStart: 0.w,
    // );


    return Column(
      children: [
        ownerId,
        ownerName,

        phoneNum,
        bankNum,
        bank,
        // _function(
        //   '签订时间',
        //       () async {
        //     var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime.now());
        //     widget.purchaseInfo.signingDate = firstDate;
        //     FocusManager.instance.primaryFocus?.unfocus();
        //     setState(() {});
        //   },
        //   widget.purchaseInfo.signingDateStr,
        //   '请选择',
        // ),
        // signingAddress,

      ],
    );
  }


  _function(
      String title,
      VoidCallback onTap,
      String? content,
      String msg,{bool topIcon = false}
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: EditItemWidget(
          title: title,
          tips: msg,
          value: content ?? '',
          topIcon: topIcon,
          paddingStart: 0,
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


class PurchaseInfo {

  String? ownerName;
  String? ownerId;
  String? phoneNum;

  String? bankNum;

  String? bank;
  // ///签订时间
  // DateTime? signingDate;
  // String get signingDateStr =>
  //     DateUtil.formatDate(signingDate, format: 'yyyy-MM-dd');
  String? signingAddress;
  ///成交金额
  String? transactionAmount;
  // String? depositAmount;

  ///首付金额
  String? downPaymentAmount;

  ///首付比例
  String? downPaymentNum;

  ///尾款金额
  String? balanceAmountBackup;
  ///尾款比例
  String? balanceAmountBackupNum;

  DateTime? deliveryDate;
  String get deliveryDateStr =>
      DateUtil.formatDate(deliveryDate, format: 'yyyy-MM-dd');

  String? deliveryPlace;

  ///手续证件
  String? formalities;

  // String? transferTax;
  // String? handlingFee;
  // String? serviceCharge;

  String? remark;

  static PurchaseInfo get empty => PurchaseInfo(
    ownerName:'',
    ownerId:'',
    phoneNum:'',
    bankNum:'',
    // signingDate:null,
    signingAddress:'',
    transactionAmount:'',
    //depositAmount:'',
    downPaymentAmount:'',
    balanceAmountBackup:'',
    deliveryDate:null,
    deliveryPlace:'',
    // transferTax:'',
    // handlingFee:'',
    // serviceCharge:'',
    remark:''
  );

  PurchaseInfo({
    this.ownerName,
    this.ownerId,
    this.phoneNum,
    this.bankNum,
    // this.signingDate,
    this.signingAddress,
    this.transactionAmount,
//    this.depositAmount,
    this.downPaymentAmount,
    this.balanceAmountBackup,
    this.deliveryDate,
    this.deliveryPlace,
    // this.transferTax,
    // this.handlingFee,
    // this.serviceCharge,
    this.remark
  });
}
