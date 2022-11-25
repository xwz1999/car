import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/sort/sort_car_model_model.dart';
import 'package:cloud_car/model/sort/sort_series_model.dart';
import 'package:cloud_car/ui/home/car_manager/car_enum.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/direct_sale_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/self_sale_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_list_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/title_drop_widget.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class DirectSaleManagerPage extends StatefulWidget {
  final int initIndex;
  final CarManageType initType;

  const DirectSaleManagerPage(
      {super.key, this.initIndex = 0, this.initType = CarManageType.all});

  @override
  _DirectSaleManagerPageState createState() => _DirectSaleManagerPageState();
}

class _DirectSaleManagerPageState extends State<DirectSaleManagerPage> {
  late CarManageType _currentType;

  TitleScreenControl screenControl = TitleScreenControl();
  final EasyRefreshController refreshController = EasyRefreshController();
  final EasyRefreshController asRefreshController = EasyRefreshController();
  final EasyRefreshController pRefreshController = EasyRefreshController();
  late String city;
  late String brand;
  late String price;
  late String sort;

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
    _currentType = widget.initType;
    _sortList =
        CarManageType.values.map((e) => ChooseItem(name: e.typeStr)).toList();
  }

  List<Widget> get listWidget => [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
              color: kForeGroundColor),
          clipBehavior: Clip.antiAlias,
          child: ScreenWidget(
            pickString: _currentType.typeStr,
            childAspectRatio: 200 / 56,
            callback: (String item, int value) {
              screenControl.screenHide();
              _currentType = CarManageType.values[value];
              if (mounted) {
                setState(() {});
              }
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
    pRefreshController.dispose();
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
          body: Builder(builder: (context) {
            return TitleDropDownWidget([_currentType.typeStr], listWidget,
                height: kToolbarHeight + 20.w,
                bottomHeight: 30.w,
                screenControl: screenControl,
                headFontSize: 36.sp,
                isSearch: true,
                callback: (text) {
                  _pickCar.value.keyWords = text;
                  switch (_currentType) {
                    case CarManageType.all:
                      refreshController.callRefresh();
                      break;
                    case CarManageType.company:
                      asRefreshController.callRefresh();
                      break;
                    case CarManageType.person:
                      pRefreshController.callRefresh();
                      break;
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                leftWidget: const CloudBackButton(
                  isSpecial: true,
                ),
                // screen: '筛选',
                onTap: () {
                  screenControl.screenHide();
                  Scaffold.of(context).openEndDrawer();
                },
                child: _getCurrentPage());
          }),
          endDrawer: CustomDrawer(
              widthPercent: 0.86,
              backgroundColor: Colors.white,
              callback: (bool isOpened) {},
              child: _getSortList())),
    );
  }

  Widget _getCurrentPage() {
    switch (_currentType) {
      case CarManageType.all:
        return DirectSalePage(
          initIndex: widget.initIndex,
          pickCar: _pickCar,
          refreshController: refreshController,
        );

      case CarManageType.company:
        return SelfSalePage(
            initIndex: widget.initIndex,
            refreshController: asRefreshController,
            pickCar: _pickCar);
      case CarManageType.person:
        return SelfSalePage(
            ownerType: 3,
            initIndex: widget.initIndex,
            refreshController: pRefreshController,
            pickCar: _pickCar);
    }
  }

  _getSortList() {
    return SortListPage(
      pickCar: _pickCar,
      onConfirm: () {
        if(_currentType==CarManageType.company){
          asRefreshController.callRefresh();
        }else if(_currentType==CarManageType.all){
          refreshController.callRefresh();
        }else{
          pRefreshController.callRefresh();
        }
        Get.back();
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
