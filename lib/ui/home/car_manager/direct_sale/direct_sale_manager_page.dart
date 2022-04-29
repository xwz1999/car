import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/sort/sort_car_model_model.dart';
import 'package:cloud_car/model/sort/sort_series_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/direct_sale_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/title_drop_head_widget.dart';
import 'package:cloud_car/utils/title_drop_widget.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/car_widget.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/search_bar_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'assessment_car_page.dart';

class DirectSaleManagerPage extends StatefulWidget {
  const DirectSaleManagerPage({Key? key}) : super(key: key);

  @override
  _DirectSaleManagerPageState createState() => _DirectSaleManagerPageState();
}

class _DirectSaleManagerPageState extends State<DirectSaleManagerPage> {
  late List<String> _dropDownHeaderItemStrings1;

  // List<dynamic>? data;
  //
  // List<Widget> listWidget1 = [];
  //
  // TitleHeadScreenControl screenControl1 = TitleHeadScreenControl();
  final EasyRefreshController refreshController = EasyRefreshController();

  late String city;
  late String brand;
  late String price;
  late String sort;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  ScreenControl screenControl = ScreenControl();
  String _pickSort = '';

  //
  // final List<ChooseItem> _sortList1 = [
  //   ChooseItem(name: '直卖车辆'),
  //   ChooseItem(name: '收购车辆'),
  //   ChooseItem(name: '评估车辆'),
  // ];

  String title = '直卖车辆';


  List<Widget> listWidget = [];
  List<ChooseItem> _sortList = [];

  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 2));

  @override
  void initState() {
    super.initState();

     _dropDownHeaderItemStrings1 = [
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
          pickString: _pickSort,
          childAspectRatio: 144 / 56,
          callback: (String item,int value) {
            screenControl.screenHide();
            _pickSort = item;
            refreshController.callRefresh();
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

    // _dropDownHeaderItemStrings1 = [
    //   '直卖车辆',
    // ];
    //
    // listWidget1 = [
    //   Container(
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(16.w)),
    //         color: kForeGroundColor),
    //     clipBehavior: Clip.antiAlias,
    //     child: ScreenWidget(
    //       pickString: '',
    //       childAspectRatio: 200 / 56,
    //       callback: (String item,int value) {
    //         _dropDownHeaderItemStrings1 = [item];
    //         screenControl1.screenHide();
    //         setState(() {});
    //       },
    //       mainAxisSpacing: 0.w,
    //       crossAxisSpacing: 44.w,
    //       crossAxisCount: 3,
    //       itemList: _sortList1,
    //     ),
    //   ),
    // ];
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
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
          body: Stack(
            children: [

              Padding(
                padding:  EdgeInsets.only(top: kToolbarHeight + MediaQuery.of(context).padding.top),
                child: DropDownWidget(
                  _dropDownHeaderItemStrings1,
                  listWidget,
                  height: 80.w,
                  bottomHeight: 400.w,
                  screenControl: screenControl,
                  headFontSize: 28.sp,
                  screen: '筛选',
                  onTap: () {
                    screenControl.screenHide();
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  child:     DirectSalePage(
                    callBack: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    }, pickCar: _pickCar, refreshController: refreshController, sort: _pickSort,
                  )
                ),
              ),
              _getAppbar(),

            ],
          ),
          endDrawer: CustomDrawer(
              widthPercent: 0.86,
              backgroundColor: Colors.white,
              callback: (bool isOpened) {},
              child: _getSortList())),
    );

  }

  _getAppbar() {
    return SearchBarWidget(
      callback: (String text) {
        _pickCar.value.keyWords = text;
        refreshController.callRefresh();
        setState(() {

        });
      },
      tips: '请输入车辆名称名称',
      title: Container(
        alignment: Alignment.center,
        child: Text(
          '直卖车辆',
          style: TextStyle(
              color: const Color(0xFF111111),
              fontSize: BaseStyle.fontSize36,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _getSortList() {
    return SortListPage(
      pickCar: _pickCar,
      onConfirm: () {
        Get.back();
        refreshController.callRefresh();
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


//Stack(
//
//               children: [
//
//                 Column(
//                   children: [
//                     ///目前不需要标题筛选所以先隐藏
//                     // ChooseWidget(
//                     //   callBack: (name) {
//                     //
//                     //     setState(() {});
//                     //   },
//                     //   items: const [
//                     //     '在售',
//                     //     '已预定',
//                     //     '已售',
//                     //     '退库',
//                     //     '待审核',
//                     //     '已驳回'
//                     //   ],
//                     //   item: '在售',
//                     // ),
//                     // _dropDownHeaderItemStrings1.first == '直卖车辆' ||
//                     //     _dropDownHeaderItemStrings1.first == '收购车辆'
//                     //     ? DirectSalePage(
//                     //   callBack: () {
//                     //     _scaffoldKey.currentState?.openEndDrawer();
//                     //   },
//                     //   type:
//                     //   _dropDownHeaderItemStrings1 == ['直卖车辆'] ? 1 : 2,
//                     // )
//                     //     : AssessmentCarPage(callBack: () {
//                     //   _scaffoldKey.currentState?.openEndDrawer();
//                     // }),
//                     _getAppbar(),
//                     DropDownWidget(
//                       _dropDownHeaderItemStrings1,
//                       listWidget,
//                       height: 80.w,
//                       bottomHeight: 400.w,
//                       screenControl: screenControl,
//                       headFontSize: 28.sp,
//                       screen: '筛选',
//                       onTap: () {
//                         screenControl.screenHide();
//                         _scaffoldKey.currentState?.openEndDrawer();
//                       },
//                       child:     DirectSalePage(
//                         callBack: () {
//                           _scaffoldKey.currentState?.openEndDrawer();
//                         }, pickCar: _pickCar, refreshController: refreshController, sort: _pickSort,
//                       )
//                     )
//
//                   ],
//                 ),
//
//                 ///目前不需要标题筛选所以先隐藏
//                 // TitleDropHeadWidget(
//                 //   _dropDownHeaderItemStrings1,
//                 //   listWidget1,
//                 //   height: kToolbarHeight,
//                 //   bottomHeight: 24.w,
//                 //   screenControl: screenControl1,
//                 //   headFontSize: 36.sp,
//                 //   leftWidget: const CloudBackButton(),
//                 //   isSearch: true,
//                 //   isNotSearch: false,
//                 //   callback: (text) {},
//                 //
//                 //   tips: '请输入车辆名称',
//                 // ),
//
//               ],
//             ),
