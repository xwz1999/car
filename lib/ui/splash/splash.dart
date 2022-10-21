import 'dart:convert';
import 'dart:io';

import 'package:cloud_car/providers/app_provider.dart';
import 'package:cloud_car/ui/splash/agreement_page.dart';
import 'package:cloud_car/ui/splash/privacy_page.dart';
import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/hive_store.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/utils/web_socket/websocket_message_model.dart';
import 'package:cloud_car/utils/web_socket/websocket_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart';
import 'package:power_logger/power_logger.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

import '../../constants/environment/environment.dart';
import '../../providers/user_provider.dart';
import '../login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final TapGestureRecognizer _agreementRecognizer = TapGestureRecognizer();
  final TapGestureRecognizer _privacyRecognizer = TapGestureRecognizer();

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

    //PowerLogger.start(context, debug: AppENV.instance.env != ENVConfig.release);
    PowerLogger.start(context, debug: true);
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
        return CupertinoAlertDialog(
          title: const Text('隐私政策和用户协议'),
          content: RichText(
            text: TextSpan(
                text: '点击登录即表示您已阅读并同意',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: '《用户协议》',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: _agreementRecognizer
                        ..onTap = () {
                          Get.to(() => const AgreementPage());
                        }),
                  TextSpan(
                      text: '《隐私政策》',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: _privacyRecognizer
                        ..onTap = () {
                          Get.to(() => const PrivacyPage());
                        }),
                  const TextSpan(
                      style: TextStyle(color: Colors.black),
                      text:
                          '（特别是免除或限制责任、管辖等粗体下划线标注的条款）。如您不同意上述协议的任何条款，您应立即停止登录及使用本软件及服务。')
                ]),
          ),

          // ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Get.back(result: true),
              child: const Text('同意'),
            ),
            CupertinoDialogAction(
              onPressed: () => Get.back(result: false),
              child: const Text('拒绝'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final app = Provider.of<AppProvider>(context,listen: false);
    var env = const String.fromEnvironment('ENV', defaultValue: 'dev');
    if (kDebugMode) {
      print('env :$env');
    }
    AppENV.instance.setEnv(env);
    //AppENV.instance.setEnv('release');

    Future.delayed(const Duration(milliseconds: 1000), () async {
      await initialAll(context);

      /// 苹果上架审核 先检测微信是否安装 若未安装则隐藏微信登录
      var wxInstall = await fluwx.isWeChatInstalled;
      app.wxInstall = wxInstall;
      if (!await userProvider.init()) {
        await Get.offAll(() => const LoginPage());
      } else {
        await Get.offAll(() => const TabNavigator());
      }
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
