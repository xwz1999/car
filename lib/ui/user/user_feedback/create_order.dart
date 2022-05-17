import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Text(
              '怎么创建订单',
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: const Color(0xFF111111), fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          Container(
              height: 520.w,
              color: kForeGroundColor,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      child: Flexible(
                    child: Text(
                      '请点击【工作台】-【客户管理】客户详情页面右下角，点击“发起合同”即为订单生成。同样，创建订单入口在【工作台】-【车辆管理】中也可以以“出售”车辆形式生成合同，完成订单创建。以上为建议方案，若未能解决，请直接在此处输入您的详细问题。',
                      style: TextStyle(
                        color: BaseStyle.color999999,
                        fontSize: BaseStyle.fontSize24,
                        //height: 24.sp
                      ),
                    ),
                  )),
                  108.hb,
                  DottedBorder(
                      dashPattern: const [16, 8],
                      strokeWidth: 4.w,
                      color: const Color(0xFFDDDDDD),
                      radius: Radius.circular(8.w),
                      child: SizedBox(
                        width: 200.w,
                        height: 150.w,

                        //padding: EdgeInsets.all(76.w),
                        child: GestureDetector(
                          child: Stack(children: [
                            Align(
                              child: Container(
                                width: 48.w,
                                height: 2.w,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 4.w),
                                    color: const Color(0xFFDDDDDD),
                                    borderRadius: BorderRadius.circular(1.4.w)),
                              ),
                            ),
                            Positioned(
                              left: 100.w,
                              top: 48.w,
                              child: Container(
                                width: 2.w,
                                height: 48.w,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 4.w),
                                    color: const Color(0xFFDDDDDD),
                                    borderRadius: BorderRadius.circular(1.4.w)),
                              ),
                            )
                          ]),
                        ),
                      ))
                ],
              )),
          32.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Text(
              '联系方式',
              style: TextStyle(
                  color: const Color(0xFF111111),
                  fontSize: BaseStyle.fontSize28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          24.hb,
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              onEditingComplete: () {
                setState(() {});
                // _refreshController.callRefresh();
              },
              onChanged: (text) {
                setState(() {});
              },
              style: TextStyle(
                color: BaseStyle.color333333,
                fontSize: BaseStyle.fontSize28,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 32.w),
                filled: true,
                fillColor: Colors.white,
                hintText: "请输入您的手机号码方便联系",
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                border: InputBorder.none,
              ),
            ),
          ),
          96.hb,
          CloudBottomButton(
            onTap: () {},
            text: '提交',
          ),
        ],
      ),
    );
  }
}
