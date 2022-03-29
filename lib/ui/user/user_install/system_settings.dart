import 'package:cloud_car/ui/user/user_install/Bank_card.dart';
import 'package:cloud_car/ui/user/user_install/cancellation.dart';
import 'package:cloud_car/ui/user/user_install/enterprise_information.dart';
import 'package:cloud_car/ui/user/user_install/real_name.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InatallPage extends StatefulWidget {
  const InatallPage({Key? key}) : super(key: key);

  @override
  _InatallPageState createState() => _InatallPageState();
}

class _InatallPageState extends State<InatallPage> {
  List<dynamic>? data;
  List list = [
    {'title': '企业信息'},
    {'title': '认证身份'},
    {'title': '我的银行卡'},
  ];
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
          backgroundColor: kForeGroundColor,
          title: Text('系统设置',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: BodyColor,
        extendBody: true,
        body: Column(
          children: [
            16.hb,
            _getView(),
            24.hb,
            _getbottom(),
            24.hb,
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 204.w)),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '不再使用云云问车了？',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: const Color(0xFFAAAAAA))),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          Get.to(() => const CancellationPage());
                        }),
                      text: '注销账号',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: const Color(0xFF027AFF)))
                ]))
              ],
            )
          ],
        ));
  }

//按钮
  _getbottom() {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 312.w, vertical: 32.w),
          height: 96.w,
          color: Colors.white,
          child: Text(
            '退出登录',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: const Color(0xFF027AFF)),
          )),
    );
  }

  ///
  _getView() {
    return Container(
      height: 390.w,
      color: Colors.white,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 16.w),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _getList(list[index]);
        },
        separatorBuilder: (context, index) => const Divider(
          height: 1.0,
          color: Color(0xFFEEEEEE),
        ),
      ),
    );
  }

//列表
  _getList(item) {
    return ListTile(
      onTap: () {
        switch (item['title']) {
          case '企业信息':
            Get.to(() => const EnterpriseInformationPage());
            //print("1111111");
            break;
          case '认证身份':
            Get.to(() => const RealNamePage());
            break;
          case '我的银行卡':
            Get.to(() => const BankCardPage());
            break;
        }
      },

      //绘制消息主体
      title: Text(item['title'], style: Theme.of(context).textTheme.subtitle2),

      trailing: const Icon(Icons.keyboard_arrow_right),
      //contentPadding: ,
    );
  }

//

}
