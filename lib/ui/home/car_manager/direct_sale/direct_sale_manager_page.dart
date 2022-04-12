

import 'package:cloud_car/ui/home/car_manager/direct_sale/direct_sale_page.dart';
import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/title_drop_widget.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:cloud_car/widget/title_drop_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DirectSaleManagerPage extends StatefulWidget {
  const DirectSaleManagerPage({Key? key}) : super(key: key);

  @override
  _DirectSaleManagerPageState createState() => _DirectSaleManagerPageState();
}

class _DirectSaleManagerPageState extends State<DirectSaleManagerPage> {

  late List<String> _dropDownHeaderItemStrings1;

  List<dynamic>? data;

  List<Widget> listWidget1 = [];

  TitleScreenControl screenControl1 = TitleScreenControl();

  late String city;
  late String brand;
  late String price;
  late String sort;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  final List<ChooseItem> _sortList1 = [
    ChooseItem(name: '直卖车辆'),
    ChooseItem(name: '收购车辆'),
    ChooseItem(name: '评估车辆'),
  ];

  String title = '直卖车辆';

  @override
  void initState() {
    super.initState();
  

    _dropDownHeaderItemStrings1 = [
      '直卖车辆',
    ];


    listWidget1 = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(
          childAspectRatio: 200 / 56,
          callback: (String item) {
            _dropDownHeaderItemStrings1 = [item];

            screenControl1.screenHide();
            setState(() {

            });
          },
          mainAxisSpacing: 0.w,
          crossAxisSpacing: 44.w,
          crossAxisCount: 3,
          itemList: _sortList1,
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: bodyColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body:  Stack(

          children: [

            DirectSalePage(callBack:(){
              _scaffoldKey.currentState?.openEndDrawer();
              print('1112312312');
            },

            ),
            Container(
              color: Colors.white,
              //height: kToolbarHeight + MediaQuery.of(context).padding.top,
              //alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  Expanded(
                    child: TitleDropDownWidget(

                      _dropDownHeaderItemStrings1,
                      listWidget1,
                      height: kToolbarHeight ,
                      bottomHeight: 24.w,
                      screenControl: screenControl1,
                      headFontSize: 36.sp,
                      leftWidget:  const CloudBackButton(
                        isSpecial: true,
                      ),
                      rightWidget:       Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SearchPage());
                            },
                            child: Image.asset(Assets.icons.mainSearch.path,
                                height: 48.w, width: 48.w),
                          ),
                          20.wb,
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),

        endDrawer:CustomDrawer(
            widthPercent: 0.86,
            backgroundColor: Colors.white,
            callback: (bool isOpened) {},
            child: _getSortList())
      ),
    );
    return TitleDropScaffold(
      key: _scaffoldKey,
        bodyColor: bgColor,
        systemStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        appbar: Container(
          color: Colors.white,
          //height: kToolbarHeight + MediaQuery.of(context).padding.top,
          //alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


              Expanded(
                child: TitleDropDownWidget(

                  _dropDownHeaderItemStrings1,
                  listWidget1,
                  height: kToolbarHeight ,
                  bottomHeight: 24.w,
                  screenControl: screenControl1,
                  headFontSize: 36.sp,
                  leftWidget:  const CloudBackButton(
                    isSpecial: true,
                  ),
                  rightWidget:       Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SearchPage());
                        },
                        child: Image.asset(Assets.icons.mainSearch.path,
                            height: 48.w, width: 48.w),
                      ),
                      20.wb,
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        extendBody: true,
        drawer: CustomDrawer(
            widthPercent: 0.86,
            backgroundColor: Colors.white,
            callback: (bool isOpened) {},
            child: _getSortList()),
        body:
        DirectSalePage(callBack:(){
          _scaffoldKey.currentState?.openEndDrawer();
          print('1112312312');
        },
          
        )
    );


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
