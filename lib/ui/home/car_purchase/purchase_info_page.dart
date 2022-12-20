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
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/share_util.dart';
import '../../../widget/button/colud_check_radio.dart';

class PurchaseInfoPage extends StatefulWidget {
  final PurchaseCarInfo purchaseCarInfo;
  final PurchaseInfo purchaseInfo;
  final PurchasePhotoModel reportPhotoModel;

  const PurchaseInfoPage({super.key,
    required this.purchaseCarInfo,
    required this.purchaseInfo,
    required this.reportPhotoModel});

  @override
  _PurchaseInfoPageState createState() => _PurchaseInfoPageState();
}

class _PurchaseInfoPageState extends State<PurchaseInfoPage> {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerIdController = TextEditingController();
  final TextEditingController institutionsController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController bankNumController = TextEditingController();
  final TextEditingController bankController = TextEditingController();

  // final TextEditingController signingAddressController = TextEditingController();

  final TextEditingController transactionAmountController =
  TextEditingController();
  final TextEditingController depositAmountController = TextEditingController();
  final TextEditingController downPaymentAmountController =
  TextEditingController();
  final TextEditingController balanceAmountBackupController =
  TextEditingController();

  // final TextEditingController deliveryPlaceController = TextEditingController();
  // final TextEditingController transferTaxController = TextEditingController();
  // final TextEditingController handlingFeeController = TextEditingController();
  // final TextEditingController serviceChargeController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  final TextEditingController downPaymentNumController =
  TextEditingController();
  final TextEditingController balanceAmountBackupNumController =
  TextEditingController();
  final TextEditingController designationController = TextEditingController();
  late int state = 0;

  bool get canTap {
    if (ownerIdController.text
        .trim()
        .isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }
    if (ownerNameController.text
        .trim()
        .isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }
    if (phoneNumController.text
        .trim()
        .isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }
    if (bankNumController.text
        .trim()
        .isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }
    if (bankController.text
        .trim()
        .isEmpty) {
      BotToast.showText(text: '请先完善车主信息');
      return false;
    }

    if (transactionAmountController.text
        .trim()
        .isEmpty) {
      BotToast.showText(text: '请先输入成交金额');
      return false;
    }
    if (depositAmountController.text
        .trim()
        .isEmpty) {
      BotToast.showText(text: '请先输入定金金额');
      return false;
    }
    // if (downPaymentNumController.text.trim().isEmpty) {
    //   BotToast.showText(text: '请先输入首付占比');
    //   return false;
    // }
    // if (downPaymentAmountController.text.trim().isEmpty) {
    //   BotToast.showText(text: '请先输入首付金额');
    //   return false;
    // }
    if (balanceAmountBackupController.text
        .trim()
        .isEmpty) {
      BotToast.showText(text: '请先输入尾款金额');
      return false;
    }

    // if (balanceAmountBackupNumController.text.trim().isEmpty) {
    //   BotToast.showText(text: '请先输入尾款占比');
    //   return false;
    // }
    if (widget.purchaseInfo.deliveryDate == null) {
      BotToast.showText(text: '请先选择交付日期');
      return false;
    }

    if (widget.purchaseInfo.remark == '') {
      BotToast.showText(text: '请先输入车况描述');
      return false;
    }

    widget.purchaseInfo.ownerId = ownerIdController.text;
    widget.purchaseInfo.ownerName = ownerNameController.text;

    widget.purchaseInfo.phoneNum = phoneNumController.text;
    widget.purchaseInfo.bankNum = bankNumController.text;
    widget.purchaseInfo.bank = bankController.text;

    widget.purchaseInfo.transactionAmount = transactionAmountController.text;
    widget.purchaseInfo.downPaymentAmount = depositAmountController.text;
    widget.purchaseInfo.downPaymentNum = downPaymentNumController.text;
    widget.purchaseInfo.balanceAmountBackup =
        balanceAmountBackupController.text;
    widget.purchaseInfo.balanceAmountBackupNum =
        balanceAmountBackupNumController.text;
    widget.purchaseInfo.kind = state + 1;
    //widget.purchaseInfo.remark = remarkController.text;

    return true;
  }

