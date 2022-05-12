// ignore_for_file: unused_field

import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/const_data.dart';
import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/user/user_assessment/user_assessment.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/picker/cloud_grid_picker_widget.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../model/sort/sort_brand_model.dart';
import '../../../../model/sort/sort_car_model_model.dart';
import '../../../../model/sort/sort_series_model.dart';
import '../../../../utils/new_work/api_client.dart';
import '../../../../widget/button/cloud_back_button.dart';
import '../../../../widget/picker/car_date_picker.dart';
import '../../../../widget/picker/cloud_image_picker.dart';
import '../../../../widget/sort_widget.dart';
import '../../sort/choose_car_page.dart';
import '../../sort/search_param_model.dart';
import '../direct_sale/edit_item_widget.dart';
import '../fill_evainfo_page.dart';

class PushCarPage extends StatefulWidget {
  const PushCarPage({Key? key}) : super(key: key);

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
  DateTime? _firstDate;
  final TextEditingController _carNumController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _mileController = TextEditingController();

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
  final Map<int, String> _sourceType = {
    1: '车商',
    2: '个人直卖',
  };

  List<ChooseItem> get typeList =>
      _sourceType.values.map((e) => ChooseItem(name: e)).toList();

  String? _source;

  @override
  void initState() {
    _publishCarInfo.mileage = _mileController.text;
    _publishCarInfo.viNum = _viNumController.text;
    _publishCarInfo.engineNum = _engineController.text;
    _publishCarInfo.carNum = _carNumController.text;
    super.initState();
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
                                      '剩余评估次数',
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
                                      '精准估值',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0x99eeeeee)),
                                    ),
                                    20.wb,
                                    const Text(
                                      '守护您的车辆交易',
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
                                  '去充值',
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
                                offset: Offset(0.0, -20.0), //阴影xy轴偏移量
                                blurRadius: 15.0, //阴影模糊程度
                                spreadRadius: 1.0 //阴影扩散程度
                                )
                          ]),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await CloudImagePicker.pickSingleImage(
                                      title: '选择图片')
                                  .then(
                                (value) async {
                                  if (value != null) {
                                    File files = value;
                                    String urls =
                                        await apiClient.uploadImage(files);
                                    carInfoModel = await CarFunc.carDistinguish(
                                        urls.imageWithHost);
                                    if (carInfoModel != null) {
                                      _publishCarInfo.viNum = carInfoModel!.vin;
                                      _publishCarInfo.carName =
                                          carInfoModel!.cartype;
                                      _publishCarInfo.licensingDate =
                                          DateUtil.getDateTime(carInfoModel!.issuedate);
                                      _publishCarInfo.carNum =
                                          carInfoModel!.lsnum;
                                      _publishCarInfo.engineNum =
                                          carInfoModel!.engineno;
                                      setState(() {});
                                    }
                                  }
                                },
                              );
                              setState(() {});
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                    'assets/images/driving_license2.png'),
                              ],
                            ),
                          ),
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
    var vinum = _textarea(
        '车架号',
        '请输入车架号',
        _publishCarInfo.viNum!,
        _viNumController,
        (text) => setState(() {
              _publishCarInfo.viNum = _viNumController.text;
            }));
    var carnum = _textarea(
        '车牌号',
        '请输入车牌号',
        _publishCarInfo.carNum!,
        _carNumController,
        (text) => setState(() {
              _publishCarInfo.carNum = _carNumController.text;
            }));
    var version = _textarea(
        '发动机号',
        '请输入发动机号',
        _publishCarInfo.engineNum!,
        _engineController,
        (text) => setState(() {
              _publishCarInfo.engineNum = _engineController.text;
            }));
    var mile = EditItemWidget(
      topIcon: true,
      title: '表现里程',
      value: _publishCarInfo.mileage.toString(),
      canChange: true,
      callback: (String content) {
        _publishCarInfo.mileage = content;
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
          vinum,
          _function(
            '品牌车型',
            () async {
              await Get.to(() => ChooseCarPage(
                    callback: () {
                      Get.back();
                      _publishCarInfo.carName = _pickCar.value.car.name;
                      _publishCarInfo.carModelId = _pickCar.value.car.id;
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    pickCar: _pickCar,
                  ));
              setState(() {});
            },
            _publishCarInfo.carName,
            '请输入具体车型',
          ),
          _function(
            '首次上牌',
            () async {
              _firstDate = await CarDatePicker.monthPicker(DateTime.now());
              _publishCarInfo.licensingDate = _firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.licensingDateStr,
            '选择首次上牌时间',
          ),
          20.heightBox,
          carnum,
          20.heightBox,
          version,
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
          mile,
          _function(
            '车辆来源',
            () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.w))),
                builder: (context) {
                  return CloudListPickerWidget(
                      title: '车辆来源',
                      items: _sourceType.values.toList(),
                      onConfirm: (str, index) {
                        _publishCarInfo.carSource =
                            _sourceType.keys.toList()[index];
                        Get.back();
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                      });
                },
              );
            },
            _sourceType[_publishCarInfo.carSource] ?? '',
            '请选择车辆来源',
          ),
        ],
      ),
    );
  }

  _textarea(String title, String hint, String content,
      TextEditingController _contentController, Function(String) callback) {
    return Container(
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
              controller: _contentController,
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
    if (_publishCarInfo.viNum.isEmptyOrNull) {
      BotToast.showText(text: '请输入车架号');
      return false;
    }
    if (_publishCarInfo.carName.isEmptyOrNull) {
      BotToast.showText(text: '请选择车型');
      return false;
    }
    if (_publishCarInfo.licensingDate==null) {
      BotToast.showText(text: '请选择首次上牌时间');
      return false;
    }

    if (!RegexUtil.matches(licensePlateReg, _publishCarInfo.carNum ?? '')) {
      BotToast.showText(text: '请输入正确的车牌号');
      return false;
    }

    if (_publishCarInfo.engineNum.isEmptyOrNull) {
      BotToast.showText(text: '请输入发动机号');
      return false;
    }
    if (_publishCarInfo.carColor.isEmptyOrNull) {
      BotToast.showText(text: '请选择车身颜色');
      return false;
    }
    if (_publishCarInfo.mileage.isEmptyOrNull) {
      BotToast.showText(text: '请输入行驶里程');
      return false;
    }
    if (_publishCarInfo.carSource == null) {
      BotToast.showText(text: '请选择车辆来源');
      return false;
    }
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

  RadioModel(
    this.isSelected,
    this.buttonText,
  );
}

class PublishCarInfo {
  ///车架号
  String? viNum;

  ///车型
  String? carName;
  int? carModelId;

  ///首次上牌时间
  DateTime? licensingDate;
  String get licensingDateStr => DateUtil.formatDate(licensingDate,format: 'yyyy-MM');

  ///车牌号
  String? carNum;

  ///发动机号
  String? engineNum;

  ///车身颜色
  String? carColor;

  ///表现里程
  String? mileage;

  ///车辆来源 1.车商 2.个人直卖 3.收购
  int? carSource;

  PublishCarInfo({
    this.viNum,
    this.carName,
    this.licensingDate,
    this.carNum,
    this.engineNum,
    this.carColor,
    this.mileage,
    this.carSource,
    this.carModelId,
  });
}
