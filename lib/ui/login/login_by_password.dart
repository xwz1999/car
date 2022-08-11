import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginByPassword extends StatefulWidget {
  const LoginByPassword({Key? key}) : super(key: key);

  @override
  _LoginByPasswordState createState() => _LoginByPasswordState();
}

class _LoginByPasswordState extends State<LoginByPassword> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
      title: '账号登录',
      barHeight: 88.w,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              250.hb,
              Image.asset(
                Assets.images.loginBg.path,
                width: 308.w,
                height: 60.w,
              ),
              120.hb,
              SizedBox(
                width: 600.w,
                child: TextField(
                  controller: _accountController,
                  decoration: InputDecoration(
                      hintText: '输入账号',
                      hintStyle: TextStyle(
                        fontSize: 36.sp,
                        color: const Color(0xFF999999),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12))),
                ),
              ),
              30.hb,
              SizedBox(
                width: 600.w,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: '输入密码',
                      hintStyle: TextStyle(
                        fontSize: 36.sp,
                        color: const Color(0xFF999999),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12))),
                ),
              ),
              48.hb,
              CloudBottomButton(
                onTap: () async {
                  var cancel = CloudToast.loading;
                  if (!RegexUtil.isMobileSimple(_accountController.text)) {
                    CloudToast.show('手机号错误');
                    cancel();
                    return;
                  }
                  await apiClient.request(API.login.smsCode, data: {
                    'phone': _accountController.text,
                  });

                  var res =
                      await apiClient.request(API.login.smsCodeLogin, data: {
                    'phone': _accountController.text,
                    'code': _passwordController.text,
                  });

                  if (res.code == 0) {
                    await UserTool.userProvider.setToken(res.data['token']);
                    Get.offAll(() => const TabNavigator());
                  } else {
                    CloudToast.show(res.msg);
                  }
                  cancel();
                },
                text: '提交',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
