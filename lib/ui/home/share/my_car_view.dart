import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../model/car_manager/car_list_model.dart';
import '../../../utils/drop_down_widget.dart';
import '../../../widget/car_item_widget.dart';
import '../car_valuation/car_func.dart';

class MyCarView extends StatefulWidget {
  final List<String> dropDownHeaderItemStrings;
  final List<Widget> listWidget;
  final ScreenControl screenControl;
  final VoidCallback onTap;

  const MyCarView(
      {Key? key,
      required this.dropDownHeaderItemStrings,
      required this.listWidget,
      required this.screenControl,
      required this.onTap})
      : super(key: key);

  @override
  _MyCarViewState createState() => _MyCarViewState();
}

class _MyCarViewState extends State<MyCarView> {
  List<CarListModel> _myCarList = [];
  int _page = 1;
  final int _size = 10;
  final EasyRefreshController _refreshController = EasyRefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropDownWidget(
      widget.dropDownHeaderItemStrings,
      widget.listWidget,
      height: 80.w,
      bottomHeight: 400.w,
      screenControl: widget.screenControl,
      headFontSize: 28.sp,
      child: EasyRefresh.custom(
        firstRefresh: true,
        controller: _refreshController,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          _page = 1;
          _myCarList = await CarFunc.getMyCarList(page: _page, size: _size);
          setState(() {});
        },
        onLoad: () async {
          _page++;
          var baseList = await apiClient.requestList(API.car.getCarSelfLists,
              data: {'page': _page, 'size': _size, 'order': ''});
          if (baseList.nullSafetyTotal > _myCarList.length) {
            _myCarList.addAll(baseList.nullSafetyList
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
                price:
                    NumUtil.divide(num.parse(model.price), 10000).toString() +
                        '万元',
              );
            }, childCount: _myCarList.length)),
          ),
        ],
      ),
      screen: '筛选',
      onTap: widget.onTap,
    );
  }
}
