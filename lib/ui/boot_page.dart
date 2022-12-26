import 'package:cloud_car/gen/assets.gen.dart';
import 'package:cloud_car/ui/splash/splash.dart';
import 'package:flutter/material.dart';

import 'login/login_page.dart';


class BootPage extends StatefulWidget {
  const BootPage({Key? key}) : super(key: key);

  @override
  _BootPageState createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
      _createPageView()
    ],);
  }

  Widget _createPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _pageIndex = index;
          print(_pageController.page);
          print(_pageIndex);
        });
      },
      children: [
        Image.asset(Assets.images.boot1.path,fit: BoxFit.fill,),
        Image.asset(Assets.images.boot2.path,fit: BoxFit.fill,),
        Image.asset(Assets.images.boot3.path,fit: BoxFit.fill,),
        Image.asset(Assets.images.boot4.path,fit: BoxFit.fill,),
        const LoginPage()
        // Future.delayed(Duration)
        //  const SplashPage(),
      ],
    );
  }
}
