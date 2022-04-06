import 'package:cloud_car/ui/user/user_feedback/Product_recommendations.dart';
import 'package:cloud_car/ui/user/user_feedback/create_order.dart';
import 'package:cloud_car/ui/user/user_feedback/problem_feedback.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('产品手册',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 16.w)),
          Container(
            height: 224.w,
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            color: kForeGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                28.hb,
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Text(
                    '反馈中心',
                    style: TextStyle(
                        color: const Color(0xFF110000),
                        fontSize: BaseStyle.fontSize28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                24.hb,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ProblemFeedback());
                      },
                      child: Column(
                        children: [
                          SizedBox(
                              width: 80.w,
                              height: 80.w,
                              //padding: EdgeInsets.all(14.w),
                              child: Image.asset(
                                Assets.icons.advice.path,
                                fit: BoxFit.fill,
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 0.w),
                            child: Text(
                              '问题反馈',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                    ),
                    80.wb,
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Recommendations());
                      },
                      child: Column(
                        children: [
                          SizedBox(
                              width: 80.w,
                              height: 80.w,
                              //padding: EdgeInsets.all(14.w),
                              child: Image.asset(
                                Assets.icons.feedback.path,
                                fit: BoxFit.fill,
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 0.w),
                            child: Text(
                              '产品建议',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          16.hb,
          Container(
            color: kForeGroundColor,
            width: 750.w,
            child:
                //padding: EdgeInsets.symmetric(horizontal: 32.w),
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                28.hb,
                Padding(
                  padding: EdgeInsets.only(left: 32.w),
                  child: Text(
                    '帮助中心',
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize28,
                        color: const Color(0xFF110000),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 600.w,
                  child: ListView(
                    //padding: EdgeInsets.only(left: 32.w),
                    children: ListTile.divideTiles(
                        context: context,
                        color: BaseStyle.coloreeeeee,
                        tiles: [
                          ListTile(
                            title: Text(
                              '怎么创建订单',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            trailing: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: const Icon(
                                  Icons.keyboard_arrow_right,
                                )),
                            onTap: () {
                              Get.to(() => const CreateOrder());
                            },
                          ),
                          ListTile(
                            title: Text(
                              '订单成交后在哪里查看合同',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            trailing: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: const Icon(
                                  Icons.keyboard_arrow_right,
                                )),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              '怎么添加客户',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            trailing: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: const Icon(
                                  Icons.keyboard_arrow_right,
                                )),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              '车辆信息为什么修改不了',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            trailing: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: const Icon(
                                  Icons.keyboard_arrow_right,
                                )),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              '怎么提现店铺获利金额',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            trailing: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: const Icon(
                                  Icons.keyboard_arrow_right,
                                )),
                            onTap: () {},
                          ),
                        ]).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
