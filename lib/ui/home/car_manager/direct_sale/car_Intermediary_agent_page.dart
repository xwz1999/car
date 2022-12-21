import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/sell_car_order_third_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../model/car/car_sale_contract_model.dart';
import '../../../../model/contract/initiate_contract_model.dart';
import '../../../../model/user/store_model.dart';
import '../../../../widget/button/cloud_back_button.dart';
import '../../../../widget/button/colud_check_radio.dart';
import '../publish_car/choose_shop_page.dart';

// typedef TextCallback = Function(String content);
class CarIntermediaryAgentPage extends StatefulWidget {
  final ValueNotifier<InitiateContractModel> contractModel;
  final CarSaleContractModel carSaleContract;

  const CarIntermediaryAgentPage(
      {Key? key, required this.contractModel, required this.carSaleContract})
      : super(key: key);

  @override
  _CarIntermediaryAgentPageState createState() =>
      _CarIntermediaryAgentPageState();
}

class _CarIntermediaryAgentPageState extends State<CarIntermediaryAgentPage> {
  final List _models1 = ['无', '云云问车', '其他'];
    List<int> _selectIndex1 = [];
  late String jjf = "无";
   String store = "";
  final TextEditingController transactionAmountController =
      TextEditingController();
  final TextEditingController storesName=TextEditingController();
  final TextEditingController sellerServiceFee = TextEditingController();
  final TextEditingController buyerServiceCharge = TextEditingController();

  @override
  void initState() {
    // widget.carSaleContract.thirdPartInfo.kind!=0?_selectIndex1.add(widget.carSaleContract.thirdPartInfo.kind):_selectIndex1=[];
    // widget.carSaleContract.thirdPartInfo.kind!=0?jjf=_models1[widget.carSaleContract.thirdPartInfo.kind-1]:jjf='';

    // print(widget.carSaleContract.thirdPartInfo.kind);
    // print(widget.carSaleContract.thirdPartInfo.kind);
    // _selectIndex1==[]? _selectIndex1=[]: _selectIndex1.setAll(0,[ widget.carSaleContract.thirdPartInfo.kind ?? 0]);
    ///_selectIndex1.add(widget.carSaleContract.thirdPartInfo.kind);
    sellerServiceFee.text= widget.carSaleContract.thirdPartInfo.saleServiceFeeRate;
    buyerServiceCharge.text=widget.carSaleContract.thirdPartInfo.purchaseServiceFeeRate;
    storesName.text=store;
    super.initState();
  }

