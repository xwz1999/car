import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/extensions/map_extension.dart';
import 'package:cloud_car/model/car/car_info_model.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/cars_detail_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/new_cars_detail_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

enum SelfCarStatus {
  onSale(1, '在售'),
  schedule(2, '预定'),
  sold(3, '已售'),
  returnBack(4, '退库');
  // reviewed(5, '待审核'),
  // reject(6, '已驳回');

  final int typeNum;
  final String typeStr;

  static SelfCarStatus getValue(int value) =>
      SelfCarStatus.values.firstWhere((element) => element.typeNum == value);

  const SelfCarStatus(this.typeNum, this.typeStr);
}

class SelfSalePage extends StatefulWidget {
  final EasyRefreshController refreshController;
  final ValueNotifier<SearchParamModel> pickCar;
  final int initIndex;

  const SelfSalePage({
    super.key,
    required this.refreshController,
    required this.pickCar,
    this.initIndex = 0,
  });

  @override
  _SelfSalePageState createState() => _SelfSalePageState();
}

class _SelfSalePageState extends State<SelfSalePage>
    with AutomaticKeepAliveClientMixin {
  bool _onLoad = true;
  late List<CarListModel> carList = [];
  ScreenControl screenControl = ScreenControl();
  List<Widget> listWidget1 = [];

  List<ChooseItem> _sortList = [];
  late String sort = '';
  late List<String> _dropDownHeaderItemStrings;

  late SelfCarStatus _currentCarStatus;

  Map<String, dynamic> get _params => {
        'keyword': widget.pickCar.value.keyWords,
        'brandId': widget.pickCar.value.brand.id,
        'seriesId': widget.pickCar.value.series.id,
        'minPrice': widget.pickCar.value.finalMinPrice,
        'maxPrice': widget.pickCar.value.finalMaxPrice,
        'minAge': widget.pickCar.value.minCarAge,
        'maxAge': widget.pickCar.value.maxCarAge,
        'struct': widget.pickCar.value.struct,
        'gearType': widget.pickCar.value.gearType,
        'minMileage': widget.pickCar.value.finalMinMile,
        'maxMileage': widget.pickCar.value.finalMaxMile,
        'dischargeStandard': widget.pickCar.value.dischargeStandard,
        'selfCarStatus': _currentCarStatus.typeNum,
      };

  int _page = 1;
  final int _size = 10;

  CarInfoModel? carInfoModel;

  @override
  void initState() {
    super.initState();
    _currentCarStatus = SelfCarStatus.values[widget.initIndex];
    _sortList = [
      ChooseItem(name: '最新创建'),
      ChooseItem(name: '标价最高'),
      ChooseItem(name: '标价最低'),
      ChooseItem(name: '车龄最短'),
      ChooseItem(name: '里程最少'),
      ChooseItem(name: '最近更新'),
    ];

    _dropDownHeaderItemStrings = [
      '排序',
    ];
  }

  List<Widget> get listWidgets => [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
              color: kForeGroundColor),
          clipBehavior: Clip.antiAlias,
          child: ScreenWidget(
            pickString: sort,
            childAspectRatio: 200 / 56,
            callback: (String item, int value) {
              sort = item;
              screenControl.screenHide();
              widget.refreshController.callRefresh();
              setState(() {});
            },
            mainAxisSpacing: 40.w,
            crossAxisSpacing: 44.w,
            crossAxisCount: 3,
            itemList: _sortList,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight + 50.w,
        ),
        ChooseWidget(
          callBack: (index) {
            _currentCarStatus = SelfCarStatus.values[index];
            widget.refreshController.callRefresh();
          },
          items: SelfCarStatus.values.map((e) => e.typeStr).toList(),
          item: _currentCarStatus.typeStr,
        ),
        Expanded(
            child: DropDownWidget(
          _dropDownHeaderItemStrings,
          listWidgets,
          height: 76.w,
          bottomHeight: 400.w,
          screenControl: screenControl,
          headFontSize: 28.sp,
          screen: '筛选',
          onTap: () {
            screenControl.screenHide();
            Scaffold.of(context).openEndDrawer();
          },
          child: EasyRefresh.custom(
            firstRefresh: true,
            controller: widget.refreshController,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            onRefresh: () async {
              _page = 1;
              var list = await CarFunc.getMyCarList(
                  page: _page,
                  size: _size,
                  order: CarMap.carSortString.getKeyFromValue(sort),
                  searchParams: _params);
              carList.clear();
              carList.addAll(list);
              _onLoad = false;
              setState(() {});
            },
            onLoad: () async {
              _page++;
              var baseList =
                  await apiClient.requestList(API.car.getCarSelfLists, data: {
                'page': _page,
                'size': _size,
                'order': CarMap.carSortString.getKeyFromValue(sort),
                'search': _params
              });
              if (baseList.nullSafetyTotal > carList.length) {
                carList.addAll(baseList.nullSafetyList
                    .map((e) => CarListModel.fromJson(e))
                    .toList());
              } else {
                widget.refreshController.finishLoad(noMore: true);
              }
              if (mounted) {
                setState(() {});
              }
            },
            slivers: [
              SliverToBoxAdapter(
                child: 80.hb,
              ),
              _onLoad
                  ? const SliverToBoxAdapter()
                  : carList.isEmpty
                      ? const SliverToBoxAdapter(
                          child: NoDataWidget(
                            text: '暂无相关车辆信息',
                            paddingTop: 300,
                          ),
                        )
                      : SliverPadding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                          ),
                          sliver: SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                            var model = carList[index];
                            return GestureDetector(
                              onTap: () async {
                                Get.to(() => NewCarsDetailPage(
                                      carListModel: model,
                                    ));
                              },
                              child: CarItemWidget(
                                widgetPadding: EdgeInsets.symmetric(
                                    vertical: 28.w, horizontal: 24.w),
                                name: model.modelName,
                                time: DateUtil.formatDateMs(
                                    model.licensingDate.toInt() * 1000,
                                    format: 'yyyy年MM月'),
                                distance: '${model.mileage}万公里',
                                url: model.mainPhoto,
                                price: NumUtil.divide(
                                        num.parse(model.price), 10000)
                                    .toString(),
                              ),
                            );
                          }, childCount: carList.length)),
                        ),
            ],
          ),
        ))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
