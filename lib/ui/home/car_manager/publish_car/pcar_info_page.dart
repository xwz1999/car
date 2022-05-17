import 'package:cloud_car/model/car/business_push_model.dart';
import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/car/dealer_list_model.dart';
import 'package:cloud_car/model/region/china_region_model.dart';
import 'package:cloud_car/ui/home/car_manager/choose_dealer_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_box_widget.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_report_page.dart';
import 'package:cloud_car/ui/home/sort/choose_city_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/picker/cloud_grid_picker_widget.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:cloud_car/widget/publish_car_info_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../model/car/car_photo_model.dart';
import '../../../../widget/button/cloud_back_button.dart';

class PublishCarInfoPage extends StatefulWidget {
  final int? orderId;

  final ValueNotifier<BusinessPushModel> businessPushModel;

  final ValueNotifier<CarPhotoModel> carPhotoModel;

  final ConsignmentContractModel consignmentContractModel;

  const PublishCarInfoPage({
    super.key,
    required this.businessPushModel,
    required this.carPhotoModel,
    required this.consignmentContractModel,
    this.orderId,
  });

  @override
  State<PublishCarInfoPage> createState() => _PublishCarInfoPageState();
}

class _PublishCarInfoPageState extends State<PublishCarInfoPage> {
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
              padding: EdgeInsets.all(32.w),
              child: Column(
                children: [
                  widget.orderId!=null?const SizedBox():
                  PublishCarInfoWidget(
                    fontColor: const Color(0xFF999999),
                    publishCarInfo:
                        widget.consignmentContractModel.publishCarInfo!,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.w))),
                        builder: (context) {
                          return CloudListPickerWidget(
                              title: '车辆类型',
                              items: carTypeList.map((e) => e.name).toList(),
                              onConfirm: (str, index) {
                                widget.carPhotoModel.value.baseInfo.type = str;
                                Get.back();
                                FocusManager.instance.primaryFocus?.unfocus();
                                setState(() {});
                              });
                        },
                      );
                    },
                    child: EditItemWidget(
                      title: '车辆类型',
                      tips: '请选择',
                      value: widget.carPhotoModel.value.baseInfo.type ?? '',
                      topIcon: true,
                      canChange: false,
                      callback: (String content) {},
                      paddingTop: 0.w,
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
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.w))),
                        builder: (context) {
                          return CloudGridPickerWidget(
                              title: '选择内饰颜色',
                              items: interColorList.map((e) => e.name).toList(),
                              onConfirm: (str, index) {
                                widget.carPhotoModel.value.baseInfo
                                    .interiorColor = str.first;

                                Get.back();
                                FocusManager.instance.primaryFocus?.unfocus();
                                setState(() {});
                              });
                        },
                      );
                    },
                    child: EditItemWidget(
                      title: '内饰颜色',
                      tips: '请选择',
                      value:
                          widget.carPhotoModel.value.baseInfo.interiorColor ??
                              '',
                      topIcon: false,
                      canChange: false,
                      callback: (String content) {},
                      endIcon: Image.asset(
                        Assets.icons.icGoto.path,
                        width: 32.w,
                        height: 32.w,
                      ),
                    ),
                  ),
                  EditItemWidget(
                    title: '排量',
                    tips: '请输入',
                    value:
                        widget.carPhotoModel.value.baseInfo.displacement ?? '',
                    topIcon: true,
                    callback: (String content) {
                      widget.carPhotoModel.value.baseInfo.displacement =
                          content;
                      setState(() {});
                    },
                    endText: 'L',
                  ),
                  EditItemWidget(
                    title: '变速箱',
                    tips: '请输入',
                    value: widget.carPhotoModel.value.baseInfo.gearbox ?? '',
                    topIcon: true,
                    callback: (String content) {
                      widget.carPhotoModel.value.baseInfo.gearbox = content;
                      setState(() {});
                    },
                  ),
                  EditItemWidget(
                    title: '排放标准',
                    tips: '请输入',
                    value:
                        widget.carPhotoModel.value.baseInfo.emissionStandard ??
                            '',
                    topIcon: true,
                    callback: (String content) {
                      widget.carPhotoModel.value.baseInfo.emissionStandard =
                          content;
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      Get.to(() => ChooseDealerPage(
                            callback: (DealerListModel model) {
                              widget.businessPushModel.value.dealerName =
                                  model.name;
                              widget.businessPushModel.value.dealerId =
                                  model.id;
                              setState(() {});
                            },
                          ));
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: EditItemWidget(
                      title: '所属车商',
                      tips: '请选择',
                      value: widget.businessPushModel.value.dealerName ?? '',
                      topIcon: widget.orderId == null,
                      canChange: false,
                      callback: (String content) {},
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
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.w))),
                        builder: (context) {
                          return CloudListPickerWidget(
                              title: '使用性质',
                              items: purposeList.map((e) => e.name).toList(),
                              onConfirm: (str, index) {
                                widget.carPhotoModel.value.baseInfo
                                    .useCharacter = str;
                                Get.back();
                                FocusManager.instance.primaryFocus?.unfocus();
                                setState(() {});
                              });
                        },
                      );
                    },
                    child: EditItemWidget(
                      title: '使用性质',
                      tips: '请选择',
                      value: widget.carPhotoModel.value.baseInfo.useCharacter ??
                          '',
                      topIcon: true,
                      canChange: false,
                      callback: (String content) {},
                      endIcon: Image.asset(
                        Assets.icons.icGoto.path,
                        width: 32.w,
                        height: 32.w,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ChooseCityPage(
                            callback: (ChinaRegionModel model) {
                              widget.carPhotoModel.value.baseInfo
                                  .locationString = model.name;
                              widget.carPhotoModel.value.baseInfo.location =
                                  model.id;
                              setState(() {});
                            },
                          ));
                    },
                    child: EditItemWidget(
                      title: '车辆所在地',
                      tips: '请选择',
                      value:
                          widget.carPhotoModel.value.baseInfo.locationString ??
                              '',
                      topIcon: true,
                      canChange: false,
                      callback: (String content) {},
                      endIcon: Image.asset(
                        Assets.icons.icGoto.path,
                        width: 32.w,
                        height: 32.w,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ChooseCityPage(
                            callback: (ChinaRegionModel model) {
                              widget.carPhotoModel.value.baseInfo
                                  .attributionString = model.name;
                              widget.carPhotoModel.value.baseInfo.attribution =
                                  model.id;
                              setState(() {});
                            },
                          ));
                    },
                    child: EditItemWidget(
                      title: '车辆归属地',
                      tips: '请选择',
                      topIcon: true,
                      value: widget
                              .carPhotoModel.value.baseInfo.attributionString ??
                          '',
                      canChange: false,
                      callback: (String content) {},
                      endIcon: Image.asset(
                        Assets.icons.icGoto.path,
                        width: 32.w,
                        height: 32.w,
                      ),
                    ),
                  ),
                  EditItemBoxWidget(
                    title: '车况(对内)',
                    tips: '请输入',
                    topIcon: true,
                    value:
                        widget.carPhotoModel.value.baseInfo.conditionIn ?? '',

                    callback: (String content) {
                      widget.carPhotoModel.value.baseInfo.conditionIn = content;
                    },
                  ),
                  EditItemBoxWidget(
                    title: '车况(对外)',
                    tips: '请输入',
                    topIcon: true,
                    value:
                        widget.carPhotoModel.value.baseInfo.conditionOut ?? '',

                    callback: (String content) {
                      widget.carPhotoModel.value.baseInfo.conditionOut =
                          content;
                    },
                  ),
                  32.hb,
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.carPhotoModel.value.baseInfo.type == null ||
                      widget.carPhotoModel.value.baseInfo.gearbox == null ||
                      widget.carPhotoModel.value.baseInfo.displacement ==
                          null ||
                      widget.carPhotoModel.value.baseInfo.emissionStandard ==
                          null ||
                      widget.carPhotoModel.value.baseInfo.useCharacter ==
                          null ||
                      widget.carPhotoModel.value.baseInfo.location==null||
                      widget.carPhotoModel.value.baseInfo.attribution==null||
                      (widget.carPhotoModel.value.baseInfo.conditionIn==null||
                          widget.carPhotoModel.value.baseInfo.conditionIn!.isEmpty)
                      ||
                      (widget.carPhotoModel.value.baseInfo.conditionOut==null||
                          widget.carPhotoModel.value.baseInfo.conditionOut!.isEmpty)||
                      (widget.orderId == null &&
                          widget.businessPushModel.value.dealerId == null)) {
                    CloudToast.show('请先完善客户信息');
                  } else {
                    Get.to(() => CarReportPage(
                          consignmentContractModel:
                              widget.consignmentContractModel,
                          businessPushModel: widget.businessPushModel,
                          carPhotoModel: widget.carPhotoModel,
                      orderId: widget.orderId,
                        ));
                  }
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
}
