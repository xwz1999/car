import 'package:cloud_car/ui/home/sort/carlist_page.dart';
import 'package:cloud_car/ui/home/sort/citylist_page.dart';
import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/preferred/preferred_car_detail.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CarCollection extends StatefulWidget {
  const CarCollection({Key? key}) : super(key: key);

  @override
  State<CarCollection> createState() => _CarCollectionState();
}

class _CarCollectionState extends State<CarCollection> {
  late List<String> _dropDownHeaderItemStrings = ['城市', '品牌', '价格', '排序'];
  List<Widget> listWidget = [];
  ScreenControl screenControlMy = ScreenControl();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ChooseItem> _sortList = [];
  List<ChooseItem> _priceList = [];
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
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'time': '2020年10月',
      'distance': '20.43万公里',
      'standard': '国六',
      'pice': '27.43',
      'choose': true,
    },
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
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'time': '2020年10月',
      'distance': '20.43万公里',
      'standard': '国六',
      'pice': '27.43',
      'choose': false,
    },
    {
      'url': Assets.images.carBanner,
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'time': '2020年10月',
      'distance': '20.43万公里',
      'standard': '国六',
      'pice': '27.43',
      'choose': true,
    },
    {
      'url': Assets.images.carBanner,
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'time': '2020年10月',
      'distance': '20.43万公里',
      'standard': '国六',
      'pice': '27.43',
      'choose': false,
    },
  ];
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('收藏列表',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        actions: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(() => const SearchPage());
                  },
                  child: Text(
                    '编辑',
                    style: TextStyle(
                        color: BaseStyle.color111111,
                        fontSize: BaseStyle.fontSize28),
                  )),
              SizedBox(
                width: 32.w,
              )
            ],
          )
        ],
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: Column(
        children: [
          Container(
            height: 76.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.w),
                    bottomRight: Radius.circular(16.w)),
                color: const Color(0xFFFFFFFF)),
            child: _myCar(),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return get(carList[index]);
            },
            itemCount: carList.length,
          ))
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
    return GestureDetector(
      onTap: () {
        Get.to(() => const PreferredCardDetailPage());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: const Color(0xFFFFFFFF)),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
        // width: 702.w,
        // height: 228.w,
        margin: EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
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
                  ],
                )
              ],
            )
          ],
        ),
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
}
