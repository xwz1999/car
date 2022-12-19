import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/model/car/car_info_model.dart';
import 'package:cloud_car/model/contract/purchase_photo_model.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/sort/sort_car_model_model.dart';
import 'package:cloud_car/model/sort/sort_series_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_choose_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_info_page.dart';
import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/home/sort/sort_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/hive_store.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:cloud_car/widget/scan_license_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../widget/alert.dart';
import '../../../widget/picker/cloud_grid_picker_widget.dart';

class PurchasePushCarPage extends StatefulWidget {
  const PurchasePushCarPage({super.key});

  @override
  State<PurchasePushCarPage> createState() => _PurchasePushCarPageState();
}

class _PurchasePushCarPageState extends State<PurchasePushCarPage> {
  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 3));
  late CarDistinguishModel? carInfoModel;

  final ValueNotifier<PurchaseCarInfo> _publishCarInfo =
      ValueNotifier(PurchaseCarInfo.empty);

  final ValueNotifier<PurchaseInfo> purchaseInfo =
      ValueNotifier(PurchaseInfo.empty);

  final ValueNotifier<PurchasePhotoModel> reportPhotoModel =
      ValueNotifier(PurchasePhotoModel.init);

  // final PurchaseCarInfo _publishCarInfo = PurchaseCarInfo.empty;
  final TextEditingController _viNumController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _mileController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _licenseColorController = TextEditingController();
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

  List<ChooseItem> emission = [
    ChooseItem(name: '国一'),
    ChooseItem(name: '国二'),
    ChooseItem(name: '国三'),
    ChooseItem(name: '国四'),
    ChooseItem(name: '国五'),
    ChooseItem(name: '国六'),
  ];

  List<String> get carNatureOfUseList =>
      CarNatureOfUse.values.map((e) => e.typeStr).toList();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0),()async{
      await (HiveStore.carBox?.get('carInfo')) as PurchaseCarInfo;
      await (HiveStore.carBox?.get('info')) as PurchaseInfo;
      await (HiveStore.carBox?.get('photo')) as PurchasePhotoModel;
      await HiveStore.carBox?.get('save');
      PurchaseCarInfo carInfo=await HiveStore.carBox?.get('carInfo');
      if(HiveStore.carBox?.get('save')){
        _licensePlateController.text=carInfo.licensePlate ?? '';
        _publishCarInfo.value.carName=carInfo.carName ?? '';
        // _publishCarInfo.value.carModelId=carInfo.carModelId;

      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _viNumController.dispose();
    _engineController.dispose();
    _mileController.dispose();
    _licensePlateController.dispose();
    BotToast.closeAllLoading();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: IconButton(
            onPressed: () {
              Alert.show(
                  context,
                  NormalContentDialog(
                    type: NormalTextDialogType.delete,
                    title: '提示',
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '是否保留此次发布编辑的信息,下次打开',
                          style: TextStyle(fontSize:28.sp),
                        ),
                        Text('直接继续发布', style: TextStyle(fontSize: 28.sp))
                      ],
                    ),
                    items: const ['取消'],
                    deleteItem: '确定',
                    //监听器
                    listener: (index) {
                      Alert.dismiss(context);
                      // _getSure = false;
                        Get.back();
                      setState(() {
                        //_getSure;
                      });
                      //Value = false;
                      //(Value);
                    },
                    deleteListener: () async{
                      Alert.dismiss(context);
                      // _getSure = true;
                      HiveStore.carBox?.delete('carInfo');
                      HiveStore.carBox?.delete('info');
                      HiveStore.carBox?.delete('photo');
                      HiveStore.carBox?.delete('save');
                      await HiveStore.carBox?.put('carInfo', _publishCarInfo.value);
                      await HiveStore.carBox?.put('info', purchaseInfo.value);
                      await HiveStore.carBox?.put('photo', reportPhotoModel.value);
                      await HiveStore.carBox?.put('save', true);
                      Get.back();
                      setState(() {

                        //_getSure;
                      });
                      //print(_getSure);
                      //Value = true;
                      //(Value);
                    },
                  ));
            },
            icon: const Icon(
              CupertinoIcons.chevron_back,
              color: Color(0xFF111111),
            ),
          ),
        ),

        // const CloudBackButton(
        //
        //   isSpecial: true,
        // ),
        backgroundColor: kForeGroundColor,
        title: Text('车辆收购',
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
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        ScanLicenseWidget(onLoadComplete: (carInfoModel) async {
                          if (carInfoModel.vinModel != null) {
                            _publishCarInfo.value.carName =
                                carInfoModel.vinModel!.first.modelName;
                            _publishCarInfo.value.carModelId =
                                carInfoModel.vinModel!.first.modelId;
                          }
                          _viNumController.text = carInfoModel.vehicle.vin;
                          _licensePlateController.text =
                              carInfoModel.vehicle.lsnum;
                          _licenseColorController.text =
                              carInfoModel.vinModel!.first.color;
                          _publishCarInfo.value.licensingDate =
                              DateUtil.getDateTime(
                                  carInfoModel.vehicle.regdate);

                          ///出厂日期1
                          var a = await SortFunc.getCarInfo(
                              carInfoModel.vinModel!.first.modelId);
                          _publishCarInfo.value.productionDate =
                              DateUtil.getDateTime(a!.marketDate);
                          // _publishCarInfo.value.productionDate =
                          //     DateUtil.getDateTime(
                          //         CarCommonInfo.);
                          _engineController.text =
                              carInfoModel.vehicle.engineno;
                          setState(() {});
                        }),
                        _rewardWidget(),
                        100.w.heightBox,
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (!canTap) {
                                return;
                              }
                              // print(_publishCarInfo.value);
                              // print(purchaseInfo.value);
                              // // print(reportPhotoModel.value);
                              Get.to(() => PurchaseInfoPage(
                                        purchaseCarInfo: _publishCarInfo.value,
                                        purchaseInfo: purchaseInfo.value,
                                        reportPhotoModel:
                                            reportPhotoModel.value,
                                      )
                                  //   PurchaseChoosePage(
                                  // purchaseCarInfo: _publishCarInfo.value,
                                  // purchaseInfo: purchaseInfo.value,
                                  // reportPhotoModel: reportPhotoModel.value,)
                                  );
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
                      ],
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
      tips: '请输入车架号后六号',
      controller: _viNumController,
      topIcon: false,
      paddingStart: 0.w,
    );
    var engineNum = EditItemWidget(
      title: '发动机号',
      tips: '请输入发动机号后六位',
      controller: _engineController,
      topIcon: false,
      paddingStart: 0.w,
    );
    var licensePlate = EditItemWidget(
      // value: _publishCarInfo.value.licensePlate,
      title: '车辆牌照',
      tips: '请输入',
      controller: _licensePlateController,
      topIcon: false,
      paddingStart: 0.w,
    );
    var licenseColor = EditItemWidget(
      // value: _publishCarInfo.value.licensePlate,
      title: '车身颜色',
      tips: '请输入',
      controller: _licenseColorController,
      topIcon: false,
      paddingStart: 0.w,
      callback: (String content) {
        _publishCarInfo.value.color = content;
      },
    );
    var mile = EditItemWidget(
      topIcon: false,
      title: '行驶里程',
      paddingStart: 0.w,
      tips: '请输入里程',
      controller: _mileController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.value.mileage = content;
      },
      endText: '万公里',
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          20.heightBox,
          licensePlate,

          _function(
            '品牌车型',
            () async {
              await Get.to(() => ChooseCarPage(
                    callback: () {
                      Get.back();
                      _publishCarInfo.value.carName = _pickCar.value.car.name;
                      _publishCarInfo.value.carModelId =
                          _pickCar.value.car.modelId;
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    pickCar: _pickCar,
                  ));
              setState(() {});
            },
            _publishCarInfo.value.carName,
            '请选择',
          ),
          vinNum,
          _function(
            '首次上牌',
            () async {
              var firstDate = await CarDatePicker.pick(
                DateTime.now(),
              );

              ///var firstDate = await CarDatePicker.calenderPicker(DateTime(1960), DateTime.now());
              _publishCarInfo.value.licensingDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            // _publishCarInfo.value.licensingDateStr,

            _publishCarInfo.value.licensingDateStr,
            '选择首次上牌时间',
          ),
          _function(
            '使用性质',
            () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudListPickerWidget(
                      title: '使用性质',
                      items: carNatureOfUseList,
                      onConfirm: (str, index) {
                        _publishCarInfo.value.carNatureOfUse = index;
                        Get.back();
                        setState(() {});
                      });
                },
              );
            },
            _publishCarInfo.value.carNatureOfUseEM.typeStr,
            '请选择',
          ),
          engineNum,

          _function(
            '出厂日期',
            () async {
              var firstDate = await CarDatePicker.pick(
                DateTime.now(),
              );

              ///var firstDate = await CarDatePicker.calenderPicker(DateTime(1960), DateTime.now());
              _publishCarInfo.value.productionDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.value.productionDateStr,
            '选择出厂日期',
          ),

          _function(
            '交强险',
            () async {
              var firstDate = await CarDatePicker.pick(
                DateTime.now(),
              );

              /// var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime(DateTime.now().year+100));
              _publishCarInfo.value.compulsoryInsuranceDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.value.compulsoryInsuranceDateStr,
            '选择交强险到期时间',
          ),

          mile,
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
                      time: false,
                      title: '车身颜色',
                      items: colorList.map((e) => e.name).toList(),
                      onConfirm: (strList, indexList) {
                        if (strList.isNotEmpty) {
                          _publishCarInfo.value.color = strList.first;
                          // Get.back();
                          FocusManager.instance.primaryFocus?.unfocus();
                          setState(() {});
                        }
                      });
                },
              );
            },
            _publishCarInfo.value.color,
            '请输入车身颜色',
          ),
          // licenseColor,
          // _function(
          //     '环保等级',
          //         () async {
          //       await showModalBottomSheet(
          //         context: context,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
          //         builder: (context) {
          //           return CloudGridPickerWidget(
          //               title: '环保等级',
          //               items: emission.map((e) => e.name).toList(),
          //               onConfirm: (strList, indexList) {
          //                 _publishCarInfo.value.environmentalLevel = strList.first;
          //                 Get.back();
          //                 FocusManager.instance.primaryFocus?.unfocus();
          //                 setState(() {});
          //               });
          //         },
          //       );
          //     },
          //     _publishCarInfo.value.environmentalLevel,
          //     '请选择'
          // ),
        ],
      ),
    );
  }

  bool get canTap {
    if (_publishCarInfo.value.carName.isEmptyOrNull) {
      BotToast.showText(text: '请选择具体车型');
      return false;
    }
    if (_viNumController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入车架号');
      return false;
    }

    if (_publishCarInfo.value.licensingDate == null) {
      BotToast.showText(text: '请选择首次上牌时间');
      return false;
    }
    if (_publishCarInfo.value.carNatureOfUse == 0) {
      BotToast.showText(text: '请先选择使用性质');
      return false;
    }
    if (_engineController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入发动机号');
      return false;
    }
    if (_publishCarInfo.value.productionDate == null) {
      BotToast.showText(text: '请选择出厂日期');
      return false;
    }

    if (_publishCarInfo.value.compulsoryInsuranceDate == null) {
      BotToast.showText(text: '请选择交强险时间');
      return false;
    }

    if (_mileController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入行驶里程');
      return false;
    }

    if (_publishCarInfo.value.licensePlate == '') {
      BotToast.showText(text: '请输入车辆牌照');
      return false;
    }

    _publishCarInfo.value.mileage = _mileController.text;
    _publishCarInfo.value.viNum = _viNumController.text;
    _publishCarInfo.value.engineNum = _engineController.text;
    _publishCarInfo.value.licensePlate = _licensePlateController.text;
    return true;
  }

  _function(String title, VoidCallback onTap, String? content, String msg,
      {bool topIcon = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: EditItemWidget(
          title: title,
          tips: msg,
          value: content ?? '',
          topIcon: topIcon,
          paddingStart: 0,
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
}

class PurchaseCarInfo {
  ///渠道1=入驻商 2=车商
  int? channel;

  ///车型
  String? carName;
  int? carModelId;

  ///车架号
  String? viNum;

  ///首次上牌时间
  DateTime? licensingDate;

  String get licensingDateStr =>
      DateUtil.formatDate(licensingDate, format: 'yyyy-MM-dd');

  ///出场日期
  DateTime? productionDate;

  String get productionDateStr =>
      DateUtil.formatDate(productionDate, format: 'yyyy-MM-dd');

  ///车辆牌照
  String? licensePlate;

  ///使用性质
  int? carNatureOfUse;

  CarNatureOfUse get carNatureOfUseEM =>
      CarNatureOfUse.getValue(carNatureOfUse ?? 0);

  ///发动机号
  String? engineNum;

  ///交强险到期时间
  DateTime? compulsoryInsuranceDate;

  String get compulsoryInsuranceDateStr {
    if (compulsoryInsuranceDate == null) {
      return '';
    } else {
      return DateUtil.formatDate(compulsoryInsuranceDate, format: 'yyyy-MM-dd');
    }
  }

  ///表显里程
  String? mileage;

  ///车身颜色
  String? color;

  // ///环保等级
  // String? environmentalLevel;

  String? customer;

  int? customerId;

  static PurchaseCarInfo get empty => PurchaseCarInfo(
      channel: null,
      color: '',
      viNum: '',
      carName: '',
      carModelId: null,
      licensingDate: null,
      engineNum: '',
      customer: '',
      customerId: null,
      mileage: '',
      carNatureOfUse: 0,
      //environmentalLevel:'',
      compulsoryInsuranceDate: null);

  PurchaseCarInfo({
    this.channel,
    this.carName,
    this.licensingDate,
    this.viNum,
    this.customer,
    this.customerId,
    this.engineNum,
    this.mileage,
    this.carModelId,
    this.carNatureOfUse,
    //this.environmentalLevel,
    this.compulsoryInsuranceDate,
    this.color,
  });
}
