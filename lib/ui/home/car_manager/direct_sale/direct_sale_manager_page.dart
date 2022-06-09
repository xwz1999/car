import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/sort/sort_car_model_model.dart';
import 'package:cloud_car/model/sort/sort_series_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/direct_sale_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_list_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/title_drop_widget.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../../widget/custom_drawer.dart';
import 'assessment_car_page.dart';

class DirectSaleManagerPage extends StatefulWidget {
  const DirectSaleManagerPage({super.key});

  @override
  _DirectSaleManagerPageState createState() => _DirectSaleManagerPageState();
}

class _DirectSaleManagerPageState extends State<DirectSaleManagerPage> {
  late List<String> _dropDownHeaderItemStrings1;

  // List<dynamic>? data;
  //

  TitleScreenControl screenControl = TitleScreenControl();
  final EasyRefreshController refreshController = EasyRefreshController();
  final EasyRefreshController asRefreshController = EasyRefreshController();

  late String city;
  late String brand;
  late String price;
  late String sort;

  String title = '直卖车辆';

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

    _sortList = [
      ChooseItem(name: '直卖车辆'),
      // ChooseItem(name: '收购车辆'),
      ChooseItem(name: '评估车辆'),
    ];

    _dropDownHeaderItemStrings1 = [
      '直卖车辆',
    ];
  }

  List<Widget> get listWidget => [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
              color: kForeGroundColor),
          clipBehavior: Clip.antiAlias,
          child: ScreenWidget(
            pickString: _dropDownHeaderItemStrings1.first,
            childAspectRatio: 200 / 56,
            callback: (String item, int value) {
              screenControl.screenHide();
              _dropDownHeaderItemStrings1.first = item;
              _dropDownHeaderItemStrings1.first != '直卖车辆'
                  ? refreshController.callRefresh()
                  : asRefreshController.callRefresh();
              setState(() {});

            },
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 24.w,
            crossAxisCount: 3,
            haveButton: true,
            itemList: _sortList,
          ),
        ),
      ];

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
    asRefreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: bodyColor,
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Row(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  return TitleDropDownWidget(
                      _dropDownHeaderItemStrings1, listWidget,
                      height: kToolbarHeight + 20.w,
                      bottomHeight: 30.w,
                      screenControl: screenControl,
                      headFontSize: 36.sp,
                      isSearch: true,
                      callback: (text) {
                        _pickCar.value.keyWords = text;
                        _dropDownHeaderItemStrings1.first == '直卖车辆'
                            ? refreshController.callRefresh()
                            : asRefreshController.callRefresh();
                        setState(() {});
                      },
                      leftWidget: const CloudBackButton(
                        isSpecial: true,
                      ),
                      // screen: '筛选',
                      onTap: () {
                        screenControl.screenHide();
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: _dropDownHeaderItemStrings1.first == '直卖车辆'
                          ? DirectSalePage(
                              pickCar: _pickCar,
                              refreshController: refreshController,
                            )
                          : AssessmentCarPage(
                              refreshController: asRefreshController,
                              pickCar: _pickCar,
                            ));
                }),
              )
            ],
          ),
          endDrawer: CustomDrawer(
              widthPercent: 0.86,
              backgroundColor: Colors.white,
              callback: (bool isOpened) {},
              child: _getSortList())),
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
