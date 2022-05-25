import 'package:cloud_car/model/car/car_sale_contract_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_contract/initiate_contract_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

typedef TextCallback = Function(String content);

class SellCarOrderThirdPage extends StatefulWidget {
  final ValueNotifier<InitiateContractModel> contractModel;

  const SellCarOrderThirdPage({super.key, required this.contractModel});

  @override
  _SellCarOrderThirdPageState createState() => _SellCarOrderThirdPageState();
}

class _SellCarOrderThirdPageState extends State<SellCarOrderThirdPage> {
  late TextEditingController _editingController;

  late TextEditingController _editingController2;

  @override
  void initState() {
    _editingController = TextEditingController();
    _editingController2 = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _editingController2.dispose();
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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          8.hb,
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Container(
              width: double.infinity,
              color: kForeGroundColor,
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 24.w, bottom: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarItemWidget(
                    widgetPadding: EdgeInsets.zero,
                    name: widget.contractModel.value.carModel!.modelName,
                    time: DateUtil.formatDateMs(
                        widget.contractModel.value.carModel!.licensingDate
                                .toInt() *
                            1000,
                        format: 'yyyy年MM月'),
                    distance:
                        '${widget.contractModel.value.carModel!.mileage}万公里',
                    //standard: '国六',
                    url: widget.contractModel.value.carModel!.mainPhoto,
                    price: NumUtil.divide(
                            num.parse(
                                widget.contractModel.value.carModel!.price),
                            10000)
                        .toString(),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 12.w),
            child: Text(
              '销售信息',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: BaseStyle.color111111, fontWeight: FontWeight.bold),
            ),
          ),
          20.hb,
          Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getContentItem(
                    '成交价', widget.contractModel.value.carModel!.price,
                    endText: '元', isSpecial: true),

                getContentItem(
                    '定金', widget.contractModel.value.carAmountModel!.deposit,
                    endText: '元', isSpecial: true, topIcon: false),

                getContentItem('首付',
                    widget.contractModel.value.carAmountModel!.downPayment,
                    endText: '元', isSpecial: true, topIcon: false),

                getContentItem('尾款',
                    widget.contractModel.value.carAmountModel!.balancePayment,
                    endText: '元', isSpecial: true, topIcon: false),

                getContentItem('服务费比例',
                    '${double.parse(widget.contractModel.value.carAmountModel!.serviceFeeRate) * 100}%',
                    isGrey: true, isSpecial: true),

                // getContentItem('付款方式','全款',),
                //
                // getContentItem('过户方式','本地',),
                30.hb,
              ],
            ),
          ),
          20.hb,
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 12.w),
            child: Text(
              '客户信息',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: BaseStyle.color111111, fontWeight: FontWeight.bold),
            ),
          ),
          20.hb,
          Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getContentItem(
                  '客户',
                  widget.contractModel.value.customerModel!.nickname,
                ),
                getContentItem('手机号', widget.contractModel.value.phone ?? '',
                    isSpecial: true),
                getContentItem(
                  '姓名',
                  widget.contractModel.value.name ?? '',
                ),
                getContentItem('身份证号', widget.contractModel.value.cardNo ?? '',
                    isSpecial: true),
                getContentItem(
                  '客户来源',
                  widget.contractModel.value.origin ?? '',
                ),
                getContentItem(
                  '地址',
                  widget.contractModel.value.address ?? '',
                ),
                getContentItem('所在地', widget.contractModel.value.location ?? '',
                    topIcon: false),
                getContentItem(
                  '付款人',
                  widget.contractModel.value.payer ?? '',
                ),
                getContentItem(
                  '开户行',
                  widget.contractModel.value.bank ?? '',
                ),
                getContentItem(
                  '银行卡号',
                  widget.contractModel.value.bankCard ?? '',
                ),
                getContentItem('备注描述', widget.contractModel.value.remarks ?? '',
                    topIcon: false),
                30.hb,
              ],
            ),
          ),
          30.hb,
          Row(
            children: [
              32.wb,
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    height: 72.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFF027AFF), width: 2.w),
                      borderRadius: BorderRadius.all(Radius.circular(8.w)),
                    ),
                    child: Text(
                      '修改信息',
                      style: TextStyle(
                          color: const Color(0xFF027AFF),
                          fontSize: BaseStyle.fontSize28),
                    ),
                  ),
                ),
              ),
              46.wb,
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Alert.show(
                        context,
                        NormalContentDialog(
                          type: NormalTextDialogType.delete,
                          title: '合同确认',
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              16.hb,
                              Text(
                                '合同信息是否确认无误并发起？',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                          items: const ['取消'],
                          deleteItem: '发起',
                          //监听器
                          listener: (index) {
                            Alert.dismiss(context);
                          },
                          deleteListener: () async {
                            Alert.dismiss(context);
                            await CarFunc.addSale(CarSaleContractModel(
                                    carId:
                                        widget.contractModel.value.carModel!.id,
                                    customerId: widget
                                        .contractModel.value.customerModel!.id,
                                    phone:
                                        widget.contractModel.value.phone ?? '',
                                    idCard:
                                        widget.contractModel.value.name ?? '',
                                    address:
                                        widget.contractModel.value.address ??
                                            '',
                                    openBank:
                                        widget.contractModel.value.bank ?? '',
                                    bankCard:
                                        widget.contractModel.value.bankCard ??
                                            '',
                                    remark:
                                        widget.contractModel.value.remarks ??
                                            '',
                                    name:
                                        widget.contractModel.value.name ?? ''))
                                .then((value) {
                              if (value) {
                                Get.off(() => SuccessFailurePage(
                                    conditions: true,
                                    headline: '卖车合同',
                                    body: Text(
                                      '合同发起成功',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    bottom: CloudBottomButton(
                                      onTap: () {
                                        Get.back();
                                        Get.back();
                                        Get.back();
                                      },
                                      text: '返回汽车详情',
                                    )));
                              } else {
                                CloudToast.show('合同发起失败');
                              }
                            });
                          },
                        ));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    height: 72.w,
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
                          color: kForeGroundColor,
                          fontSize: BaseStyle.fontSize28),
                    ),
                  ),
                ),
              ),
              32.wb,
            ],
          ),
          30.hb,
        ],
      ),
    );
  }

  getContentItem(String title, String content,
      {isSpecial = false,
      String endText = '',
      topIcon = true,
      isGrey = false}) {
    return Padding(
      padding: EdgeInsets.only(top: 30.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topIcon
              ? Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Text(
                    '*  ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: const Color(0xFFE62222),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Text(
                    '*  ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: Colors.transparent,
                    ),
                  ),
                ),
          SizedBox(
            width: 170.w,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xFF999999),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: isSpecial ? 0.w : 0.w),
            child: Text(
              content.isEmpty ? '/' : content,
              style: TextStyle(
                  fontSize: 28.sp,
                  color:
                      isGrey ? BaseStyle.color999999 : BaseStyle.color333333),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )),
          endText.isNotEmpty
              ? Text(
                  endText,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF333333),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
