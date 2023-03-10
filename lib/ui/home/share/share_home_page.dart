import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/share/all_car_view.dart';
import 'package:cloud_car/ui/home/share/my_car_view.dart';
import 'package:cloud_car/ui/home/share/share_car_page.dart';
import 'package:cloud_car/ui/home/sort/carlist_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/custom_floating_action_button_location.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../model/sort/sort_brand_model.dart';
import '../../../model/sort/sort_car_model_model.dart';
import '../../../model/sort/sort_series_model.dart';

class ShareHomePage extends StatefulWidget {
  const ShareHomePage({super.key});

  @override
  _ShareHomePageState createState() => _ShareHomePageState();
}

class _ShareHomePageState extends State<ShareHomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late List<String> _dropDownHeaderItemStrings;
  List<dynamic>? data;

  ScreenControl screenControl = ScreenControl();
  final EasyRefreshController _myRefreshController = EasyRefreshController();
  final EasyRefreshController _allRefreshController = EasyRefreshController();
  final List<CarListModel> _myCarList = [];
  final List<CarListModel> _allCarList = [];

  // String _pickCity='';

  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 2));

  String _pickSort = '';

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<ChooseItem> _priceList = [];

  List<ChooseItem> _sortList = [];

  late TabController _tabController;

  List<Widget> get listWidget => [
        CarListPage(
          pickCar: _pickCar,
          carCallback: () {
            screenControl.screenHide();
            if (_tabController.index == 0) {
              _myRefreshController.callRefresh();
            } else {
              _allRefreshController.callRefresh();
            }
          },
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
              color: kForeGroundColor),
          clipBehavior: Clip.antiAlias,
          child: ScreenWidget(
            pickString: _pickCar.value.price,
            callback: (String item,int value) {
              screenControl.screenHide();
              _pickCar.value.price = item;
              if (_tabController.index == 0) {
                _myRefreshController.callRefresh();
              } else {
                _allRefreshController.callRefresh();
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
            pickString: _pickSort,
            childAspectRatio: 144 / 56,
            callback: (String item,int value) {
              screenControl.screenHide();
              _pickSort = item;
              if (_tabController.index == 0) {
                _myRefreshController.callRefresh();
              } else {
                _allRefreshController.callRefresh();
              }
              setState(() {});
            },
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 24.w,
            crossAxisCount: 4,
            haveButton: true,
            itemList: _sortList,
          ),
        ),
      ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    _dropDownHeaderItemStrings = ['??????', '??????', '??????'];
    _priceList = [
      ChooseItem(name: '??????'),
      ChooseItem(name: '4?????????'),
      ChooseItem(name: '4-8???'),
      ChooseItem(name: '8-15???'),
      ChooseItem(name: '15-20???'),
      ChooseItem(name: '20-30???'),
      ChooseItem(name: '30-50???'),
      ChooseItem(name: '50?????????'),
    ];

    _sortList =
        CarMap.carSortString.values.map((e) => ChooseItem(name: e)).toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _allRefreshController.dispose();
    _myRefreshController.dispose();
    screenControl.disPose();
    super.dispose();
  }

  _customer() {
    return GestureDetector(
      onTap: () async {
        Get.to(() => ShareCarPage(
              models: _tabController.index == 0 ? _myCarList : _allCarList,
            ));
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
              tabs: [_tab(0, '????????????'), _tab(1, '????????????')]),
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
        body: DropDownWidget(
          _dropDownHeaderItemStrings,
          listWidget,
          height: 80.w,
          bottomHeight: 400.w,
          screenControl: screenControl,
          headFontSize: 28.sp,
          screen: '??????',
          onTap: () {
            screenControl.screenHide();
            _scaffoldKey.currentState?.openEndDrawer();
          },
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              MyCarView(
                sort: _pickSort,
                refreshController: _myRefreshController,
                pickCar: _pickCar,
                myCarList: _myCarList,
              ),
              AllCarView(
                allCarList: _allCarList,
                pickCar: _pickCar,
                sort: _pickSort,
                refreshController: _allRefreshController,
              )
            ],
            // children: [_myCar(), _allCar()],
          ),
        )
    );
  }

  _tab(int index, String text) {
    return Text(text);
  }

  _getSortList() {
    return SortListPage(
      pickCar: _pickCar,
      onConfirm: () {
        Get.back();
        if (_tabController.index == 0) {
          _myRefreshController.callRefresh();
        } else {
          _allRefreshController.callRefresh();
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
