import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../model/car_valuation/car_distinguish_model.dart';
import '../../../model/sort/sort_brand_model.dart';
import '../../../model/sort/sort_car_model_model.dart';
import '../../../model/sort/sort_series_model.dart';
import '../../../utils/new_work/api_client.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/picker/car_date_picker.dart';
import '../../../widget/picker/car_list_picker.dart';
import '../../../widget/picker/cloud_image_picker.dart';
import '../../../widget/sort_widget.dart';
import '../car_valuation/car_func.dart';
import '../car_valuation/car_valuation_page.dart';
import '../sort/carlist_page.dart';
import '../sort/choose_car_page.dart';
import '../sort/search_param_model.dart';
import 'direct_sale/edit_item_widget.dart';
import 'fill_evainfo_page.dart';

class PushCarPage extends StatefulWidget {
  const PushCarPage({Key? key}) : super(key: key);

  @override
  State<PushCarPage> createState() => _PushCarPageState();
}

class _PushCarPageState extends State<PushCarPage> {
  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(SearchParamModel(
      series: SortSeriesModel.init,
      brand: SortBrandModel.init,
      car: SortCarModelModel.init,
      returnType: 3));
  late CarDistinguishModel? carInfoModel;
  final CarInfo _carInfo = CarInfo();
  final TextEditingController _viNumController = TextEditingController();
  DateTime? _firstDate;
  final TextEditingController _carNumController = TextEditingController();
  final TextEditingController _versionController = TextEditingController();
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
  List<ChooseItem> typeList = [
    ChooseItem(name: '车商'),
    ChooseItem(name: '个人直卖'),
  ];

  String? _source;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _viNumController.dispose();
    _carNumController.dispose();
    _versionController.dispose();
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
                                    const Text(
                                      '49',
                                      style: TextStyle(
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
                                    await ApiClient().uploadImage(files);
                                    carInfoModel = await CarFunc.carDistinguish(
                                        urls.imageWithHost);
                                    if (carInfoModel != null) {
                                      _carInfo.name = carInfoModel!.cartype;

                                      _carInfo.address = carInfoModel!.address;

                                      _carInfo.licensingDate =
                                          carInfoModel!.regdate;
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
                                Get.to(() =>  EvainfoPage(carColor:_carInfo.color! ,firstDate: _carInfo.licensingDate!,mile: _mileController.text, carName: _carInfo.name!,));
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
    var vinum = _textarea('车架号', '请输入车架号', _viNumController);
    var carnum = _textarea('车牌号', '请输入车牌号', _carNumController);
    var version = _textarea('发动机号', '请输入发动机号', _versionController);
    var mile = Container(
      color: Colors.transparent,
      child: Row(
        children: [
          '*'.text.size(30.sp).color(Colors.red).make().paddingOnly(top: 5),
          10.wb,
          SizedBox(
            width: 170.w,
            child: '表显里程'
                .text
                .size(30.sp)
                .color(Colors.black.withOpacity(0.45))
                .make(),
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              onChanged: (text) => setState(() {}),
              autofocus: false,
              controller: _mileController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '请输入行驶里程',
                  hintStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black.withOpacity(0.25),
                  )),
            ),
          ),
          24.wb,
          '万公里'.text.size(30.sp).color(Colors.black.withOpacity(0.8)).make(),
        ],
      ),
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
                      _carInfo.name = _pickCar.value.car.name;
                    },
                    pickCar: _pickCar,
                  ));
                  setState(() {});
                },
            _carInfo.name,
            '请输入具体车型',
          ),
          _function(
            '首次上牌',
                () async {
              _firstDate = await CarDatePicker.monthPicker(DateTime.now());
              _carInfo.licensingDate =
                  DateUtil.formatDate(_firstDate, format: 'yyyy-MM');
              setState(() {});
            },
            _carInfo.licensingDate,
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
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.w))),
                builder: (context) {
                  return CarListPicker(
                    items: colorList, callback: (String content) {
                    Get.back();
                    _carInfo.color = content;
                    setState(() {
                    });
                  }, title: '车身颜色',
                  );
                },
              );
            },
            _carInfo.color,
            '请输入车身颜色',
          ),
          20.heightBox,
          mile,
          _function(
            '车辆来源',
                ()async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.w))),
                builder: (context) {
                  return CarListPicker(
                    isGrid: false,
                    items: typeList, callback: (String content) {
                    Get.back();
                    _source = content;
                    setState(() {
                    });
                  }, title: '车辆来源',
                  );
                },
              );
            },
            _source,
            '请选择车辆来源',
          ),
        ],
      ),
    );
  }

  _textarea(String title,
      String hint,
      TextEditingController _contentController,) {
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
              onChanged: (text) => setState(() {}),
              autofocus: false,
              controller: _contentController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black.withOpacity(0.25),
                  )),
            ),
          ),
          24.wb,
        ],
      ),
    );
  }

  _function(String title,
      VoidCallback onTap,
      String? content,
      String msg,) {
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

  RadioModel(this.isSelected,
      this.buttonText,);
}
