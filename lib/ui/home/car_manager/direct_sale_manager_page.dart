import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  List<ChooseItem> _sortList = [];
  String title = '直卖车辆';

  @override
  void initState() {
    super.initState();
    _dropDownHeaderItemStrings = [
      '排序',
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
          backgroundColor: kForeGroundColor,
          title: SizedBox(
            width: 200.w,
            child: PopupMenuButton(
                offset: const Offset(20, 25),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34.sp,
                          color: const Color(0xFF333333),
                        )),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black87,
                      size: 40.w,
                    ),
                  ],
                ),
                onSelected: (String value) {
                  setState(() {
                    title = value;
                    setState(() {});
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      PopupMenuItem(
                          value: "直卖车辆",
                          child: Text("直卖车辆",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: const Color(0xFF333333),
                              ))),
                      PopupMenuItem(
                          value: "收购车辆",
                          child: Text("收购车辆",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: const Color(0xFF333333),
                              ))),
                      PopupMenuItem(
                          value: "评估车辆",
                          child: Text("评估车辆",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: const Color(0xFF333333),
                              ))),
                    ]),
          ),
        ),
        endDrawer: CustomDrawer(
            widthPercent: 0.86,
            backgroundColor: Colors.white,
            callback: (bool isOpened) {},
            child: _getSortList()),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: Column(
          children: [
            ChooseWidget(
              callBack: (name) {
                setState(() {});
              },
              items: const [
                '在售',
                '已预定',
                '已售',
                '退库',
                '待审核',
                '已驳回',
              ],
            ),
            Divider(
              height: 1.w,
              color: BaseStyle.colordddddd,
            ),
            Expanded(
              child: DropDownWidget(
                _dropDownHeaderItemStrings,
                listWidget,
                height: 76.w,
                bottomHeight: 24.w,
                screenControl: screenControl,
                headFontSize: 28.sp,
                child: Container(
                  margin: EdgeInsets.only(top: 80.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                    itemBuilder: (context, index) {
                      return CarItemWidget(
                        widgetPadding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 20.w),
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
                    itemCount: 10,
                  ),
                ),
                screen: '筛选',
                onTap: () {
                  screenControl.screenHide();
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              ),
            )
          ],
        ));
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
}
