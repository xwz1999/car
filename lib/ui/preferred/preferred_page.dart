// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/extensions/map_extension.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/new_cars_detail_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/func/car_map.dart';
import 'package:cloud_car/ui/home/sort/carlist_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_list_page.dart';
import 'package:cloud_car/ui/preferred/preferred_allcar.dart';
import 'package:cloud_car/ui/preferred/preferred_carcollection.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/custom_drawer.dart';
import 'package:cloud_car/widget/jurisdiction_toast.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../model/sort/sort_brand_model.dart';
import '../../model/sort/sort_car_model_model.dart';
import '../../model/sort/sort_series_model.dart';

class PreferredPage extends StatefulWidget {
  const PreferredPage({super.key});

  @override
  _PreferredPageState createState() => _PreferredPageState();
}

class _PreferredPageState extends State<PreferredPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late List<String> _dropDownHeaderItemStrings = ['品牌', '价格', '排序'];
  List<ChooseItem> _priceList = [];
  ScreenControl screenControl = ScreenControl();
  List<ChooseItem> _sortList = [];
  final EasyRefreshController _refreshController = EasyRefreshController();
  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 2));
  List<CarListModel> _carList = [];
  int _page = 1;
  final int _size = 10;
  String _pickSort = '';
  final TextEditingController _searchController = TextEditingController();

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
        'fuelType':_pickCar.value.fuelType,
        'minMileage': _pickCar.value.finalMinMile,
        'maxMileage': _pickCar.value.finalMaxMile,
        'dischargeStandard': _pickCar.value.dischargeStandard,
        'keyword': _searchController.text,
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
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CloudScaffold(
      path: Assets.images.homeBg.path,
      bodyColor: bodyColor,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      endDrawer: CustomDrawer(
          widthPercent: 0.86,
          backgroundColor: Colors.white,
          callback: (bool isOpened) {},
          child: SortListPage(
            pickCar: _pickCar,
            onConfirm: () {
              Get.back();
              _refreshController.callRefresh();
            },
          )),
      appbar: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: kToolbarHeight + MediaQuery.of(context).padding.top,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                45.wb,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.w),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0.w),
                          blurRadius: 10.w,
                          color: const Color(0x33027AFF),
                        )
                      ],
                      color: kForeGroundColor),
                  width: 618.w,
                  height: 72.w,
                  child: Row(
                    children: [
                      // Row(
                      //   children: [
                      //     32.wb,
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: SizedBox(
                      //           child: Row(
                      //         children: [
                      //           Text(
                      //             '宁波',
                      //             style: Theme.of(context).textTheme.subtitle2,
                      //           ),
                      //           12.wb,
                      //           Image(
                      //             image:AssetImage(Assets.icons.noSelected.path) ,
                      //             width: 6.w,
                      //             height: 6.w,
                      //           )
                      //         ],
                      //       )),
                      //     )
                      //   ],
                      // ),
                      24.wb,
                      // Container(
                      //   height: 24.w,
                      //   decoration: BoxDecoration(
                      //     color: const Color(0xFF828CA0).withOpacity(0.5),
                      //     border: Border.all(width: 1.w),
                      //   ),
                      // ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _searchController,
                          onEditingComplete: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            _refreshController.callRefresh();
                          },
                          onTap: () {},
                          style: TextStyle(
                            textBaseline: TextBaseline.ideographic,
                            fontSize: 32.sp,
                            color: Colors.black,
                          ),
                          //controller: _editingController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "请输入车辆名称",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            prefixIconConstraints: const BoxConstraints(minHeight: 0,minWidth: 0),
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: const Icon(
                                CupertinoIcons.search,
                                size: 16,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              //
                              // 不是焦点的时候颜色
                              borderRadius: BorderRadius.circular(36.w),
                              borderSide: const BorderSide(
                                color: kForeGroundColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              // 焦点集中的时候颜色
                              borderRadius: BorderRadius.circular(36.w),
                              borderSide:
                                  const BorderSide(color: kForeGroundColor),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(36.w),
                                borderSide:
                                    const BorderSide(color: kForeGroundColor)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                12.wb,
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CarCollection());
                  },
                  child: SizedBox(
                      width: 48.w,
                      height: 48.w,
                      child: Image.asset(Assets.icons.collection.path)),
                ),
                20.wb,
              ],
            ),
          ),
          Container(
            height: 162.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                  const Color(0xFFFFFFFF),
                  const Color(0xFFFFFFFF).withOpacity(0)
                ])),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 30.w)),
                getPhoto('全部车源', Assets.icons.carOptions.path),
                84.wb,
                getPhoto('直卖车', Assets.icons.carDirect.path),
                84.wb,
                getPhoto('最新上架', Assets.icons.carShelves.path),
                84.wb,
                getPhoto('4s认证车', Assets.icons.carCertification.path),
              ],
            ),
          ),
        ],
      ),
      //extendBody: true,
      body: Expanded(
        child: _myCar(EasyRefresh.custom(
            firstRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            controller: _refreshController,
            onRefresh: () async {
              _page = 1;
              _carList = await CarFunc.getCarList(_page, _size,
                  order: CarMap.carSortString.getKeyFromValue(_pickSort),
                  searchParams: _params);
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
      ),
    );
  }

  getPhoto(String title, String url) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case '全部车源':
            Get.to(() => AllCar(
                  title: title,
                ));
            break;
          case '直卖车':
            Get.to(() => AllCar(
                  title: title,
                ));
            break;
          case '最新上架':
            Get.to(() => AllCar(
                  title: title,
                ));
            break;
          case '4s认证车':
            Get.to(() => AllCar(
                  title: title,
                ));
            break;
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 96.w,
              height: 96.w,
              child: Image.asset(
                url,
                fit: BoxFit.fill,
              )),
          8.hb,
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
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
        }, child: child);
      },
    );
  }

  _carItem(CarListModel model) {
    return GestureDetector(
      onTap: () {
        if(UserTool.userProvider.userInfo.levelEM ==
            PermissionLevel.normal){
          Alert.show(context, const JurisdictionToast());
        }else{
          Get.to(() => NewCarsDetailPage(
            carListModel: model,
          ));
        }

      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: const Color(0xFFFFFFFF)),

        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.w),
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
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8.w),
        //       color: const Color(0xFF4F5A74).withOpacity(0.08)),
        //   child: Text(
        //     standard,
        //     style: TextStyle(
        //         fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
        //   ),
        // )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
