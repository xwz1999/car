// ignore_for_file: unused_field, avoid_print

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/extensions/map_extension.dart';

import 'package:cloud_car/model/preferred/collect_car_model.dart';
import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/sort/carlist_page.dart';

import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_list_page.dart';

import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../model/sort/sort_brand_model.dart';
import '../../model/sort/sort_car_model_model.dart';
import '../../model/sort/sort_series_model.dart';

class CarCollection extends StatefulWidget {
  const CarCollection({Key? key}) : super(key: key);

  @override
  State<CarCollection> createState() => _CarCollectionState();
}

class _CarCollectionState extends State<CarCollection> {
  late List<String> _dropDownHeaderItemStrings = ['品牌', '价格', '排序'];
  ScreenControl screenControlMy = ScreenControl();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ChooseItem> _sortList = [];
  List<ChooseItem> _priceList = [];
  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 2));
  List<CollectCarModel> _carList = [];
  int _page = 1;
  final int _size = 10;
  String _pickSort = '';
  ScreenControl screenControl = ScreenControl();
  final EasyRefreshController _refreshController = EasyRefreshController();

  List<Widget> get listWidget => [
        CarListPage(
          pickCar: _pickCar,
          carCallback: () {
            screenControl.screenHide();
            _refreshController.callRefresh();
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
            callback: (String item, int value) {
              screenControl.screenHide();
              _pickCar.value.price = item;
              _refreshController.callRefresh();
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
            callback: (String item, int value) {
              screenControl.screenHide();
              _pickSort = item;
              _refreshController.callRefresh();
            },
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 24.w,
            crossAxisCount: 4,
            haveButton: true,
            itemList: _sortList,
          ),
        ),
      ];

  Map<String, dynamic> get _params => {
        'brandId': _pickCar.value.brand.id,
        'seriesId': _pickCar.value.series.id,
        'minPrice': _pickCar.value.finalMinPrice,
        'maxPrice': _pickCar.value.finalMaxPrice,
        'minAge': _pickCar.value.minCarAge,
        'maxAge': _pickCar.value.maxCarAge,
        'struct': _pickCar.value.struct,
        'gearType': _pickCar.value.gearType,
        'minMileage': _pickCar.value.finalMinMile,
        'maxMileage': _pickCar.value.finalMaxMile,
        'dischargeStandard': _pickCar.value.dischargeStandard,
      };

  @override
  void initState() {
    super.initState();
    _dropDownHeaderItemStrings = ['品牌', '价格', '排序'];
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
  }

  @override
  void dispose() {
    _refreshController.dispose();
    screenControl.disPose();
    super.dispose();
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
                  onTap: () {},
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
      endDrawer: CustomDrawer(
          widthPercent: 0.86,
          backgroundColor: Colors.white,
          callback: (bool isOpened) {},
          child: SortListPage(
            pickCar: _pickCar,
            onConfirm: () {
              Get.back();

              setState(() {});
              _refreshController.callRefresh();
            },
          )),
      backgroundColor: bodyColor,
      body: _myCar(EasyRefresh.custom(
          firstRefresh: true,
          header: MaterialHeader(),
          footer: MaterialFooter(),
          controller: _refreshController,
          onRefresh: () async {
            print(_params);
            _page = 1;
            var baseList =
                await apiClient.requestList(API.car.collect.list, data: {
              'page': _page,
              'size': _size,
              'order': CarMap.carSortString.getKeyFromValue(_pickSort),
              'search': _params
            });
            _carList = baseList.nullSafetyList
                .map((e) => CollectCarModel.fromJson(e))
                .toList();

            setState(() {});
          },
          onLoad: () async {
            _page++;
            var baseList =
                await apiClient.requestList(API.car.getCarLists, data: {
              'page': _page,
              'size': _size,
              'order': CarMap.carSortString.getKeyFromValue(_pickSort),
              'search': _params
            });
            if (baseList.nullSafetyTotal > _carList.length) {
              _carList.addAll(baseList.nullSafetyList
                  .map((e) => CollectCarModel.fromJson(e))
                  .toList());
              setState(() {});
            } else {
              _refreshController.finishLoad(noMore: true);
            }
          },
          slivers: [
            SliverToBoxAdapter(
              child: 80.hb,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _carItem(_carList[index]);
              }, childCount: _carList.length),
            )
          ])),
    );
  }

  _myCar(Widget child) {
    return Builder(
      builder: (context) {
        return DropDownWidget(_dropDownHeaderItemStrings, listWidget,
            height: 80.w,
            bottomHeight: 400.w,
            screenControl: screenControl,
            headFontSize: 28.sp,
            child: child,
            screen: '筛选', onTap: () {
          screenControl.screenHide();
          Scaffold.of(context).openEndDrawer();
        });
      },
    );
  }

  _carItem(CollectCarModel model) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: const Color(0xFFFFFFFF)),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
      // width: 702.w,
      height: 235.w,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CloudImageNetworkWidget.car(
            width: 235.w,
            height: 180.w,
            urls: [model.mainPhoto],
          ),
          24.wb,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 375.w,
                  child: Text(
                    model.modelName,
                    maxLines: 2,
                    style: TextStyle(
                        color: BaseStyle.color111111,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                16.hb,
                getChip(
                    DateUtil.formatDate(model.createdAtDT,
                        format: DateFormats.zh_y_mo),
                    model.mileage.toString() + '万公里',
                    model.downPayment),
                20.hb,
                Row(
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: model.unitPrice.toString(),
                          style: TextStyle(
                              color: const Color(0xFFFF3B02),
                              fontSize: BaseStyle.fontSize36)),
                      TextSpan(
                          text: '万',
                          style: TextStyle(
                              color: const Color(0xFFFF3B02),
                              fontSize: BaseStyle.fontSize32)),
                    ])),
                    const Spacer(),
                  ],
                )
              ],
            ),
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
}
