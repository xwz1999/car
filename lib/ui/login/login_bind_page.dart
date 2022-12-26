
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
import '../boot_page.dart';

class LoginBindPage extends StatefulWidget {
  final String token;
  final int bindType; // 1 = 微信 2 = 苹果

  const LoginBindPage({super.key, required this.token, required this.bindType});

  @override
  _LoginBindPageState createState() => _LoginBindPageState();
}

class _LoginBindPageState extends State<LoginBindPage> {
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
        child: ListView(
          children: [
            250.hb,
            Center(
              child: Text(
                '${widget.bindType == 1 ? '微信' : '苹果'}账号绑定手机号',
                style: TextStyle(
                    color: BaseStyle.color333333,
                    fontSize: BaseStyle.fontSize48),
              ),
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
              controller: _smsCodeController,
              focusNode: _smsCodeFocusNode,
              onChange: (code) {
                setState(() {
                  _loginEnable = _verifyLoginEnable();
                });
              },
              getCodeEnable: _getCodeEnable,
              phone: _phoneController.text,
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
                  var base = await apiClient.request(
                      widget.bindType == 1
                          ? API.login.weixinBind
                          : API.login.appleBind,
                      data: {
                        'phone': _phoneController.text,
                        'code': _smsCodeController.text,
                        'bindToken': widget.token,
                        'inviteCode': '',
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
                  '提       交',
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
