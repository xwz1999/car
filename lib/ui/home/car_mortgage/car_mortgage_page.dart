import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_mortgage/car_mortgage_result_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_picker_box.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_item_widget.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:flutter/material.dart';

import 'choose_time_widget.dart';

///车辆按揭
class CarMortgagePage extends StatefulWidget {
  const CarMortgagePage({super.key});

  @override
  _CarMortgagePageState createState() => _CarMortgagePageState();
}

class _CarMortgagePageState extends State<CarMortgagePage> {

  bool chooseOne = true;
  num? loanAmount;
  num? loanTerm;
  num? interestRate;
  String? repaymentMethod;


  List<PayWay> payWayLists = [
    const PayWay(title: '等额本息', describe: '月供每月相同，本金逐月递增，利息逐月增加', id: '等额本息'),
    const PayWay(title: '等额本金', describe: '月供逐月递减，本金每月相同，利息逐月递减', id: '等额本金'),
    const PayWay(title: '等额等息', describe: '月供、本金、利息每月相同', id: '等额等息'),
    const PayWay(title: '先息后本', describe: '每月还固定利息，到期还全部本金', id: '先息后本'),
    const PayWay(title: '到期本息', describe: '到期一次性还清全部本金和利息', id: '到期本息'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: Colors.white,
        title: Text(
          '车贷计算器',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Container(
            color: const Color(0xFFF9F9F9),
            height: 16.w,
            width: double.infinity,
          ),
          EditItemWidget(
            paddingTop: 30.w,
            keyboardType:TextInputType.number,
            title: '贷款金额',
            value: loanAmount==null?'': loanAmount.toString(),
            callback: (String content) {
              loanAmount = double.parse(content);
              setState(() {

              });
            },
            endText: '万元',
            canChange: true,
            tips: '限制1000万以内',
          ),
          30.hb,
          Divider(
            endIndent: 16.w,
            indent: 16.w,
            height: 1.w,
            color: const Color(0xFFE8E8E8),
          ),
          EditItemWidget(
            keyboardType:TextInputType.number,
            paddingTop: 30.w,
            title: '贷款期限',
            value: loanTerm==null?'': loanTerm.toString(),
            callback: (String content) {
              loanTerm = double.parse(content);
              setState(() {

              });
            },
            canChange: true,
            tips: '限制600月以内',
            endIcon: ChooseTimeWidget(
                first: '月',
                second: '天',
                callBack: (String text) {
                  print(text);
                }),
          ),
          30.hb,
          Divider(
            endIndent: 16.w,
            indent: 16.w,
            height: 2.w,
            color: const Color(0xFFE8E8E8),
          ),
          EditItemWidget(
            paddingTop: 30.w,
            keyboardType:TextInputType.number,
            title: '利率',
            value: interestRate==null?'': interestRate.toString(),
            callback: (String content) {
              interestRate = double.parse(content);
              setState(() {

              });

            },
            endIcon: Row(
              children: [
                Text(
                  '%',
                  style: TextStyle(
                      color: const Color(0xFF999999), fontSize: 28.sp),
                ),
                15.wb,
                ChooseTimeWidget(
                    first: '年',
                    second: '日',
                    callBack: (String text) {
                      print(text);
                    }),
              ],
            ),
            canChange: true,
            tips: '限50字以内',
          ),
          30.hb,
          Divider(
            endIndent: 16.w,
            indent: 16.w,
            height: 1.w,
            color: const Color(0xFFE8E8E8),
          ),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudListPickerItemWidget(
                      title: '还款方式',
                      items: payWayLists,
                      onConfirm: (str, index) {
                        repaymentMethod = str.id;
                        Get.back();
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                      });
                },
              );
            },
            child: EditItemWidget(
              title: '还款方式',
              value: repaymentMethod??'',
              callback: (String content) {


              },
              endText: '万元',
              canChange: false,
              tips: '请选择还款方式',
            ),
          ),
          80.hb,
          Container(
            width: double.infinity,
            height: 84.w,
            color: kForeGroundColor,
            child: GestureDetector(
              onTap: () async {
                Get.to(()=>const CarMortgageResultPage());
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
                  '开始计算',
                  style: TextStyle(
                      color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
                ),
              ),
            ),
          ),
          32.hb,
          Container(
            width: double.infinity,
            height: 84.w,
            color: kForeGroundColor,
            child: GestureDetector(
              onTap: () async {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                padding: EdgeInsets.symmetric(vertical: 16.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8.w)),
                ),
                child: Text(
                  '重置',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: BaseStyle.fontSize28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PayWay{
  final String title;
  final String describe;
  final String id;

  const PayWay({
    required this.title,
    required this.describe,
    required this.id,
  });
}
