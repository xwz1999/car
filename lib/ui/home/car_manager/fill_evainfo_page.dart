import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/car/estimate_price_model.dart';
import 'package:cloud_car/ui/home/car_manager/check_pushcar_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/picker/cloud_grid_picker_widget.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/picker/car_list_picker.dart';
import '../../../widget/sort_widget.dart';
import '../car_valuation/car_valuation_page.dart';
import 'direct_sale/edit_item_widget.dart';

class FillEvainfoPage extends StatefulWidget {
  final PublishCarInfo publishCarInfo;

  const FillEvainfoPage({
    Key? key,
    required this.publishCarInfo,
  }) : super(key: key);

  @override
  State<FillEvainfoPage> createState() => _FillEvainfoPageState();
}

class _FillEvainfoPageState extends State<FillEvainfoPage> {
  final CarInfo _carInfo = CarInfo(
    plate: -1,
    paint: -1,
    transfer: -1,
  );

  ///寄卖合同model
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel =
      ValueNotifier(ConsignmentContractModel(masterInfo: MasterInfo()));

  // String? _transfer = ''; //过户次数
  // String? _paint = ''; //油漆面
  // String? _metal = ''; //钣金面
  // String? _replace = ''; //更换件
  // String? _transmission = ''; //变速箱
  // String? _accident = ''; //重大事故
  // String? _maintain = ''; //4s保养
  // String? _trueMeters = ''; //真实公里数

  final Map<int?, String> _transferListMap = {
    0: '无过户',
    1: '1次',
    2: '2次',
    3: '3次',
    4: '4次',
    5: '5次',
    6: '6次',
    7: '7次',
    8: '8次',
    9: '9次',
    10: '10次',
    null: '10次以上'
  };

  List<ChooseItem> get transferList =>
      _transferListMap.values.map((e) => ChooseItem(name: e)).toList();

  final Map<int?, String> _paintListMap = {
    0: '0个面',
    1: '1个面',
    2: '2个面',
    3: '3个面',
    4: '4个面',
    5: '5个面',
    6: '6个面',
    7: '7个面',
    8: '8个面',
    9: '9个面',
    10: '10个面',
    null: '10个面以上',
  };

  List<ChooseItem> get paintList =>
      _paintListMap.values.map((e) => ChooseItem(name: e)).toList();

  List<ChooseItem> replaceList = [
    ChooseItem(name: '有更换'),
    ChooseItem(name: '无更换'),
  ];
  List<ChooseItem> replaceDetailList = [
    ChooseItem(name: '左大灯'),
    ChooseItem(name: '右大灯'),
    ChooseItem(name: '前翼子板左'),
    ChooseItem(name: '前翼子板右'),
    ChooseItem(name: '引擎盖'),
    ChooseItem(name: '后尾盖'),
    ChooseItem(name: '后尾灯左'),
    ChooseItem(name: '后尾灯右'),
    ChooseItem(name: '车门左前'),
    ChooseItem(name: '车门右前'),
    ChooseItem(name: '车门左后'),
    ChooseItem(name: '车门右后'),
  ];
  List<ChooseItem> fixList = [
    ChooseItem(name: '有维修'),
    ChooseItem(name: '无维修'),
  ];
  List<ChooseItem> maintainList = [
    ChooseItem(name: '未按时保养'),
    ChooseItem(name: '按时保养'),
  ];
  Map<int, String> shamMileageType = {
    1: '有修改',
    2: '未修改',
  };

  List<String> get shamMileage => shamMileageType.values.toList();
  Map<int, String> accidentDetailType = {
    1: '四梁六柱发生修复',
    2: '后翼子板切割',
    3: '纵梁修复',
    4: '安全气囊弹出',
  };

  List<String> get accidentDetailList => accidentDetailType.values.toList();
  List<ChooseItem> accidentList = [
    ChooseItem(name: '有重大事故'),
    ChooseItem(name: '无重大事故'),
  ];

  Map<int, String> fixType = {1: '轻微渗油', 2: '严重渗油', 3: '发动机解体维修'};

  List<String> get haveFixList => fixType.values.toList();

  @override
  void initState() {
    _carInfo.name = widget.publishCarInfo.carName;
    _carInfo.modelId = widget.publishCarInfo.carModelId;
    _carInfo.color = widget.publishCarInfo.carColor;
    _carInfo.mileage = widget.publishCarInfo.mileage;
    _carInfo.licensingDate = widget.publishCarInfo.licensingDate;
    _carInfo.licensePlate = widget.publishCarInfo.carNum;
    _carInfo.engineNo = widget.publishCarInfo.engineNum;
    _carInfo.source = widget.publishCarInfo.carSource;
    _carInfo.vin = widget.publishCarInfo.viNum;
    super.initState();
  }

