import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/preferred/preferred_page.dart';
import 'package:cloud_car/ui/user/user_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/hive_store.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home/home_page.dart';
import 'notice/notice_page.dart';

class TabNavigator extends StatefulWidget {
  final int? index;

  const TabNavigator({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentIndex = 0;
  DateTime? _lastPressed;

  //页面列表
  List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 0), () async {
      Hive.initFlutter;
      await HiveStore.init();
    });

    _pages = [
      const HomePage(),
      const PreferredPage(),
      const NoticePage(), //PropertyIndex(),
      const UserPage(),
    ];

    _tabController = TabController(
        length: _pages.length, vsync: this, initialIndex: widget.index ?? 0);
  }

  _buildBottomBar(
    String title,
    String unselected,
    String selected,
  ) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        unselected,
        height: 44.w,
        width: 44.w,
        //color: Colors.black38,
      ),
      activeIcon: Image.asset(
        selected,
        height: 44.w,
        width: 44.w,
      ),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    //底部导航来
    List<BottomNavigationBarItem> bottomNav = <BottomNavigationBarItem>[
      _buildBottomBar(
        '工作台',
        Assets.icons.tabHome.path,
        Assets.icons.tabHomeChoose.path,
      ),
      _buildBottomBar(
        '云云优选',
        Assets.icons.tabCar.path,
        Assets.icons.tabCarChoose.path,
      ),
      _buildBottomBar(
        '通知',
        Assets.icons.tabNotice.path,
        Assets.icons.tabNoticeChoose.path,
      ),
      _buildBottomBar(
        '我的',
        Assets.icons.tabMy.path,
        Assets.icons.tabMyChoose.path,
      ),
    ];
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null ||
              DateTime.now().difference(_lastPressed!) >
                  const Duration(seconds: 1)) {
            //两次点击间隔超过1秒重新计算
            _lastPressed = DateTime.now();
            BotToast.showText(text: '再点击一次返回退出');
            return false;
          }
          //否则关闭app
          return true;
        },
        child: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNav,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedFontSize: 20.sp,
        unselectedFontSize: 20.sp,
        onTap: (index) {
          _tabController!.animateTo(index, curve: Curves.easeInOutCubic);
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
