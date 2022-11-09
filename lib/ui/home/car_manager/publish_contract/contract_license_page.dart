import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/user/user_order/sales_orders_page.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class ContractLicencePage extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;

  const ContractLicencePage({super.key, required this.consignmentContractModel});

  @override
  State<ContractLicencePage> createState() => _ContractLicencePageState();
}

class _ContractLicencePageState extends State<ContractLicencePage> {
  @override
  void initState() {
    super.initState();
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
            Container(
              padding: EdgeInsets.all(30.w),
              child: '牌证信息'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
              color: Colors.white,
              child: showLicense(),
            ),
            Container(
              padding: EdgeInsets.all(30.w),
              child: '服务费'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 34.w,),
              child: const EditItemWidget(
                textColor: Color(0xFF999999),
                title: '服务费比列',
                keyboardType: TextInputType.number,
                value: '5%',
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()async {
                  if (widget.consignmentContractModel.value
                              .commercialInsurance ==
                          null ||
                      widget.consignmentContractModel.value
                              .compulsoryInsurance ==
                          null) {
                    CloudToast.show('请先完善牌证信息');
                  } else {
                    // Get.to(() => ContactCondition(
                    //       consignmentContractModel:
                    //           widget.consignmentContractModel,
                    //     ));

                    widget.consignmentContractModel.value.serviceFeeRate = '0.05';

                    var cancel = CloudToast.loading;
                    widget.consignmentContractModel.value.masterInfo
                        .idCardBack =
                        await apiClient.uploadImage(widget
                        .consignmentContractModel.value.idBack!.first);

                    widget.consignmentContractModel.value.masterInfo
                        .idCardFront =
                        await apiClient.uploadImage(widget
                        .consignmentContractModel.value.idFront!.first);

                    // widget.consignmentContractModel.value.masterInfo.photo =
                    //     await apiClient.uploadImage(
                    //         widget.consignmentContractModel.value.bust!.first);

                    bool success = await CarFunc.addConsignment(
                        widget.consignmentContractModel.value);
                    cancel();

                    if (success) {
                      CloudToast.show('合同发布成功');
                      Get.offUntil(
                          GetPageRoute(
                              page: () =>
                              const SalesOrderPage(orderType: OrderType.personal)),
                              (route) =>
                          (route as GetPageRoute).routeName ==
                              '/TabNavigator');

                      ///关闭估价和发布合同的所有页面 跳转到寄卖订单列表

                    } else {
                      CloudToast.show('合同发布失败');
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '发起合同'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingOnly(left: 30.w, right: 30.w),
          ],
        ),
      ),
    );
  }

