import 'dart:io';

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/login/wx_login_model.dart';
import 'package:cloud_car/ui/login/jverify_error_code.dart';
import 'package:cloud_car/ui/login/wx_login_page.dart';
import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:jverify/jverify.dart';
import 'package:power_logger/power_logger.dart';

import '../../utils/new_work/api_client.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String _operator = '';
  // String _phone = '';
  bool _chooseAgreement = false;

  Map<String, String> simOperator = {
    'CM': '中国移动',
    'CU': '中国联通',
    'CT': '中国电信',
  };

  Future getPrePhone() async {
    var re = await Jverify().preLogin();
    if (kDebugMode) {
      print("预取号${re.toString()}");
    }
  }

  void addJverifyListen() {
    /// 添加 loginAuthSyncApi 接口回调的监听
    Jverify().addLoginAuthCallBackListener((event) async {
      var _result = "监听获取返回数据：[${event.code}] message = ${event.message}";
      if (kDebugMode) {
        print(_result);
      }
      if (event.code == 6000) {
        UserTool.userProvider.setToken(event.message);
        Get.offAll(() => const TabNavigator());
      } else {
        CloudToast.show(JverifyErrorCode.getmsg(event.code));
      }
    });
  }

  void addFluwxListen() {
    fluwx.weChatResponseEventHandler
        .distinct((a, b) => a == b)
        .listen((event) async {
      var res = event as fluwx.WeChatAuthResponse;
      if (kDebugMode) {
        print(
            '微信登录数据返回 code ${res.code} errcode:${res.errCode} ${res.errStr} state: ${res.state} type: ${res.type}');
      }
      switch (res.errCode) {
        case 0:
          var base = await apiClient
              .request(API.login.weixin, data: {'code': res.code});
          if (base.code == 0) {
            var wxLoginResponse = WxLoginModel.fromJson(base.data);
            if (!wxLoginResponse.isBind) {
              Get.to(() => WxLoginPage(
                    token: wxLoginResponse.bindToken,
                  ));
            } else {
              UserTool.userProvider.setToken(wxLoginResponse.loginInfo.token);
              //Get.offAll(const TabNavigator());
            }
          } else {
            CloudToast.show(base.msg);
          }
          break;
        case -4:
          CloudToast.show('用户拒绝授权');
          break;
        case -2:
          CloudToast.show('用户取消授权');
          break;
        case -6:
          CloudToast.show('应用签名错误');
          break;
        default:
          CloudToast.show('未知错误');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // _operator = '中国移动认证';
    // _phone = '12345678909';
    getPrePhone();
    addFluwxListen();
    addJverifyListen();
  }

  @override
  void dispose() {
    super.dispose();
    print(11111);
    Jverify().dismissLoginAuthView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
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
              // Row(
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       _operator,
              //       style: TextStyle(
              //           color: BaseStyle.color666666,
              //           fontSize: BaseStyle.fontSize28),
              //     ),
              //     18.wb,
              //     Text(
              //       TextUtils.getAsteriskPhone(_phone),
              //       style: TextStyle(
              //           color: BaseStyle.color666666,
              //           fontSize: BaseStyle.fontSize40,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              56.hb,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  gradient: const LinearGradient(
                      colors: [Color(0xFF0593FF), kPrimaryColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                ),
                child: MaterialButton(
                    onPressed: () async {
                      if (!_chooseAgreement) {
                        CloudToast.show('请阅读并同意用户协议和隐私政策');
                        return;
                      }
                      var cancel = CloudToast.loading;
                      var setup = await Jverify().isInitSuccess();
                      if (!setup['result']) {
                        CloudToast.show('初始化未完成');
                        cancel();
                        return;
                      }
                      var re = await Jverify().checkVerifyEnable();
                      if (kDebugMode) {
                        print('检查认证网络环境数据返回： ${re.toString()}');
                      }
                      if (re["result"]) {
                        var map = await Jverify().getToken();
                        if (kDebugMode) {
                          print('极光认证获取token数据返回： ${map.toString()}');
                        }
                        if (map['code'] == 2000) {
                          var token = map['message'];
                          var base = await apiClient.request(API.login.phone,
                              data: {'token': token, 'inviteCode': ''});
                          if (base.code == 0) {
                            if (kDebugMode) {
                              print('调用登陆接口返回手机号：  ${base.data}');
                            }
                          } else {
                            CloudToast.show(base.msg);
                          }
                          await _authToken();
                        } else {
                          CloudToast.show('获取token失败');
                        }
                      } else {
                        CloudToast.show('当前网络不支持认证');
                      }
                      cancel();
                      //Get.to(() => const TabNavigator());
                    },
                    elevation: 0,
                    height: 72.w,
                    minWidth: 590.w,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.w)),
                    child: Text(
                      '本机号码一键登录',
                      style: TextStyle(
                          fontSize: BaseStyle.fontSize28,
                          color: kForeGroundColor),
                    )),
              ),
              40.hb,
              MaterialButton(
                  onPressed: () async {
                    if (!_chooseAgreement) {
                      CloudToast.show('请阅读并同意用户协议和隐私政策');
                      return;
                    }
                    var cancel = CloudToast.loading;
                    try {
                      await fluwx.sendWeChatAuth(
                          scope: "snsapi_userinfo",
                          state: 'wechat_sdk_demo_test');
                    } catch (e) {
                      CloudToast.show('fluwx初始化失败');
                      LoggerData.addData(e.toString());
                    }
                    cancel();
                  },
                  elevation: 0,
                  height: 72.w,
                  minWidth: 590.w,
                  color: kForeGroundColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2.w, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Text(
                    '微信授权登录',
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize28, color: kPrimaryColor),
                  )),
              42.hb,
              GestureDetector(
                onTap: () {
                  _chooseAgreement = !_chooseAgreement;
                  setState(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50.w,
                        height: 50.w,
                        padding: EdgeInsets.only(top: 6.w, right: 5.w),
                        child: !_chooseAgreement
                            ? const Icon(CupertinoIcons.circle,
                                size: 18, color: Color(0xFFdddddd))
                            : const Icon(CupertinoIcons.checkmark_circle,
                                size: 18, color: Colors.red)),
                    RichText(
                        text: TextSpan(
                            text: "我已阅读并同意",
                            style: TextStyle(
                                color: BaseStyle.colorcccccc,
                                fontSize: 12 * 2.sp),
                            children: [
                          TextSpan(
                              text: '《用户服务协议》',
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 12 * 2.sp),
                              recognizer: _recognizer(context, 2)),
                          TextSpan(
                            text: "和",
                            style: TextStyle(
                                color: BaseStyle.colorcccccc,
                                fontSize: 12 * 2.sp),
                          ),
                          TextSpan(
                              text: '《隐私协议》',
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 12 * 2.sp),
                              recognizer: _recognizer(context, 1)),
                        ])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _recognizer(context, int type) {
    final TapGestureRecognizer recognizer = TapGestureRecognizer();
    recognizer.onTap = () {
      if (kDebugMode) {
        print("点击协议了");
      }

      ///跳转到用户协议页面
    };
    return recognizer;
  }

  ///调起一键登录页面
  Future _authToken() async {
    // final screenSize = MediaQuery.of(context).size;
    // final screenWidth = screenSize.width;
    // final screenHeight = screenSize.height;
    bool isiOS = Platform.isIOS;

    /// 自定义授权的 UI 界面，以下设置的图片必须添加到资源文件里，
    /// android项目将图片存放至drawable文件夹下，可使用图片选择器的文件名,例如：btn_login.xml,入参为"btn_login"。
    /// ios项目存放在 Assets.xcassets。
    ///
    JVUIConfig uiConfig = JVUIConfig();
    //uiConfig.authBackgroundImage = ;

    //uiConfig.navHidden = true;
    uiConfig.navColor = Colors.blue.value;
    uiConfig.navText = "一键登录";
    uiConfig.navTextColor = Colors.white.value;
    // uiConfig.navReturnImgPath = "return_bg";//图片必须存在

    uiConfig.logoWidth = 100;
    uiConfig.logoHeight = 100;
    //uiConfig.logoOffsetX = isiOS ? 0 : null;//(screenWidth/2 - uiConfig.logoWidth/2).toInt();
    uiConfig.logoOffsetY = 10;
    uiConfig.logoVerticalLayoutItem = JVIOSLayoutItem.ItemSuper;
    uiConfig.logoHidden = false;
    uiConfig.logoImgPath = "logo";

    uiConfig.numberFieldWidth = 200;
    uiConfig.numberFieldHeight = 40;
    //uiConfig.numFieldOffsetX = isiOS ? 0 : null;//(screenWidth/2 - uiConfig.numberFieldWidth/2).toInt();
    uiConfig.numFieldOffsetY = isiOS ? 20 : 120;
    uiConfig.numberVerticalLayoutItem = JVIOSLayoutItem.ItemLogo;
    uiConfig.numberColor = Colors.blue.value;
    uiConfig.numberSize = 18;

    uiConfig.sloganOffsetY = isiOS ? 20 : 160;
    uiConfig.sloganVerticalLayoutItem = JVIOSLayoutItem.ItemNumber;
    uiConfig.sloganTextColor = Colors.black.value;
    uiConfig.sloganTextSize = 15;
    //        uiConfig.slogan
    //uiConfig.sloganHidden = 0;

    uiConfig.logBtnWidth = 220;
    uiConfig.logBtnHeight = 50;
    //uiConfig.logBtnOffsetX = isiOS ? 0 : null;//(screenWidth/2 - uiConfig.logBtnWidth/2).toInt();
    uiConfig.logBtnOffsetY = isiOS ? 20 : 230;
    uiConfig.logBtnVerticalLayoutItem = JVIOSLayoutItem.ItemSlogan;
    uiConfig.logBtnText = "一键登录";
    uiConfig.logBtnTextColor = Colors.white.value;
    uiConfig.logBtnTextSize = 16;
    // uiConfig.loginBtnNormalImage = "login_btn_normal";//图片必须存在
    // uiConfig.loginBtnPressedImage = "login_btn_press";//图片必须存在
    // uiConfig.loginBtnUnableImage = "login_btn_unable";//图片必须存在

    uiConfig.privacyState = true; //设置默认勾选
    uiConfig.privacyCheckboxSize = 16;
    // uiConfig.checkedImgPath = "check_image";//图片必须存在
    // uiConfig.uncheckedImgPath = "uncheck_image";//图片必须存在
    uiConfig.privacyCheckboxInCenter = true;
    //uiConfig.privacyCheckboxHidden = false;

    //uiConfig.privacyOffsetX = isiOS ? (20 + uiConfig.privacyCheckboxSize) : null;
    uiConfig.privacyOffsetY = 32; // 距离底部距离
    uiConfig.privacyOffsetX = 12;
    uiConfig.privacyVerticalLayoutItem = JVIOSLayoutItem.ItemSuper;
    uiConfig.clauseName = "用户协议";
    uiConfig.clauseUrl = "http://www.baidu.com";
    uiConfig.clauseBaseColor = Colors.black.value;
    uiConfig.clauseNameTwo = "隐私政策";
    uiConfig.clauseUrlTwo = "http://www.hao123.com";
    uiConfig.clauseColor = Colors.blue.value;
    uiConfig.privacyText = ["同意", "以及", "和", ""];
    uiConfig.privacyTextSize = 13;
    //uiConfig.privacyWithBookTitleMark = true;
    //uiConfig.privacyTextCenterGravity = false;
    uiConfig.authStatusBarStyle = JVIOSBarStyle.StatusBarStyleDarkContent;
    uiConfig.privacyStatusBarStyle = JVIOSBarStyle.StatusBarStyleDefault;

    uiConfig.statusBarColorWithNav = true;
    uiConfig.virtualButtonTransparent = true;

    uiConfig.privacyStatusBarColorWithNav = true;
    uiConfig.privacyVirtualButtonTransparent = true;

    uiConfig.needStartAnim = true;
    uiConfig.needCloseAnim = true;

    uiConfig.privacyNavColor = Colors.blue.value;
    uiConfig.privacyNavTitleTextColor = Colors.white.value;
    uiConfig.privacyNavTitleTextSize = 16;
    uiConfig.privacyNavTitleTitle1 = "用户协议";
    uiConfig.privacyNavTitleTitle2 = "隐私协议";
    // uiConfig.privacyNavReturnBtnImage = "return_bg"; //图片必须存在;

    /// 添加自定义的 控件 到授权界面
    // List<JVCustomWidget> widgetList = [];

    /// 步骤 1：调用接口设置 UI
    Jverify()
        .setCustomAuthorizationView(true, uiConfig, landscapeConfig: uiConfig);

    /// 步骤 2：调用一键登录接口
    Jverify().loginAuthSyncApi(autoDismiss: false);
  }
}
