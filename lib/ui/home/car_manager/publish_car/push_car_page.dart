import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/ui/home/car_manager/car_enum.dart';
import 'package:cloud_car/ui/home/sort/car_three_city_list_page.dart';
import 'package:cloud_car/ui/user/user_assessment/user_assessment_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/picker/cloud_grid_picker_widget.dart';
import 'package:cloud_car/widget/scan_license_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
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

class PushCarPage extends StatefulWidget {
  const PushCarPage({super.key});

  @override
  State<PushCarPage> createState() => _PushCarPageState();
}

class _PushCarPageState extends State<PushCarPage> {
  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 3));
  late CarDistinguishModel? carInfoModel;
  final PublishCarInfo _publishCarInfo = PublishCarInfo();
  final TextEditingController _viNumController = TextEditingController();
  final TextEditingController _carNumController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _mileController = TextEditingController();

  List<ChooseItem> colorList = [
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
    ChooseItem(name: '??????'),
  ];

  List<ChooseItem> get list =>
      CarSource.values.map((e) => ChooseItem(name: e.sourceName)).toList();

  @override
  void initState() {
    super.initState();
    _publishCarInfo.locationCity = '??????';
    _publishCarInfo.locationCityId = 42;
  }

  @override
  void dispose() {
    _viNumController.dispose();
    _carNumController.dispose();
    _engineController.dispose();
    _mileController.dispose();
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
        title: Text('????????????',
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
                  Column(
                    children: [
                      24.hb,
                      Container(
                        width: double.infinity,
                        height: 200.w,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 24.w, right: 24.w),
                        padding: EdgeInsets.only(left: 55.w, top: 35.w),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/assessment_bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    const Text(
                                      '??????????????????',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ).paddingOnly(top: 10.w),
                                    20.wb,
                                    Text(
                                      (UserTool.userProvider.userInfo.data
                                              .assessCount)
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).paddingZero,
                                  ],
                                ),
                                20.wb,
                                Wrap(
                                  children: [
                                    const Text(
                                      '????????????',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0x99eeeeee)),
                                    ),
                                    20.wb,
                                    const Text(
                                      '????????????????????????',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0x99eeeeee)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            150.wb,
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const UserAssessmentPage());
                              },
                              child: Container(
                                width: 120.w,
                                height: 58.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(6.w)),
                                child: const Text(
                                  '?????????',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ).paddingOnly(top: 20.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200.w),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, -20.0), //??????xy????????????
                                blurRadius: 15.0, //??????????????????
                                spreadRadius: 1.0 //??????????????????
                                )
                          ]),
                      child: Column(
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
                          100.w.heightBox,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!canTap) {
                                  return;
                                }
                                Get.to(() => FillEvainfoPage(
                                      publishCarInfo: _publishCarInfo,
                                    ));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              child: '?????????'
                                  .text
                                  .size(30.sp)
                                  .color(Colors.white)
                                  .make(),
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
      title: '?????????',
      tips: '??????????????????',
      controller: _viNumController,
    );
    // var carNum = EditItemWidget(
    //   title: '?????????',
    //   tips: '??????????????????',
    //   controller: _carNumController,
    // );
    // var version = _textarea(
    //     '????????????',
    //     '?????????????????????',
    //     _publishCarInfo.engineNum??'',
    //     _engineController,
    //     (text) => setState(() {
    //           _publishCarInfo.engineNum = _engineController.text;
    //         }));
    var engineNum = EditItemWidget(
      title: '????????????',
      tips: '?????????????????????',
      controller: _engineController,
    );

    var mile = EditItemWidget(
      topIcon: true,
      title: '????????????',
      tips: '???????????????',
      controller: _mileController,
      canChange: true,
      callback: (String content) {
        _publishCarInfo.mileage = content;
      },
      endText: '?????????',
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
          vinNum,
          _function(
            '????????????',
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
            '?????????????????????',
          ),
          _function(
            '????????????',
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
            '??????????????????',
          ),
          _function(
            '????????????',
            () async {
              // _publishCarInfo.licensingDate =
              //     await CarDatePicker.calenderPicker(
              //         DateTime(2000), DateTime.now());
              var firstDate = await CarDatePicker.monthPicker(DateTime.now());
              _publishCarInfo.licensingDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.licensingDateStr,
            '????????????????????????',
          ),
          // carNum,
          engineNum,
          _function(
            '????????????',
            () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudGridPickerWidget(
                      title: '????????????',
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
            '?????????????????????',
          ),
          mile,
          // _function(
          //   '????????????',
          //   () async {
          //     await showModalBottomSheet(
          //       context: context,
          //       shape: RoundedRectangleBorder(
          //           borderRadius:
          //               BorderRadius.vertical(top: Radius.circular(16.w))),
          //       builder: (context) {
          //         return CloudListPickerWidget(
          //             title: '????????????',
          //             items: CarSource.values.map((e) => e.sourceName).toList(),
          //             onConfirm: (str, index) {
          //               _publishCarInfo.carSource =
          //                   CarSource.values.toList()[index].sourceNum;
          //               Get.back();
          //               FocusManager.instance.primaryFocus?.unfocus();
          //               setState(() {});
          //             });
          //       },
          //     );
          //   },
          //   _publishCarInfo.carSource != null
          //       ? CarSource.getValue(_publishCarInfo.carSource!).sourceName
          //       : '',
          //   '?????????????????????',
          // ),
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
    if (_viNumController.text.trim().isEmpty) {
      BotToast.showText(text: '??????????????????');
      return false;
    }
    if (_publishCarInfo.carName.isEmptyOrNull) {
      BotToast.showText(text: '???????????????');
      return false;
    }
    if (_publishCarInfo.licensingDate == null) {
      BotToast.showText(text: '???????????????????????????');
      return false;
    }

    // if (!RegexUtil.matches(licensePlateReg, _carNumController.text)) {
    //   BotToast.showText(text: '???????????????????????????');
    //   return false;
    // }

    if (_publishCarInfo.locationCity.isEmptyOrNull) {
      CloudToast.show('?????????????????????');
      return false;
    }

    if (_engineController.text.trim().isEmpty) {
      BotToast.showText(text: '?????????????????????');
      return false;
    }
    if (_publishCarInfo.carColor.isEmptyOrNull) {
      BotToast.showText(text: '?????????????????????');
      return false;
    }
    if (_mileController.text.trim().isEmpty) {
      BotToast.showText(text: '?????????????????????');
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
    String msg,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: EditItemWidget(
          title: title,
          tips: msg,
          value: content ?? '',
          topIcon: true,
          paddingStart: 32,
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

class RadioModel {
  bool? isSelected;
  String? buttonText;

  RadioModel({
    this.isSelected,
    this.buttonText,
  });
}

class PublishCarInfo {
  ///?????????
  String? viNum;

  ///??????
  String? carName;
  int? carModelId;

  ///??????????????????
  DateTime? licensingDate;

  String get licensingDateStr =>
      DateUtil.formatDate(licensingDate, format: 'yyyy-MM');

  // ///?????????
  // String? carNum;
  /// ????????????
  String? locationCity;

  /// ????????????id
  int? locationCityId;

  ///????????????
  String? engineNum;

  ///????????????
  String? carColor;

  ///????????????
  String? mileage;

  static PublishCarInfo get empty => PublishCarInfo(
        viNum: '',
        // carNum: '',
        locationCity: '',
        locationCityId: 0,
        carName: '',
        carColor: '',
        carModelId: 0,
        licensingDate: DateTime.now(),
        engineNum: '',
        mileage: '',
      );

  PublishCarInfo({
    this.viNum,
    this.carName,
    this.licensingDate,
    this.locationCity,
    this.locationCityId,
    this.engineNum,
    this.carColor,
    this.mileage,
    this.carModelId,
  });
}