  @override
  void dispose() {
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
        title: Text('填写估价信息',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0x99eeeeee),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(30.w),
                  child: widget.publishCarInfo.carName!.text
                      .size(32.sp)
                      .bold
                      .color(Colors.black)
                      .make(),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            20.wb,
                            SizedBox(
                              width: 160.w,
                              child: '车身颜色'
                                  .text
                                  .size(30.sp)
                                  .color(Colors.black.withOpacity(0.45))
                                  .make(),
                            ),
                            Expanded(
                                child: widget.publishCarInfo.carColor!.text
                                    .size(30.sp)
                                    .color(Colors.black)
                                    .make()),
                            24.wb,
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            20.wb,
                            SizedBox(
                              width: 160.w,
                              child: '首次上牌'
                                  .text
                                  .size(30.sp)
                                  .color(Colors.black.withOpacity(0.45))
                                  .make(),
                            ),
                            Expanded(
                                child: widget
                                    .publishCarInfo.licensingDateStr.text
                                    .size(30.sp)
                                    .color(Colors.black)
                                    .make()),
                            24.wb,
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 15.h,
                        ),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            20.wb,
                            SizedBox(
                              child: '行驶里程'
                                  .text
                                  .size(30.sp)
                                  .color(Colors.black.withOpacity(0.45))
                                  .make(),
                            ),
                            40.wb,
                            Expanded(
                                child: widget.publishCarInfo.mileage!.text
                                    .size(30.sp)
                                    .color(Colors.black)
                                    .make()),
                            24.wb,
                            '万公里'.text.size(30.sp).make(),
                          ],
                        ),
                      ),
                      _function(
                        '过户次数',
                        () async {
                          await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.w))),
                            builder: (context) {
                              return CarListPicker(
                                carString:
                                    _transferListMap[_carInfo.transfer] ?? '',
                                items: transferList,
                                callback: (String content, int value) {
                                  Get.back();
                                  _carInfo.transfer =
                                      _transferListMap.keys.toList()[value];
                                  setState(() {});
                                },
                                title: '过户次数',
                              );
                            },
                          );
                        },
                        _transferListMap[_carInfo.transfer] ?? '',
                        '请选择',
                      ),
                      _function(
                        '油漆面修复',
                        () async {
                          await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.w))),
                            builder: (context) {
                              return CarListPicker(
                                carString: _paintListMap[_carInfo.paint] ?? '',
                                items: paintList,
                                callback: (String content, int value) {
                                  Get.back();
                                  _carInfo.paint =
                                      _paintListMap.keys.toList()[value];
                                  _carInfo.paint = value;
                                  setState(() {});
                                },
                                title: '油漆面修复',
                              );
                            },
                          );
                        },
                        _paintListMap[_carInfo.paint] ?? '',
                        '请选择',
                      ),
                      _function(
                        '钣金面修复',
                        () async {
                          await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.w))),
                            builder: (context) {
                              return CarListPicker(
                                carString: _paintListMap[_carInfo.plate] ?? "",
                                items: paintList,
                                callback: (String content, int value) {
                                  Get.back();
                                  _carInfo.plate =
                                      _paintListMap.keys.toList()[value];
                                  setState(() {});
                                },
                                title: '钣金面修复',
                              );
                            },
                          );
                        },
                        _paintListMap[_carInfo.plate] ?? "",
                        '请选择',
                      ),
                      _function(
                        '更换件情况',
                        () async {
                          await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.w))),
                            builder: (context) {
                              return CloudListPickerWidget(
                                title: '更换件情况',
                                items: replaceList.map((e) => e.name).toList(),
                                onConfirm: (String content, int value) {
                                  Get.back();
                                  _carInfo.hasParts = value;
                                  if (value == 0) {
                                    Get.bottomSheet(CloudGridPickerWidget.multi(
                                        title: '更换件情况',
                                        items: replaceDetailList
                                            .map((e) => e.name)
                                            .toList(),
                                        onConfirm: (strList, indexList) {
                                          Get.back();
                                          _carInfo.parts = indexList
                                              .map((e) => e + 1)
                                              .toList();
                                        }));
                                  }
                                  setState(() {});
                                },
                              );
                            },
                          );
                        },
                        _carInfo.hasParts != null
                            ? _carInfo.hasParts == 1
                                ? replaceList[_carInfo.hasParts!].name
                                : replaceList[_carInfo.hasParts!].name
                            : '',
                        '请选择',
                      ),
                      _function(
                        '变速箱情况',
                        () async {
                          await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.w))),
                            builder: (context) {
                              return CloudListPickerWidget(
                                title: '变速箱情况',
                                items: fixList.map((e) => e.name).toList(),
                                onConfirm: (str, index) async {
                                  Get.back();
                                  _carInfo.hasSituation = index;
                                  if (index == 0) {
                                    await Get.bottomSheet(
                                      CloudListPickerWidget(
                                        title: '变速箱情况',
                                        items: haveFixList,
                                        onConfirm: (str, index) {
                                          Get.back();
                                          _carInfo.engine =
                                              fixType.keys.toList()[index];
                                        },
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                              );
                            },
                          );
                        },
                        _carInfo.hasSituation != null
                            ? _carInfo.hasSituation == 1
                                ? fixList[_carInfo.hasSituation!].name
                                : fixType[_carInfo.engine]
                            : '',
                        '请选择',
                      ),
                      _function(
                        '重大事故',
                        () async {
                          await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.w))),
                            builder: (context) {
                              return CloudListPickerWidget(
                                  title: '重大事故',
                                  items:
                                      accidentList.map((e) => e.name).toList(),
                                  onConfirm: (str, index) async {
                                    Get.back();
                                    _carInfo.hasAccident = index;
                                    if (index == 0) {
                                      await Get.bottomSheet(
                                          CloudListPickerWidget(
                                              title: '重大事故',
                                              items: accidentDetailList,
                                              onConfirm: (str, index) {
                                                _carInfo.accidents = [];
                                                _carInfo.accidents!.add(
                                                    accidentDetailType.keys
                                                        .toList()[index]);
                                                Get.back();
                                              }));
                                    }

                                    setState(() {});
                                  });
                            },
                          );
                        },
                        _carInfo.hasAccident != null
                            ? _carInfo.hasAccident == 1
                                ? accidentList[_carInfo.hasAccident!].name
                                : accidentDetailType[_carInfo.accidents!.first]
                            : '',
                        '请选择',
                      ),
                      _function('全程4s按时保养', () async {
                        await showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.w))),
                          builder: (context) {
                            return CloudListPickerWidget(
                                title: '全程4s按时保养',
                                items: maintainList.map((e) => e.name).toList(),
                                onConfirm: (str, index) {
                                  _carInfo.maintain = index;
                                  Get.back();
                                  setState(() {});
                                });
                          },
                        );
                      },
                          _carInfo.maintain != null
                              ? maintainList[_carInfo.maintain!].name
                              : '',
                          '请选择',
                          titleWidth: 220.w),
                      _function('有无更改真实公里数', () async {
                        await showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.w))),
                          builder: (context) {
                            return CloudListPickerWidget(
                                title: '有无更改真实公里数',
                                items: shamMileage,
                                onConfirm: (str, index) {
                                  _carInfo.shamMileage = index + 1;
                                  Get.back();
                                  setState(() {});
                                });
                          },
                        );
                      },
                          _carInfo.shamMileage != null
                              ? shamMileageType[_carInfo.shamMileage!]
                              : '',
                          '请选择',
                          titleWidth: 280.w),
                      30.hb,
                    ],
                  ),
                ),
                30.heightBox,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      var cancel = CloudToast.loading;
                      EstimatePriceModel? estimatePriceModel;
                      estimatePriceModel =
                          await CarFunc.getEstimatePrice(_carInfo);
                      if (estimatePriceModel != null) {
                        consignmentContractModel.value.publishCarInfo =
                            widget.publishCarInfo;
                        consignmentContractModel.value.evaluationPrice =
                            estimatePriceModel.price;
                        consignmentContractModel.value.priceId =
                            estimatePriceModel.id as int?;

                        Get.to(() => CheckPushPage(
                              consignmentContractModel:
                                  consignmentContractModel,
                            ));
                      }
                      cancel();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: '马上估价'.text.size(30.sp).color(Colors.white).make(),
                  ),
                ).paddingOnly(left: 40.w, right: 40.w, bottom: 30.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _function(String title, VoidCallback onTap, String? content, String msg,
      {double? titleWidth}) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: EditItemWidget(
          title: title,
          titleWidth: titleWidth,
          tips: msg,
          value: content ?? '',
          topIcon: false,
          paddingStart: 20,
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
