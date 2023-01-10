import 'dart:convert';
import 'dart:io';

import 'package:cloud_car/providers/app_provider.dart';
import 'package:cloud_car/ui/splash/agreement_page.dart';
import 'package:cloud_car/ui/splash/privacy_page.dart';
import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/hive_store.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/utils/web_socket/websocket_message_model.dart';
import 'package:cloud_car/utils/web_socket/websocket_util.dart';
import 'package:file_preview/file_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:power_logger/power_logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:aliyun_face_plugin/aliyun_face_plugin.dart';

import '../../constants/environment/environment.dart';
import '../../providers/user_provider.dart';
import '../boot_page.dart';
import '../login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final TapGestureRecognizer _agreementRecognizer = TapGestureRecognizer();
  final TapGestureRecognizer _privacyRecognizer = TapGestureRecognizer();

  // final _aliyunFacePlugin=AliyunFacePlugin();
  bool agree = false;

  Future initialAll(context) async {
    await HiveStore.init();
    var agreement = await HiveStore.appBox?.get('agreement') ?? false;
    if (!agreement) {
      var result = await _showLoginVerify();
      if (result == null || !result) {
        await HiveStore.appBox?.put('agreement', false);
        await SystemNavigator.pop();
      } else {
        await HiveStore.appBox?.put('agreement', true);
      }
    }
    //使用前进行判断是否已经初始化
    Future.delayed(const Duration(seconds: 0),()async
    {
      var isInit = await FilePreview.tbsHasInit();
      if (!isInit) {
        await FilePreview.initTBS();
        return;
      }
    });
    // WidgetsFlutterBinding.ensureInitialized();
    PowerLogger.start(context, debug: AppENV.instance.env != ENVConfig.release);
    //PowerLogger.start(context, debug: true);
    ///第三方加载
    var isAndroid = Platform.isAndroid;
    registerWxApi(
        appId: 'wx9bc3ffb23a749254',
        doOnIOS: !isAndroid,
        doOnAndroid: isAndroid,
        universalLink: 'https://manage.yunyunwenche.com/');

    ///Providers 初始化
    //初始化省市区版本
    UserTool.cityProvider.init();
    UserTool.cityProvider.initCities();
    //获取包信息
    UserTool.appProvider.init();
    // 初始化websocket
    WebsocketUtil().initWebSocket(
        heartConsole: true,
        onReceive: (message) {
          var model = WebsocketMessageModel.fromJson(jsonDecode(message));
          Get.dialog(SimpleDialog(
            title: model.title.text.size(36.sp).isIntrinsic.make(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: model.content.text.isIntrinsic.make(),
              ),
            ],
          ));
        });
  }

  Future<bool?> _showLoginVerify() async {
    return await showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
          return CupertinoAlertDialog(
            title: const Text('隐私政策和用户协议'),
            content: Column(
              children: [
                20.hb,
                Text(
                  '在使用之前，请您仔细阅读并充分理解《用户协议》、《隐私政策》',
                  style: TextStyle(color: Colors.black, fontSize: 28.sp),
                ),
                20.hb,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        agree = !agree;
                        stateSetter(() {});
                      },
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: agree
                                ? const Color(0xFF0593FF)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16.w),
                            border: !agree
                                ? Border.all(color: const Color(0xFFCCCCCC))
                                : Border.all(color: Colors.transparent)),
                        child: agree
                            ? Icon(
                                CupertinoIcons.checkmark,
                                size: 24.w,
                                color: Colors.white,
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                    5.wb,
                    RichText(
                      text: TextSpan(
                          text: '我已阅读并同意',
                          style: TextStyle(
                              color: const Color(0xFF666666), fontSize: 20.sp),
                          children: [
                            TextSpan(
                                text: '《用户服务协议》',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 20.sp),
                                recognizer: _agreementRecognizer
                                  ..onTap = () {
                                    Get.to(() => const AgreementPage());
                                  }),
                            TextSpan(
                              text: '和',
                              style: TextStyle(
                                  color: const Color(0xFF666666),
                                  fontSize: 20.sp),
                            ),
                            TextSpan(
                                text: '《隐私政策》',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 20.sp),
                                recognizer: _privacyRecognizer
                                  ..onTap = () {
                                    Get.to(() => const PrivacyPage());
                                  }),
                          ]),
                    ),
                  ],
                )
              ],
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Get.back(result: false),
                child: const Text('取消'),
              ),
              CupertinoDialogAction(
                onPressed: agree
                    ? () => Get.back(result: true)
                    : () {
                        CloudToast.show('请勾选同意协议');
                      },
                child: Text(
                  '同意',
                  style: TextStyle(
                      color: agree
                          ? const Color(0xFF027AFF)
                          : const Color(0xFFBBBBBB)),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // _aliyunFacePlugin.init();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final app = Provider.of<AppProvider>(context, listen: false);
    var env = const String.fromEnvironment('ENV', defaultValue: 'dev');
    if (kDebugMode) {
      print('env :$env');
    }
    AppENV.instance.setEnv(env);
    //AppENV.instance.setEnv('release');

    Future.delayed(const Duration(milliseconds: 0), () async {
      final prefs = await SharedPreferences.getInstance();

      await initialAll(context);

      /// 苹果上架审核 先检测微信是否安装 若未安装则隐藏微信登录
      var wxInstall = await fluwx.isWeChatInstalled;
      app.wxInstall = wxInstall;
      if (!await userProvider.init()) {
        // Get.offAll(()=>const BootPage());
         prefs.getString('first') != null
            ? Get.offAll(() => const LoginPage())
            : Get.offAll(() => const BootPage());
      } else {
        await Get.offAll(() => const TabNavigator());
      }
      prefs.setString('first', 'first');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
