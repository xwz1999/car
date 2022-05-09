import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/extensions/map_extension.dart';
import 'package:cloud_car/model/car/car_info_model.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'cars_detail_page.dart';

class DirectSalePage extends StatefulWidget {
  final EasyRefreshController refreshController;
  final ValueNotifier<SearchParamModel> pickCar;


  const DirectSalePage({Key? key, required this.refreshController, required this.pickCar, })
      : super(key: key);

  @override
  _DirectSalePageState createState() => _DirectSalePageState();
}

class _DirectSalePageState extends State<DirectSalePage> with AutomaticKeepAliveClientMixin {
  bool _onLoad = true;
  late List<CarListModel> carList = [];
  ScreenControl screenControl = ScreenControl();
  List<Widget> listWidget1 = [];

  List<ChooseItem> _sortList = [];
  late String sort = '';
  late List<String> _dropDownHeaderItemStrings;


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

  CarInfoModel? carInfoModel;

  @override
  void initState() {
    super.initState();
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
        callback: (String item,int value) {
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
    return
      Column(
        children: [
           SizedBox(
            height: kToolbarHeight + 50.w,
          ),
          ChooseWidget(
            callBack: (name) {
              setState(() {});
            },
            items: const [
              '在售',
              '已预定',
              '已售',
              '退库',
              '待审核',
              '已驳回',
            ],
            item: '',
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
              //_scaffoldKey.currentState?.openEndDrawer();
            },
            child:  EasyRefresh.custom(
              firstRefresh: true,
              controller: widget.refreshController,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              onRefresh: () async {
                _page = 1;

                var list = await CarFunc.getCarList(
                    _page,
                    _size,
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
                  'order':CarMap.carSortString.getKeyFromValue(sort),
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
                          onTap: () async{
                            Get.to(()=> CarsDetailPage(isSelf: model.isSelf!=1?false:true,carListModel: model,));
                            // carInfoModel = await CarFunc.getCarInfo(model.id);
                            // if(carInfoModel!=null){
                            //   Get.to(()=> CarsDetailPage(isSelf: model.isSelf!=1?false:true,carId: ,));
                            // }else{
                            //   CloudToast.show('车辆详情获取失败');
                            // }



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
            ),
          ))
        ],
      );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
