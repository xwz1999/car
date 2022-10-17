import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/model/car/dealer_list_model.dart';
import 'package:cloud_car/model/user/staff_all_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/choose_purchaser_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_picture_page.dart';
import 'package:cloud_car/ui/home/sort/car_three_city_list_page.dart';
import 'package:cloud_car/ui/user/user_assessment/user_assessment_page.dart';
import 'package:cloud_car/ui/user/user_management/staff_management_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/picker/cloud_grid_picker_widget.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:cloud_car/widget/scan_license_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../model/sort/sort_brand_model.dart';
import '../../../../model/sort/sort_car_model_model.dart';
import '../../../../model/sort/sort_series_model.dart';
import '../../../../widget/button/cloud_back_button.dart';
import '../../../../widget/picker/car_date_picker.dart';
import '../../../../widget/sort_widget.dart';
import '../../sort/choose_car_page.dart';
import '../../sort/search_param_model.dart';
import '../direct_sale/edit_item_widget.dart';
import '../fill_evainfo_page.dart';
import 'choose_shop_page.dart';

class NewPushCarPage extends StatefulWidget {
  const NewPushCarPage({super.key});

  @override
  State<NewPushCarPage> createState() => _NewPushCarPageState();
}

class _NewPushCarPageState extends State<NewPushCarPage> {
  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 3));
  late CarDistinguishModel? carInfoModel;
  final NewPublishCarInfo _publishCarInfo = NewPublishCarInfo();
  final TextEditingController _viNumController = TextEditingController();
  final TextEditingController _carNumController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _mileController = TextEditingController();
  final TextEditingController _carParkingNumController = TextEditingController();
  final TextEditingController _newCarPriceController = TextEditingController();
  final TextEditingController _purchaseTaxController = TextEditingController();
  final TextEditingController _retrofittingFeeController = TextEditingController();
  final TextEditingController _carDescriptionController = TextEditingController();
  final TextEditingController _wholesalePriceController = TextEditingController();
  final TextEditingController _salePriceController = TextEditingController();
  final TextEditingController _purchasePriceController = TextEditingController();
  final TextEditingController _transferNumController = TextEditingController();
  final TextEditingController _keyCountController = TextEditingController();
  final TextEditingController _commercialInsurancePriceController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();



  List<ChooseItem> colorList = [
    ChooseItem(name: '蓝色'),
    ChooseItem(name: '紫色'),
    ChooseItem(name: '灰色'),
    ChooseItem(name: '银色'),
    ChooseItem(name: '米色'),
    ChooseItem(name: '棕色'),
    ChooseItem(name: '青色'),
    ChooseItem(name: '黑色'),
    ChooseItem(name: '金色'),
    ChooseItem(name: '橙色'),
    ChooseItem(name: '红色'),
    ChooseItem(name: '白色'),
    ChooseItem(name: '绿色'),
    ChooseItem(name: '黄色'),
    ChooseItem(name: '其他'),
  ];

  List<ChooseItem> interColorList = [
    ChooseItem(name: '黑色'),
    ChooseItem(name: '米黄色'),
    ChooseItem(name: '米灰色'),
    ChooseItem(name: '红色'),
    ChooseItem(name: '棕色'),
    ChooseItem(name: '米/黑'),
    ChooseItem(name: '红/黑'),
    ChooseItem(name: '米灰/黑'),
    ChooseItem(name: '棕/黑'),
    ChooseItem(name: '白/黑'),
    ChooseItem(name: '其他'),
  ];

  List<ChooseItem> emission = [
  ChooseItem(name: '国一'),
  ChooseItem(name: '国二'),
  ChooseItem(name: '国三'),
  ChooseItem(name: '国四'),
  ChooseItem(name: '国五'),
  ChooseItem(name: '国六'),
  ChooseItem(name: '欧一'),
  ChooseItem(name: '欧二'),
  ChooseItem(name: '欧三'),
  ChooseItem(name: '欧四'),
  ChooseItem(name: '欧五'),
  ChooseItem(name: '欧六'),
  ];


  List<String> get carSourceList =>
      CarSource.values.map((e) =>  e.typeStr).toList();

  List<String> get carTypeList =>
      CarType.values.map((e) =>  e.typeStr).toList();

  List<String> get carStockStatusList =>
      CarStockStatus.values.map((e) =>  e.typeStr).toList();

  List<String> get natureOfUseList =>
      CarNatureOfUse.values.map((e) =>  e.typeStr).toList();

  List<String> get carPurchaseTypeList =>
      CarPurchaseType.values.map((e) =>  e.typeStr).toList();


  @override
  void initState() {
    super.initState();
    _publishCarInfo.locationCity = '宁波';
    _publishCarInfo.locationCityId = 42;
  }

  @override
  void dispose() {
    _viNumController.dispose();
    _carNumController.dispose();
    _engineController.dispose();
    _mileController.dispose();
    _carParkingNumController.dispose();
    _newCarPriceController.dispose();
    _purchaseTaxController.dispose();
    _retrofittingFeeController.dispose();
    _carDescriptionController.dispose();
    _wholesalePriceController.dispose();
    _salePriceController.dispose();
    _purchasePriceController.dispose();
    _transferNumController.dispose();
    _keyCountController.dispose();
    _commercialInsurancePriceController.dispose();
    _remarkController.dispose();
    BotToast.closeAllLoading();
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
        title: Text('车辆发布',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [

                  Padding(
                    padding: EdgeInsets.only(top: 0.w),
                    child: Container(

                      width: double.infinity,

                      child:
                      Column(
                        children: [
                          ScanLicenseWidget(onLoadComplete: (carInfoModel) {
                            if (carInfoModel.vinModel != null) {
                              _publishCarInfo.carName =
                                  carInfoModel.vinModel!.first.modelName;
                              _publishCarInfo.carModelId =
                                  carInfoModel.vinModel!.first.modelId;
                              _publishCarInfo.carColor =
                                  carInfoModel.vinModel!.first.color;
                            }
                            _viNumController.text = carInfoModel.vehicle.vin;
                            _publishCarInfo.licensingDate =
                                DateUtil.getDateTime(
                                    carInfoModel.vehicle.issuedate);
                            _carNumController.text = carInfoModel.vehicle.lsnum;
                            _engineController.text =
                                carInfoModel.vehicle.engineno;
                            setState(() {});
                          }),
                          _rewardWidget(),
                          Container(
                            width: double.infinity,
                            height: 40.w,
                            color: const Color(0xFFF6F6F6),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    30.wb,
                                    Container(
                                      padding: EdgeInsets.only(top: 20.w),
                                      width: 150.w,
                                      child: Text('备注',
                                          style: TextStyle(
                                            color: BaseStyle.color999999,
                                            fontSize: BaseStyle.fontSize28,)),
                                    )
                                  ],
                                )
                                ,
                                12.hb,
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.w),
                                      border: Border.all(color: BaseStyle.colordddddd,width: 2.w)
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 16.w,horizontal: 20.w),
                                  height: 200.w,
                                  child: TextField(
                                    maxLines: 50,
                                    keyboardType: TextInputType.text,
                                    onEditingComplete: () {

                                    },
                                    onChanged: (text) {
                                      _publishCarInfo.remark = text;
                                    },

                                    style: TextStyle(
                                      color: BaseStyle.color333333,
                                      fontSize: BaseStyle.fontSize28,),
                                    controller: _remarkController,
                                    decoration: InputDecoration(

                                      contentPadding: EdgeInsets.zero,
                                      filled: true,
                                      isDense: true,
                                      fillColor: Colors.white,
                                      hintText: "请输入",
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                32.hb,
                              ],
                            ),
                          ),
                          100.w.heightBox,
                          Padding(
                            padding:  EdgeInsets.all(20.w),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // if (!canTap) {
                                  //   return;
                                  // }
                                  Get.to(() => PushCarPicturePage(
                                        newPublishCarInfo: _publishCarInfo,
                                      ));
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                child: '下一步'
                                    .text
                                    .size(30.sp)
                                    .color(Colors.white)
                                    .make(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _rewardWidget() {
    var vinNum = EditItemWidget(
      title: '车架号',
      tips: '请输入车架号',
      controller: _viNumController,
    );
    var carNum = EditItemWidget(
      title: '临时车牌',
      tips: '请输入',
      controller: _carNumController,
        topIcon: false
    );
    var carParkingNum = EditItemWidget(
      title: '车位编号',
      tips: '请输入',
      controller: _carParkingNumController,
        topIcon: false
    );



    // var version = _textarea(
    //     '发动机号',
    //     '请输入发动机号',
    //     _publishCarInfo.engineNum??'',
    //     _engineController,
    //     (text) => setState(() {
    //           _publishCarInfo.engineNum = _engineController.text;
    //         }));
    var engineNum = EditItemWidget(
      title: '发动机号',
      tips: '请输入发动机号',
      controller: _engineController,
    );

    var mile = EditItemWidget(
      topIcon: true,
      title: '表现里程',
      tips: '请输入里程',
      controller: _mileController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.mileage = content;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      endText: '万公里',
    );

    var newCarPrice = EditItemWidget(
      title: '新车指导价',
      tips: '',
      controller: _newCarPriceController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      canChange: true,
      callback: (String content) {
        _publishCarInfo.newCarPrice = content;
      },
      endText: '万',
    );


    var purchaseTax = EditItemWidget(
      title: '购置税',
      tips: '请输入',
      controller: _purchaseTaxController,
      canChange: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      callback: (String content) {
        _publishCarInfo.purchaseTax = content;
      },
      endText: '万元',
    );

    var wholesalePrice = EditItemWidget(
      title: '批发价格',
      tips: '请输入',
      controller: _wholesalePriceController,
      canChange: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      callback: (String content) {
        _publishCarInfo.wholesalePrice = content;
      },
      endText: '万',
    );

    var salePrice = EditItemWidget(
      title: '销售价格',
      tips: '请输入',
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: _salePriceController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.salePrice = content;
      },
      endText: '万',
    );

    var retrofittingFee = EditItemWidget(
      title: '加装费用',
      tips: '请输入',
      controller: _retrofittingFeeController,
      canChange: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      callback: (String content) {
        _publishCarInfo.retrofittingFee = content;
      },
      endText: '元',
    );


    var purchasePrice = EditItemWidget(
      title: '采购价格',
      tips: '请输入', inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: _purchasePriceController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.purchasePrice = content;
      },
      endText: '万',
        topIcon: false
    );

    var transferNum = EditItemWidget(
        title: '采购价格',
        tips: '请输入', inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: _transferNumController,
        canChange: true,
        callback: (String content) {
          _publishCarInfo.transferNum = content;
        },
        endText: '次',
        topIcon: false
    );

    var keyCount = EditItemWidget(
        title: '钥匙数量',
        tips: '请输入', inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: _keyCountController,
        canChange: true,
        callback: (String content) {
          _publishCarInfo.keyCount = content;
        },
        endText: '把',
        topIcon: false
    );


    var commercialInsurancePrice = EditItemWidget(
      title: '商业险金额',
      tips: '请输入',
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: _commercialInsurancePriceController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.commercialInsurancePrice = content;
      },
      endText: '元',
      topIcon: false,
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          20.heightBox,
          Text('车辆信息',style: TextStyle(color: const Color(0xFF333333),fontSize: 28.w),),
          _function(
            '车辆来源',
                () async {
                  await showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
                    builder: (context) {
                      return CloudListPickerWidget(
                          title: '车辆来源',
                          items: carSourceList,
                          onConfirm: (str, index) {
                            _publishCarInfo.carSource = index;
                            Get.back();
                            setState(() {});
                          });
                    },
                  );
            },
            _publishCarInfo.carSourceEM.typeStr,
            '请选择',
          ),
          _publishCarInfo.carSource==1||_publishCarInfo.carSource==3? _function(
            '所属门店',
                () async {
                  ///需要新接口
                  Get.to(() => ChooseShopPage(
                    callback: (DealerListModel model) {
                      _publishCarInfo.carShop = model.name;
                      _publishCarInfo.carShopId = model.id;
                      setState(() {});
                    },
                  ));
              setState(() {});
            },
            _publishCarInfo.carShop,
            '请选择',
            topIcon: false
          ):const SizedBox(),
          _function(
            '车辆类型',
                () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudListPickerWidget(
                      title: '车辆类型',
                      items: carTypeList,
                      onConfirm: (str, index) {
                        _publishCarInfo.carType = index;
                        Get.back();
                        setState(() {});
                      });
                },
              );
            },
            _publishCarInfo.carTypeEM.typeStr,
            '请选择',
          ),
          _function(
            '品牌车型',
            () async {
              await Get.to(() => ChooseCarPage(
                    callback: () {
                      Get.back();
                      _publishCarInfo.carName = _pickCar.value.car.name;
                      _publishCarInfo.carModelId = _pickCar.value.car.modelId;
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    pickCar: _pickCar,
                  ));
              setState(() {});
            },
            _publishCarInfo.carName,
            '请输入具体车型',
          ),
          vinNum,
          engineNum,
          _function(
            '首次上牌',
                () async {
              var firstDate = await CarDatePicker.monthPicker(DateTime.now());
              _publishCarInfo.licensingDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.licensingDateStr,
            '选择首次上牌时间',
          ),
          _function(
            '车身颜色',
                () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudGridPickerWidget(
                      title: '车身颜色',
                      items: colorList.map((e) => e.name).toList(),
                      onConfirm: (strList, indexList) {
                        _publishCarInfo.carColor = strList.first;
                        Get.back();
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                      });
                },
              );
            },
            _publishCarInfo.carColor,
            '请输入车身颜色',
          ),

          _function(
            '内饰颜色',
                () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudGridPickerWidget(
                      title: '内饰颜色',
                      items: interColorList.map((e) => e.name).toList(),
                      onConfirm: (strList, indexList) {
                        _publishCarInfo.carDecorativeColor = strList.first;
                        Get.back();
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                      });
                },
              );
            },
            _publishCarInfo.carDecorativeColor,
            '请选择',
            topIcon: false
          ),
          carNum,
          carParkingNum,
          _function(
            '库存状态',
                () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudListPickerWidget(
                      title: '库存状态',
                      items: carStockStatusList,
                      onConfirm: (str, index) {
                        _publishCarInfo.carStockStatus = index;
                        Get.back();
                        setState(() {});
                      });
                },
              );
            },
            _publishCarInfo.carStockStatusEM.typeStr,
            '请选择',
              topIcon: false
          ),
          _function(
              '使用性质',
                  () async {
                await showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
                  builder: (context) {
                    return CloudListPickerWidget(
                        title: '使用性质',
                        items: natureOfUseList,
                        onConfirm: (str, index) {
                          _publishCarInfo.natureOfUse = index;
                          Get.back();
                          setState(() {});
                        });
                  },
                );
              },
              _publishCarInfo.natureOfUseEM.typeStr,
              '请选择',
          ),
          mile,
          _function(
            '出厂日期',
                () async {
              var firstDate = await CarDatePicker.monthPicker(DateTime.now());
              _publishCarInfo.productionDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.productionDateStr,
            '请选择',
            topIcon: false
          ),
          newCarPrice,
          purchaseTax,
          retrofittingFee,
          _function(
            '所在地',
            () async {
              await Get.to(() => CarThreeCityListPage(onSelect: (city) {
                    _publishCarInfo.locationCity = city.cityName;
                    _publishCarInfo.locationCityId = city.cityId;
                    Get.back();
                  }));
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.locationCity,
            '选择所在地区',
          ),
          _function(
              '环保等级',
                  () async {
                await showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
                  builder: (context) {
                    return CloudGridPickerWidget(
                        title: '环保等级',
                        items: emission.map((e) => e.name).toList(),
                        onConfirm: (strList, indexList) {
                          _publishCarInfo.environmentalLevel = strList.first;
                          Get.back();
                          FocusManager.instance.primaryFocus?.unfocus();
                          setState(() {});
                        });
                  },
                );
              },
              _publishCarInfo.environmentalLevel,
              '请选择'
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50.w,right: 5.w),
                    child: Text(
                      '*',
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: const Color(0xFFE62222),
                      ),
                    ),
                  ),
                  10.wb,
                  Container(
                    padding: EdgeInsets.only(top: 32.w),
                    width: 150.w,
                    child: Text('车况描述',
                        style: TextStyle(
                          color: BaseStyle.color999999,
                          fontSize: BaseStyle.fontSize28,)),
                  )
                ],
              )
             ,
              12.hb,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(color: BaseStyle.colordddddd,width: 2.w)
                ),
                padding: EdgeInsets.symmetric(vertical: 16.w,horizontal: 20.w),
                height: 200.w,
                child: TextField(
                  maxLines: 50,
                  keyboardType: TextInputType.text,
                  onEditingComplete: () {

                  },
                  onChanged: (text) {
                    _publishCarInfo.carDescription = text;
                  },

                  style: TextStyle(
                    color: BaseStyle.color333333,
                    fontSize: BaseStyle.fontSize28,),
                  controller: _carDescriptionController,
                  decoration: InputDecoration(

                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    isDense: true,
                    fillColor: Colors.white,
                    hintText: "请选择",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                    border: InputBorder.none,
                  ),
                ),
              ),
              32.hb,
            ],
          ),
          Text('价格信息',style: TextStyle(color: const Color(0xFF333333),fontSize: 28.w),),
          wholesalePrice,
          salePrice,
          _publishCarInfo.carSource==1||_publishCarInfo.carSource==3?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.hb,
              Text('采购信息',style: TextStyle(color: const Color(0xFF333333),fontSize: 28.w),),
              _function(
                '采购类型',
                    () async {
                  await showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
                    builder: (context) {
                      return CloudListPickerWidget(
                          title: '采购类型',
                          items: carPurchaseTypeList,
                          onConfirm: (str, index) {
                            _publishCarInfo.purchaseType = index;
                            Get.back();
                            setState(() {});
                          });
                    },
                  );
                },
                _publishCarInfo.purchaseTypeEM.typeStr,
                '请选择',
                  topIcon: false
              ),

              purchasePrice,
              _function(
                  '采购日期',
                      () async {
                    var firstDate = await CarDatePicker.monthPicker(DateTime.now());
                    _publishCarInfo.purchaseDate = firstDate;
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {});
                  },
                  _publishCarInfo.purchaseDateStr,
                  '请选择',
                  topIcon: false
              ),
              _function(
                  '采购人',
                      () async {
                        ///需要新接口
                    Get.to(()=> ChoosePurchaserPage(callback: (StaffAllModel model) {
                      _publishCarInfo.purchasePerson = model.name;
                      setState(() {});
                    },));


                  },
                  _publishCarInfo.purchasePerson,
                  '请选择',
                  topIcon: false
              ),
              _function(
                '门店',
                    () async {
                      ///需要新接口
                      Get.to(()=> ChoosePurchaserPage(callback: (StaffAllModel model) {

                      },));
                  setState(() {});
                },
                _publishCarInfo.purchaseStore,
                '请选择',
                topIcon: false,

              ),
            ],
          ):const SizedBox(),
          32.hb,
          Text('牌证信息',style: TextStyle(color: const Color(0xFF333333),fontSize: 28.w),),
          transferNum,
          keyCount,
          _showSelect(
              _publishCarInfo.haveCompulsoryInsurance ?? -1,
              '交强险', (choose) {
            FocusManager.instance.primaryFocus?.unfocus();
            if (choose != -1) {
              _publishCarInfo.haveCompulsoryInsurance = choose;
            } else {
              _publishCarInfo.haveCompulsoryInsurance = null;
            }

            setState(() {});
          }),
          _function(
              '交强险到期',
                  () async {
                var firstDate = await CarDatePicker.monthPicker(DateTime.now());
                _publishCarInfo.compulsoryInsuranceDate = firstDate;
                FocusManager.instance.primaryFocus?.unfocus();
                setState(() {});
              },
              _publishCarInfo.compulsoryInsuranceDateStr,
              '请选择日期',
              topIcon: false
          ),
          _showSelect(
              _publishCarInfo.haveCommercialInsurance ?? -1,
              '商业险', (choose) {
            FocusManager.instance.primaryFocus?.unfocus();
            if (choose != -1) {
              _publishCarInfo.haveCommercialInsurance = choose;
            } else {
              _publishCarInfo.haveCommercialInsurance = null;
            }

            setState(() {});
          }),
          _function(
              '商业险到期',
                  () async {
                var firstDate = await CarDatePicker.monthPicker(DateTime.now());
                _publishCarInfo.commercialInsuranceDate = firstDate;
                FocusManager.instance.primaryFocus?.unfocus();
                setState(() {});
              },
              _publishCarInfo.commercialInsuranceDateStr,
              '请选择日期',
              topIcon: false
          ),

          commercialInsurancePrice,
          32.hb,

        ],
      ),
    );
  }

  _textarea(String title, String hint, String content,
      TextEditingController contentController, Function(String) callback) {
    return ColoredBox(
      color: Colors.transparent,
      child: Row(
        children: [
          '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 170.w,
            child: title.text
                .size(30.sp)
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              onChanged: callback,
              autofocus: false,
              controller: contentController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                    color: Color(0xFFcccccc),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          24.wb,
        ],
      ),
    );
  }

  bool get canTap {
    if(_publishCarInfo.carSource==null){
      BotToast.showText(text: '请选择车辆来源');
      return false;
    }
    if(_publishCarInfo.carType==null){
      BotToast.showText(text: '请选择车辆类型');
      return false;
    }

    if (_viNumController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入车架号');
      return false;
    }
    if (_publishCarInfo.carName.isEmptyOrNull) {
      BotToast.showText(text: '请选择车型');
      return false;
    }
    if (_publishCarInfo.licensingDate == null) {
      BotToast.showText(text: '请选择首次上牌时间');
      return false;
    }

    if (_publishCarInfo.locationCity.isEmptyOrNull) {
      CloudToast.show('请选择所在地区');
      return false;
    }

    if (_engineController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入发动机号');
      return false;
    }
    if (_publishCarInfo.carColor.isEmptyOrNull) {
      BotToast.showText(text: '请选择车身颜色');
      return false;
    }
    if (_mileController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入行驶里程');
      return false;
    }
    if (_publishCarInfo.locationCity.isEmptyOrNull) {
      BotToast.showText(text: '请选择所在地');
      return false;
    }
    if (_publishCarInfo.environmentalLevel.isEmptyOrNull) {
      BotToast.showText(text: '请选择环保等级');
      return false;
    }
    if (_publishCarInfo.carDescription.isEmptyOrNull) {
      BotToast.showText(text: '请输入车况描述');
      return false;
    }
    if (_publishCarInfo.wholesalePrice.isEmptyOrNull) {
      BotToast.showText(text: '请输入批发价格');
      return false;
    }

    if (_publishCarInfo.salePrice.isEmptyOrNull) {
      BotToast.showText(text: '请输入销售价格');
      return false;
    }

    _publishCarInfo.mileage = _mileController.text;
    _publishCarInfo.viNum = _viNumController.text;
    _publishCarInfo.engineNum = _engineController.text;
    return true;
  }

  _function(
    String title,
    VoidCallback onTap,
    String? content,
    String msg,{bool topIcon = true}
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: EditItemWidget(
          title: title,
          tips: msg,
          value: content ?? '',
          topIcon: topIcon,
          paddingStart: 28,
          canChange: false,
          callback: (String content) {},
          endIcon: Image.asset(
            Assets.icons.icGoto.path,
            width: 32.w,
            height: 32.w,
          ),
        ),
      ),
    );
  }

  _showSelect(
      int select,
      String title,
      Function(int choose) callBack,
      ) {
    return Container(
      padding: EdgeInsets.only(
        top: 40.w,
      ),
      color: Colors.transparent,
      child: Row(
        children: [
          30.wb,
          SizedBox(
            width: 170.w,
            child: title.text
                .size(26.sp)
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (select == 1) {
                    select = -1;
                  } else {
                    select = 1;
                  }
                  setState(() {});
                  callBack(select);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50.w,
                        height: 50.w,
                        padding: EdgeInsets.only(top: 6.w, right: 5.w),
                        child: !(select == 1)
                            ? const Icon(CupertinoIcons.circle,
                            size: 18, color: Color(0xFFdddddd))
                            : const Icon(
                            CupertinoIcons.checkmark_alt_circle_fill,
                            size: 18,
                            color: Colors.blue)),
                    RichText(
                      text: TextSpan(
                        text: "有",
                        style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      ),
                    ),
                  ],
                ),
              ),
              30.widthBox,
              GestureDetector(
                onTap: () {
                  if (select == 0) {
                    select = -1;
                  } else {
                    select = 0;
                  }
                  setState(() {});
                  callBack(select);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50.w,
                        height: 50.w,
                        padding: EdgeInsets.only(top: 6.w, right: 5.w),
                        child: select == 1 || select == -1
                            ? const Icon(CupertinoIcons.circle,
                            size: 18, color: Color(0xFFdddddd))
                            : const Icon(
                            CupertinoIcons.checkmark_alt_circle_fill,
                            size: 18,
                            color: Colors.blue)),
                    RichText(
                      text: TextSpan(
                        text: "无",
                        style: TextStyle(color: Colors.black, fontSize: 30.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}

class RadioModel {
  bool? isSelected;
  String? buttonText;

  RadioModel({
    this.isSelected,
    this.buttonText,
  });
}

class NewPublishCarInfo {
  ///车辆来源
  int? carSource;

  CarSource get carSourceEM => CarSource.getValue(carSource??0);

  ///所属门店
  String? carShop;
  int? carShopId;

  ///车辆类型
  int? carType;
  CarType get carTypeEM => CarType.getValue(carType??0);

  ///车架号
  String? viNum;

  ///车型
  String? carName;
  int? carModelId;
  ///发动机号
  String? engineNum;

  ///首次上牌时间
  DateTime? licensingDate;

  String get licensingDateStr =>
      DateUtil.formatDate(licensingDate, format: 'yyyy-MM');


  ///车身颜色
  String? carColor;

  ///车辆内饰颜色
  String? carDecorativeColor;

  ///车辆临时车牌
  String? carTemporaryNum;

  ///车位编号
  String? carParkingNum;

  ///车辆库存状态
  int? carStockStatus;
  CarStockStatus get carStockStatusEM => CarStockStatus.getValue(carStockStatus??0);

  ///车辆使用性质
  int? natureOfUse;
  CarNatureOfUse get natureOfUseEM => CarNatureOfUse.getValue(natureOfUse??0);

  ///表显里程
  String? mileage;

  ///出厂日期
  DateTime? productionDate;

  String get productionDateStr =>
      DateUtil.formatDate(productionDate, format: 'yyyy-MM');

  ///新车指导价
  String? newCarPrice;///选择车型以后调用接口获取数据

  ///购置税
  String? purchaseTax;

  ///加装费用
  String? retrofittingFee;

  /// 所在地区
  String? locationCity;

  /// 所在地区id
  int? locationCityId;

  ///环保等级
  String? environmentalLevel;

  ///车况描述
  String? carDescription;

  ///批发价格
  String? wholesalePrice;

  ///销售价格
  String? salePrice;

  ///采购类型
  int? purchaseType;
  CarPurchaseType get purchaseTypeEM => CarPurchaseType.getValue(purchaseType??0);

  ///采购价格
  String? purchasePrice;

  ///采购日期
  DateTime? purchaseDate;

  String get purchaseDateStr =>
      DateUtil.formatDate(purchaseDate, format: 'yyyy-MM');

  ///采购人
  String? purchasePerson;
  int? purchasePersonId;

  ///采购门店
  String? purchaseStore;
  int? purchaseStoreId;

  ///过户次数
  String? transferNum;

  ///钥匙数量
  String? keyCount;

  ///是否交强险
  int? haveCompulsoryInsurance;

  ///交强险到期时间
  DateTime? compulsoryInsuranceDate;
  String get compulsoryInsuranceDateStr =>
      DateUtil.formatDate(purchaseDate, format: 'yyyy-MM');

  ///是否有商业险
  int? haveCommercialInsurance;

  ///商业险到期时间
  DateTime? commercialInsuranceDate;
  String get commercialInsuranceDateStr =>
      DateUtil.formatDate(purchaseDate, format: 'yyyy-MM');

  ///商业险金额
  String? commercialInsurancePrice;

  ///备注
  String? remark;

  static NewPublishCarInfo get empty => NewPublishCarInfo(
        carSource:0,
        carShop:'',
        viNum: '',
        locationCity: '',
        locationCityId: 0,
        carName: '',
        carColor: '',
        carModelId: 0,
        licensingDate: DateTime.now(),
        engineNum: '',
        mileage: '',
        carType: 0,
        salePrice: '',
        remark: '',
        commercialInsurancePrice: '',
        commercialInsuranceDate: DateTime.now(),
        compulsoryInsuranceDate: DateTime.now(),
        keyCount: '',
        transferNum: '',
        carDecorativeColor: '',
        carDescription: '',
        carParkingNum: '',
        carShopId: 0,
        carStockStatus: 0,
        carTemporaryNum: '',
        environmentalLevel: '',
        haveCommercialInsurance: -1,
        haveCompulsoryInsurance: -1,
        natureOfUse: 0,
        newCarPrice: '',
        productionDate: DateTime.now(),
        purchaseDate:  DateTime.now(),
        purchasePerson:'',
        purchasePersonId:0,
        purchasePrice:'',
        purchaseStore:'',
        purchaseStoreId:0,
        purchaseTax:'',
        purchaseType:0,
        retrofittingFee:'',
        wholesalePrice:''
      );

  NewPublishCarInfo({
    this.carSource,
    this.viNum,
    this.carName,
    this.licensingDate,
    this.locationCity,
    this.locationCityId,
    this.engineNum,
    this.carColor,
    this.mileage,
    this.carModelId,
    this.carType,
    this.salePrice,
    this.remark,
    this.commercialInsurancePrice,
    this.commercialInsuranceDate,
    this.compulsoryInsuranceDate,
    this.keyCount,
    this.transferNum,
    this.carDecorativeColor,
    this.carDescription,
    this.carParkingNum,
    this.carShop,
    this.carShopId,
    this.carStockStatus,
    this.carTemporaryNum,
    this.environmentalLevel,
    this.haveCommercialInsurance,
    this.haveCompulsoryInsurance,
    this.natureOfUse,
    this.newCarPrice,
    this.productionDate,
    this.purchaseDate,
    this.purchasePerson,
    this.purchasePersonId,
    this.purchasePrice,
    this.purchaseStore,
    this.purchaseStoreId,
    this.purchaseTax,
    this.purchaseType,
    this.retrofittingFee,
    this.wholesalePrice
  });
}
