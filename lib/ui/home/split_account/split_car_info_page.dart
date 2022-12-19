import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/model/region/china_region_model.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/sort/sort_car_model_model.dart';
import 'package:cloud_car/model/sort/sort_series_model.dart';
import 'package:cloud_car/ui/home/car_manager/car_enum.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/ui/home/sort/choose_city_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/cloud_grid_picker_widget.dart';
import 'package:cloud_car/widget/scan_license_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class SplitCarInfoPage extends StatefulWidget {
  final double ownAmount;
  final List<dynamic> brokerAmounts;

  const SplitCarInfoPage({super.key, required this.ownAmount, required this.brokerAmounts});

  @override
  State<SplitCarInfoPage> createState() => _SplitCarInfoPageState();
}

class _SplitCarInfoPageState extends State<SplitCarInfoPage> {
  final ValueNotifier<SearchParamModel> _pickCar = ValueNotifier(
      SearchParamModel(
          series: SortSeriesModel.init,
          brand: SortBrandModel.init,
          car: SortCarModelModel.init,
          returnType: 3));
  late CarDistinguishModel? carInfoModel;
  final SplitCarInfo _publishCarInfo = SplitCarInfo();
  final TextEditingController _viNumController = TextEditingController();
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

  List<ChooseItem> get list =>
      CarSource.values.map((e) => ChooseItem(name: e.sourceName)).toList();

  @override
  void initState() {
    super.initState();
    // _publishCarInfo.locationCity = '宁波';
    // _publishCarInfo.locationCityId = 42;
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

                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
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
                            onPressed: ()async {
                              if (!canTap) {
                                return;
                              }
                              var cancel = CloudToast.loading;

                              var res = await apiClient.request(API.split.create, data: {
                                'ownAmount': widget.ownAmount,
                                'name': DateUtil.formatDate(_publishCarInfo.licensingDate, format: 'yyyy年MM月')+_publishCarInfo.carName!,
                                'brokerAmounts': widget.brokerAmounts,
                                'modelId': _publishCarInfo.carModelId,
                                'locationId': _publishCarInfo.locationCityId,
                                'licensingDate': _publishCarInfo.licensingDateStr,
                                'color': _publishCarInfo.carColor,
                                'mileage': (num.parse(_publishCarInfo.mileage??'0')*10000).toString(),
                              });
                              if (res.code == 0) {
                                CloudToast.show('创建成功');
                                Get.back();
                                Get.back();
                                Get.back();
                              } else {
                                CloudToast.show(res.msg);
                              }
                              cancel();
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                            ),
                            child: '创建分账'
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



    var mile = EditItemWidget(
      topIcon: true,
      title: '表显里程',
      tips: '请输入里程',
      controller: _mileController,
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
          _function(
            '选择地区',
                () async {
              await  Get.to(() => ChooseCityPage(
                callback: (ChinaRegionModel model) {
                  _publishCarInfo.locationCity =model.name;
                  _publishCarInfo.locationCityId =  model.id;
                  setState(() {});
                },
              ));
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.locationCity,
            '选择所在地区',
          ),
          _function(
            '首次上牌',
                () async {
                  var firstDate = await CarDatePicker.pick(DateTime.now(),);
             /// var firstDate = await CarDatePicker.calenderPicker(DateTime(1960), DateTime.now());
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
                  return CloudGridPickerWidget(time: false,
                      title: '车身颜色',
                      items: colorList.map((e) => e.name).toList(),
                      onConfirm: (strList, indexList) {
                        if(strList.isNotEmpty){
                          _publishCarInfo.carColor = strList.first;
                          // Get.back();
                          FocusManager.instance.primaryFocus?.unfocus();
                          setState(() {});
                        }

                      });
                },
              );
            },
            _publishCarInfo.carColor,
            '请输入车身颜色',
          ),
          mile,

        ],
      ),
    );
  }



  bool get canTap {
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

    if (_publishCarInfo.carColor.isEmptyOrNull) {
      BotToast.showText(text: '请选择车身颜色');
      return false;
    }
    if (_mileController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入行驶里程');
      return false;
    }

    _publishCarInfo.mileage = _mileController.text;
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

class SplitCarInfo {

  ///车型
  String? carName;
  int? carModelId;

  ///首次上牌时间
  DateTime? licensingDate;

  String get licensingDateStr =>
      DateUtil.formatDate(licensingDate, format: 'yyyy-MM-dd');

  // ///车牌号
  // String? carNum;
  /// 所在地区
  String? locationCity;

  /// 所在地区id
  int? locationCityId;


  ///车身颜色
  String? carColor;

  ///表显里程
  String? mileage;

  static SplitCarInfo get empty => SplitCarInfo(
    locationCity: '',
    locationCityId: 0,
    carName: '',
    carColor: '',
    carModelId: 0,
    licensingDate: DateTime.now(),
    mileage: '',
  );

  SplitCarInfo({
    this.carName,
    this.licensingDate,
    this.locationCity,
    this.locationCityId,
    this.carColor,
    this.mileage,
    this.carModelId,
  });
}
