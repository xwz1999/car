import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/report_photo_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_photo_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_push_car_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PurchaseInfoPage extends StatefulWidget {
  final PurchaseCarInfo purchaseCarInfo;
  final PurchaseInfo purchaseInfo;
  final ReportPhotoModel reportPhotoModel;
  const PurchaseInfoPage({super.key, required this.purchaseCarInfo, required this.purchaseInfo, required this.reportPhotoModel});

  @override
  _PurchaseInfoPageState createState() => _PurchaseInfoPageState();
}

class _PurchaseInfoPageState extends State<PurchaseInfoPage> {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerIdController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController bankNumController = TextEditingController();
  final TextEditingController signingAddressController = TextEditingController();

  final TextEditingController transactionAmountController = TextEditingController();
  final TextEditingController depositAmountController = TextEditingController();
  final TextEditingController downPaymentAmountController = TextEditingController();
  final TextEditingController balanceAmountBackupController = TextEditingController();

  final TextEditingController deliveryPlaceController = TextEditingController();
  final TextEditingController transferTaxController = TextEditingController();
  final TextEditingController handlingFeeController = TextEditingController();
  final TextEditingController serviceChargeController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();



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
          Padding(padding: EdgeInsets.all(32.w),child:  '车主信息'.text.size(28.sp).color(const Color(0xFF999999)).make(),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 24.w),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,),
            child: _ownerInfo()
          ),
          Padding(padding: EdgeInsets.all(32.w),child:  '费用信息'.text.size(28.sp).color(const Color(0xFF999999)).make(),),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 24.w),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,),
              child: _priceInfo()
          ),
          Padding(padding: EdgeInsets.all(32.w),child:  '车况描述'.text.size(28.sp).color(const Color(0xFF999999)).make(),),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,),
              child: _remark()
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.w,right: 5.w),
              child: Text(
                '*',
                style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFFE62222),
                ),
              ),
            ),
            10.wb,
            Container(
              padding: EdgeInsets.only(top: 12.w),
              width: 150.w,
              child: Text('车况描述',
                  style: TextStyle(
                    color: BaseStyle.color999999,
                    fontSize: BaseStyle.fontSize28,)),
            )
          ],
        )
        ,
        12.hb,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
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
      paddingTop: 0.5,
    );
    var depositAmount = EditItemWidget(
      topIcon: false,
      title: '定金金额',
      paddingStart: 0.w,
      tips: '请输入',
      controller: depositAmountController,
      endText: '元',
    );
    var downPaymentAmount = EditItemWidget(
      topIcon: false,
      title: '首付金额',
      paddingStart: 0.w,
      tips: '请输入',
      controller: downPaymentAmountController,
      endText: '元',
    );
    var balanceAmount = EditItemWidget(
      topIcon: false,
      title: '尾款金额',
      paddingStart: 0.w,
      tips: '请输入',
      controller: balanceAmountBackupController,
      endText: '元',
    );
    var deliveryPlace = EditItemWidget(
      topIcon: false,
      title: '交付地点',
      paddingStart: 0.w,
      tips: '请输入',
      controller: deliveryPlaceController,
    );

    var transferTax = EditItemWidget(
      topIcon: false,
      title: '过户税',
      paddingStart: 0.w,
      tips: '请输入',
      controller: transferTaxController,
      endText: '元',
    );
    var handlingFee = EditItemWidget(
      topIcon: false,
      title: '代办手续费',
      paddingStart: 0.w,
      tips: '请输入',
      controller: handlingFeeController,
      endText: '元',
    );
    var serviceCharge = EditItemWidget(
      topIcon: false,
      title: '服务费',
      paddingStart: 0.w,
      tips: '请输入',
      controller: serviceChargeController,
      endText: '元',
    );


    return Column(
      children: [
        transactionAmount,
        depositAmount,
        downPaymentAmount,
        balanceAmount,
        _function(
          '交付时间',
              () async {
            var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime.now());
            widget.purchaseInfo.deliveryDate = firstDate;
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {});
          },
          widget.purchaseInfo.deliveryDateStr,
          '请选择',
        ),
        deliveryPlace,
        transferTax,
        handlingFee,
        serviceCharge
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
      paddingTop: 0.5,
    );
    var ownerId = EditItemWidget(
      title: '身份证号',
      tips: '请输入',
      controller: ownerIdController,
      topIcon: false,
      paddingStart: 0.w,
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
    );

    var signingAddress = EditItemWidget(
      title: '签约地点',
      tips: '请输入',
      controller: signingAddressController,
      topIcon: false,
      paddingStart: 0.w,
    );


    return Column(
      children: [
        ownerName,
        ownerId,
        phoneNum,
        bankNum,
        _function(
          '签订时间',
              () async {
            var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime.now());
            widget.purchaseInfo.signingDate = firstDate;
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {});
          },
          widget.purchaseInfo.signingDateStr,
          '请选择',
        ),
        signingAddress,

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
  ///签订时间
  DateTime? signingDate;
  String get signingDateStr =>
      DateUtil.formatDate(signingDate, format: 'yyyy-MM-dd');
  String? signingAddress;
  String? transactionAmount;
  String? depositAmount;
  String? downPaymentAmount;
  String? balanceAmountBackup;
  DateTime? deliveryDate;
  String get deliveryDateStr =>
      DateUtil.formatDate(signingDate, format: 'yyyy-MM-dd');

  String? deliveryPlace;
  String? transferTax;
  String? handlingFee;
  String? serviceCharge;

  String? remark;

  static PurchaseInfo get empty => PurchaseInfo(
    ownerName:'',
    ownerId:'',
    phoneNum:'',
    bankNum:'',
    signingDate:null,
    signingAddress:'',
    transactionAmount:'',
    depositAmount:'',
    downPaymentAmount:'',
    balanceAmountBackup:'',
    deliveryDate:null,
    deliveryPlace:'',
    transferTax:'',
    handlingFee:'',
    serviceCharge:'',
    remark:''
  );

  PurchaseInfo({
    this.ownerName,
    this.ownerId,
    this.phoneNum,
    this.bankNum,
    this.signingDate,
    this.signingAddress,
    this.transactionAmount,
    this.depositAmount,
    this.downPaymentAmount,
    this.balanceAmountBackup,
    this.deliveryDate,
    this.deliveryPlace,
    this.transferTax,
    this.handlingFee,
    this.serviceCharge,
    this.remark
  });
}
