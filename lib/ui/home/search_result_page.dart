import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/extensions/map_extension.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/cars_detail_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/new_cars_detail_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/sort/carlist_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_list_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/search_bar_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../model/sort/sort_brand_model.dart';
import '../../model/sort/sort_car_model_model.dart';
import '../../model/sort/sort_series_model.dart';

class SearchResultPage extends StatefulWidget {
  final String keyWords;

  const SearchResultPage({super.key, required this.keyWords,});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  late List<String> _dropDownHeaderItemStrings = ['品牌', '价格', '排序'];

  ScreenControl screenControlMy = ScreenControl();
  List<ChooseItem> _sortList = [];
  List<ChooseItem> _priceList = [];

  final EasyRefreshController _refreshController = EasyRefreshController();
  int _page = 1;
  ScreenControl screenControl = ScreenControl();

  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 2));
  List<CarListModel> _carList = [];
  final int _size = 10;
  String _pickSort = '';

  bool _onLoad = true;

  @override
  void initState() {
    super.initState();
    _pickCar.value.keyWords = widget.keyWords;
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
        'keyword': _pickCar.value.keyWords,
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
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(
          widthPercent: 0.86,
          backgroundColor: Colors.white,
          callback: (bool isOpened) {},
          child: _getSortList()),
      backgroundColor: bodyColor,
      body: Column(
        children: [
          _getAppbar(),
          Expanded(
            child: _myCar(EasyRefresh.custom(
              firstRefresh: true,
              controller: _refreshController,
              header: MaterialHeader(),
              onRefresh: () async {
                _page = 1;

                _carList = await CarFunc.getCarList(_page, _size,
                    order: CarMap.carSortString.getKeyFromValue(_pickSort),
                    searchParams: _params);
                setState(() {});

                _onLoad = false;

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
                      .map((e) => CarListModel.fromJson(e))
                      .toList());
                } else {
                  _refreshController.finishLoad(noMore: true);
                }
                setState(() {});
              },
              slivers: [
                SliverToBoxAdapter(
                  child: 80.hb,
                ),
                _onLoad
                    ? SliverToBoxAdapter(
                        child: 0.hb,
                      )
                    : _carList.isEmpty
                        ? const SliverToBoxAdapter(
                            child: NoDataWidget(
                            text: '暂无车辆信息',
                            paddingTop: 300,
                          ))
                        : SliverPadding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 20.w),
                            sliver: SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                var model = _carList[index];
                                return _carItem(model);
                              }, childCount: _carList.length),
                            ),
                          )
              ],
            )),
            // )
          )
        ],
      ),
    );
  }

  _getAppbar() {
    return SearchBarWidget(
      callback: (String text) {
        _pickCar.value.keyWords = text;
        _refreshController.callRefresh();
      },
      canChange: false,
      keywords: widget.keyWords,
      tips: '请输入车辆名称',
      title: Container(
        alignment: Alignment.center,
        child: Text(
          '',
          style: TextStyle(
              color: const Color(0xFF111111), fontSize: BaseStyle.fontSize36),
        ),
      ),
    );
  }

  _getSortList() {
    return SortListPage(
      onConfirm: () {
        Get.back();
        _refreshController.callRefresh();
        setState(() {});
      },
      pickCar: _pickCar,
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
            screen: '筛选', onTap: () {
          screenControl.screenHide();
          Scaffold.of(context).openEndDrawer();
        },
            child: child);
      },
    );
  }

  _carItem(CarListModel model) {
    return GestureDetector(
      onTap: () {
        Get.to(() => NewCarsDetailPage(
              carListModel: model,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: const Color(0xFFFFFFFF)),

        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.w),
        // width: 702.w,
        height: 235.w,

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
                      DateUtil.formatDate(model.licensingDateDT,
                          format: DateFormats.zh_y_mo),
                      '${model.mileage}万公里',
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
                      GestureDetector(
                        onTap: () async {
                          var re = await apiClient.request(
                              model.collect == 0
                                  ? API.car.collect.add
                                  : API.car.collect.cancel,
                              data: {'carId': model.id},
                              showMessage: true);
                          if (re.code == 0) {
                            _refreshController.callRefresh();
                          }
                        },
                        child: SizedBox(
                          width: 40.w,
                          height: 40.w,
                          child: Image.asset(model.collect == 1
                              ? Assets.icons.alreadyCollected.path
                              : Assets.icons.notCollect.path),
                        ),
                      )
                    ],
                  )
                ],
              ),
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
