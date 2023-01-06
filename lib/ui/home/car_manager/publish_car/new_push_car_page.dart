import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/model/contract/report_photo_model.dart';
import 'package:cloud_car/model/order/individual_model.dart';
import 'package:cloud_car/model/region/china_region_model.dart';
import 'package:cloud_car/model/user/store_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_manage_photo_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_picture_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/ui/home/car_valuation/car_valuation_page.dart';
import 'package:cloud_car/ui/home/sort/choose_city_page.dart';
import 'package:cloud_car/utils/custom_floating_action_button_location.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/picker/cloud_grid_picker_widget.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:cloud_car/widget/scan_license_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../model/publish_info_model.dart';
import '../../../../model/sort/sort_brand_model.dart';
import '../../../../model/sort/sort_car_model_model.dart';
import '../../../../model/sort/sort_series_model.dart';
import '../../../../model/user/staff_all_model.dart';
import '../../../../model/user/storeall_model.dart';
import '../../../../widget/button/cloud_back_button.dart';
import '../../../../widget/picker/car_date_picker.dart';
import '../../../../widget/sort_widget.dart';
import '../../sort/choose_car_page.dart';
import '../../sort/search_param_model.dart';
import '../direct_sale/edit_item_widget.dart';
import 'choose_purchaser_page.dart';
import 'choose_shop_page.dart';

class NewPushCarPage extends StatefulWidget {
  final IndividualModel? individualModel;
  final PublishInfoModel? publishInfoModel;

  const NewPushCarPage(
      {super.key, this.individualModel, this.publishInfoModel});

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

  final ValueNotifier<PushPhotoModel> carPhotoModel =
      ValueNotifier(PushPhotoModel.init);

  final ValueNotifier<ReportPhotoModel> reportPhotoModel =
      ValueNotifier(ReportPhotoModel.init);

  final ValueNotifier<NewPublishCarInfo> _publishCarInfo =
      ValueNotifier(NewPublishCarInfo());

  late CarDistinguishModel? carInfoModel;

