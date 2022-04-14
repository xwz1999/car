import 'package:cloud_car/ui/login/wx_login_page.dart';
import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _operator = '';
  String _phone = '';
  bool _chooseAgreement = false;

  @override
  void initState() {
    super.initState();
    _operator = '中国移动认证';
    _phone = '12345678909';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
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
            120.hb,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _operator,
                  style: TextStyle(
                      color: BaseStyle.color666666,
                      fontSize: BaseStyle.fontSize28),
                ),
                18.wb,
                Text(
                  TextUtils.getAsteriskPhone(_phone),
                  style: TextStyle(
                      color: BaseStyle.color666666,
                      fontSize: BaseStyle.fontSize40,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            56.hb,
            Container(
              decoration:  BoxDecoration(
                borderRadius:BorderRadius.circular(8.w),
                gradient: const LinearGradient(
                    colors: [Color(0xFF0593FF), kPrimaryColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('本机号码一键登录');
                  }
                  Get.to(()=>const TabNavigator());
                },
                elevation: 0,
                height: 72.w,
                minWidth: 590.w,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w)),
                child: Text('本机号码一键登录',style: TextStyle(fontSize:BaseStyle.fontSize28,color: kForeGroundColor ),)
              ),
            ),
            40.hb,
            MaterialButton(
              onPressed: () async{
              var code =  sendWeChatAuth(scope: "snsapi_userinfo",state: 'wechat_sdk_demo_test');

                Get.to(()=>const WxLoginPage());
              },
              elevation: 0,
              height: 72.w,
              minWidth: 590.w,
              color: kForeGroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2.w, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Text('微信授权登录',style: TextStyle(fontSize:BaseStyle.fontSize28,color: kPrimaryColor ),
              )
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
}
