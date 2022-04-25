import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/share/all_car_view.dart';
import 'package:cloud_car/ui/home/share/my_car_view.dart';
import 'package:cloud_car/ui/home/sort/carlist_page.dart';
import 'package:cloud_car/ui/home/sort/citylist_page.dart';
import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/share/share_car_page.dart';
import 'package:cloud_car/ui/home/sort/sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/custom_floating_action_button_location.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../widget/car_item_widget.dart';

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
  final EasyRefreshController _myRefreshController = EasyRefreshController();
  final EasyRefreshController _allRefreshController = EasyRefreshController();
   String _pickCity='';
   String _pickBrand='';
   String _pickPrice='';
   String _pickSort='';

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

    _sortList = CarSort.values
        .map((e) => ChooseItem(name: CarMap.carSortString[e]!))
        .toList();

    listWidget = [
      CityListPage(
        cityCallback: (String city) {
          if (kDebugMode) {
            print(city);
          }
          // _dropDownHeaderItemStrings = [city, '品牌', '价格', '排序'];
          screenControlMy.screenHide();
          _pickCity = city;
          setState(() {});
        },
      ),
      CarListPage(
        carCallback: (String city, int id) {
          if (kDebugMode) {
            print(city);
          }
          // _dropDownHeaderItemStrings = [city, '品牌', '价格', '排序'];
          screenControlMy.screenHide();
          _pickBrand = city;
          Get.back();
          Get.back();
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
            screenControlMy.screenHide();

            _pickPrice = item;
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
          callback: (String item) {
            screenControlMy.screenHide();
            _pickSort = item;
          },
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
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            MyCarView(
                sort: _pickSort,
                refreshController: _myRefreshController,
                dropDownHeaderItemStrings: _dropDownHeaderItemStrings,
                listWidget: listWidget,
                screenControl: screenControlMy,
                onTap: () {
                  screenControlMy.screenHide();
                  _scaffoldKey.currentState?.openEndDrawer();
                }),
            AllCarView(
                sort: _pickSort,
                refreshController: _allRefreshController,
                dropDownHeaderItemStrings: _dropDownHeaderItemStrings,
                listWidget: listWidget,
                screenControl: screenControlAll,
                onTap: () {
                  screenControlMy.screenHide();
                  _scaffoldKey.currentState?.openEndDrawer();
                })
          ],
          // children: [_myCar(), _allCar()],
        ));
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
  bool get wantKeepAlive => true;
}
