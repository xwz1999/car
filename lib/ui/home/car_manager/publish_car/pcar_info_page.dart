import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_report_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/picker/car_list_picker.dart';
import 'package:cloud_car/widget/publish_car_info_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class PublishCarInfoPage extends StatefulWidget {
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel;

  const PublishCarInfoPage({Key? key, required this.consignmentContractModel})
      : super(key: key);

  @override
  State<PublishCarInfoPage> createState() => _PublishCarInfoPageState();
}

class _PublishCarInfoPageState extends State<PublishCarInfoPage> {
  final TextEditingController _displacementController =
      TextEditingController(); //排量
  final TextEditingController _transmissionController =
      TextEditingController(); //变速箱
  final TextEditingController _emissionController =
      TextEditingController(); //排放标准
  final TextEditingController _carConditionInterController =
      TextEditingController(); //排放标准
  final TextEditingController _carConditionOutController =
      TextEditingController(); //排放标准
  String? _carType = '';
  String? _interColor = '';
  String? _purpose = '';
  final String _carPlace = '';
  final String _location = '';
  List<ChooseItem> carTypeList = [
    ChooseItem(name: '二手车(中规)'),
    ChooseItem(name: '二手车(平行进口)'),
  ];
  List<ChooseItem> interColorList = [
    ChooseItem(name: '黑色'),
    ChooseItem(name: '米黄色'),
    ChooseItem(name: '米灰色'),
    ChooseItem(name: '红色'),
    ChooseItem(name: '棕色'),
    ChooseItem(name: '米/黑'),
    ChooseItem(name: '红/黑'),
    ChooseItem(name: '米灰/黑'),
    ChooseItem(name: '棕/黑'),
    ChooseItem(name: '白/黑'),
    ChooseItem(name: '其他'),
  ];
  List<ChooseItem> purposeList = [
    ChooseItem(name: '运营'),
    ChooseItem(name: '非运营'),
  ];

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0x99eeeeee),
        ),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(30.w),
              child: '基本信息'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(30.w),
              child: Column(
                children: [
                  PublishCarInfoWidget(
                    fontColor: Colors.black38,
                    publishCarInfo: widget.consignmentContractModel.value.publishCarInfo!,
                  ),
                  _publishChoose(
                      style: false,
                      necessary: true,
                      title: '车辆类型',
                      hint: '请选择',
                      head: '车辆类型',
                      value: _carType!,
                      callback: (content,value) {
                        Get.back();
                        _carType = content;
                        setState(() {});
                      },
                      typeList: carTypeList),
                  _publishChoose(
                      style: true,
                      necessary: false,
                      title: '内饰颜色',
                      hint: '请选择',
                      head: '选择内饰颜色',
                      value: _interColor!,
                      callback: (content,value) {
                        Get.back();
                        _interColor = content;
                        setState(() {});
                      },
                      typeList: interColorList),
                  _publishController(
                      true, '排量', '请输入', _displacementController, 'L'),
                  _publishController(
                      true, '变速箱', '请输入', _transmissionController, ''),
                  _publishController(
                      true, '排放标准', '请输入', _emissionController, ''),
                  Row(
                    children: [
                      23.wb,
                      '所属车商'
                          .text
                          .size(30.sp)
                          .color(Colors.black.withOpacity(0.45))
                          .make(),
                    ],
                  ).paddingOnly(top: 15.h, bottom: 15.h),
                  _publishChoose(
                      style: false,
                      necessary: true,
                      title: '使用性质',
                      hint: '请选择',
                      head: '使用性质',
                      value: _purpose!,
                      callback: (content,value) {
                        Get.back();
                        _purpose = content;
                        setState(() {});
                      },
                      typeList: purposeList),
                  _publishJumpPage(false, '车辆所在地', '请选择', () {}, _carPlace),
                  _publishJumpPage(false, '车辆归属地', '请选择', () {}, _location),
                  _publishTextField('车况（对内）', _carConditionInterController),
                  _publishTextField('车况（对外）', _carConditionOutController),
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const CarReportPage());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingAll(30.w),
          ],
        ),
      ),
    );
  }

  _publishTextField(
    String title,
    TextEditingController contentController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.size(30.sp).color(Colors.black.withOpacity(0.45)).make(),
        15.heightBox,
        TextField(
          minLines: 3,
          maxLines: 10,
          cursorHeight: 2,
          textAlign: TextAlign.start,
          onChanged: (text) => setState(() {}),
          autofocus: false,
          controller: contentController,
          decoration: InputDecoration(
            hintText: '请输入',
            hintStyle: TextStyle(
              fontSize: 30.sp,
              color: Colors.black.withOpacity(0.25),
            ),
            contentPadding: EdgeInsets.all(30.h),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: const BorderSide(
                    color: Colors.black12, width: 1, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: const BorderSide(
                    color: Colors.black, width: 1, style: BorderStyle.solid)),
          ),
        ),
      ],
    ).paddingOnly(top: 15.h, bottom: 15.h, left: 23.w, right: 23.w);
  }

  _publishJumpPage(
    bool necessary,
    String title,
    String hint,
    VoidCallback onTap,
    String content,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            necessary
                ? '*'
                    .text
                    .size(30.sp)
                    .color(Colors.red)
                    .make()
                    .paddingOnly(top: 5)
                : 13.wb,
            10.wb,
            SizedBox(
              width: 170.w,
              child: title.text
                  .size(30.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
            ),
            (content.isEmpty ? hint : content)
                .text
                .size(30.sp)
                .color(Colors.black.withOpacity(content.isEmpty ? 0.25 : 0.85))
                .make(),
            const Spacer(),
            Icon(
              CupertinoIcons.chevron_right,
              color: Colors.black.withOpacity(0.45),
              size: 28.w,
            ),
          ],
        ),
      ),
    ).paddingOnly(top: 15.h, bottom: 15.h);
  }

  _publishController(
    bool necessary,
    String title,
    String hint,
    TextEditingController contentController,
    String unit,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
      color: Colors.transparent,
      child: Row(
        children: [
          necessary
              ? '*'
                  .text
                  .size(30.sp)
                  .color(Colors.red)
                  .make()
                  .paddingOnly(top: 5)
              : 13.wb,
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
              controller: contentController,
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
          unit.text.size(30.sp).color(Colors.black.withOpacity(0.8)).make(),
        ],
      ),
    );
  }

  _publishChoose({
    required bool style,
    required bool necessary,
    required String title,
    required String hint,
    required String head,
    required String value,
    required Function(String,int) callback,
    required List<ChooseItem> typeList,
  }) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
          builder: (context) {
            return CarListPicker(
              isGrid: style,
              carString: value.isEmptyOrNull ? '' : value,
              items: typeList,
              callback: callback,
              title: '车辆来源',
            );
          },
        );
      },
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            necessary
                ? '*'
                    .text
                    .size(30.sp)
                    .color(Colors.red)
                    .make()
                    .paddingOnly(top: 5)
                : 13.wb,
            10.wb,
            SizedBox(
              width: 170.w,
              child: title.text
                  .size(30.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
            ),
            (value.isEmpty ? hint : value)
                .text
                .size(30.sp)
                .color(Colors.black.withOpacity(value.isEmpty ? 0.25 : 0.85))
                .make(),
            const Spacer(),
            Icon(
              CupertinoIcons.chevron_right,
              color: Colors.black.withOpacity(0.45),
              size: 28.w,
            ),
          ],
        ),
      ),
    ).paddingOnly(top: 15.h, bottom: 15.h);
  }
}
