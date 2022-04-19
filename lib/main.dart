import 'dart:io';
import 'package:bot_toast/bot_toast.dart';

import 'package:cloud_car/providers/user_provider.dart';
import 'package:cloud_car/ui/splash/splash.dart';

import 'package:cloud_car/ui/login/login_page.dart';

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
    return GestureDetector(
      onTap: () {
        //点击输入框外部隐藏键盘⌨️
        //只能响应点击非手势识别的组件
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(750, 1334),
        builder: (context) => GetMaterialApp(
          onGenerateTitle: (context) => '云云问车',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          home: const SplashPage(),
          supportedLocales: const [Locale('zh')],
          locale: const Locale('zh'),
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          //builder: BotToastInit(),
          builder: (context, child) {
            return MediaQuery(
              //设置文字大小不随系统设置改变
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: BotToastInit().call(context, child),
            );
          },
          navigatorObservers: [BotToastNavigatorObserver()],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var builder;
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                builder[() => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(create: (_) => UserProvider()),
                      ],
                      child: GetMaterialApp(
                        onGenerateTitle: (context) => '云云问车',
                        debugShowCheckedModeBanner: false,
                        theme: AppTheme.theme,
                        home: const SplashPage(),
                        supportedLocales: const [Locale('zh')],
                        locale: const Locale('zh'),
                        localizationsDelegates:
                            GlobalMaterialLocalizations.delegates,
                        //builder: BotToastInit(),
                        builder: (context, child) {
                          ScreenUtil.setContext(context);
                          return MediaQuery(
                            //设置文字大小不随系统设置改变
                            data: MediaQuery.of(context)
                                .copyWith(textScaleFactor: 1.0),
                            child: BotToastInit().call(context, child),
                          );
                        },
                        navigatorObservers: [BotToastNavigatorObserver()],
                      ),
                    )],
              ]),
        ));
  }
}
