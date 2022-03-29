import 'package:cloud_car/ui/user/user_install/cancellation_account.dart';
import 'package:cloud_car/ui/user/user_install/validation.dart';
import 'package:cloud_car/utils/headers.dart';

import 'package:cloud_car/widget/cloud_back_button.dart';

import 'package:flutter/material.dart';

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
              //976.hb,
              _getBottom(),
              24.hb,
              Padding(
                padding: EdgeInsets.only(
                  right: 30.w,
                ),
                child: Text(
                  '若您仍选择注销，则视为放弃上述内容',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: const Color(0xFFAAAAAA)),
                ),
              )
            ],
          ),
        )

        // Column(
        //   color: Colors.red,

        //   children[],

        // ))
        );
  }

//

//

//底部按钮
  _getBottom() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const CancellationAccountPage());
      },
      child: Container(
        width: 686.w,
        height: 72.w,
        padding: EdgeInsets.only(left: 218.w, top: 22.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF0593FF), Color(0xFF027AFF)])),
        child: SizedBox(
          width: 252.w,
          height: 28.w,
          child: Text(
            '我了解风险，下一步',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: const Color(0xffffffff)),
          ),
        ),
      ),
    );
  }
}
