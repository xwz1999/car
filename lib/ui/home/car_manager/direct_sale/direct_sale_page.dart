import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/extensions/map_extension.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class DirectSalePage extends StatefulWidget {
  final Function callBack;
  final EasyRefreshController refreshController;
  final ValueNotifier<SearchParamModel> pickCar;
  final String sort;


  const DirectSalePage({Key? key, required this.refreshController, required this.pickCar, required this.callBack, required this.sort, })
      : super(key: key);

  @override
  _DirectSalePageState createState() => _DirectSalePageState();
}

class _DirectSalePageState extends State<DirectSalePage> {
  bool _onLoad = true;
  late List<CarListModel> carList = [];

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
  };

  int _page = 1;
  final int _size = 10;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return
      EasyRefresh.custom(
      firstRefresh: true,
      controller: widget.refreshController,
      header: MaterialHeader(),
      footer: MaterialFooter(),
      onRefresh: () async {
        _page = 1;

        var list = await CarFunc.getCarList(
            _page,
            _size,
            order: CarMap.carSortString.getKeyFromValue(widget.sort),

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
          'order':CarMap.carSortString.getKeyFromValue(widget.sort),
          'search': _params
        });
        if (baseList.nullSafetyTotal > carList.length) {
          carList.addAll(baseList.nullSafetyList
              .map((e) => CarListModel.fromJson(e))
              .toList());
        } else {
          widget.refreshController.finishLoad(noMore: true);
        }
        setState(() {});
      },
      slivers: [
        SliverToBoxAdapter(
          child: 80.hb,
        ),
        _onLoad
            ? const  SliverToBoxAdapter(
        )
            : carList.isEmpty
            ? const SliverToBoxAdapter(
              child: NoDataWidget(
          text: '暂无相关车辆信息',
          paddingTop: 300,
        ),
            )
            :
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var model = carList[index];
                return GestureDetector(
                  onTap: (){

                  },
                  child: CarItemWidget(
                    widgetPadding:
                    EdgeInsets.symmetric(vertical: 28.w, horizontal: 24.w),
                    name: model.modelName,
                    time: DateUtil.formatDateMs(model.licensingDate.toInt() * 1000,
                        format: 'yyyy年MM月'),
                    distance: model.mileage + '万公里',
                    // standard: '国六',
                    url: model.mainPhoto,
                    price: NumUtil.divide(num.parse(model.price), 10000).toString(),
                  ),
                );
              }, childCount: carList.length)),
        ),
      ],
    );

  }
}
