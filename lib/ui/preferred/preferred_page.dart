// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import 'package:cloud_car/ui/home/carlist_page.dart';
import 'package:cloud_car/ui/home/citylist_page.dart';
import 'package:cloud_car/ui/preferred/preferred_allcar.dart';
import 'package:cloud_car/ui/preferred/preferred_carcollection.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreferredPage extends StatefulWidget {
  const PreferredPage({Key? key}) : super(key: key);

  @override
  _PreferredPageState createState() => _PreferredPageState();
}

class _PreferredPageState extends State<PreferredPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late List<String> _dropDownHeaderItemStrings = ['城市', '品牌', '价格', '排序'];
  List<Widget> listWidget = [];
  List<ChooseItem> _priceList = [];
  ScreenControl screenControlMy = ScreenControl();
  List<ChooseItem> _sortList = [];
  List carList = [
    {
      'url': Assets.images.carBanner,
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'time': '2020年10月',
      'distance': '20.43万公里',
      'standard': '国六',
      'pice': '27.43',
      'choose': false,
    },
    {
      'url': Assets.images.carBanner,
      'title': '奔驰CLS级',
      'time': '2019年5月',
      'distance': '123.61万公里',
      'standard': '国六',
      'pice': '52.68',
      'choose': true,
    },
    {
      'url': Assets.images.carBanner,
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'time': '2015年4月',
      'distance': '452.55万公里',
      'standard': '国六',
      'pice': '31.22',
      'choose': false,
    },
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late int num = 2;
    super.build(context);
    return CloudScaffold(
      path: Assets.images.homeBg.path,
      bodyColor: bodyColor,
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
                            onTap: () {},
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
                    // setState(() {});
                    Get.to(() => const CarCollection());
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
          Container(
            height: 162.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                  const Color(0xFFFFFFFF),
                  const Color(0xFFFFFFFF).withOpacity(0)
                ])),
            child: Row(
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
          ),
          _myCar(),
        ],
      ),
      //extendBody: true,
      body: Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return get(carList[index]);
          },
          itemCount: carList.length,
        ),
      ),
    );
  }

  getPhoto(String title, String url) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case '全部车源':
            Get.to(() => const AllCar());
            break;
        }
      },
      child: Column(
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
      ),
    );
  }

  _myCar() {
    return DropDownWidget(
      _dropDownHeaderItemStrings,
      listWidget,
      height: 80.r,
      bottomHeight: 400.r,
      screenControl: screenControlMy,
      headFontSize: 28.sp,
      child: const SizedBox(),
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

  get(item) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: const Color(0xFFFFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
      // width: 702.w,
      // height: 228.w,
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: item['url'],
            width: 235.w,
            height: 180.w,
          ),
          // SizedBox(
          //   width: 235.w,
          //   height: 180.w,
          //   child: Image.asset(
          //     item['url'],
          //     fit: BoxFit.fill,
          //   ),
          // ),
          24.wb,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 375.w,
                child: Text(
                  item['title'],
                  style: TextStyle(
                      color: BaseStyle.color111111,
                      fontSize: BaseStyle.fontSize28),
                ),
              ),
              16.hb,
              getChip(item['time'], item['distance'], item['standard']),
              20.hb,
              Row(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: item['pice'],
                        style: TextStyle(
                            color: const Color(0xFFFF3B02),
                            fontSize: BaseStyle.fontSize36)),
                    TextSpan(
                        text: item['万'],
                        style: TextStyle(
                            color: const Color(0xFFFF3B02),
                            fontSize: BaseStyle.fontSize32)),
                  ])),
                  230.wb,
                  GestureDetector(
                    child: SizedBox(
                      width: 40.w,
                      height: 40.w,
                      child: Image.asset(item['choose']
                          ? Assets.icons.alreadyCollected.path
                          : Assets.icons.notCollect.path),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  getChip(String time, String distance, String standard) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: const Color(0xFF4F5A74).withOpacity(0.08)),
          child: Text(
            time,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: const Color(0xFF4F5A74).withOpacity(0.08)),
          child: Text(
            distance,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: const Color(0xFF4F5A74).withOpacity(0.08)),
          child: Text(
            standard,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
