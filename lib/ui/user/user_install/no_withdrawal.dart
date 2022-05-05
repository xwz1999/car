import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/user_tool.dart';
import '../../../widget/button/cloud_back_button.dart';

class NoWithddrawalPage extends StatefulWidget {
  const NoWithddrawalPage({Key? key}) : super(key: key);

  @override
  _NoWithddrawalPageState createState() => _NoWithddrawalPageState();
}

class _NoWithddrawalPageState extends State<NoWithddrawalPage> {
  List<dynamic>? data;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor, //头部颜色
          title: Text('钱包余额为提现',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: kForeGroundColor, //内容颜色
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
            width: 750.w,
            padding: EdgeInsets.only(left: 32.w),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Text(
                    '建议您处理完以下事项后在注销',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: const Color(0xFF111111),
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                40.hb,
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Row(
                    children: [
                      56.wb,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: '账号余额未提现',
                                style: TextStyle(
                                    fontSize: 12 * 2.sp,
                                    color: BaseStyle.color333333)),
                            TextSpan(
                                text: '（¥1,000.00元）',
                                style: TextStyle(
                                    fontSize: 12 * 2.sp,
                                    color: BaseStyle.color333333))
                          ])),
                          24.hb,
                          GestureDetector(
                            child: Text(
                              '去处理>',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(color: const Color(0xFF027AFF)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CloudBottomButton(
                  text: '我了解分险,下一步',
                  onTap: () {
                    Get.to(() => SuccessFailure(
                          conditions: false,
                          headline: '注销账号',
                          body: Column(children: [
                            Text(
                              '是否确定注销该账号',
                              style: TextStyle(
                                  fontSize: BaseStyle.fontSize40,
                                  color: BaseStyle.color333333),
                            ),
                            32.hb,
                            Text(
                              '当前账号: ${UserTool.userProvider.userInfo.nickname}',
                              style: TextStyle(
                                  fontSize: BaseStyle.fontSize24,
                                  color: BaseStyle.color333333),
                            )
                          ]),
                          bottom: Column(
                            children: [
                              CloudBottomButton(
                                text: '注销',
                                onTap: () {},
                              ),
                              Text(
                                '若您仍选择注销,则视为放弃上述内容',
                                style: TextStyle(
                                    color: const Color(0xFFAAAAAA),
                                    fontSize: BaseStyle.fontSize24),
                              )
                            ],
                          ),
                        ));
                  },
                ),
                24.hb,
                Padding(
                  padding: EdgeInsets.only(
                    right: 30.w,
                  ),
                  child: Text(
                    '若您仍选择注销，则视为放弃上述内容',
                    style: TextStyle(
                        color: const Color(0xFFAAAAAA),
                        fontSize: BaseStyle.fontSize24),
                  ),
                ),
                32.hb,
              ],
            )

            // Column(
            //   color: Colors.red,

            //   children[],

            // ))
            ));
  }
}
