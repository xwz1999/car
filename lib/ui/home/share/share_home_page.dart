import 'package:cloud_car/ui/home/carlist_page.dart';
import 'package:cloud_car/ui/home/citylist_page.dart';
import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/share/share_car_page.dart';
import 'package:cloud_car/ui/home/sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/custom_floating_action_button_location.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShareHomePage extends StatefulWidget {
  const ShareHomePage({Key? key}) : super(key: key);

  @override
  _ShareHomePageState createState() => _ShareHomePageState();
}

class _ShareHomePageState extends State<ShareHomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late List<String> _dropDownHeaderItemStrings;

  List<dynamic>? data;
  List<Widget> listWidget = [];
  ScreenControl screenControlMy = ScreenControl();
  ScreenControl screenControlAll = ScreenControl();
  late String city;
  late String brand;
  late String price;
  late String sort;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<ChooseItem> _priceList = [];

  List<ChooseItem> _sortList = [];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    _dropDownHeaderItemStrings = ['城市', '品牌', '价格', '排序'];
    _priceList = [
      ChooseItem(name: '不限'),
      ChooseItem(name: '4万以下'),
      ChooseItem(name: '4-8万'),
      ChooseItem(name: '8-15万'),
      ChooseItem(name: '15-20万'),
      ChooseItem(name: '20-30万'),
      ChooseItem(name: '30-50万'),
      ChooseItem(name: '50万以上'),
    ];

    _sortList = [
      ChooseItem(name: '最近创建'),
      ChooseItem(name: '标价最高'),
      ChooseItem(name: '标价最低'),
      ChooseItem(name: '车龄最短'),
      ChooseItem(name: '里程最少'),
      ChooseItem(name: '最近更新'),
    ];

    listWidget = [
      CityListPage(
        cityCallback: (String city) {
          if (kDebugMode) {
            print(city);
          }
          _dropDownHeaderItemStrings = [city, '品牌', '价格', '排序'];
          setState(() {});
        },
      ),
      CarListPage(
        carCallback: (String city) {
          if (kDebugMode) {
            print(city);
          }
          _dropDownHeaderItemStrings = [city, '品牌', '价格', '排序'];
          setState(() {});
        },
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(
          callback: (String item) {
            if (kDebugMode) {
              print(item + '1231232');
            }
          },
          childAspectRatio: 144 / 56,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          haveButton: true,
          itemList: _priceList,
        ),
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(
          childAspectRatio: 144 / 56,
          callback: (String item) {},
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 4,
          haveButton: true,
          itemList: _sortList,
        ),
      ),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _customer() {
    return GestureDetector(
      onTap: () async {
        Get.to(() => const ShareCarPage());
      },
      child: Container(
        width: 72.w,
        height: 72.w,
        decoration: BoxDecoration(
          color: const Color(0xFF000000).withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(36.w)),
        ),
        padding: EdgeInsets.all(16.w),
        child: Image.asset(
          Assets.icons.icShare.path,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        floatingActionButton: _customer(),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(
            FloatingActionButtonLocation.endDocked, 4, -240.w),
        key: _scaffoldKey,
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: TabBar(
              onTap: (index) {
                setState(() {});
              },
              isScrollable: true,
              labelPadding:
                  EdgeInsets.symmetric(vertical: 10.w, horizontal: 40.w),
              controller: _tabController,
              indicatorWeight: 3,
              labelColor: BaseStyle.color111111,
              unselectedLabelColor: BaseStyle.color999999,
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.w),
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.85),
              ),
              indicatorColor: kPrimaryColor,
              tabs: [_tab(0, '我的车辆'), _tab(1, '全部车辆')]),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.mainSearch.path,
                  height: 48.w, width: 48.w),
            ),
            20.wb,
          ],
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        endDrawer: CustomDrawer(
            widthPercent: 0.86,
            backgroundColor: Colors.white,
            callback: (bool isOpened) {},
            child: _getSortList()),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: TabBarView(
          controller: _tabController,
          children: [_myCar(), _allCar()],
        ));
  }

  _myCar() {
    return DropDownWidget(
      _dropDownHeaderItemStrings,
      listWidget,
      height: 80.r,
      bottomHeight: 400.r,
      screenControl: screenControlMy,
      headFontSize: 28.sp,
      child: Container(
        margin: EdgeInsets.only(top: 80.r),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
          itemBuilder: (context, index) {
            return CarItemWidget(
              widgetPadding:
                  EdgeInsets.symmetric(vertical: 28.w, horizontal: 24.w),
              name: '奔驰CLE 插电混动 纯电动续航103km',
              time: '2019年5月',
              distance: '20.43万公里',
              standard: '国六',
              url: Assets.images.homeBg.path,
              price: '27.43万',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: const Color(0xFFF6F6F6),
              height: 16.w,
            );
          },
          itemCount: 6,
        ),
      ),
      screen: '筛选',
      onTap: () {
        screenControlMy.screenHide();
        _scaffoldKey.currentState?.openEndDrawer();
        if (kDebugMode) {
          print('筛选');
        }
      },
    );
  }

  _allCar() {
    return DropDownWidget(
      _dropDownHeaderItemStrings,
      listWidget,
      height: 80.r,
      bottomHeight: 400.r,
      screenControl: screenControlAll,
      headFontSize: 28.sp,
      child: Container(
        margin: EdgeInsets.only(top: 80.r),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
          itemBuilder: (context, index) {
            return CarItemWidget(
              widgetPadding:
                  EdgeInsets.symmetric(vertical: 28.w, horizontal: 24.w),
              name: '奔驰CLE 插电混动 纯电动续航103km',
              time: '2019年5月',
              distance: '20.43万公里',
              standard: '国六',
              url: Assets.images.homeBg.path,
              price: '27.43万',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: const Color(0xFFF6F6F6),
              height: 16.w,
            );
          },
          itemCount: 5,
        ),
      ),
      screen: '筛选',
      onTap: () {
        screenControlAll.screenHide();
        _scaffoldKey.currentState?.openEndDrawer();
        if (kDebugMode) {
          print('筛选');
        }
      },
    );
  }

  _tab(int index, String text) {
    return Text(text);
  }

  _getSortList() {
    return SortListPage(
      callback: (ChooseItem item) {
        if (kDebugMode) {
          print(item.name + '123123');
        }
      },
    );
  }

  getTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        color: Colors.white,
        height: 70.w,
        alignment: Alignment.center,
        // width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 20.wb,
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                //  Icon(
                //   Icons.keyboard_arrow_down,
                //   color: Color(0xFFafada7),
                //   size: 20,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