  final TextEditingController _viNumController = TextEditingController();
  final TextEditingController _carNumController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _mileController = TextEditingController();
  final TextEditingController _carParkingNumController =
      TextEditingController();
  final TextEditingController _newCarPriceController = TextEditingController();
  final TextEditingController _purchaseTaxController = TextEditingController();
  final TextEditingController _retrofittingFeeController =
      TextEditingController();
  final TextEditingController _carDescriptionController =
      TextEditingController();
  final TextEditingController _wholesalePriceController =
      TextEditingController();
  final TextEditingController _salePriceController = TextEditingController();
  final TextEditingController _purchasePriceController =
      TextEditingController();
  final TextEditingController _transferNumController = TextEditingController();
  final TextEditingController _keyCountController = TextEditingController();
  final TextEditingController _commercialInsurancePriceController =
      TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _purchasePrice = TextEditingController();
  final TextEditingController _purchase = TextEditingController();

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
  ];

  List<String> get carSourceList =>
      CarSource.values.map((e) => e.typeStr).toList();

  List<String> get carTypeList => CarType.values.map((e) => e.typeStr).toList();

  List<String> get carStockStatusList =>
      CarStockStatus.values.map((e) => e.typeStr).toList();

  List<String> get natureOfUseList =>
      CarNatureOfUse.values.map((e) => e.typeStr).toList();

  List<String> get carPurchaseTypeList =>
      CarPurchaseType.values.map((e) => e.typeStr).toList();

  List<String> get purchaseTypeList =>
      CarNatureOfUse.values.map((e) => e.typeStr).toList();

  @override
  void initState() {
    super.initState();
    // _publishCarInfo.value.locationCity = '宁波';
    // _publishCarInfo.value.locationCityId = 119;

    if (widget.individualModel != null) {
      _publishCarInfo.value.carSource = 1;
      _publishCarInfo.value.carName = widget.individualModel!.model.name;
      _publishCarInfo.value.carModelId = widget.individualModel!.model.id;
      _publishCarInfo.value.newCarPrice = widget.individualModel!.model.price;
      _newCarPriceController.text = widget.individualModel!.model.price;
      _publishCarInfo.value.licensingDate = DateTime.fromMillisecondsSinceEpoch(
          widget.individualModel!.contract.licensingDate * 1000);

      _viNumController.text = widget.individualModel!.contract.vin;
      _engineController.text = widget.individualModel!.contract.engine;
      _publishCarInfo.value.carColor = widget.individualModel!.contract.color;
      _mileController.text =
          (num.parse(widget.individualModel!.contract.mileage) / 10000)
              .toString();

      _keyCountController.text =
          (widget.individualModel!.contract.keyCount).toString();

      _transferNumController.text =
          (widget.individualModel!.contract.transfer).toString();

      _publishCarInfo.value.haveCompulsoryInsurance =
          widget.individualModel!.contract.compulsoryInsurance;
      if (widget.individualModel!.contract.compulsoryInsurance != 0) {
        _publishCarInfo.value.compulsoryInsuranceDate =
            DateTime.fromMillisecondsSinceEpoch(
                widget.individualModel!.contract.compulsoryInsuranceDate *
                    1000);
      }
      _publishCarInfo.value.haveCommercialInsurance =
          widget.individualModel!.contract.commercialInsurance;
      if (widget.individualModel!.contract.commercialInsurance != 0) {
        _publishCarInfo.value.commercialInsuranceDate =
            DateTime.fromMillisecondsSinceEpoch(
                widget.individualModel!.contract.commercialInsuranceDate *
                    1000);
        _commercialInsurancePriceController.text =
            widget.individualModel!.contract.commercialInsurancePrice;
      }
    }

    if (widget.publishInfoModel != null) {
      // 车辆来源
      _publishCarInfo.value.carSource = widget.publishInfoModel?.source ?? 1;
      // 品牌车型
      _publishCarInfo.value.carName = widget.publishInfoModel?.modelName ?? '';
      _publishCarInfo.value.carModelId = widget.publishInfoModel?.modelId ?? 0;
      // 所属门店
      _publishCarInfo.value.carShop =
          widget.publishInfoModel?.dealerInfo.name ?? '';
      _publishCarInfo.value.carShopId =
          widget.publishInfoModel?.dealerInfo.id ?? 0;
      // 车辆类型
      _publishCarInfo.value.carType =
          CarType.getValues(widget.publishInfoModel?.type ?? '').typeNum;
      // _publishCarInfo.value.carTypeEM.typeStr=widget.publishInfoModel?.type ?? '';
      // 车架号
      _viNumController.text = widget.publishInfoModel?.vin ?? '';
      //发动机号
      _engineController.text = widget.publishInfoModel?.engineNo ?? '';
      // 首次上牌
      _publishCarInfo.value.licensingDate = DateTime.fromMillisecondsSinceEpoch(
          (widget.publishInfoModel!.licensingDate).toInt() * 1000);
      //车身颜色
      _publishCarInfo.value.carColor = widget.publishInfoModel?.color ?? '';
      //内饰颜色
      _publishCarInfo.value.carDecorativeColor =
          widget.publishInfoModel?.interiorColor ?? '';
      //所在地
      _publishCarInfo.value.locationCity =
          widget.publishInfoModel?.location ?? '';
      _publishCarInfo.value.locationCityId =
          widget.publishInfoModel!.locationCityId;
      //上牌地
      _publishCarInfo.value.attribution =
          widget.publishInfoModel?.attribution ?? '';
      _publishCarInfo.value.attributionId =
          widget.publishInfoModel!.attributionCityId;
      //使用性质
      _publishCarInfo.value.natureOfUse =
          CarNatureOfUse.getValues(widget.publishInfoModel!.useCharacter)
              .typeNum;
      //表显里程
      _mileController.text = widget.publishInfoModel?.mileage ?? '';
      //车牌号
      _carNumController.text =
          widget.publishInfoModel?.temporaryLicensePlate ?? '';
      //车位编号
      _carParkingNumController.text = widget.publishInfoModel?.parkingNo ?? '';
      //库存状态
      _publishCarInfo.value.carStockStatus =
          widget.publishInfoModel!.stockStatus;
      //新车指导价
      _publishCarInfo.value.newCarPrice = widget.publishInfoModel?.price ?? '';
      //置购税
      _purchaseTaxController.text =
          (num.parse(widget.publishInfoModel!.purchaseTax) / 10000).toString();
      //加装费用
      _retrofittingFeeController.text =
          widget.publishInfoModel?.installationCost ?? '';
      //车况描述
      _publishCarInfo.value.carDescription =
          widget.publishInfoModel?.condition ?? '';
      //内部价格
      _wholesalePriceController.text =
          widget.publishInfoModel?.priceInfo.interiorPrice ?? '';
      // _publishCarInfo.value.wholesalePrice =
      //     widget.publishInfoModel?.priceInfo.interiorPrice ?? '';
      //外部价格
      _salePriceController.text =
          widget.publishInfoModel?.priceInfo.exteriorPrice ?? '';
      // _publishCarInfo.value.salePrice =
      //     widget.publishInfoModel?.priceInfo.exteriorPrice ?? '';
      //采购信息
      if (widget.publishInfoModel!.purchaseInfo.date > 0) {
        _purchase.text = widget.publishInfoModel?.purchaseInfo.liaison ?? '';
        _purchasePrice.text = widget.publishInfoModel?.purchaseInfo.price ?? '';
        _publishCarInfo.value.purchaseDate =
            DateTime.fromMillisecondsSinceEpoch(
                (widget.publishInfoModel!.purchaseInfo.date).toInt() * 1000);
      }
      //过户次数
      _transferNumController.text =
          widget.publishInfoModel?.certificateInfo.transfer == 0
              ? ''
              : (widget.publishInfoModel?.certificateInfo.transfer).toString();
      //钥匙数量
      _keyCountController.text =
          widget.publishInfoModel?.certificateInfo.keyCount == 0
              ? ''
              : (widget.publishInfoModel?.certificateInfo.keyCount).toString();
      //强交险
      _publishCarInfo.value.haveCompulsoryInsurance =
          widget.publishInfoModel!.certificateInfo.compulsoryInsurance;
      if (widget.publishInfoModel!.certificateInfo.compulsoryInsurance != 0) {
        _publishCarInfo.value.compulsoryInsuranceDate =
            DateTime.fromMillisecondsSinceEpoch((widget.publishInfoModel!
                        .certificateInfo.compulsoryInsuranceDate)
                    .toInt() *
                1000);
      }
      //商业险
      _publishCarInfo.value.haveCommercialInsurance =
          widget.publishInfoModel!.certificateInfo.compulsoryInsurance;
      if (widget.publishInfoModel!.certificateInfo.compulsoryInsurance != 0) {
        _publishCarInfo.value.commercialInsuranceDate =
            DateTime.fromMillisecondsSinceEpoch((widget.publishInfoModel!
                        .certificateInfo.compulsoryInsuranceDate)
                    .toInt() *
                1000);
        _commercialInsurancePriceController.text =
            widget.publishInfoModel!.certificateInfo.commercialInsurancePrice;
      }
      //备注
      _publishCarInfo.value.remark = widget.publishInfoModel!.remark;
      // 照片图片
      carPhotoModel.value = PushPhotoModel(
          carPhotos: widget.publishInfoModel!.carPhotos,
          interiorPhotos: widget.publishInfoModel!.interiorPhotos,
          defectPhotos: widget.publishInfoModel!.defectPhotos,
          dataPhotos: widget.publishInfoModel!.dataPhotos);
    }
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
    _purchasePrice.dispose();
    _purchase.dispose();
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
        // actions: [
        //   Center(
        //     child: GestureDetector(
        //       onTap: (){},
        //       child:  Padding(
        //         padding: EdgeInsets.only(right: 32.w),
        //         child: Text('草稿箱',style: TextStyle(color: const Color(0xFF333333),fontSize: 28.sp,fontWeight: FontWeight.w500),),
        //       ),
        //     ),
        //   )
        // ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //
      //
      // },child:
      //
      // SizedBox(
      //   width: 120.w,
      //   height: 120.w,
      //   child: AspectRatio(
      //     aspectRatio: 1,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.all(Radius.circular(60.w)),
      //       child:   Image.asset(Assets.images.imgSave.path,width: 120.w,height: 120.w,),
      //     ),
      //   ),
      // ),
      // ),
      // floatingActionButtonLocation: CustomFloatingActionButtonLocation(
      //     FloatingActionButtonLocation.endDocked,2.w, -130.w),
      backgroundColor: bodyColor,
      extendBody: true,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 20.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              color: Colors.white,
                            ),
                            child: ScanLicenseWidget(
                                onLoadComplete: (carInfoModel) {
                              if (carInfoModel.vinModel != null) {
                                _publishCarInfo.value.carName =
                                    carInfoModel.vinModel!.first.modelName;
                                _publishCarInfo.value.carModelId =
                                    carInfoModel.vinModel!.first.modelId;
                                _publishCarInfo.value.carColor =
                                    carInfoModel.vinModel!.first.color;
                                _publishCarInfo.value.carTemporaryNum =
                                    carInfoModel.vehicle.lsnum;
                              }
                              _newCarPriceController.text =
                                  carInfoModel.vinModel!.first.modelPrice != 0
                                      ? (carInfoModel
                                              .vinModel!.first.modelPrice)
                                          .toString()
                                      : '无';
                              _viNumController.text = carInfoModel.vehicle.vin;
                              _publishCarInfo.value.licensingDate =

                                  ///carInfoModel.vehicle.regdate as DateTime?;
                                  DateUtil.getDateTime(
                                      carInfoModel.vehicle.regdate);
                              _carNumController.text =
                                  carInfoModel.vehicle.lsnum;
                              _engineController.text =
                                  carInfoModel.vehicle.engineno;

                              setState(() {});
                            }),
                          ),
                          _rewardWidget(),
                          80.w.heightBox,
                          Padding(
                            padding: EdgeInsets.all(20.w),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (!canTap) {
                                    return;
                                  }
                                  // print("这是数据${_publishCarInfo.}");

                                  Get.to(
                                    PushCarManagePhotoPage(
                                      tabs: const [
                                        '车辆照片',
                                        '内饰照片',
                                        '缺陷照片',
                                        '车辆数据'
                                      ],

                                      model: carPhotoModel.value,
                                      initIndex: 0,
                                      // reportPhotoModel: widget.reportPhotoModel,
                                      newPublishCarInfo: _publishCarInfo.value,
                                    ),
                                  );
                                  // Get.to(() => PushCarPicturePage(
                                  //       newPublishCarInfo:
                                  //           _publishCarInfo.value,
                                  //       carPhotoModel: carPhotoModel.value,
                                  //       // reportPhotoModel:
                                  //       //     reportPhotoModel.value,
                                  //     ));
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
                          50.hb,
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
      title: '车牌号',
      tips: '请输入',
      controller: _carNumController,
      topIcon: true,
      callback: (String content) {
        _publishCarInfo.value.carTemporaryNum = content;
      },
    );
    var carParkingNum = EditItemWidget(
      title: '车位编号',
      tips: '请输入',
      controller: _carParkingNumController,
      topIcon: false,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
    );

    var engineNum = EditItemWidget(
      title: '发动机号',
      tips: '请输入发动机号',
      controller: _engineController,
    );

    var mile = EditItemWidget(
      topIcon: true,
      title: '表显里程',
      tips: '请输入里程',
      controller: _mileController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.value.mileage = content;
      },
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      endText: '万公里',
    );

    var newCarPrice = EditItemWidget(
      title: '新车指导价',
      tips: '',
      controller: _newCarPriceController,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      canChange: true,
      callback: (String content) {
        _publishCarInfo.value.newCarPrice = content;
      },
      endText: '万',
      topIcon: false,
    );

    var purchaseTax = EditItemWidget(
      title: '购置税',
      tips: '请输入',
      controller: _purchaseTaxController,
      canChange: true,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      callback: (String content) {
        _publishCarInfo.value.purchaseTax = content;
      },
      endText: '万元',
      topIcon: false,
    );

    var wholesalePrice = EditItemWidget(
      title: '内部价格',
      tips: '请输入',
      controller: _wholesalePriceController,
      canChange: true,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      callback: (String content) {
        _publishCarInfo.value.wholesalePrice = content;
      },
      endText: '万',
    );

    var salePrice = EditItemWidget(
      title: _publishCarInfo.value.carSource != 1 ? '外部价格' : '评估价格',
      tips: '请输入',
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      controller: _salePriceController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.value.salePrice = content;
      },
      endText: '万',
    );
    var purchasePrice = EditItemWidget(
      topIcon: false,
      title: '采购价格',
      tips: '请输入',
      controller: _purchasePrice,
      canChange: true,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      callback: (String content) {
        _publishCarInfo.value.purchasePrice = content;
      },
      endText: '万',
    );
    var purchase = EditItemWidget(
      topIcon: false,
      title: '采购人',
      tips: '请输入',
      controller: _purchase,
      canChange: true,
      // inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      callback: (String content) {
        _publishCarInfo.value.purchasePerson = content;
      },
      endText: '',
    );
    var retrofittingFee = EditItemWidget(
      title: '加装费用',
      tips: '请输入',
      controller: _retrofittingFeeController,
      canChange: true,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      callback: (String content) {
        _publishCarInfo.value.retrofittingFee = content;
      },
      endText: '元',
      topIcon: false,
    );

    // var purchasePrice = EditItemWidget(
    //   title: '采购价格',
    //   tips: '请输入', inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
    //   controller: _purchasePriceController,
    //   canChange: true,
    //   callback: (String content) {
    //     _publishCarInfo.value.purchasePrice = content;
    //   },
    //   endText: '万',
    //     topIcon: false
    // );

    var transferNum = EditItemWidget(
        title: '过户次数',
        tips: '请输入',
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
        controller: _transferNumController,
        canChange: true,
        callback: (String content) {
          _publishCarInfo.value.transferNum = content;
        },
        endText: '次',
        topIcon: false);

    var keyCount = EditItemWidget(
        title: '钥匙数量',
        tips: '请输入',
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
        controller: _keyCountController,
        canChange: true,
        callback: (String content) {
          _publishCarInfo.value.keyCount = content;
        },
        endText: '把',
        topIcon: false);

    var commercialInsurancePrice = EditItemWidget(
      title: '商业险金额',
      tips: '请输入',
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      controller: _commercialInsurancePriceController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.value.commercialInsurancePrice = content;
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
      // padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFFF6F6F6),
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            child: Text(
              '车辆档案',
              style: TextStyle(color: const Color(0xFF999999), fontSize: 36.w),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                _function(
                  '车辆来源',
                  () async {
                    await showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.w))),
                      builder: (context) {
                        return CloudListPickerWidget(
                            initIndex: _publishCarInfo.value.carSource ?? 1,
                            title: '车辆来源',
                            items: carSourceList,
                            onConfirm: (str, index) {
                              _publishCarInfo.value.carSource = index;
                              Get.back();
                              setState(() {});
                            });
                      },
                    );
                  },
                  _publishCarInfo.value.carSourceEM.typeStr,
                  '请选择',
                ),
                _function(
                  '所属门店',
                  () async {
                    ///需要新接口
                    Get.to(() => ChooseShopPage(
                          callback: (StoreModel model) {
                            _publishCarInfo.value.carShop = model.name;
                            _publishCarInfo.value.carShopId = model.id;
                            setState(() {});
                          },
                        ));
                    setState(() {});
                  },
                  _publishCarInfo.value.carShop,
                  '请选择',
                ),
                _function(
                  '车辆类型',
                  () async {
                    await showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.w))),
                      builder: (context) {
                        return CloudListPickerWidget(
                            initIndex: _publishCarInfo.value.carType ?? 1,
                            title: '车辆类型',
                            items: carTypeList,
                            onConfirm: (str, index) {
                              _publishCarInfo.value.carType = index;
                              Get.back();
                              setState(() {});
                            });
                      },
                    );
                  },
                  _publishCarInfo.value.carTypeEM.typeStr,
                  '请选择',
                ),
                _function(
                  '品牌车型',
                  () async {
                    await Get.to(() => ChooseCarPage(
                          callback: () {
                            Get.back();
                            _publishCarInfo.value.carName =
                                _pickCar.value.car.name;
                            _publishCarInfo.value.carModelId =
                                _pickCar.value.car.modelId;
                            _publishCarInfo.value.newCarPrice =
                                _pickCar.value.car.guidePrice;

                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          pickCar: _pickCar,
                        ));
                    setState(() {});
                  },
                  _publishCarInfo.value.carName,
                  '请输入具体车型',
                ),
                vinNum,
                engineNum,
                _function(
                  '首次上牌',
                  () async {
                    var firstDate =
                        await CarDatePicker.monthPicker(DateTime.now());
                    // await CarDatePicker.calenderPicker(
                    //     DateTime(1960), DateTime.now());
                    _publishCarInfo.value.licensingDate = firstDate;
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {});
                  },
                  _publishCarInfo.value.licensingDateStr,
                  '选择首次上牌时间',
                ),
                _function(
                  '车身颜色',
                  () async {
                    await showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.w))),
                      builder: (context) {
                        return CloudGridPickerWidget(
                            time: false,
                            title: '车身颜色',
                            items: colorList.map((e) => e.name).toList(),
                            onConfirm: (strList, indexList) {
                              if (strList.isNotEmpty) {
                                _publishCarInfo.value.carColor = strList.first;
                                // Get.back();
                                FocusManager.instance.primaryFocus?.unfocus();
                                setState(() {});
                              }
                            });
                      },
                    );
                  },
                  _publishCarInfo.value.carColor,
                  '请输入车身颜色',
                ),
                _function('内饰颜色', () async {
                  await showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.w))),
                    builder: (context) {
                      return CloudGridPickerWidget(
                          time: false,
                          title: '内饰颜色',
                          items: interColorList.map((e) => e.name).toList(),
                          onConfirm: (strList, indexList) {
                            if (strList.isNotEmpty) {
                              _publishCarInfo.value.carDecorativeColor =
                                  strList.first;
                              // Get.back(); /
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {});
                            }
                          });
                    },
                  );
                }, _publishCarInfo.value.carDecorativeColor, '请选择',
                    topIcon: false),
                _function(
                  '所在地',
                  () async {
                    await Get.to(() => ChooseCityPage(
                          callback: (ChinaRegionModel model) {
                            _publishCarInfo.value.locationCity = model.name;
                            _publishCarInfo.value.locationCityId = model.id;
                            setState(() {});
                          },
                        ));
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {});
                  },
                  _publishCarInfo.value.locationCity,
                  '请选择',
                ),
                _function(
                  '上牌地',
                  () async {
                    await Get.to(() => ChooseCityPage(
                          callback: (ChinaRegionModel model) {
                            _publishCarInfo.value.attribution = model.name;
                            _publishCarInfo.value.attributionId = model.id;
                            setState(() {});
                          },
                        ));
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {});
                  },
                  _publishCarInfo.value.attribution,
                  '请选择',
                ),
                _function(
                  '使用性质',
                  () async {
                    await showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.w))),
                      builder: (context) {
                        return CloudListPickerWidget(
                            title: '使用性质',
                            items: natureOfUseList,
                            onConfirm: (str, index) {
                              _publishCarInfo.value.natureOfUse = index;
                              FocusManager.instance.primaryFocus?.unfocus();
                              Get.back();
                              setState(() {});
                            });
                      },
                    );
                  },
                  _publishCarInfo.value.natureOfUseEM.typeStr,
                  '请选择',
                ),
                mile,
                carNum,
                carParkingNum,
                _function('库存状态', () async {
                  await showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.w))),
                    builder: (context) {
                      return CloudListPickerWidget(
                          title: '库存状态',
                          items: carStockStatusList,
                          onConfirm: (str, index) {
                            _publishCarInfo.value.carStockStatus = index;
                            FocusManager.instance.primaryFocus?.unfocus();
                            Get.back();
                            setState(() {});
                          });
                    },
                  );
                }, _publishCarInfo.value.carStockStatusEM.typeStr, '请选择',
                    topIcon: false),
                newCarPrice,
                purchaseTax,
                retrofittingFee,
              ],
            ),
          ),

          // _function('出厂日期', () async {
          //   // var firstDate = await CarDatePicker.calenderPicker(
          //   //     DateTime(1960), DateTime.now());
          //   var firstDate = await CarDatePicker.monthPicker(DateTime.now());
          //   _publishCarInfo.value.productionDate = firstDate;
          //   FocusManager.instance.primaryFocus?.unfocus();
          //   setState(() {});
          // }, _publishCarInfo.value.productionDateStr, '请选择', topIcon: false),

          // _function('环保等级', () async {
          //   await showModalBottomSheet(
          //     context: context,
          //     shape: RoundedRectangleBorder(
          //         borderRadius:
          //             BorderRadius.vertical(top: Radius.circular(16.w))),
          //     builder: (context) {
          //       return CloudGridPickerWidget(
          //           title: '环保等级',
          //           items: emission.map((e) => e.name).toList(),
          //           onConfirm: (strList, indexList) {
          //             if (strList.isNotEmpty) {
          //               _publishCarInfo.value.environmentalLevel =
          //                   strList.first;
          //               Get.back();
          //               FocusManager.instance.primaryFocus?.unfocus();
          //               setState(() {});
          //             }
          //           });
          //     },
          //   );
          // }, _publishCarInfo.value.environmentalLevel, '请选择'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xFFF6F6F6),
                padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
                child: Text(
                  '车况描述',
                  style:
                      TextStyle(color: const Color(0xFF999999), fontSize: 36.w),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.w, left: 20.w),
                    child: Text(
                      '*',
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: const Color(0xFFE62222),
                      ),
                    ),
                  ),
                  10.wb,
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20.w, top: 25.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(
                              color: BaseStyle.colordddddd, width: 2.w)),
                      padding: EdgeInsets.only(
                          top: 10.w, left: 20.w, right: 20.w, bottom: 20.w),
                      constraints:
                          BoxConstraints(maxHeight: 450.w, minHeight: 150.w),
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onEditingComplete: () {},
                        onChanged: (text) {
                          _publishCarInfo.value.carDescription = text;
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
                        controller: _carDescriptionController,
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
                  ),
                ],
              ),
              32.hb,
            ],
          ),
          Container(
            width: double.infinity,
            color: const Color(0xFFF6F6F6),
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            child: Text(
              '采购信息',
              style: TextStyle(color: const Color(0xFF999999), fontSize: 36.w),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                wholesalePrice,
                salePrice,
                // purchasePrice,
                //     _function(
                //       '采购类型',
                //           () async {
                //         await showModalBottomSheet(
                //           context: context,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
                //           builder: (context) {
                //             return CloudListPickerWidget(
                //                 title: '采购类型',
                //                 items: carPurchaseTypeList,
                //                 onConfirm: (str, index) {
                //                   _publishCarInfo.value.purchaseType = index;
                //                   Get.back();
                //                   setState(() {});
                //                 });
                //           },
                //         );
                //       },
                //       _publishCarInfo.value.purchaseTypeEM.typeStr,
                //       '请选择',
                //         topIcon: false
                //     ),
                // purchasePrice,
                _function('采购日期', () async {
                  var firstDate = await CarDatePicker.pick(
                    DateTime.now(),
                  );
                  // var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime.now());
                  _publishCarInfo.value.purchaseDate = firstDate;
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {});
                }, _publishCarInfo.value.purchaseDateStr, '请选择',
                    topIcon: false),
                purchasePrice,
                purchase,
                // _function(
                //     '采购人',
                //         () async {
                //           ///需要新接口
                //       Get.to(()=> ChoosePurchaserPage(callback: (StoreallModel model,String name) {
                //         // _publishCarInfo.value.purchasePerson = model.staffs;
                //         _publishCarInfo.value.purchasePerson =name;
                //         _publishCarInfo.value.purchaseStore=model.name;
                //         setState(() {});
                //       },));
                //
                //
                //     },
                //     _publishCarInfo.value.purchasePerson,
                //     '请选择',
                //     topIcon: false
                // ),
                // _function(
                //   '门店',
                //       () async {
                //         ///需要新接口
                //         // Get.to(()=> ChoosePurchaserPage(callback: (StaffAllModel model) {
                //         //
                //         // },));
                //     setState(() {});
                //   },
                //   _publishCarInfo.value.purchaseStore,
                //   '请选择',
                //   topIcon: false,
                //
                // ),
                // purchase,
              ],
            ),
          ),

          // _publishCarInfo.value.carSource==2||_publishCarInfo.value.carSource==3?
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     32.hb,
          //     Text('采购信息',style:TextStyle(color: const Color(0xFF999999),fontSize: 36.w),),
          //     _function(
          //       '采购类型',
          //           () async {
          //         await showModalBottomSheet(
          //           context: context,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
          //           builder: (context) {
          //             return CloudListPickerWidget(
          //                 title: '采购类型',
          //                 items: carPurchaseTypeList,
          //                 onConfirm: (str, index) {
          //                   _publishCarInfo.value.purchaseType = index;
          //                   Get.back();
          //                   setState(() {});
          //                 });
          //           },
          //         );
          //       },
          //       _publishCarInfo.value.purchaseTypeEM.typeStr,
          //       '请选择',
          //         topIcon: false
          //     ),
          //
          //     purchasePrice,
          //     _function(
          //         '采购日期',
          //             () async {
          //           var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime.now());
          //           _publishCarInfo.value.purchaseDate = firstDate;
          //           FocusManager.instance.primaryFocus?.unfocus();
          //           setState(() {});
          //         },
          //         _publishCarInfo.value.purchaseDateStr,
          //         '请选择',
          //         topIcon: false
          //     ),
          //     _function(
          //         '采购人',
          //             () async {
          //               ///需要新接口
          //           Get.to(()=> ChoosePurchaserPage(callback: (StaffAllModel model) {
          //             _publishCarInfo.value.purchasePerson = model.name;
          //             setState(() {});
          //           },));
          //
          //
          //         },
          //         _publishCarInfo.value.purchasePerson,
          //         '请选择',
          //         topIcon: false
          //     ),
          //     _function(
          //       '门店',
          //           () async {
          //             ///需要新接口
          //             Get.to(()=> ChoosePurchaserPage(callback: (StaffAllModel model) {
          //
          //             },));
          //         setState(() {});
          //       },
          //       _publishCarInfo.value.purchaseStore,
          //       '请选择',
          //       topIcon: false,
          //
          //     ),
          //   ],
          // ):const SizedBox(),
          // Text(
          //   '牌证信息',
          //   style: TextStyle(color: const Color(0xFF999999), fontSize: 36.w),
          // ),
          Container(
            width: double.infinity,
            color: const Color(0xFFF6F6F6),
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            child: Text(
              '牌证信息',
              style: TextStyle(color: const Color(0xFF999999), fontSize: 36.w),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                transferNum,
                keyCount,
                _showSelect(
                    _publishCarInfo.value.haveCompulsoryInsurance ?? -1, '交强险',
                    (choose) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (choose != -1) {
                    _publishCarInfo.value.haveCompulsoryInsurance = choose;
                  } else {
                    _publishCarInfo.value.haveCompulsoryInsurance = null;
                  }

                  setState(() {});
                }),
                _function('交强险到期', () async {
                  // var firstDate = await CarDatePicker.calenderPicker(
                  //     DateTime(1960), DateTime(DateTime.now().year + 100));
                  // var firstDate =
                  //     await CarDatePicker.monthPicker(DateTime.now(), add: 100);
                  var firstDate = await CarDatePicker.pick(DateTime.now());
                  _publishCarInfo.value.compulsoryInsuranceDate = firstDate;
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {});
                }, _publishCarInfo.value.compulsoryInsuranceDateStr, '请选择日期',
                    topIcon: false),
                _showSelect(
                    _publishCarInfo.value.haveCommercialInsurance ?? -1, '商业险',
                    (choose) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (choose != -1) {
                    _publishCarInfo.value.haveCommercialInsurance = choose;
                  } else {
                    _publishCarInfo.value.haveCommercialInsurance = null;
                  }

                  setState(() {});
                }),
                _function('商业险到期', () async {
                  // var firstDate = await CarDatePicker.calenderPicker(
                  //     DateTime(1960), DateTime(DateTime.now().year + 100));
                  // var firstDate =
                  //     await CarDatePicker.monthPicker(DateTime.now(), add: 100);

                  var firstDate = await CarDatePicker.pick(DateTime.now());
                  _publishCarInfo.value.commercialInsuranceDate = firstDate;
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {});
                }, _publishCarInfo.value.commercialInsuranceDateStr, '请选择日期',
                    topIcon: false),
                commercialInsurancePrice,
                Column(
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
                                color: BaseStyle.color333333,
                                fontSize: BaseStyle.fontSize32,
                              )),
                        )
                      ],
                    ),
                    12.hb,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(
                              color: BaseStyle.colordddddd, width: 2.w)),
                      padding: EdgeInsets.only(
                          top: 10.w, left: 20.w, right: 20.w, bottom: 20.w),
                      constraints:
                          BoxConstraints(maxHeight: 450.w, minHeight: 150.w),
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onEditingComplete: () {},
                        onChanged: (text) {
                          _publishCarInfo.value.remark = text;
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  // _textarea(String title, String hint, String content,
  //     TextEditingController contentController, Function(String) callback) {
  //   return ColoredBox(
  //     color: Colors.transparent,
  //     child: Row(
  //       children: [
  //         '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
  //         10.wb,
  //         SizedBox(
  //           width: 170.w,
  //           child: title.text
  //               .size(30.sp)
  //               .color(Colors.black.withOpacity(0.45))
  //               .make(),
  //         ),
  //         Expanded(
  //           child: TextField(
  //             textAlign: TextAlign.start,
  //             onChanged: callback,
  //             autofocus: false,
  //             controller: contentController,
  //             decoration: InputDecoration(
  //               contentPadding: EdgeInsets.zero,
  //               isDense: true,
  //               border: InputBorder.none,
  //               hintText: hint,
  //               hintStyle: const TextStyle(
  //                   color: Color(0xFFcccccc),
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.w300),
  //             ),
  //           ),
  //         ),
  //         24.wb,
  //       ],
  //     ),
  //   );
  // }

  bool get canTap {
    if (_publishCarInfo.value.carSource == null) {
      BotToast.showText(text: '请选择车辆来源');
      return false;
    }
    if (_publishCarInfo.value.carSource != 1) {
      if ((_publishCarInfo.value.carSource == 2 ||
              _publishCarInfo.value.carSource == 3) &&
          _publishCarInfo.value.carShop.isEmptyOrNull) {
        BotToast.showText(text: '请先选择所属门店');
        return false;
      }
    }

    if (_publishCarInfo.value.carType == null) {
      BotToast.showText(text: '请选择车辆类型');
      return false;
    }

    if (_viNumController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入车架号');
      return false;
    }
    if (_publishCarInfo.value.carName.isEmptyOrNull) {
      BotToast.showText(text: '请选择车型');
      return false;
    }
    if (_publishCarInfo.value.licensingDate == null) {
      BotToast.showText(text: '请选择首次上牌时间');
      return false;
    }

    if (_publishCarInfo.value.locationCity.isEmptyOrNull) {
      CloudToast.show('请选择所在地区');
      return false;
    }

    if (_engineController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入发动机号');
      return false;
    }
    if (_publishCarInfo.value.carColor.isEmptyOrNull) {
      BotToast.showText(text: '请选择车身颜色');
      return false;
    }
    if (_mileController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入行驶里程');
      return false;
    }
    if (_publishCarInfo.value.carTemporaryNum == '') {
      BotToast.showText(text: '请输入车牌号');
      return false;
    }
    if (_publishCarInfo.value.attribution.isEmptyOrNull) {
      BotToast.showText(text: '请选择上牌地');
      return false;
    }

    if (_publishCarInfo.value.carDescription.isEmptyOrNull) {
      BotToast.showText(text: '请输入车况描述');
      return false;
    }
    if (_publishCarInfo.value.wholesalePrice.isEmptyOrNull) {
      BotToast.showText(text: '请输入内部价格');
      return false;
    }

    if (_publishCarInfo.value.salePrice.isEmptyOrNull) {
      BotToast.showText(text: '请输入外部价格');
      return false;
    }

    _publishCarInfo.value.mileage = _mileController.text;
    _publishCarInfo.value.viNum = _viNumController.text;
    _publishCarInfo.value.engineNum = _engineController.text;
    _publishCarInfo.value.carTemporaryNum = _carNumController.text;
    _publishCarInfo.value.carParkingNum = _carParkingNumController.text != ''
        ? int.parse(_carParkingNumController.text)
        : null;
    return true;
  }

  _function(String title, VoidCallback onTap, String? content, String msg,
      {bool topIcon = true}) {
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
      padding: EdgeInsets.only(top: 30.w, bottom: 30.w),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: const Color(0xFFF6F6F6), width: 2.w)),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          30.wb,
          SizedBox(
            width: 180.w,
            child: title.text.size(32.sp).color(const Color(0xFF333333)).make(),
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

  CarSource get carSourceEM => CarSource.getValue(carSource ?? 0);

  ///所属门店
  String? carShop;
  int? carShopId;

  ///车辆类型
  int? carType;

  CarType get carTypeEM => CarType.getValue(carType ?? 0);

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
  int? carParkingNum;

  ///车辆库存状态   ///接口暂无
  int? carStockStatus;

  CarStockStatus get carStockStatusEM =>
      CarStockStatus.getValue(carStockStatus ?? 0);

  ///车辆使用性质
  int? natureOfUse;

  CarNatureOfUse get natureOfUseEM => CarNatureOfUse.getValue(natureOfUse ?? 0);

  ///表显里程
  String? mileage;

  ///出厂日期
  DateTime? productionDate;

  String get productionDateStr {
    if (productionDate == null) {
      return '';
    } else {
      return DateUtil.formatDate(productionDate, format: 'yyyy-MM');
    }
  }

  ///新车指导价
  String? newCarPrice;

  ///选择车型以后调用接口获取数据

  ///购置税
  String? purchaseTax;

  ///加装费用
  String? retrofittingFee;

  /// 所在地区
  String? locationCity;

  /// 所在地区id
  int? locationCityId;

  ///上牌地
  String? attribution;

  /// 所在地区id
  int? attributionId;

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

  CarPurchaseType get purchaseTypeEM =>
      CarPurchaseType.getValue(purchaseType ?? 0);

  ///采购价格
  String? purchasePrice;

  ///采购日期
  DateTime? purchaseDate;

  String get purchaseDateStr {
    if (purchaseDate == null) {
      return '';
    } else {
      return DateUtil.formatDate(purchaseDate, format: 'yyyy-MM-dd');
    }
  }

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

  String get compulsoryInsuranceDateStr {
    if (compulsoryInsuranceDate == null) {
      return '';
    } else {
      return DateUtil.formatDate(compulsoryInsuranceDate, format: 'yyyy-MM');
    }
  }

  ///是否有商业险
  int? haveCommercialInsurance;

  ///商业险到期时间
  DateTime? commercialInsuranceDate;

  String get commercialInsuranceDateStr {
    if (commercialInsuranceDate == null) {
      return '';
    } else {
      return DateUtil.formatDate(commercialInsuranceDate, format: 'yyyy-MM');
    }
  }

  ///商业险金额
  String? commercialInsurancePrice;

  ///备注
  String? remark;

  static NewPublishCarInfo get empty => NewPublishCarInfo(
      carSource: 0,
      carShop: '',
      viNum: '',
      locationCity: '',
      locationCityId: 0,
      carName: '',
      carColor: '',
      carModelId: 0,
      licensingDate: null,
      engineNum: '',
      mileage: '',
      carType: 0,
      salePrice: '',
      remark: '',
      commercialInsurancePrice: '',
      commercialInsuranceDate: null,
      compulsoryInsuranceDate: null,
      keyCount: '',
      transferNum: '',
      carDecorativeColor: '',
      carDescription: '',
      carParkingNum: null,
      carShopId: 0,
      carStockStatus: 0,
      carTemporaryNum: '',
      environmentalLevel: '',
      haveCommercialInsurance: -1,
      haveCompulsoryInsurance: -1,
      natureOfUse: 0,
      newCarPrice: '',
      productionDate: null,
      purchaseDate: null,
      purchasePerson: '',
      purchasePersonId: 0,
      purchasePrice: '',
      purchaseStore: '',
      purchaseStoreId: 0,
      purchaseTax: '',
      purchaseType: 0,
      retrofittingFee: '',
      wholesalePrice: '');

  NewPublishCarInfo(
      {this.carSource,
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
      this.wholesalePrice});
}
