import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/task_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import 'car_manager_page.dart';
import 'home_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  late final List<KingCoin> _kingCoinList = [];

  late EasyRefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _kingCoinList
        .add(KingCoin(name: '车辆管理', url: Assets.icons.carManager.path));
    _kingCoinList
        .add(KingCoin(name: '客户管理', url: Assets.icons.customerManager.path));
    _kingCoinList
        .add(KingCoin(name: '车辆估值', url: Assets.icons.carValuation.path));
    _kingCoinList.add(KingCoin(name: '车辆发布', url: Assets.icons.carPush.path));
    _kingCoinList
        .add(KingCoin(name: '车辆按揭', url: Assets.icons.carMortgage.path));
    _kingCoinList.add(KingCoin(name: '车辆代理', url: Assets.icons.carAgent.path));
    _kingCoinList
        .add(KingCoin(name: '维护查询', url: Assets.icons.carMaintain.path));
    _kingCoinList
        .add(KingCoin(name: '收车(合作)', url: Assets.icons.carRecovery.path));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CloudScaffold(
      bodyColor: bgColor,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      appbar: Container(
        color: Colors.transparent,
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            32.wb,
            SizedBox(
              //头像
              width: 64.w, height: 64.w,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.w)),
                    child: Container(
                      color: Colors.blue,
                    )),
              ),
            ),
            16.wb,
            Text('Hi,张三',
                style: TextStyle(
                    color: BaseStyle.color111111,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp)),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.mainSearch.path,
                  height: 48.w, width: 48.w),
            ),
            24.wb,
            GestureDetector(
              onTap: () {
                Get.to(() => const TaskPage());
              },
              child: Image.asset(Assets.icons.mainMenu.path,
                  height: 48.w, width: 48.w),
            ),
            32.wb,
          ],
        ),
      ),
      extendBody: true,
      body: Expanded(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 34.w, right: 34.w, top: 20.w),
              child: _getKingCoin(),
              height: 344.w,
            ),
            _getBanner(),
            48.hb,
            _getShare(),
            48.hb,
            _getPoster(),
            48.hb,
          ],
        ),
      ),
    );
  }

  _getKingCoin() {
    return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: _kingCoinList.length,
        //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 4,
            //纵轴间距
            mainAxisSpacing: 6,
            //横轴间距
            crossAxisSpacing: 24,
            //子组件宽高长度比例
            childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          //Widget Function(BuildContext context, int index)
          return _kingCoinItem(
              _kingCoinList[index].name, _kingCoinList[index].url);
        });
  }

  _kingCoinItem(String name, String url) {
    return GestureDetector(
      onTap: () {
        switch (name) {
          case '车辆管理':
            Get.to(() => const CarManagerPage());
            break;
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              url,
              width: 96.w,
              height: 96.w,
            ),
            //30.w.heightBox,
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  _getBanner() {
    return Container(
      width: double.infinity,
      height: 162.w,
      padding: EdgeInsets.only(left: 32.w, right: 32.w),
      child: Image.asset(Assets.images.bannerBg.path),
    );
  }

  _getShare() {
    return Column(
      children: [
        HomeTitle(
          title: '快速分享',
          suffixTitle: '查看全部',
          onTap: () {},
        ),
        12.hb,
        Container(
          height: 338.w,
          padding: EdgeInsets.only(left: 32.w),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 16.w,
              );
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 240.w,
                child: Builder(
                  builder: (context) {
                    return _shareItem();
                  },
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }

  _getPoster() {
    return Column(
      children: [
        HomeTitle(
          title: '海报',
          suffixTitle: '查看全部',
          onTap: () {},
        ),
        12.hb,
        Container(
          height: 400.w,
          padding: EdgeInsets.only(left: 32.w),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 16.w,
              );
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 200.w,
                child: Builder(
                  builder: (context) {
                    return _posterItem();
                  },
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }

  _shareItem() {
    return Container(
      width: 240.w,
      height: 338.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 240.w,
            height: 180.w,
            color: Colors.lightBlue,
          ),
          // Image.asset(
          //   R.ASSETS_IMAGES_BANNER_BG_PNG,
          //   width: 240.w,height: 180.w,
          // ),
          Container(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.hb,
                Text(
                  '奥迪A6',
                  style: TextStyle(
                      color: const Color(0xFF111111),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
                9.hb,
                Row(
                  children: [
                    _getTextView('2019'),
                    12.wb,
                    _getTextView('1.1万公里'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '27.4万',
                      style: TextStyle(
                          color: const Color(0xFFFF3E02), fontSize: 32.sp),
                    ),
                    const Spacer(),
                    Image.asset(
                      Assets.icons.homeShare.path,
                      width: 28.w,
                      height: 28.w,
                    ),
                    20.wb,
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _posterItem() {
    return Container(
      width: 240.w,
      height: 360.w,

      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: Colors.lightBlue,
      ),
      //child: Image.asset(R.ASSETS_IMAGES_BANNER_BG_PNG,width: 240.w,height: 360.w,),
    );
  }

  _getTextView(String text) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF1F2F4),
          borderRadius: BorderRadius.all(Radius.circular(2.w))),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.w),
      child: Text(
        text,
        style: TextStyle(color: const Color(0xFF4F5A74), fontSize: 18.sp),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class KingCoin {
  late String name;
  late String url;

  KingCoin({required this.name, required this.url});
}
