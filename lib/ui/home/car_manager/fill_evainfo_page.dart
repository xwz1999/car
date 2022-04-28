import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/home/car_manager/check_pushcar_page.dart';
import 'package:cloud_car/ui/home/car_manager/push_car_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';

import 'package:cloud_car/utils/headers.dart';

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
  final CarInfo _carInfo = CarInfo();
  String? _transfer = ''; //过户次数
  String? _paint = ''; //油漆面
  String? _metal = ''; //钣金面
  String? _replace = ''; //更换件
  String? _transmission = ''; //变速箱
  String? _accident = ''; //重大事故
  String? _maintain = ''; //4s保养
  String? _trueMeters = ''; //真实公里数

  List<ChooseItem> transferList = [
    ChooseItem(name: '无过户'),
    ChooseItem(name: '1次'),
    ChooseItem(name: '2次'),
    ChooseItem(name: '3次'),
    ChooseItem(name: '4次'),
    ChooseItem(name: '5次'),
    ChooseItem(name: '6次'),
    ChooseItem(name: '7次'),
    ChooseItem(name: '8次'),
    ChooseItem(name: '9次'),
    ChooseItem(name: '10次'),
    ChooseItem(name: '10次以上'),
  ];
  List<ChooseItem> paintList = [
    ChooseItem(name: '0个面'),
    ChooseItem(name: '1个面'),
    ChooseItem(name: '2个面'),
    ChooseItem(name: '3个面'),
    ChooseItem(name: '4个面'),
    ChooseItem(name: '5个面'),
    ChooseItem(name: '6个面'),
    ChooseItem(name: '7个面'),
    ChooseItem(name: '8个面'),
    ChooseItem(name: '9个面'),
    ChooseItem(name: '10个面'),
    ChooseItem(name: '10个面以上'),
  ];
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
    ChooseItem(name: '是'),
    ChooseItem(name: '否'),
  ];
  List<ChooseItem> accidentDetailList = [
    ChooseItem(name: '四梁六柱发生修复'),
    ChooseItem(name: '后翼子板切割'),
    ChooseItem(name: '纵梁修复'),
    ChooseItem(name: '安全气囊弹出'),
  ];
  List<ChooseItem> accidentList = [
    ChooseItem(name: '有重大事故'),
    ChooseItem(name: '无重大事故'),
  ];
  List<ChooseItem> haveFixList = [
    ChooseItem(name: '轻微渗油'),
    ChooseItem(name: '严重渗油'),
    ChooseItem(name: '发动机解体维修'),
  ];

  @override
  void initState() {
    BotToast.showText(text: '请选择选项内容');
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
                  height: 1000.h,
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
                                child: widget.publishCarInfo.licensingDate!.text
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
                                carString: _transfer ?? '',
                                items: transferList,
                                callback: (String content,int value) {
                                  Get.back();
                                  _transfer = content;
                                  _carInfo.transfer=value;
                                  BotToast.showText(text: value.toString());
                                  setState(() {});
                                },
                                title: '过户次数',
                              );
                            },
                          );
                        },
                        _transfer,
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
                                carString: _paint ?? '',
                                items: paintList,
                                callback: (String content,int value) {
                                  Get.back();
                                  _paint = content;
                                  _carInfo.paint=value;
                                  setState(() {});
                                },
                                title: '油漆面修复',
                              );
                            },
                          );
                        },
                        _paint,
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
                                carString: _metal ?? '',
                                items: paintList,
                                callback: (String content,int value) {
                                  Get.back();
                                  _metal = content;
                                  _carInfo.plate=value;
                                  setState(() {});
                                },
                                title: '钣金面修复',
                              );
                            },
                          );
                        },
                        _metal,
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
                              return CarListPicker(
                                isGrid: false,
                                carString: _replace ?? '',
                                items: replaceList,
                                callback: (String content,int value) {
                                  Get.back();
                                  _replace = content;

                                  setState(() {});
                                },
                                title: '更换件情况',
                              );
                            },
                          );
                        },
                        _replace,
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
                              return CarListPicker(
                                isGrid: false,
                                carString: _transmission ?? '',
                                items: fixList,
                                callback: (String content,int value) {
                                  Get.back();
                                  _transmission = content;
                                  setState(() {});
                                },
                                title: '变速箱情况',
                              );
                            },
                          );
                        },
                        _transmission,
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
                              return CarListPicker(
                                isGrid: false,
                                carString: _accident ?? '',
                                items: accidentList,
                                callback: (String content,int value) {
                                  Get.back();
                                  _accident = content;
                                  setState(() {});
                                },
                                title: '重大事故',
                              );
                            },
                          );
                        },
                        _accident,
                        '请选择',
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.w))),
                            builder: (context) {
                              return CarListPicker(
                                isGrid: false,
                                carString: _maintain ?? '',
                                items: maintainList,
                                callback: (String content,int value) {
                                  Get.back();
                                  _maintain = content;
                                  setState(() {});
                                },
                                title: '全程4s按时保养',
                              );
                            },
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 220.w,
                                child: Text(
                                  '全程4s按时保养',
                                  style: TextStyle(
                                    color: BaseStyle.color999999,
                                    fontSize: BaseStyle.fontSize28,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller:
                                      TextEditingController(text: _maintain),
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  onChanged: (text) {},
                                  style: TextStyle(
                                    color: BaseStyle.color333333,
                                    fontSize: BaseStyle.fontSize28,
                                  ),
                                  decoration: const InputDecoration(
                                    //contentPadding: EdgeInsets.only(top: 15.w,bottom: 15.w),
                                    filled: true,
                                    isCollapsed: true,
                                    fillColor: Colors.white,
                                    hintText: '请选择',
                                    hintStyle: TextStyle(
                                        color: Color(0xFFcccccc),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Image.asset(
                                Assets.icons.icGoto.path,
                                width: 32.w,
                                height: 32.w,
                              ),
                            ],
                          ),
                        ),
                      ).paddingOnly(top: 50.h, left: 20.w, right: 35.w),
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.w))),
                            builder: (context) {
                              return CarListPicker(
                                isGrid: false,
                                carString: _trueMeters ?? '',
                                items: maintainList,
                                callback: (String content,int value) {
                                  Get.back();
                                  _trueMeters = content;
                                  setState(() {});
                                },
                                title: '有无更改真实公里数',
                              );
                            },
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 280.w,
                                child: Text(
                                  '有无更改真实公里数',
                                  style: TextStyle(
                                    color: BaseStyle.color999999,
                                    fontSize: BaseStyle.fontSize28,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller:
                                      TextEditingController(text: _trueMeters),
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  onChanged: (text) {},
                                  style: TextStyle(
                                    color: BaseStyle.color333333,
                                    fontSize: BaseStyle.fontSize28,
                                  ),
                                  decoration: const InputDecoration(
                                    //contentPadding: EdgeInsets.only(top: 15.w,bottom: 15.w),
                                    filled: true,
                                    isCollapsed: true,
                                    fillColor: Colors.white,
                                    hintText: '请选择',
                                    hintStyle: TextStyle(
                                        color: Color(0xFFcccccc),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Image.asset(
                                Assets.icons.icGoto.path,
                                width: 32.w,
                                height: 32.w,
                              ),
                            ],
                          ),
                        ),
                      ).paddingOnly(top: 50.h, left: 20.w, right: 35.w),
                    ],
                  ),
                ),
                30.heightBox,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async{
                      var list = await CarFunc.getEstimatePrice(_carInfo);
                      Get.to(() =>
                          CheckPushPage(publishCarInfo: widget.publishCarInfo));
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

