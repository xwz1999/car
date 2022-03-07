import 'package:cloud_car/ui/home/sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widget/custom_drawer.dart';
import '../../widget/screen_widget.dart';
import '../../widget/sort_widget.dart';
import 'carlist_page.dart';
import 'citylist_page.dart';

class DirectSaleManagerPage extends StatefulWidget {
  const DirectSaleManagerPage({Key? key}) : super(key: key);

  @override
  _DirectSaleManagerPageState createState() => _DirectSaleManagerPageState();
}

class _DirectSaleManagerPageState extends State<DirectSaleManagerPage> {
  late List<String> _dropDownHeaderItemStrings;

  List<dynamic>? data;
  List<Widget> listWidget = [];
  ScreenControl screenControl = ScreenControl();
  late String city;
  late String brand;
  late String price;
  late String sort;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<ChooseItem> _priceList = [];

  List<ChooseItem> _sortList = [];

  @override
  void initState() {
    super.initState();
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
            print(item+'1231232');
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,

          title: Text('直卖车辆',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        endDrawer: CustomDrawer(
          widthPercent: 0.86,
          backgroundColor: Colors.white,
          callback: (bool isOpened) {  },
          child:_getSortList()
        ),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: DropDownWidget(
          _dropDownHeaderItemStrings,
          listWidget,
          height: 80.r,
          bottomHeight: 400.r,
          screenControl: screenControl,
          headFontSize: 28.sp,
          child: Container(
            margin: EdgeInsets.only(top: 80.r),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemBuilder: (context, index) {
                return CarItemWidget(
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
          onTap:(){
            screenControl.screenHide();
            _scaffoldKey.currentState?.openEndDrawer();
            print('筛选');
          },
        ));
  }

  _getSortList(){
    return SortListPage(callback: (ChooseItem item) {
      print(item.name+'123123');
    },);
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
}
