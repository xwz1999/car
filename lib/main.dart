import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/providers/app_provider.dart';
import 'package:cloud_car/providers/city_provider.dart';
import 'package:cloud_car/providers/user_provider.dart';
import 'package:cloud_car/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'constants/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CityProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(750, 1334),
        builder: (context) => GestureDetector(
          onTap: () {
            //点击输入框外部隐藏键盘⌨️
            //只能响应点击非手势识别的组件
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: GetMaterialApp(
            onGenerateTitle: (context) => '云云问车',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            home: const SplashPage(),
            supportedLocales: const [Locale('zh')],
            locale: const Locale('zh'),
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            //builder: BotToastInit(),
            builder: (context, child) {
              ScreenUtil.setContext(context);
              return MediaQuery(
                //设置文字大小不随系统设置改变
                data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .copyWith(textScaleFactor: 1.0),
                child: BotToastInit().call(context, child),
              );
            },
            navigatorObservers: [BotToastNavigatorObserver()],
          ),
        ),
      ),
    );
  }
}
