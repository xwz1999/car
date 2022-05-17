import 'package:cloud_car/ui/user/user_feedback/Product_recommendations.dart';

import 'package:cloud_car/ui/user/user_feedback/problem_feedback.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

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
        title: Text('意见反馈',
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
            height: 210.w,
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
                        Get.to(() => const ProblemFeedback(
                              isTitle: true,
                              title1: '问题描述',
                              text: '请输入您的问题并上传页面截屏可帮助技术人员更快地解决问题',
                            ));
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
                              Get.to(() => const ProblemFeedback(
                                    title1: '怎么创建订单',
                                    text:
                                        '请点击【工作台】-【客户管理】客户详情页面右下角，点击“发起合同”即为订单生成。同样，创建订单入口在【工作台】-【车辆管理】中也可以以“出售”车辆形式生成合同，完成订单创建。以上为建议方案，若未能解决，请直接在此处输入您的详细问题。',
                                  ));
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
                            onTap: () {
                              Get.to(() => const ProblemFeedback(
                                    title1: '订单成交后在哪里查看合同',
                                    text:
                                        '订单成交后，可至【我的】-【查看合同】处查看相关合同文件。以上为建议方案，若未能解决，请直接在此处输入您的详细问题。',
                                  ));
                            },
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
                            onTap: () {
                              Get.to(() => const ProblemFeedback(
                                    title1: '怎么添加客户',
                                    text:
                                        '可至【我的】-【邀请】模块分享客户邀请码，客户使用微信扫描二维码进入云云问车小程序注册成功后即为您的绑定客户。以上为建议方案，若未能解决，请直接在此处输入您的详细问题。',
                                  ));
                            },
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
                            onTap: () {
                              Get.to(() => const ProblemFeedback(
                                    title1: '车辆信息为什么修改不了',
                                    text:
                                        '车辆信息的修改需要经过平台后台审核，若您已经提交相关修改信息，请耐心等待，平台审核通过后即可修改成功。以上为建议方案，若未能解决，请直接在此处输入您的详细问题。',
                                  ));
                            },
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
                            onTap: () {
                              Get.to(() => const ProblemFeedback(
                                    title1: '怎么提现店铺获利金额',
                                    text:
                                        '请点击【我的】-【钱包】进行金额提现，提现前务必进行实名认证并绑定您的提现银行卡号。以上为建议方案，若未能解决，请直接在此处输入您的详细问题。',
                                  ));
                            },
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
