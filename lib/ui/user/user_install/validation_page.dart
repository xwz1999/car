import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/ui/login/login_page.dart';
import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/cloud_phone_text_field_widget.dart';
import 'package:cloud_car/widget/cloud_sms_code_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  List<dynamic>? data;
  bool _getCodeEnable = false;

  ///时间倒计数值
  late TextEditingController _phoneController;
  late TextEditingController _smsCodeController;
  final FocusNode _phoneFocusNode = FocusNode();
  late FocusNode _smsCodeFocusNode;
  bool _loginEnable = false;

  @override
  void initState() {
    super.initState();

    _smsCodeFocusNode = FocusNode();
    _phoneController = TextEditingController();
    _smsCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _smsCodeFocusNode.dispose();
    _phoneController.dispose();
    _smsCodeController.dispose();
    _phoneFocusNode.dispose();
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
        ),
        backgroundColor: kForeGroundColor, //内容颜色
        extendBody: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              72.hb,
              Text(
                '请先验证身份',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontSize: 48.w),
              ),
              54.hb,
              CloudPhoneTextFieldWidget(
                  controller: _phoneController,
                  focusNode: _phoneFocusNode,
                  onChange: (phone) {
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
                    setState(() {});
                  }),
              20.hb,
              CloudSmsCodeWidget(
                onChange: (code) {
                  setState(() {
                    _loginEnable = _verifyLoginEnable();
                  });
                },
                controller: _smsCodeController,
                focusNode: _smsCodeFocusNode,
                phone: _phoneController.text,
                getCodeEnable: _getCodeEnable,
              ),
              94.hb,
              CloudBottomButton(
                  text: '提交',
                  onTap: () {
                    Get.to(() => SuccessFailurePage(
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
                                onTap: () async {
                                  var cancel = CloudToast.loading;
                                  var res =
                                      await apiClient.request(API.user.logOff,data: {'code':_smsCodeController.text});
                                  if (res.code == 0) {
                                    UserTool.userProvider.cleanToken();
                                    Get.offAll(() => const LoginPage());
                                  } else {
                                    CloudToast.show(res.msg);
                                  }
                                  cancel();
                                },
                              ),
                            ],
                          ),
                        ));
                  })
            ],
          ),
        ));
  }

  _verifyLoginEnable() {
    if (!TextUtils.verifyPhone(_phoneController.text)) {
      setState(() {});
      return false;
    }
    return _smsCodeController.text.length == 6;
  }
}