  @override
  void dispose() {
    transactionAmountController.dispose();
    sellerServiceFee.dispose();
    buyerServiceCharge.dispose();
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
        title: Text(
          '卖车合同',
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              padding: EdgeInsets.only(right: 32.w),
              child: Text(
                '上一步',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28.sp,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w, top: 12.w),
          child: Text(
            '居间方信息',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: BaseStyle.color111111, fontWeight: FontWeight.bold),
          ),
        ),
        20.hb,
        Container(
            padding: EdgeInsets.only(top: 30.w, bottom: 30.w),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFFF6F6F6), width: 2.w))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.w, left: 32.w),
                  child: Text(
                    '*  ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: const Color(0xFFE62222),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    '居间方',
                    style: TextStyle(
                      fontSize: 32.sp,
                      color: BaseStyle.color333333,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.w,
                  child: getChooseList((String choice, int index) {
                    jjf = choice;
                    if (choice == "无") {
                      widget.carSaleContract.thirdPartInfo.kind = 1;
                    } else if (choice == "云云问车") {
                      widget.carSaleContract.thirdPartInfo.kind = 2;
                    } else if (choice == "其他") {
                      widget.carSaleContract.thirdPartInfo.kind = 3;
                    }
                  }, _models1, _selectIndex1),
                ),
              ],
            )),
        jjf == "其他"
            ? Container(
                padding: EdgeInsets.only(left: 32.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFF6F6F6), width: 2.w))),
                child: _function(
                  '选择门店',

                  () async {
                    ///需要新接口
                    Get.to(() => ChooseShopPage(
                          title: "所属门店",
                          callback: (StoreModel model) {
                            store = model.name;
                            storesName.text=model.name;
                            // widget.carSaleContract.thirdPartInfo.s
                            widget.carSaleContract.thirdPartInfo.storeId =
                                model.id;
                            setState(() {});
                          },
                        ));
                    setState(() {});
                  },
                  store,
                  '请选择',
                  storesName
                ),
              )
            : const SizedBox(),
        jjf == "无"
            ? const SizedBox()
            : Container(
                padding: EdgeInsets.only(left: 32.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFF6F6F6), width: 0.w))),
                child: EditItemWidget(
                  topIcon: false,
                  title: '成交价',
                  paddingStart: 64.w,
                  tips: widget.contractModel.value.carModel!.price,
                  controller: transactionAmountController,
                  endText: '元',
                  canChange: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  callback: (text) {},
                ),
              ),
        jjf == "无"
            ? const SizedBox()
            : Container(
                padding: EdgeInsets.only(left: 32.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFF6F6F6), width: 0.w))),
                child: EditItemWidget(
                  topIcon: true,
                  title: '卖方服务费',
                  paddingStart: 0.w,
                  tips: '0%~3%（成交价的3%）',
                  controller: sellerServiceFee,
                  endText: '%',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  callback: (text) {
                    if (text == "0") {
                      if (jjf == "云云问车") {
                        CloudToast.show("卖方服务费不可为0");
                      }
                    } else {
                      widget.carSaleContract.thirdPartInfo.saleServiceFeeRate =
                          text;
                    }
                  },
                ),
              ),
        jjf == "无"
            ? const SizedBox()
            : Container(
                padding: EdgeInsets.only(left: 32.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFFF6F6F6), width: 2.w))),
                child: EditItemWidget(
                  topIcon: true,
                  title: '买方服务费',
                  paddingStart: 0.w,
                  tips: '0%~3%（成交价的3%）',
                  controller: buyerServiceCharge,
                  endText: '%',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  callback: (text) {
                    if (text == "0") {
                      if (jjf == "云云问车") {
                        CloudToast.show("买方服务费不可为0");
                      }
                    } else {
                      widget.carSaleContract.thirdPartInfo
                          .purchaseServiceFeeRate = text;
                    }
                  },
                ),
              ),
      ]),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30.w),
        height: 150.w,
        child: GestureDetector(
          onTap: () {
            if (widget.carSaleContract.thirdPartInfo.kind == 1) {
              widget.carSaleContract.thirdPartInfo.saleServiceFeeRate = "0";
              widget.carSaleContract.thirdPartInfo.purchaseServiceFeeRate = "0";
            }
            if(!canTap){
              // print(widget.carSaleContract.thirdPartInfo.kind);
              return ;
            }
            Get.to(() => SellCarOrderThirdPage(
              contractModel: widget.contractModel,
              carSaleContract: widget.carSaleContract,
            ));
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            padding: EdgeInsets.symmetric(vertical: 16.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFF0593FF),
                  Color(0xFF027AFF),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.w)),
            ),
            child: Text(
              '下一步',
              style: TextStyle(
                  color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
            ),
          ),
        ),
      ),
    );
    //   EditItemWidget(
    //   title: '客户来源',
    //   topIcon: false,
    //   value: widget.contractModel.value.origin ?? '',
    //   callback: (String content) {
    //     widget.contractModel.value.origin = content;
    //   },
    // ),
  }

  bool get canTap {
    if(widget.carSaleContract.thirdPartInfo.kind == 0){
      CloudToast.show('请选择居间方信息');
      return false;
    }
    if (widget.carSaleContract.thirdPartInfo.kind == 2) {
      if (widget.carSaleContract.thirdPartInfo.saleServiceFeeRate == '') {
        CloudToast.show('请填写卖方服务费');
        return false;
      }
      if (widget.carSaleContract.thirdPartInfo.purchaseServiceFeeRate == '') {
        CloudToast.show('请填写买方服务费');
        return false;
      }
    } else if (widget.carSaleContract.thirdPartInfo.kind == 3) {
      if (widget.carSaleContract.thirdPartInfo.storeId == 0) {
        CloudToast.show('请填写门店信息');
        return false;
      }
      if (widget.carSaleContract.thirdPartInfo.saleServiceFeeRate == '') {
        CloudToast.show('请填写卖方服务费');
        return false;
      }
      if (widget.carSaleContract.thirdPartInfo.purchaseServiceFeeRate == '') {
        CloudToast.show('请填写买方服务费');
        return false;
      }
    }
    return true;
  }

  getChooseList(
      Function(String, int) callBack, List models, List<int> choices) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        ...models
            .mapIndexed((currentValue, index) => GestureDetector(
                  onTap: () {
                    if (choices.contains(index)) {
                      choices.clear();
                      choices.remove(index);
                    } else {
                      choices.clear();
                      choices.add(index);
                    }
                    setState(() {});
                    callBack(models[choices.first], choices.first + 1);
                  },
                  child: Container(
                    width: currentValue == "云云问车" ? 227.w : 137.w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        BeeCheckRadio(
                          // according: !(widget.carSaleContract.thirdPartInfo.kind !=0),
                          value:index,////widget.carSaleContract.thirdPartInfo.kind !=0?  widget.carSaleContract.thirdPartInfo.kind:index,/// widget.carSaleContract.thirdPartInfo.kind !=0?  widget.carSaleContract.thirdPartInfo.kind:index,
                          groupValue: choices,
                        ),
                        16.wb,
                        SizedBox(
                          width: currentValue == "云云问车" ? 170.w : 80.w,
                          child: Text(
                            currentValue,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }

  // _priceInfo(){
  //   var transactionAmount = EditItemWidget(
  //     topIcon: false,
  //     title: '成交价',
  //     paddingStart: 0.w,
  //     tips: '请输入',
  //     controller: transactionAmountController,
  //     endText: '元',
  //     inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
  //     callback: (text){
  //
  //
  //     },
  //   );
  //   return Column(
  //     children: [
  //       transactionAmount,
  //       _function(
  //         '选择门店',
  //             () async {
  //
  //           setState(() {});
  //         },
  //        "111111111",
  //         '请选择',
  //       ),
  //
  //     ],
  //   );
  // }
  _function(String title, VoidCallback onTap, String? content, String msg,TextEditingController? controller,
      {bool topIcon = true}) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: EditItemWidget(
          title: title,
          controller: controller,
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
