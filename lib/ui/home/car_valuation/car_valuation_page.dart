import 'dart:io';

import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_valuation/car_valuation_result_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/user/user_assessment/user_assessment.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/car_list_picker.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../model/sort/sort_brand_model.dart';
import '../../../model/sort/sort_car_model_model.dart';
import '../../../model/sort/sort_series_model.dart';

class CarValuationPage extends StatefulWidget {
  const CarValuationPage({Key? key}) : super(key: key);

  @override
  _CarValuationPageState createState() => _CarValuationPageState();
}

class _CarValuationPageState extends State<CarValuationPage> {
  final CarInfo _carInfo = CarInfo();
  DateTime? _firstDate;
  late CarDistinguishModel? carInfoModel;
  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 3));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('车辆估值',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              _topImage(),
              _bottomEdit(),
            ],
          ),
        ],
      ),
    );
  }

  _topImage() {
    return Column(
      children: [
        24.hb,
        Container(
          width: double.infinity,
          height: 200.w,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 24.w, right: 24.w),
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage('assets/images/assessment_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        '剩余评估次数',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      20.wb,
                      Text(
                        (UserTool.userProvider.userInfo.data.assessCount)
                            .toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '精准估值',
                        style:
                            TextStyle(fontSize: 13, color: Color(0x99eeeeee)),
                      ),
                      20.wb,
                      const Text(
                        '守护您的车辆交易',
                        style:
                            TextStyle(fontSize: 13, color: Color(0x99eeeeee)),
                      ),
                    ],
                  ),
                  30.hb,
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(() =>  const UserAssessmentPage());
                },
                child: Container(
                  width: 120.w,
                  height: 58.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6.w)),
                  child: Text(
                    '去充值',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _bottomEdit() {
    return Padding(
      padding: EdgeInsets.only(top: 200.w),
      child: Container(
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
                await CloudImagePicker.pickSingleImage(title: '选择图片').then(
                  (value) async {
                    if (value != null) {
                      File files = value;
                      String urls = await ApiClient().uploadImage(files);
                      carInfoModel =
                          await CarFunc.carDistinguish(urls.imageWithHost);
                      if (carInfoModel != null) {
                        _carInfo.name = carInfoModel!.cartype;

                        _carInfo.address = carInfoModel!.address;

                        _carInfo.licensingDate = carInfoModel!.regdate;
                        setState(() {});
                      }
                    }
                  },
                );
                setState(() {});
              },
              child: Image.asset('assets/images/driving_license2.png'),
            ),
            GestureDetector(
              onTap: () async {
                await Get.to(() => ChooseCarPage(
                      callback: () {
                        Get.back();
                        _carInfo.name = _pickCar.value.car.name;
                        _carInfo.modelId = _pickCar.value.car.id;
                        _carInfo.brand = _pickCar.value.brand.name;
                      },
                      pickCar: _pickCar,
                    ));
                setState(() {});
              },
              child: EditItemWidget(
                title: '具体车型',
                callback: (String content) {},
                value: _carInfo.name ?? '',
                tips: '请选择具体车型',
                topIcon: false,
                paddingStart: 32,
                canChange: false,
                endIcon: Image.asset(
                  Assets.icons.icGoto.path,
                  width: 32.w,
                  height: 32.w,
                ),
              ),
            ),
            EditItemWidget(
              title: '车牌号',
              callback: (String content) {
                _carInfo.licensePlate = content;

              },
              value: _carInfo.licensePlate ?? '',
              tips: '请输入车牌号',
              topIcon: false,
              paddingStart: 32,
              canChange: true,
            ),


            GestureDetector(
              onTap: () async {
                _firstDate = await CarDatePicker.pick(DateTime.now());
                _carInfo.licensingDate =
                    DateUtil.formatDate(_firstDate, format: 'yyyy-MM-dd');
                setState(() {

                });

              },
              child: EditItemWidget(
                title: '首次上牌',
                callback: (String content) {},
                value: _carInfo.licensingDate ?? '',
                tips: '请选择首次上牌时间',
                topIcon: false,
                paddingStart: 32,
                canChange: false,
                endIcon: Image.asset(
                  Assets.icons.icGoto.path,
                  width: 32.w,
                  height: 32.w,
                ),
              ),
            ),


            GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.w))),
                  builder: (context) {
                    return CarListPicker(
                      items: colorList,
                      callback: (String content,int value) {
                        Get.back();
                        _carInfo.color = content;
                        setState(() {

                        });
                      },
                      title: '车身颜色',
                    );
                  },
                );
              },
              child: EditItemWidget(
                title: '车身颜色',
                callback: (String content) {

                },
                value: _carInfo.color ?? '',
                tips: '请选择车身颜色',
                topIcon: false,
                paddingStart: 32,
                canChange: false,
                endIcon: Image.asset(
                  Assets.icons.icGoto.path,
                  width: 32.w,
                  height: 32.w,
                ),
              ),
            ),
            EditItemWidget(
              title: '行驶里程',
              callback: (String content) {
                _carInfo.mileage = content;
              },
              value: _carInfo.mileage ?? '',
              tips: '请输入行驶里程',
              topIcon: false,
              paddingStart: 32,
              endText: '万公里',
            ),
            100.hb,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                    String price = await CarFunc.getQuickAmount(_carInfo);
                    if(price.isNotEmpty){
                      _carInfo.price = price;
                      Get.to(() => CarValuationResultPage(
                        carInfo: _carInfo,
                      ));
                    }


                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '开始估值'.text.size(30.sp).color(Colors.white).make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarInfo {
  String? name;
  String? address;

  ///车型id
  int? modelId;

  ///牌照
  String? licensePlate;

  ///上牌照时间
  String? licensingDate;

  ///里程
  String? mileage;

  String? color;
  ///过户次数
  int? transfer;

  ///油漆面
  int? paint;
  ///钣金面
  int? plate;
  ///更换件
  int? hasParts;
  List<int>? parts;
  ///变速箱
  int? hasSituation;
  int? engine;
  ///重大事故
  int? hasAccident;
  List<int>? accidents;
  ///4s保养
  int? maintain;
  ///车架号
  String? vin;
  ///发动机号
  String? engineNo;
  ///车辆来源
  int? source;
  ///真实公里数
  int? shamMileage;

  String? brand;


  String? price;///最终估价 传进去

  CarInfo({
    this.name,
    this.address,
    this.modelId,
    this.licensePlate,
    this.licensingDate,
    this.mileage,
    this.transfer,
    this.paint,
    this.plate,
    this.parts,
    this.engine,
    this.accidents,
    this.maintain,
    this.vin,
    this.engineNo,
    this.source,
    this.shamMileage,
  });
}
