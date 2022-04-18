import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/utils/hive_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';
import 'package:jverify/jverify.dart';
import 'package:provider/provider.dart';

import '../../constants/environment/environment.dart';
import '../../providers/user_provider.dart';
import '../login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final TapGestureRecognizer _agreementRecognizer = TapGestureRecognizer();
  final TapGestureRecognizer _privacyRecognizer = TapGestureRecognizer();

  Future initialAll() async {
    ///第三方加载
    await HiveStore.init();
    Jverify().setup(appKey: 'c185d29d6fb92c29cfeda32a', channel: 'devloper-default');
    Jverify().setDebugMode(DevEV.instance.dev);
    registerWxApi(
        appId: 'wx9bc3ffb23a749254',
        universalLink: 'https://apiwenche.oa00.com/');
    // var agreement = await HiveStore.appBox?.get('agreement') ?? false;
    // if (!agreement) {
    //   var result = await _showLoginVerify();
    //   if (result == null || !result) {
    //     await SystemNavigator.pop();
    //     await HiveStore.appBox?.put('agreement', false);
    //   } else {
    //     await HiveStore.appBox?.put('agreement', true);
    //   }
    // }
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
                          // Get.to(() => AgreementPage());
                        }),
                  TextSpan(
                      text: '《隐私政策》',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: _privacyRecognizer
                        ..onTap = () {
                          // Get.to(() => PrivacyPage());
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
    DevEV.instance.setEnvironment(
        const String.fromEnvironment('ENV', defaultValue: 'dev') == 'dev');
    DevEV.instance.init(context);
    Future.delayed(const Duration(milliseconds: 1000), () async {
      await initialAll();
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
