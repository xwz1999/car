import 'dart:async';
import 'dart:io';

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/constants/environment/environment.dart';
import 'package:cloud_car/model/login/apple_login_model.dart';
import 'package:cloud_car/model/login/wx_login_model.dart';
import 'package:cloud_car/providers/app_provider.dart';
import 'package:cloud_car/ui/login/jverify_error_code.dart';
import 'package:cloud_car/ui/login/login_bind_page.dart';
import 'package:cloud_car/ui/login/login_by_sms_page.dart';
import 'package:cloud_car/ui/splash/privacy_page.dart';
import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:jverify/jverify.dart';
import 'package:power_logger/power_logger.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../splash/agreement_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key,  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _chooseAgreement = false;
  late StreamSubscription _fluwxListenObjcet;
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

  /// 添加 loginAuthSyncApi 接口回调的监听
  void addJverifyListen() {
    Jverify().addLoginAuthCallBackListener((event) async {
      var result = "监听获取返回数据：[${event.code}] message = ${event.message}";
      if (kDebugMode) {
        print(result);
        LoggerData.addData(result);
      }
      var cancel = CloudToast.loading;
      if (event.code == 6000) {
        var base = await apiClient.request(API.login.phone,
            data: {'token': event.message, 'inviteCode': ''});
        if (base.code == 0) {
          if (kDebugMode) {
            print('极光一键登录：  ${base.data}');
          }
          await UserTool.userProvider.setToken(base.data['token']);
          Get.offAll(() => const TabNavigator());
        } else {
          CloudToast.show(base.msg);
        }
      } else {
        CloudToast.show(JverifyErrorCode.getmsg(event.code ?? 0));
      }
      cancel();
    });
  }

  void addFluwxListen() {
    _fluwxListenObjcet = fluwx.weChatResponseEventHandler
        .distinct((a, b) => a == b)
        .listen((event) async {
      var res = event as fluwx.WeChatAuthResponse;
      if (kDebugMode) {
        print(
            '微信登录数据返回 code ${res.code} errcode:${res.errCode} ${res.errStr} state: ${res.state} type: ${res.type}');
      }
      switch (res.errCode) {
        case 0:
          var cancel = CloudToast.loading;
          try {
            var base = await apiClient
                .request(API.login.weixin, data: {'code': res.code});
            if (base.code == 0) {
              var wxLoginResponse = WxLoginModel.fromJson(base.data);
              if (!wxLoginResponse.isBind) {
                Get.to(() => LoginBindPage(
                      token: wxLoginResponse.bindToken, bindType: 1,
                    ));
              } else {
                await UserTool.userProvider
                    .setToken(wxLoginResponse.loginInfo.token);
                Get.offAll(() => const TabNavigator());
              }
            } else {
              CloudToast.show(base.msg);
            }
          } catch (e) {
            LoggerData.addData(e.toString());
          }
          cancel();
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
    Jverify()
        .setup(appKey: 'c185d29d6fb92c29cfeda32a', channel: 'devloper-default');
    Jverify().setDebugMode(AppENV.instance.env != ENVConfig.release);
    getPrePhone();
    addFluwxListen();
    addJverifyListen();
  }

  @override
  void dispose() {
    super.dispose();
    Jverify().dismissLoginAuthView();
    _fluwxListenObjcet.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
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
              DecoratedBox(
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
                          LoggerData.addData(map.toString());
                        }
                        if (map['code'] == 2000) {
                          await _authToken();
                        } else {
                          CloudToast.show(
                              '错误码：${map['code']}${map['message']}');
                        }
                      } else {
                        CloudToast.show('当前网络不支持认证');
                      }
                      cancel();
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
              Offstage(
                offstage: !app.wxInstall,
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              Offstage(
                offstage: !Platform.isIOS,
                child: Padding(
                  padding: EdgeInsets.only(top: 40.w),
                  child: MaterialButton(
                      onPressed: () async {
                        if (!_chooseAgreement) {
                          CloudToast.show('请阅读并同意用户协议和隐私政策');
                          return;
                        }
                        final credential =
                            await SignInWithApple.getAppleIDCredential(
                          scopes: [
                            AppleIDAuthorizationScopes.email,
                            AppleIDAuthorizationScopes.fullName,
                          ],
                        );
                        var cancel = CloudToast.loading;
                        var res = await apiClient
                            .request(API.login.appleLogin, data: {
                          'authorizationCode': credential.authorizationCode,
                          'userIdentifier': credential.userIdentifier,
                          'identityToken': credential.identityToken,
                        });
                        if (res.code == 0) {
                          var appleLoginModel =
                              AppleLoginModel.fromJson(res.data);
                          if (!appleLoginModel.isBind) {
                            Get.to(() => LoginBindPage(
                              token: appleLoginModel.bindToken, bindType: 2,
                            ));
                          } else {
                            await UserTool.userProvider
                                .setToken(appleLoginModel.loginInfo.token);
                            Get.offAll(() => const TabNavigator());
                          }
                        } else {
                          CloudToast.show(res.msg);
                        }
                      },
                      elevation: 0,
                      height: 72.w,
                      minWidth: 590.w,
                      color: kForeGroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.icons.appleLogin
                              .image(width: 60.w, height: 60.w),
                          Text(
                            'Sign in with Apple',
                            style: TextStyle(
                                fontSize: BaseStyle.fontSize28,
                                color: Colors.black),
                          ),
                        ],
                      )),
                ),
              ),
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const AgreementPage());
                                }),
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const PrivacyPage());
                                }),
                        ])),
                  ],
                ),
              ),
              24.hb,
              GestureDetector(
                onTap: () {
                  if (!_chooseAgreement) {
                    CloudToast.show('请阅读并同意用户协议和隐私政策');
                    return;
                  }
                  Get.to(() => const LoginBySmsPage());
                },
                child: Text(
                  '验证码登录',
                  style: TextStyle(color: Colors.black26, fontSize: 24.w),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

    uiConfig.privacyState = false; //设置默认勾选
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
    uiConfig.clauseUrl =
        "https://static.yunyunwenche.com/html/useragreement.html";
    uiConfig.clauseBaseColor = Colors.black.value;
    uiConfig.clauseNameTwo = "隐私政策";
    uiConfig.clauseUrlTwo = "https://static.yunyunwenche.com/html/privacy.html";
    uiConfig.clauseColor = Colors.blue.value;
    uiConfig.privacyText = ["", "", "", ""];
    uiConfig.privacyTextSize = 13;
    //uiConfig.privacyWithBookTitleMark = true;
    //uiConfig.privacyTextCenterGravity = false;
    uiConfig.authStatusBarStyle = JVIOSBarStyle.StatusBarStyleDarkContent;
    uiConfig.privacyStatusBarStyle = JVIOSBarStyle.StatusBarStyleDefault;
    uiConfig.privacyItem = [
      JVPrivacy(
          "《用户协议》", "https://static.yunyunwenche.com/html/useragreement.html",
          beforeName: "==", afterName: "++", separator: "、"),
      JVPrivacy("《隐私政策》", "https://static.yunyunwenche.com/html/privacy.html",
          separator: "、")
    ];

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
    Jverify().loginAuthSyncApi(autoDismiss: true);
  }
}
