
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/model/poster/poster_list_model.dart';
import 'package:cloud_car/providers/user_provider.dart';
import 'package:cloud_car/ui/home/car_mortgage/car_mortgage_page.dart';
import 'package:cloud_car/ui/home/poster/poster_edit_page.dart';
import 'package:cloud_car/ui/home/poster/poster_func.dart';
import 'package:cloud_car/ui/home/poster/poster_list_page.dart';
import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/share/share_home_page.dart';
import 'package:cloud_car/ui/home/split_account/split_account_page.dart';
import 'package:cloud_car/ui/home/user_manager/user_manager_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/share_util.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/cloud_avatar_widget.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

//import 'package:velocity_x/velocity_x.dart';

import 'car_manager/car_manager_page.dart';

//import 'car_manager/maintain_query/maintain_query_page.dart';
import 'car_manager/direct_sale/cars_detail_page.dart';
import 'car_manager/maintain_query/maintain_query_page.dart';
import 'car_manager/publish_car/push_car_page.dart';
import 'car_valuation/car_valuation_page.dart';
import 'func/car_func.dart';
import 'home_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  late final List<KingCoin> _kingCoinList = [];

  late final EasyRefreshController _refreshController = EasyRefreshController();

  //???????????????u8list
  ScreenshotController screenshotController = ScreenshotController();

  //???????????? ???????????????10???
  List<PosterListModel> _posterList = [];

  //??????????????????
  List<CarListModel> _shareCarList = [];

  @override
  void initState() {
    super.initState();
    _kingCoinList
        .add(KingCoin(name: '????????????', url: Assets.icons.carManager.path));
    _kingCoinList
        .add(KingCoin(name: '????????????', url: Assets.icons.customerManager.path));
    _kingCoinList
        .add(KingCoin(name: '????????????', url: Assets.icons.carValuation.path));
    _kingCoinList.add(KingCoin(name: '????????????', url: Assets.icons.carPush.path));
    _kingCoinList
        .add(KingCoin(name: '????????????', url: Assets.icons.carMortgage.path));
    _kingCoinList.add(KingCoin(name: '????????????', url: Assets.icons.carAgent.path));
    _kingCoinList
        .add(KingCoin(name: '????????????', url: Assets.icons.carMaintain.path));
    _kingCoinList
        .add(KingCoin(name: '????????????', url: Assets.icons.carRecovery.path));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final userProvider = Provider.of<UserProvider>(context);
    return CloudScaffold(
      path: Assets.images.homeBg.path,
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
              //??????
              width: 64.w, height: 64.w,
              child: AspectRatio(
                aspectRatio: 1,
                child: CloudAvatarWidget(
                  urls: [userProvider.userInfo.headImg],
                ),
              ),
            ),
            16.wb,
            Text('Hi,${userProvider.userInfo.nickname}',
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
            // GestureDetector(
            //   onTap: () {
            //     Get.to(() => const TaskPage());
            //   },
            //   child: Image.asset(Assets.icons.mainMenu.path,
            //       height: 48.w, width: 48.w),
            // ),
            32.wb,
          ],
        ),
      ),
      extendBody: true,
      body: Expanded(
        child: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          controller: _refreshController,
          onRefresh: () async {
            _posterList = await PosterFunc.getPosterList(page: 1);
            _shareCarList = await CarFunc.getCarList(1, 5);
            setState(() {});
          },
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
      ),
    );
  }

  _getKingCoin() {
    return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: _kingCoinList.length,
        //SliverGridDelegateWithFixedCrossAxisCount ??????????????????????????????Widget
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //??????????????????
            crossAxisCount: 4,
            //????????????
            mainAxisSpacing: 6,
            //????????????
            crossAxisSpacing: 24,
            //???????????????????????????
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
          case '????????????':
            Get.to(() => const CarManagerPage());
            break;
          case '????????????':
            Get.to(() => const UserManagerPage());
            break;
          case '????????????':
            Get.to(() => const PushCarPage());
            break;
          case '????????????':
            Get.to(() => const CarValuationPage());
            break;
          case '????????????':
            Get.to(() => const CarMortgagePage());
            break;
          case '????????????':
            Get.to(() => const MaintainQueryPage());
            break;
          case '????????????':
            Get.to(() => const SplitAccountPage());
            break;
          case '????????????':
            CloudToast.show('??????????????????');
        }
      },
      child: ColoredBox(
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
          title: '????????????',
          suffixTitle: '????????????',
          onTap: () {
            Get.to(() => const ShareHomePage());
          },
        ),
        Container(
          height: 400.w,
          padding: EdgeInsets.only(left: 32.w, right: 32.w),
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
                    return _shareItem(_shareCarList[index]);
                  },
                ),
              );
            },
            itemCount: _shareCarList.length,
          ),
        ),
      ],
    );
  }

  _getPoster() {
    return Column(
      children: [
        HomeTitle(
          title: '??????',
          suffixTitle: '????????????',
          onTap: () {
            Get.to(() => const PosterListPage());
          },
        ),
        12.hb,
        Container(
          height: 340.w,
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
                    return _posterItem(_posterList[index]);
                  },
                ),
              );
            },
            itemCount: _posterList.length,
          ),
        ),
      ],
    );
  }

  _shareItem(CarListModel model) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>CarsDetailPage(carListModel: model,));
      },
      child: Container(
        width: 240.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CloudImageNetworkWidget.car(
              width: 240.w,
              height: 180.w,
              urls: [model.mainPhoto],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.hb,
                  Text(
                    model.modelName,
                    maxLines: 2,
                    style: TextStyle(
                        color: const Color(0xFF111111),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  12.hb,
                  Row(
                    children: [
                      _getTextView(DateUtil.getDateTimeByMs(
                              model.licensingDate.toInt() * 1000)
                          .year
                          .toString()),
                      12.wb,
                      _getTextView('${model.mileage}?????????'),
                    ],
                  ),
                  14.hb,
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text:
                                '${NumUtil.divide(num.parse(model.price), 10000)}',
                            style: TextStyle(
                                color: const Color(0xFFFF3E02), fontSize: 32.sp),
                            children: [
                              TextSpan(
                                  text: '???',
                                  style: TextStyle(
                                      color: const Color(0xFFFF3E02),
                                      fontSize: 26.sp))
                            ]),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          ShareUtil.shareMiniProgram(
                            title: model.modelName,
                            imgUrl: model.mainPhoto,
                            carIds: [model.id],
                          );
                        },
                        child: Image.asset(
                          Assets.icons.homeShare.path,
                          width: 28.w,
                          height: 28.w,
                        ),
                      ),
                      16.wb,
                    ],
                  ),
                  20.hb,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _posterItem(PosterListModel model) {
    return GestureDetector(
      onTap: () => Get.to(() => PosterEditPage(model: model)),
      child: Container(
        width: 240.w,
        height: 360.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: CloudImageNetworkWidget(
          urls: [model.path],
        ),
      ),
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
