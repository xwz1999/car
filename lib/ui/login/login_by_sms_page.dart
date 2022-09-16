
import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_phone_text_field_widget.dart';
import 'package:cloud_car/widget/cloud_sms_code_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants/api/api.dart';

class LoginBySmsPage extends StatefulWidget {
  const LoginBySmsPage({
    super.key,
  });

  @override
  _LoginBySmsPageState createState() => _LoginBySmsPageState();
}

class _LoginBySmsPageState extends State<LoginBySmsPage> {
  bool _getCodeEnable = false;

  int seconds = 60;
  late TextEditingController _phoneController;
  late TextEditingController _smsCodeController;
  late FocusNode _phoneFocusNode;
  late FocusNode _smsCodeFocusNode;
  bool _loginEnable = false;

  @override
  void initState() {
    super.initState();
    _phoneFocusNode = FocusNode();
    _smsCodeFocusNode = FocusNode();
    _phoneController = TextEditingController();
    _smsCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _smsCodeFocusNode.dispose();
    _phoneController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(),
        backgroundColor: kForeGroundColor,
      ),
      backgroundColor: kForeGroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            250.hb,
            Image.asset(
              Assets.images.loginBg.path,
              width: 308.w,
              height: 60.w,
            ),
            100.hb,
            CloudPhoneTextFieldWidget(
                controller: _phoneController,
                focusNode: _phoneFocusNode,
                onChange: (phone) {
                  setState(() {
                    if (phone.length >= 11) {
                      _getCodeEnable = true;
                      _loginEnable = _verifyLoginEnable();
                    } else {
                      _getCodeEnable = false;
                      _loginEnable = false;
                    }
                    if (kDebugMode) {
                      print(_loginEnable);
                    }
                  });
                }),
            20.hb,
            CloudSmsCodeWidget(
              onChange: (code) {
                setState(() {
                  _loginEnable = _verifyLoginEnable();
                });
              },
              controller: _smsCodeController,
              focusNode: _smsCodeFocusNode, phone: _phoneController.text,getCodeEnable: _getCodeEnable,
            ),
            94.hb,
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                gradient: const LinearGradient(
                    colors: [Color(0xFF0593FF), kPrimaryColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: MaterialButton(
                onPressed: () async {
                  if (!RegexUtil.isMobileSimple(_phoneController.text)) {
                    CloudToast.show('请输入正确的手机号！');
                    return;
                  } else if (_smsCodeController.text.trim().isEmpty) {
                    CloudToast.show('请输入验证码！');
                    return;
                  }
                  var base =
                      await apiClient.request(API.login.smsCodeLogin, data: {
                    'phone': _phoneController.text,
                    'code': _smsCodeController.text,
                  });

                  if (base.code == 0) {
                    UserTool.userProvider.setToken(base.data['token']);
                    Get.offAll(const TabNavigator());
                  } else {
                    CloudToast.show(base.msg);
                  }
                },
                elevation: 0,
                height: 72.w,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w)),
                child: Text(
                  '登      录',
                  style: TextStyle(
                      color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _verifyLoginEnable() {
    if (!TextUtils.verifyPhone(_phoneController.text)) {
      setState(() {});
      return false;
    }
    return _smsCodeController.text.length == 6;
  }
}
