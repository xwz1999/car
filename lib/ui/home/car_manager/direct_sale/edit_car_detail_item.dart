import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import '../../../../constants/enums.dart';
import '../../../../model/car/new_car_info.dart';
import '../../../../model/region/china_region_model.dart';
import '../../../../widget/picker/cloud_list_picker_widget.dart';
import '../../sort/choose_city_page.dart';

// @Deprecated('')
class EditCarDetailItem extends StatefulWidget {
  final NewCarInfo carListModel;

  const EditCarDetailItem({super.key, required this.carListModel});

  @override
  _EditCarDetailItemState createState() => _EditCarDetailItemState();
}

class _EditCarDetailItemState extends State<EditCarDetailItem> {
  late TextEditingController _editingController1;
  late TextEditingController _editingController2;

  List<String> get natureOfUseList =>
      CarNatureOfUse.values.map((e) => e.typeStr).toList();

  List<String> get carStockOfUseList =>
      CarStockStatus.values.map((e) => e.typeStr).toList();

  @override
  void initState() {
    _editingController1 = TextEditingController(text: '见检测报告');
    _editingController2 = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _editingController1.dispose();
    _editingController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: [
          getItem1(),
          48.hb,
        ],
      ),
    );
  }

  getItem1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.w),
          child: Text(
            '车辆详情信息',
            style: TextStyle(fontSize: 32.w, fontWeight: FontWeight.w600),
          ),
        ),
        // EditItemWidget(
        //   title: '车辆类型',
        //   value: widget.carListModel.carInfo.type,
        //   titleColor: const Color(0xFF999999),
        //   textColor: const Color(0xFF999999),
        //   canChange: false,
        //   callback: (String content) {},
        // ),
        // EditItemWidget(
        //   title: '车辆来源',
        //   value: widget.carListModel.carInfo.source,
        //   titleColor: const Color(0xFF999999),
        //   textColor: const Color(0xFF999999),
        //   canChange: false,
        //   callback: (String content) {},
        // ),
        // EditItemWidget(
        //   title: '品牌车型',
        //   value: widget.carListModel.carInfo.modelName,
        //   titleColor: const Color(0xFF999999),
        //   textColor: const Color(0xFF999999),
        //   canChange: false,
        //   callback: (String content) {},
        // ),
        // EditItemWidget(
        //   title: '车架号',
        //   value: widget.carListModel.carInfo.engineNo,
        //   titleColor: const Color(0xFF999999),
        //   textColor: const Color(0xFF999999),
        //   canChange: false,
        //   callback: (String content) {},
        // ),
        // EditItemWidget(
        //   title: '发动机号',
        //   value: widget.carListModel.carInfo.vin,
        //   titleColor: const Color(0xFF999999),
        //   textColor: const Color(0xFF999999),
        //   canChange: false,
        //   callback: (String content) {},
        // ),
        // EditItemWidget(
        //   title: '首次上牌',
        //   value: DateUtil.formatDateMs(
        //       widget.carListModel.carInfo.licensingDate.toInt() * 1000,
        //       format: 'yyyy-MM'),
        //   titleColor: const Color(0xFF999999),
        //   textColor: const Color(0xFF999999),
        //   canChange: false,
        //   callback: (String content) {},
        // ),
        // EditItemWidget(title: '车牌号', value: '浙B562T8',canChange: false, callback: (String content) {  },),
        EditItemWidget(
          title: '车身颜色',
          value: widget.carListModel.carInfo.color,
          topIcon: false,
          canChange: true,
          titleColor: const Color(0xFF999999),
          textColor: const Color(0xFF333333),
          callback: (String content) {
            widget.carListModel.carInfo.color = content;
          },
        ),
        EditItemWidget(
          title: '内饰颜色',
          value: widget.carListModel.carInfo.interiorColor,
          canChange: true,
          topIcon: false,
          titleColor: const Color(0xFF999999),
          textColor: const Color(0xFF333333),
          callback: (String content) {
            widget.carListModel.carInfo.interiorColor = content;
          },
        ),
        // EditItemWidget(
        //   title: '临时车牌',
        //   value: widget.carListModel.carInfo.temporaryLicensePlate,
        //   canChange: true,
        //   topIcon: false,
        //   titleColor: const Color(0xFF999999),
        //   textColor: const Color(0xFF333333),
        //   callback: (String content) {
        //     widget.carListModel.carInfo.temporaryLicensePlate = content;
        //   },
        // ),
        EditItemWidget(
          title: '车位编号',
          value: widget.carListModel.carInfo.parkingNo,
          canChange: true,
          topIcon: false,
          titleColor: const Color(0xFF999999),
          textColor: const Color(0xFF333333),
          callback: (String content) {
            widget.carListModel.carInfo.parkingNo = content;
          },
        ),
        GestureDetector(
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.w))),
              builder: (context) {
                return CloudListPickerWidget(
                    title: '库存状态',
                    items: carStockOfUseList,
                    onConfirm: (str, index) {
                      // widget.carListModel.carInfo.useCharacter = str;
                      // _publishCarInfo.value.natureOfUse = index;
                      widget.carListModel.carInfo.stockStatus = index;
                      widget.carListModel.carInfo.stockStatusName = str;
                      FocusManager.instance.primaryFocus?.unfocus();
                      Get.back();
                      setState(() {});
                    });
              },
            );
          },
          child: EditItemWidget(
            title: '库存状态',
            value: widget.carListModel.carInfo.stockStatusName,
            canChange: false,
            topIcon: false,
            endIcon: Image.asset(
              Assets.icons.icGoto.path,
              width: 32.w,
              height: 32.w,
            ),
            titleColor: const Color(0xFF999999),
            textColor: const Color(0xFF333333),
            // callback: (String content) {
            //   widget.carListModel.carInfo.useCharacter=content;
            // },
          ),
        ),
        // GestureDetector(
        //   onTap: () async {
        //     await showModalBottomSheet(
        //       context: context,
        //       shape: RoundedRectangleBorder(
        //           borderRadius:
        //               BorderRadius.vertical(top: Radius.circular(16.w))),
        //       builder: (context) {
        //         return CloudListPickerWidget(
        //             title: '使用性质',
        //             items: natureOfUseList,
        //             onConfirm: (str, index) {
        //               widget.carListModel.carInfo.useCharacter = str;
        //               // _publishCarInfo.value.natureOfUse = index;
        //               FocusManager.instance.primaryFocus?.unfocus();
        //               Get.back();
        //               setState(() {});
        //             });
        //       },
        //     );
        //   },
        //   child: EditItemWidget(
        //     title: '使用性质',
        //     value:  widget.carListModel.carInfo.useCharacter,
        //     canChange: true,
        //     topIcon: false,
        //     endIcon: Image.asset(
        //       Assets.icons.icGoto.path,
        //       width: 32.w,
        //       height: 32.w,
        //     ),
        //     titleColor: const Color(0xFF999999),
        //     textColor: const Color(0xFF333333),
        //     // callback: (String content) {
        //     //   widget.carListModel.carInfo.useCharacter=content;
        //     // },
        //   ),
        // ),
        EditItemWidget(
          title: '表显里程',
          value: widget.carListModel.carInfo.mileage,
          endText:'万公里',
          canChange: true,
          titleColor: const Color(0xFF999999),
          textColor: const Color(0xFF333333),
          topIcon: false,
          callback: (String content) {
            widget.carListModel.carInfo.mileage = content;
          },
        ),
        // EditItemWidget(
        //   title: '置购税',
        //   value: widget.carListModel.carInfo.purchaseTax,
        //   canChange: true,
        //   titleColor: const Color(0xFF999999),
        //   textColor: const Color(0xFF333333),
        //   callback: (String content) {},
        // ),
        // EditItemWidget(
        //   title: '',
        //   value: '1.40',
        //   canChange: false,
        //   callback: (String content) {},
        //   endText: 'L',
        // ),
        // EditItemWidget(
        //   title: '排量',
        //   value: '1.40',
        //   canChange: false,
        //   callback: (String content) {},
        //   endText: 'L',
        // ),
        //
        // EditItemWidget(
        //   title: '变速箱',
        //   value: '7挡杆式双离合',
        //   callback: (String content) {},
        // ),
        //
        // getContentItem('排放标准', '国V', path: Assets.icons.icGoto.path),
        //
        // EditItemWidget(
        //   title: '车商编号',
        //   value: '/',
        //   canChange: true,
        //   callback: (String content) {},
        //   topIcon: false,
        // ),
        //
        // EditItemWidget(
        //     title: '车辆编号',
        //     value: '893627',
        //     canChange: true,
        //     callback: (String content) {}),
        //
        // EditItemWidget(
        //     title: '使用性质',
        //     value: '非运营',
        //     canChange: true,
        //     callback: (String content) {}),
        EditItemWidget(
          title: '加装费用',
          value: widget.carListModel.carInfo.installationCost,
          endText:'元',
          canChange: true,
          titleColor: const Color(0xFF999999),
          textColor: const Color(0xFF333333),
          callback: (String content) {},
          topIcon: false,
        ),
        GestureDetector(
          onTap: () async {
            await Get.to(() => ChooseCityPage(
                  callback: (ChinaRegionModel model) {
                    widget.carListModel.carInfo.location = model.name;
                    widget.carListModel.carInfo.locationCityId = model.id;
                    setState(() {});
                  },
                ));
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {});
          },
          child: EditItemWidget(
            title: '车辆所在地',
            value: widget.carListModel.carInfo.location,
            canChange: false,
            titleColor: const Color(0xFF999999),
            textColor: const Color(0xFF333333),
            callback: (String content) {},
            topIcon: false,
            endIcon: Image.asset(
              Assets.icons.icGoto.path,
              width: 32.w,
              height: 32.w,
            ),
          ),
        ),

        // EditItemWidget(
        //   title: '车辆归属地',
        //   value: '浙江 宁波',
        //   canChange: true,
        //   callback: (String content) {},
        //   topIcon: false,
        // ),
        //
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       padding: EdgeInsets.only(top: 40.w),
        //       width: 150.w,
        //       child: Text('车况(对内)',
        //           style: TextStyle(
        //             color: BaseStyle.color999999,
        //             fontSize: BaseStyle.fontSize28,
        //           )),
        //     ),
        //     24.hb,
        //     Container(
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(8.w),
        //           border: Border.all(color: BaseStyle.colordddddd, width: 2.w)),
        //       padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
        //       height: 200.w,
        //       child: TextField(
        //         maxLines: 50,
        //         keyboardType: TextInputType.text,
        //         onEditingComplete: () {
        //           // _refreshController.callRefresh();
        //         },
        //         onChanged: (text) {},
        //         style: TextStyle(
        //           color: BaseStyle.color333333,
        //           fontSize: BaseStyle.fontSize28,
        //         ),
        //         controller: _editingController1,
        //         decoration: InputDecoration(
        //           contentPadding: EdgeInsets.zero,
        //           filled: true,
        //           isDense: true,
        //           fillColor: Colors.white,
        //           hintText: "请输入",
        //           hintStyle: TextStyle(
        //               color: Colors.grey.shade500,
        //               fontSize: 14,
        //               fontWeight: FontWeight.w300),
        //           border: InputBorder.none,
        //         ),
        //       ),
        //     ),
        //     32.hb,
        //   ],
        // ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       padding: EdgeInsets.only(top: 32.w),
        //       width: 150.w,
        //       child: Text('车况(对外)',
        //           style: TextStyle(
        //             color: BaseStyle.color999999,
        //             fontSize: BaseStyle.fontSize28,
        //           )),
        //     ),
        //     24.hb,
        //     Container(
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(8.w),
        //           border: Border.all(color: BaseStyle.colordddddd, width: 2.w)),
        //       padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
        //       height: 200.w,
        //       child: TextField(
        //         maxLines: 50,
        //         keyboardType: TextInputType.text,
        //         onEditingComplete: () {},
        //         onChanged: (text) {},
        //         style: TextStyle(
        //           color: BaseStyle.color333333,
        //           fontSize: BaseStyle.fontSize28,
        //         ),
        //         controller: _editingController2,
        //         decoration: InputDecoration(
        //           contentPadding: EdgeInsets.zero,
        //           filled: true,
        //           isDense: true,
        //           fillColor: Colors.white,
        //           hintText: "请选择",
        //           hintStyle: TextStyle(
        //               color: Colors.grey.shade500,
        //               fontSize: 14,
        //               fontWeight: FontWeight.w300),
        //           border: InputBorder.none,
        //         ),
        //       ),
        //     ),
        //     32.hb,
        //   ],
        // ),
      ],
    );
  }

  getContentItem(String title, String content,
      {isSpecial = false, path, topIcon = true}) {
    return Padding(
      padding: EdgeInsets.only(top: 40.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topIcon
              ? Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Text(
                    '*  ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: const Color(0xFFE62222),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Text(
                    '*  ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: Colors.transparent,
                    ),
                  ),
                ),
          SizedBox(
            width: 170.w,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xFF999999),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: isSpecial ? 0.w : 0.w),
            child: Text(
              content.isEmpty ? '/' : content,
              style: TextStyle(fontSize: 28.sp, color: BaseStyle.color333333),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )),
          path != null
              ? Image.asset(
                  path,
                  width: 32.w,
                  height: 32.w,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
