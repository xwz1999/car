import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/model/car/car_distinguish_model.dart';
import 'package:cloud_car/model/contract/purchase_photo_model.dart';
import 'package:cloud_car/model/sort/sort_brand_model.dart';
import 'package:cloud_car/model/sort/sort_car_model_model.dart';
import 'package:cloud_car/model/sort/sort_series_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_choose_page.dart';
import 'package:cloud_car/ui/home/car_purchase/purchase_info_page.dart';
import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:cloud_car/widget/scan_license_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


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
  
  final ValueNotifier<PurchaseCarInfo> _publishCarInfo = ValueNotifier(PurchaseCarInfo.empty);


  final ValueNotifier<PurchaseInfo> purchaseInfo = ValueNotifier(PurchaseInfo.empty);

  final ValueNotifier<PurchasePhotoModel> reportPhotoModel =
  ValueNotifier(PurchasePhotoModel.init);
  
  // final PurchaseCarInfo _publishCarInfo = PurchaseCarInfo.empty;
  final TextEditingController _viNumController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _mileController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();

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
      CarNatureOfUse.values.map((e) =>  e.typeStr).toList();

  @override
  void initState() {
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
        leading: const CloudBackButton(
          isSpecial: true,
        ),
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
                        color: Colors.white,),
                    child: Column(
                      children: [
                        ScanLicenseWidget(onLoadComplete: (carInfoModel) {
                          if (carInfoModel.vinModel != null) {
                            _publishCarInfo.value.carName =
                                carInfoModel.vinModel!.first.modelName;
                            _publishCarInfo.value.carModelId =
                                carInfoModel.vinModel!.first.modelId;
                          }
                          _viNumController.text = carInfoModel.vehicle.vin;
                          _publishCarInfo.value.licensingDate =
                              DateUtil.getDateTime(
                                  carInfoModel.vehicle.issuedate);

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
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (!canTap) {
                                return;
                              }
                              Get.to(()=>PurchaseChoosePage(purchaseCarInfo: _publishCarInfo.value, purchaseInfo: purchaseInfo.value, reportPhotoModel: reportPhotoModel.value,));
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
      title: '车辆牌照',
      tips: '请输入',
      controller: _licensePlateController,
      topIcon: false,
      paddingStart: 0.w,
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
                      _publishCarInfo.value.carModelId = _pickCar.value.car.modelId;
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
              var firstDate = await CarDatePicker.calenderPicker(DateTime(1960), DateTime.now());
              _publishCarInfo.value.licensingDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.value.licensingDateStr,
            '选择首次上牌时间',
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
              var firstDate = await CarDatePicker.calenderPicker(DateTime(1960), DateTime.now());
              _publishCarInfo.value.productionDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.value.productionDateStr,
            '选择出厂日期',
          ),

          _function(
            '车强险',
                () async {
                  var firstDate = await CarDatePicker.calenderPicker(DateTime(1960),DateTime(DateTime.now().year+100));
              _publishCarInfo.value.compulsoryInsuranceDate = firstDate;
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {});
            },
            _publishCarInfo.value.compulsoryInsuranceDateStr,
            '选择车强险到期时间',
          ),

          mile,
          licensePlate
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
    if (_publishCarInfo.value.carNatureOfUse==0) {
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
      BotToast.showText(text: '请选择车强险时间');
      return false;
    }

    if (_mileController.text.trim().isEmpty) {
      BotToast.showText(text: '请输入行驶里程');
      return false;
    }

    if (_publishCarInfo.value.licensePlate=='') {
      BotToast.showText(text: '请输入车辆牌照');
      return false;
    }

    _publishCarInfo.value.mileage = _mileController.text;
    _publishCarInfo.value.viNum = _viNumController.text;
    _publishCarInfo.value.engineNum = _engineController.text;

    _publishCarInfo.value.licensePlate = _licensePlateController.text;
    return true;
  }

  _function(
    String title,
    VoidCallback onTap,
    String? content,
    String msg,{bool topIcon = false}
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
  CarNatureOfUse get carNatureOfUseEM => CarNatureOfUse.getValue(carNatureOfUse??0);

  ///发动机号
  String? engineNum;

  ///车强险到期时间
  DateTime? compulsoryInsuranceDate;
  String get compulsoryInsuranceDateStr {
    if(compulsoryInsuranceDate==null){
      return '';
    }else{
      return DateUtil.formatDate(compulsoryInsuranceDate, format: 'yyyy-MM-dd');
    }
  }

  ///表显里程
  String? mileage;

  // ///环保等级
  // String? environmentalLevel;


  String? customer;
  
  int? customerId;

  static PurchaseCarInfo get empty => PurchaseCarInfo(
        viNum: '',
        carName: '',
        carModelId: null,
        licensingDate: null,
        engineNum: '',
        customer:'',
        customerId:null,
        mileage: '',
        carNatureOfUse:0,
        //environmentalLevel:'',
        compulsoryInsuranceDate:null
      );

  PurchaseCarInfo({
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
    this.compulsoryInsuranceDate
  });
}
