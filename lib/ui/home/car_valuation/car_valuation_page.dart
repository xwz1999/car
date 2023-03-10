import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_valuation/car_valuation_result_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/sort/car_three_city_list_page.dart';
import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/ui/user/user_assessment/user_assessment_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/car_list_picker.dart';
import 'package:cloud_car/widget/scan_license_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../model/sort/sort_brand_model.dart';
import '../../../model/sort/sort_car_model_model.dart';
import '../../../model/sort/sort_series_model.dart';

class CarValuationPage extends StatefulWidget {
  const CarValuationPage({super.key});

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

  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();

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
  void initState() {
    super.initState();
    _carInfo.locationCity = '宁波';
    _carInfo.locationCityId = 42;
  }

  @override
  void dispose() {
    _licensePlateController.dispose();
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
                  Get.to(() => const UserAssessmentPage());
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
            ScanLicenseWidget(onLoadComplete: (carInfoModel) {
              // _carInfo.name = carInfoModel.cartype;
              if (carInfoModel.vinModel != null) {
                _carModelController.text =
                    carInfoModel.vinModel!.first.modelName;
                _carInfo.name = carInfoModel.vinModel!.first.modelName;
                _carInfo.modelId = carInfoModel.vinModel!.first.modelId;
                _carInfo.color = carInfoModel.vinModel!.first.color;
              }
              _licensePlateController.text = carInfoModel.vehicle.lsnum;
              _carInfo.address = carInfoModel.vehicle.address;

              _carInfo.licensingDate =
                  DateUtil.getDateTime(carInfoModel.vehicle.regdate);
              setState(() {});
            }),
            GestureDetector(
              onTap: () async {
                await Get.to(() => ChooseCarPage(
                      callback: () {
                        Get.back();
                        _carModelController.text = _pickCar.value.car.name;
                        _carInfo.name = _pickCar.value.car.name;
                        _carInfo.modelId = _pickCar.value.car.modelId;
                        _carInfo.brand = _pickCar.value.brand.name;
                      },
                      pickCar: _pickCar,
                    ));
                setState(() {});
              },
              child: EditItemWidget(
                title: '具体车型',
                controller: _carModelController,
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
            // EditItemWidget(
            //   title: '车牌号',
            //   callback: (String content) {
            //     // _carInfo.licensePlate = content;
            //     _carInfo.licensePlate = _licensePlateController.text;
            //   },
            //   tips: '请输入车牌号',
            //   topIcon: false,
            //   paddingStart: 32,
            //   controller: _licensePlateController,
            // ),
            GestureDetector(
              onTap: () async {
                Get.to(
                  () => CarThreeCityListPage(
                    onSelect: (city) {
                      Get.back();
                      _carInfo.locationCity = city.cityName;
                      _carInfo.locationCityId = city.cityId;
                      setState(() {});
                    },
                  ),
                );
              },
              child: EditItemWidget(
                title: '上牌地区',
                callback: (String content) {},
                value: _carInfo.locationCity,
                tips: '请选择上牌地区',
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
                // _firstDate = await CarDatePicker.pick(DateTime.now());
                // _carInfo.licensingDate = _firstDate;
                _firstDate = await CarDatePicker.monthPicker(DateTime.now());
                _carInfo.licensingDate = _firstDate;
                FocusManager.instance.primaryFocus?.unfocus();
                setState(() {});
              },
              child: EditItemWidget(
                title: '首次上牌',
                callback: (String content) {},
                value: _carInfo.licensingDateStr,
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
                      callback: (String content, int value) {
                        Get.back();
                        _carInfo.color = content;
                        setState(() {});
                      },
                      title: '车身颜色',
                    );
                  },
                );
              },
              child: EditItemWidget(
                title: '车身颜色',
                callback: (String content) {},
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
                  if (price.isNotEmpty) {
                    _carInfo.price = price;
                    Get.to(
                      () => CarValuationResultPage(
                        carInfo: _carInfo,
                      ),
                    );
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

  // ///牌照
  // String? licensePlate;
  /// 所在地区
  String? locationCity;

  /// 所在地区id
  int? locationCityId;

  ///上牌照时间
  DateTime? licensingDate;

  String get licensingDateStr =>
      DateUtil.formatDate(licensingDate, format: 'yyyy-MM');

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

  ///真实公里数
  int? shamMileage;

  String? brand;

  String? price;

  ///最终估价 传进去

  CarInfo({
    this.name,
    this.address,
    this.modelId,
    this.locationCity,
    this.locationCityId,
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
    this.shamMileage,
  });
}
