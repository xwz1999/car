import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../model/car_manager/car_list_model.dart';
import '../../../widget/car_item_widget.dart';
import '../car_valuation/car_func.dart';
import 'package:cloud_car/extensions/map_extension.dart';
import 'package:cloud_car/extensions/string_extension.dart';


class MyCarView extends StatefulWidget {
  final String sort;
  final EasyRefreshController refreshController;
  final ValueNotifier<SearchParamModel> pickCar;

  const MyCarView(
      {Key? key,
      required this.sort,
      required this.refreshController,
      required this.pickCar})
      : super(key: key);

  @override
  _MyCarViewState createState() => _MyCarViewState();
}

class _MyCarViewState extends State<MyCarView>
    with AutomaticKeepAliveClientMixin {
  List<CarListModel> _myCarList = [];
  int _page = 1;
  final int _size = 10;

  Map<String, dynamic> get _params => {
        'brandId': widget.pickCar.value.brand.id,
        'seriesId': widget.pickCar.value.series.id,
        'minPrice': widget.pickCar.value.finalMinPrice,
        'maxPrice': widget.pickCar.value.finalMaxPrice,

      };

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh.custom(
      firstRefresh: true,
      controller: widget.refreshController,
      header: MaterialHeader(),
      footer: MaterialFooter(),
      onRefresh: () async {
        _page = 1;
        _myCarList = await CarFunc.getMyCarList(
            page: _page,
            size: _size,
            order: CarMap.carSortString
                .getKeyFromValue(widget.sort)
                .toString()
                .toSnake,
            searchParams: _params);
        setState(() {});
      },
      onLoad: () async {
        _page++;
        var baseList =
            await apiClient.requestList(API.car.getCarSelfLists, data: {
          'page': _page,
          'size': _size,
          'order': CarMap.carSortString
              .getKeyFromValue(widget.sort)
              .toString()
              .toSnake,
          'search': _params
        });
        if (baseList.nullSafetyTotal > _myCarList.length) {
          _myCarList.addAll(baseList.nullSafetyList
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
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            var model = _myCarList[index];
            return CarItemWidget(
              widgetPadding:
                  EdgeInsets.symmetric(vertical: 28.w, horizontal: 24.w),
              name: model.modelName,
              time: DateUtil.formatDateMs(model.licensingDate.toInt() * 1000,
                  format: 'yyyy年MM月'),
              distance: model.mileage + '万公里',
              // standard: '国六',
              url: model.mainPhoto,
              price: NumUtil.divide(num.parse(model.price), 10000).toString(),
            );
          }, childCount: _myCarList.length)),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