  _showSelect(
    int select,
    String title,
    Function(int choose) callBack,
  ) {
    return Container(
      padding: EdgeInsets.only(
        top: 30.w,bottom: 30.w
      ),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border:  Border(bottom:  BorderSide(color: const Color(0xFFF6F6F6),width: 2.w))
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Text(
              '*  ',
              style: TextStyle(
                fontSize: 32.sp,
                color: const Color(0xFFE62222),
              ),
            ),
          ),
          SizedBox(
            width: 180.w,
            child: title.text
                .size(32.sp)
                .color( const Color(0xFF999999))
                .make(),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (select == 1) {
                    select = -1;
                  } else {
                    select = 1;
                  }
                  setState(() {});
                  callBack(select);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50.w,
                        height: 50.w,
                        padding: EdgeInsets.only(top: 6.w, right: 5.w),
                        child: !(select == 1)
                            ? const Icon(CupertinoIcons.circle,
                                size: 18, color: Color(0xFFdddddd))
                            : const Icon(
                                CupertinoIcons.checkmark_alt_circle_fill,
                                size: 18,
                                color: Colors.blue)),
                    RichText(
                      text: TextSpan(
                        text: "有",
                        style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      ),
                    ),
                  ],
                ),
              ),
              30.widthBox,
              GestureDetector(
                onTap: () {
                  if (select == 0) {
                    select = -1;
                  } else {
                    select = 0;
                  }
                  setState(() {});
                  callBack(select);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50.w,
                        height: 50.w,
                        padding: EdgeInsets.only(top: 6.w, right: 5.w),
                        child: select == 1 || select == -1
                            ? const Icon(CupertinoIcons.circle,
                                size: 18, color: Color(0xFFdddddd))
                            : const Icon(
                                CupertinoIcons.checkmark_alt_circle_fill,
                                size: 18,
                                color: Colors.blue)),
                    RichText(
                      text: TextSpan(
                        text: "无",
                        style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column showLicense() {
    return Column(
      children: [
        EditItemWidget(
          titleColor: const Color(0xFF999999),
          topIcon: false,
          title: '过户次数',
          endText: '次',
          keyboardType: TextInputType.number,
          value: widget.consignmentContractModel.value.transferNum == null
              ? ''
              : widget.consignmentContractModel.value.transferNum.toString(),
          callback: (String content) {
            widget.consignmentContractModel.value.transferNum =
                int.parse(content);
          },
        ),
        EditItemWidget(
          titleColor: const Color(0xFF999999),
          topIcon: false,
          title: '钥匙数量',
          endText: '把',
          keyboardType: TextInputType.number,
          value: widget.consignmentContractModel.value.keyCount == null
              ? ''
              : widget.consignmentContractModel.value.keyCount.toString(),
          callback: (String content) {
            widget.consignmentContractModel.value.keyCount = int.parse(content);
          },
        ),
        _showSelect(
            widget.consignmentContractModel.value.compulsoryInsurance ?? -1,
            '交强险', (choose) {
          FocusManager.instance.primaryFocus?.unfocus();
          if (choose != -1) {
            widget.consignmentContractModel.value.compulsoryInsurance = choose;
          } else {
            widget.consignmentContractModel.value.compulsoryInsurance = null;
          }

          setState(() {});
        }),
        GestureDetector(
          onTap: () async {
            DateTime? firstDate;
            firstDate = await CarDatePicker.pick(DateTime.now());
            widget.consignmentContractModel.value.compulsoryInsuranceDate =
                DateUtil.formatDate(firstDate, format: 'yyyy-MM-dd');
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                border:  Border(bottom:  BorderSide(color: const Color(0xFFF6F6F6),width: 2.w))
            ),
            padding: EdgeInsets.only(top: 30.w, left: 30.w,bottom: 30.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180.w,
                  child: Text('交强险到期',
                      style: TextStyle(
                        color: BaseStyle.color999999,
                        fontSize: BaseStyle.fontSize32,
                      )),
                ),
                Expanded(
                  child: Text(
                      widget.consignmentContractModel.value
                              .compulsoryInsuranceDate!.isEmpty
                          ? '请选择日期'
                          : widget.consignmentContractModel.value
                              .compulsoryInsuranceDate!,
                      style: widget.consignmentContractModel.value
                                  .compulsoryInsuranceDate !=
                              ''
                          ? Theme.of(context).textTheme.subtitle2
                          : TextStyle(
                              fontSize: 28.sp, color: const Color(0xFFCCCCCC))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.w),
                  child: Icon(
                    CupertinoIcons.chevron_forward,
                    size: 40.w,
                    color: BaseStyle.color666666,
                  ),
                )
              ],
            ),
          ),
        ),
        _showSelect(
            widget.consignmentContractModel.value.commercialInsurance ?? -1,
            '商业险', (choose) {
          FocusManager.instance.primaryFocus?.unfocus();
          if (choose != -1) {
            widget.consignmentContractModel.value.commercialInsurance = choose;
          } else {
            widget.consignmentContractModel.value.commercialInsurance = null;
          }

          setState(() {});
        }),
        GestureDetector(
          onTap: () async {
            DateTime? firstDate;
            firstDate = await CarDatePicker.pick(DateTime.now());
            widget.consignmentContractModel.value.commercialInsuranceDate =
                DateUtil.formatDate(firstDate, format: 'yyyy-MM-dd');
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.only(top: 30.w, left: 25.w,bottom: 30.w),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border:  Border(bottom:  BorderSide(color: const Color(0xFFF6F6F6),width: 2.w))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180.w,
                  child: Text('商业险到期',
                      style: TextStyle(
                        color: BaseStyle.color999999,
                        fontSize: BaseStyle.fontSize32,
                      )),
                ),

                Expanded(
                  child: Text(
                      widget.consignmentContractModel.value
                              .commercialInsuranceDate!.isEmpty
                          ? '请选择日期'
                          : widget.consignmentContractModel.value
                              .commercialInsuranceDate!,
                      style: widget.consignmentContractModel.value
                                  .commercialInsuranceDate !=
                              ''
                          ? Theme.of(context).textTheme.subtitle2
                          : TextStyle(
                              fontSize: 28.sp, color: const Color(0xFFCCCCCC))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.w),
                  child: Icon(
                    CupertinoIcons.chevron_forward,
                    size: 40.w,
                    color: BaseStyle.color666666,
                  ),
                )
              ],
            ),
          ),
        ),
        EditItemWidget(
          titleColor: const Color(0xFF999999),
          topIcon: false,
          title: '商业险金额',
          endText: '元',
          value:
              widget.consignmentContractModel.value.commercialInsurancePrice ??
                  "",
          callback: (String content) {
            widget.consignmentContractModel.value.commercialInsurancePrice =
                content;
          },
        ),

      ],
    );
  }
}
