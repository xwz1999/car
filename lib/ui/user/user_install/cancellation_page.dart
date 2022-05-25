// ignore_for_file: unused_element

import 'package:cloud_car/ui/user/user_install/validation_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';

class CancellationPage extends StatefulWidget {
  const CancellationPage({super.key});

  @override
  _CancellationPageState createState() => _CancellationPageState();
}

class _CancellationPageState extends State<CancellationPage> {
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
          title: Text('注销账号',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: kForeGroundColor, //内容颜色
        extendBody: true,
        body: SizedBox(
          width: 750.w,
          child: Column(
            children: [
              98.hb,
              _getWarning(),
              40.hb,
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 50.w)),
                  _getBody(),
                  // SizedBox(
                  //   width: 50.w,
                  // )
                ],
              ),
              const Spacer(),
              CloudBottomButton(
                  text: '我了解风险,下一步',
                  onTap: () {
                    Get.to(() => const ValidationPage());
                  }),
              32.hb,
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
  _getWarning() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 72.w,
          height: 72.w,
          child: Image.asset(
            Assets.icons.warning1.path,
            fit: BoxFit.fill,
          ),
        ),
        40.hb,
        Text(
          '重要提醒',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: 36.sp,
              color: const Color(0xFF111111),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

//
  _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '账号被注销后，如下信息将被清空且无法找回',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        32.hb,
        SizedBox(
          width: 300.w,

          // child: Text(
          // '',
          // style: Theme.of(context)
          //     .textTheme
          //     .subtitle2
          //     ?.copyWith(color: const Color(0xff666666)),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Padding(padding: EdgeInsets.symmetric(vertical: 20.w)),
              _getText('1、账号内公司相关信息'),
              20.hb,
              _getText('2、发布车辆信息'),
              20.hb,
              _getText('3、邀请客户信息'),
              20.hb,
              _getText('4、成交合同数据 '),
              20.hb,
              _getText('5、钱包余额'),
              20.hb,
              _getText('6、绑定银行卡信息')
            ],
          ),
        )
      ],
    );
  }

//
//
  _getText(String text) {
    return SizedBox(
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: const Color(0xFF666666)),
      ),
    );
  }
}
