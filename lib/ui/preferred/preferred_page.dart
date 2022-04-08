// ignore_for_file: unused_local_variable

import 'package:cloud_car/ui/home/carlist_page.dart';
import 'package:cloud_car/ui/home/citylist_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PreferredPage extends StatefulWidget {
  const PreferredPage({Key? key}) : super(key: key);

  @override
  _PreferredPageState createState() => _PreferredPageState();
}

class _PreferredPageState extends State<PreferredPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late EasyRefreshController _refreshController;
  late List<String> _dropDownHeaderItemStrings;
  List<Widget> listWidget = [];
  List<ChooseItem> _priceList = [];
  ScreenControl screenControlMy = ScreenControl();
  List<ChooseItem> _sortList = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
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
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late int num = 2;
    super.build(context);
    return CloudScaffold(
      path: Assets.images.homeBg.path,
      bodyColor: bgColor,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      appbar: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: kToolbarHeight + MediaQuery.of(context).padding.top,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                45.wb,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.w),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0.w),
                          blurRadius: 10.w,
                          color: const Color(0x33027AFF),
                        )
                      ],
                      color: kForeGroundColor),
                  width: 618.w,
                  height: 72.w,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          32.wb,
                          GestureDetector(
                            onTap: () {
                              CityListPage(
                                cityCallback: ((city) {
                                  city = '城市';
                                }),
                              );
                            },
                            child: SizedBox(
                                child: Row(
                              children: [
                                Text(
                                  '宁波',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                12.wb,
                                Image(
                                  image: Assets.icons.noSelected,
                                  width: 6.w,
                                  height: 6.w,
                                )
                              ],
                            )),
                          )
                        ],
                      ),
                      24.wb,
                      Container(
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF828CA0).withOpacity(0.5),
                          border: Border.all(width: 1.w),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          onEditingComplete: () {
                            setState(() {});
                            // _refreshController.callRefresh();
                          },
                          //focusNode: _contentFocusNode,

                          onTap: () {},
                          //
                          style: TextStyle(
                            textBaseline: TextBaseline.ideographic,
                            fontSize: 32.sp,
                            color: Colors.black,
                          ),
                          //controller: _editingController,
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.only(left: 20.w, top: 5.w),

                            filled: true,
                            fillColor: Colors.white,
                            hintText: "请输入客户名称",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            prefixIcon: const Icon(
                              CupertinoIcons.search,
                              size: 16,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              //
                              // 不是焦点的时候颜色
                              borderRadius: BorderRadius.circular(36.w),
                              borderSide: const BorderSide(
                                color: kForeGroundColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              // 焦点集中的时候颜色
                              borderRadius: BorderRadius.circular(36.w),
                              borderSide:
                                  const BorderSide(color: kForeGroundColor),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(36.w),
                                borderSide:
                                    const BorderSide(color: kForeGroundColor)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                12.wb,
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: SizedBox(
                      width: 48.w,
                      height: 48.w,
                      child: Image.asset(Assets.icons.collection.path)),
                ),
                20.wb,
              ],
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 30.w)),
              getPhoto('全部车源', Assets.icons.carOptions.path),
              84.wb,
              getPhoto('直卖车', Assets.icons.carDirect.path),
              84.wb,
              getPhoto('最新上架', Assets.icons.carShelves.path),
              84.wb,
              getPhoto('4s认证车', Assets.icons.carCertification.path),
            ],
          ),
        ],
      ),
      extendBody: true,
      body: Expanded(
        child: ListView(
          children: [],
        ),
      ),
    );
  }

  getPhoto(String title, String url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 96.w,
            height: 96.w,
            child: Image.asset(
              url,
              fit: BoxFit.fill,
            )),
        8.hb,
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }

  _myCay() {
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

  @override
  bool get wantKeepAlive => true;
}