  final List<int> _selectIndex2 = [0];
  final List<String> _models1 = ['个人', '公司'];
  final List<int> _selectIndex3 = [];
  final List<String> _models2 = ['公司', '门店'];
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
    designationController.dispose();
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
          Padding(
            padding: EdgeInsets.all(32.w),
            child:
            '车主信息'.text.size(36.sp).color(const Color(0xFF999999)).make(),
          ),
          Container(
              padding: EdgeInsets.only(left: 32.w, right: 12.w),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: _ownerInfo()),
          Padding(
            padding: EdgeInsets.all(32.w),
            child:
            '车款与交验车'.text.size(36.sp).color(const Color(0xFF999999)).make(),
          ),
          Container(
              padding: EdgeInsets.only(left: 32.w, right: 12.w),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: _priceInfo()),
          Padding(
            padding: EdgeInsets.all(32.w),
            child:
            '收购方选择'.text.size(36.sp).color(const Color(0xFF999999)).make(),
          ),
          Container(
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: getAcquiring()),
          Padding(
            padding: EdgeInsets.all(32.w),
            child:
            '车况描述'.text.size(36.sp).color(const Color(0xFF999999)).make(),
          ),
          Container(
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: _remark()),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async{
                // try{
                //   var res =await Dio().get('contract/20221215/云云问车车辆寄卖服务协议yDRTvUUgyg308s36UyFlheyREaFYxjbJ.PDF');
                //   print(res);
                // }catch(e){
                //   print(e);
                // }

                // ShareUtil.saveNetImageToGallery(
                //     'contract/20221215/云云问车车辆寄卖服务协议yDRTvUUgyg308s36UyFlheyREaFYxjbJ.PDF');
               // var res= await Dio().download("contract/20221215/云云问车车辆寄卖服务协议yDRTvUUgyg308s36UyFlheyREaFYxjbJ.PDF", '');
               // print(res.data.stream);
                FocusManager.instance.primaryFocus?.unfocus();
                if (!canTap) {
                  return;
                }
                Get.to(() =>
                    PurchasePhotoPage(
                        purchaseInfo: widget.purchaseInfo,
                        purchaseCarInfo: widget.purchaseCarInfo,
                        reportPhotoModel: widget.reportPhotoModel));
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

  _remark() {
    return Column(
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
              border: Border.all(color: BaseStyle.colordddddd, width: 2.w)),
          padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
          height: 200.w,
          child: TextField(
            maxLines: 50,
            keyboardType: TextInputType.text,
            onEditingComplete: () {},
            onChanged: (text) {
              widget.purchaseInfo.remark = text;
            },
            style: TextStyle(
              color: BaseStyle.color333333,
              fontSize: BaseStyle.fontSize28,
            ),
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

  _priceInfo() {
    var transactionAmount = EditItemWidget(
      topIcon: false,
      title: '成交金额',
      paddingStart: 0.w,
      tips: '请输入',
      controller: transactionAmountController,
      endText: '元',
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      callback: (text) {
        if (depositAmountController.text.isNotEmpty) {
          balanceAmountBackupController.text =
              (num.parse(text) - num.parse(depositAmountController.text))
                  .toString();
          // num amount = num.parse(text);
          // num downPaymentNum = num.parse(downPaymentNumController.text);
          // downPaymentAmountController.text = (amount * downPaymentNum/100).toStringAsFixed(2);
          // balanceAmountBackupNumController.text = (100-downPaymentNum).toStringAsFixed(2);
          // balanceAmountBackupController.text =(( amount * (100-downPaymentNum))/100).toStringAsFixed(2);
          setState(() {});
        } else {
          balanceAmountBackupController.text = '';
          setState(() {});
        }
      },
    );
    var depositAmount = EditItemWidget(
      topIcon: false,
      title: '定金金额',
      paddingStart: 0.w,
      tips: '请输入',
      controller: depositAmountController,
      endText: '元',
      callback: (text) {
        if (transactionAmountController.text.isNotEmpty) {
          balanceAmountBackupController.text =
              (num.parse(transactionAmountController.text) - num.parse(text))
                  .toString();
          // num amount = num.parse(text);
          // num downPaymentNum = num.parse(downPaymentNumController.text);
          // downPaymentAmountController.text = (amount * downPaymentNum/100).toStringAsFixed(2);
          // balanceAmountBackupNumController.text = (100-downPaymentNum).toStringAsFixed(2);
          // balanceAmountBackupController.text =(( amount * (100-downPaymentNum))/100).toStringAsFixed(2);
          setState(() {});
        } else {
          balanceAmountBackupController.text = '';
          setState(() {});
        }
      },
    );
    // var downPaymentAmount = EditItemWidget(
    //   topIcon: false,
    //   title: '首付金额',
    //   paddingStart: 0.w,
    //   inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
    //   tips: '请输入',
    //   controller: downPaymentAmountController,
    //   endText: '元',
    // );
    var balanceAmount = EditItemWidget(
      topIcon: false,
      title: '尾款金额',
      paddingStart: 0.w,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      tips: '请输入',
      controller: balanceAmountBackupController,
      endText: '元',
    );

    // var downPaymentNum = EditItemWidget(
    //   topIcon: false,
    //   title: '首付占比',
    //   paddingStart: 0.w,
    //   inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
    //   tips: '请输入',
    //   controller: downPaymentNumController,
    //   endText: '%',
    //   callback: (text){
    //     if(text.isNotEmpty&&transactionAmountController.text.isNotEmpty){
    //       num downPaymentNum = num.parse(text);
    //       num  amount = num.parse(transactionAmountController.text);
    //
    //       downPaymentAmountController.text = (amount * downPaymentNum/100).toStringAsFixed(2);
    //       balanceAmountBackupNumController.text = (100-downPaymentNum).toStringAsFixed(2);
    //       balanceAmountBackupController.text =(( amount * (100-downPaymentNum))/100).toStringAsFixed(2);
    //       setState(() {
    //
    //       });
    //     }
    //   },
    // );

    // var balanceAmountBackupNum = EditItemWidget(
    //   topIcon: false,
    //   title: '尾款占比',
    //   paddingStart: 0.w,
    //   inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
    //   tips: '请输入',
    //   controller: balanceAmountBackupNumController,
    //   endText: '%',
    // );

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
        depositAmount,
        // downPaymentNum,
        // downPaymentAmount,
        // balanceAmountBackupNum,
        balanceAmount,
        _function(
          '交付时间',
              () async {
            var firstDate = await CarDatePicker.pick(
              DateTime.now(),
            );

            /// var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime(DateTime.now().year+100));
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
      title: state == 0 ? '姓名' : '公司名称',
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
        onTap: () async {
          File? file = await CloudImagePicker.pickSingleImage(title: '选择图片');
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
            setState(() {});
          }
        },
        child: Image.asset(
          Assets.icons.scan1.path,
          width: 42.w,
          height: 42.w,
        ),
      ),
    );
    var institutionId = EditItemWidget(
      title: '机构代码',
      tips: '请输入',
      controller: institutionsController,
      topIcon: false,
      paddingStart: 0.w,
    );
    var phoneNum = EditItemWidget(
      paddingState: true,
      errText: '手机号格式错误',
      length: 11,
      title: state == 0 ? '手机号码' : '联系电话',
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
        onTap: () async {
          File? file = await CloudImagePicker.pickSingleImage(title: '选择图片');
          if (file != null) {
            setState(() {});
            var cancel = CloudToast.loading;
            String urls = await apiClient.uploadImage(file);
            BankCardInfoModel? bankCardInfoModel =
            await CarFunc.bankCardOCR(urls);
            if (bankCardInfoModel != null) {
              widget.purchaseInfo.bankNum = bankCardInfoModel.bankCardNo;
              bankNumController.text = bankCardInfoModel.bankCardNo;
              widget.purchaseInfo.bank = bankCardInfoModel.bankName;
              bankController.text = bankCardInfoModel.bankName;
            }
            cancel();
            setState(() {});
          }
        },
        child: Image.asset(
          Assets.icons.scan1.path,
          width: 42.w,
          height: 42.w,
        ),
      ),
    );

    var bank = EditItemWidget(
      title: '开户行',
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
        Padding(
          padding: EdgeInsets.only(top: 40.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 170.w,
                child: Text(
                  '车主身份',
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: const Color(0xFF333333),
                  ),
                ),
              ),
              SizedBox(
                height: 50.w,
                child: getChooseList((int choice) {
                  state = choice;
                }, _models1, _selectIndex2),
              ),
            ],
          ),
        ),

