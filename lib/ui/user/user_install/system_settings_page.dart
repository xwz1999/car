import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/ui/login/login_page.dart';
import 'package:cloud_car/ui/user/user_install/bank_card_page.dart';
import 'package:cloud_car/ui/user/user_install/cancellation_page.dart';
import 'package:cloud_car/ui/user/user_install/enterprise_information_page.dart';
import 'package:cloud_car/ui/user/user_install/real_name_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';

class SystemSettingPage extends StatefulWidget {
  const SystemSettingPage({super.key});

  @override
  _SystemSettingPageState createState() => _SystemSettingPageState();
}

class _SystemSettingPageState extends State<SystemSettingPage> {
  List<dynamic>? data;
  List list = [
    {'title': '企业信息'},
    // {'title': '认证身份'},
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
        backgroundColor: bodyColor,
        extendBody: true,
        body: Column(
          children: [
            16.hb,
            getView(),
            24.hb,
            getBottom(),
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
  getBottom() {
    return GestureDetector(
      onTap: () async {
        var cancel = CloudToast.loading;
        var base = await apiClient.request(API.login.logout, showMessage: true);
        if (base.code == 0) {
          UserTool.userProvider.logout();
          Get.offAll(const LoginPage());
        }
        cancel();
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 28.w),
          color: Colors.white,
          child: Text(
            '退出登陆',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: const Color(0xFF027AFF)),
          )),
    );
  }

  ///
  getView() {
    return ColoredBox(
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
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
    return GestureDetector(
      onTap: () {
        switch (item['title']) {
          case '企业信息':
            Get.to(() => const EnterpriseInformationPage());
            break;
          case '认证身份':
            Get.to(() => const RealNamePage());
            break;
          case '我的银行卡':
            Get.to(() => const BankCardPage());
            break;
        }
      },
      child: Container(
          height: 92.w,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              32.wb,
              Text(item['title'], style: Theme.of(context).textTheme.subtitle2),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right),
              32.wb,
            ],
          )),
    );
  }

//

}