        ownerName,
        // state==0?const Sizebox():ownerName
        state == 0 ? ownerId : institutionId,
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

  getAcquiring() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.w),
          child: Container(
            padding: EdgeInsets.only(bottom: 30.w),
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                    BorderSide(color: const Color(0xFFF6F6F6), width: 2.w)),
                color: Colors.transparent),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 170.w,
                  child: Text(
                    '收购方',
                    style: TextStyle(
                      fontSize: 32.sp,
                      color: const Color(0xFF333333),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.w,
                  child: getChooseList((int choice) async {
                    // await Dio().get(
                    //     'contract/20221215/云云问车车辆寄卖服务协议yDRTvUUgyg308s36UyFlheyREaFYxjbJ.PDF');

                    //

                    widget.purchaseCarInfo.channel=choice+1;
                    designationController.text=UserTool.userProvider.userInfo.business.storeName;
                    // state = choice;
                  }, _models2, _selectIndex3),
                ),
              ],
            ),
          ),
        ),
        // const Divider(color: Colors.grey,),
        _selectIndex3.isEmpty ? const SizedBox() : EditItemWidget(
          title: '名称',
          tips: '请输入',
          controller: designationController,
          topIcon: false,
          paddingStart: 0.w,
        )
      ],
    );
  }

  getChooseList(Function(int) callBack, List models, List<int> choices) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        ...models
            .mapIndexed((currentValue, index) =>
            GestureDetector(
              onTap: () {
                if (choices.contains(index)) {
                  choices.remove(index);
                } else {
                  choices.clear();
                  choices.add(index);
                }

                setState(() {});
                callBack(choices.first);

                // _easyRefreshController.callRefresh();
                print(state);
              },
              child: Container(
                width: 160.w,
                color: Colors.white,
                child: Row(
                  children: [
                    BeeCheckRadio(
                      value: index,
                      groupValue: choices,
                    ),
                    16.wb,
                    Text(
                      currentValue,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
                    ),
                  ],
                ),
              ),
            ))
            .toList(),
      ],
    );
  }

  _function(String title, VoidCallback onTap, String? content, String msg,
      {bool topIcon = false}) {
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
  int? kind;

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

  static PurchaseInfo get empty =>
      PurchaseInfo(
          ownerName: '',
          ownerId: '',
          phoneNum: '',
          bankNum: '',
          kind: null,
          // signingDate:null,
          signingAddress: '',
          transactionAmount: '',
          //depositAmount:'',
          downPaymentAmount: '',
          balanceAmountBackup: '',
          deliveryDate: null,
          deliveryPlace: '',
          // transferTax:'',
          // handlingFee:'',
          // serviceCharge:'',
          remark: '');

  PurchaseInfo({this.kind,
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
    this.remark});
}
