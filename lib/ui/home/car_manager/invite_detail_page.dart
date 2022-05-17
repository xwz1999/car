import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'choose_car_page.dart';

class InviteDetailPage extends StatefulWidget {
  final int id;
  final String name;
  final String phone;
  const InviteDetailPage({
    super.key,
    required this.id,
    required this.name,
    required this.phone,
  });

  @override
  _InviteDetailPageState createState() => _InviteDetailPageState();
}

class _InviteDetailPageState extends State<InviteDetailPage> {
  late int _carId = -1;

  late String _inviteTime = '';

  late String _address = '';

  late String _remark = '';

  late TextEditingController _editingController1;
  late TextEditingController _editingController2;
  late TextEditingController _editingController3;
  late TextEditingController _editingController4;
  late TextEditingController _editingController5;

  @override
  void initState() {
    _editingController1 =
        TextEditingController(text: '${widget.name}    ${widget.phone}');
    _editingController2 = TextEditingController();
    _editingController3 = TextEditingController();
    _editingController4 = TextEditingController();
    _editingController5 = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _editingController1.dispose();
    _editingController2.dispose();
    _editingController3.dispose();
    _editingController4.dispose();
    _editingController5.dispose();
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
        title: Text('发起邀约',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            color: kForeGroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 120.w,
                      child: Text('邀约人',
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    color: const Color(0xFF999999),
                                  )),
                    ),
                    50.wb,
                    Expanded(
                      child: TextField(
                        enabled: false,
                        keyboardType: TextInputType.text,
                        onEditingComplete: () {
                          setState(() {});
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {
                          setState(() {});
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
                        controller: _editingController1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 0.w),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "请选择",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChooseCarPage(
                          callback: (CarListModel model) {
                            _editingController2.text = model.modelName;
                            _carId = model.id;
                            setState(() {});
                          },
                          title: '选择预定车辆',
                        ));
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32.w),
                        width: 120.w,
                        child: Text('预定车辆',
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      color: const Color(0xFF999999),
                                    )),
                      ),
                      50.wb,
                      Expanded(
                        child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () {
                            setState(() {});
                            // _refreshController.callRefresh();
                          },
                          onChanged: (text) {
                            setState(() {});
                          },
                          style: TextStyle(
                            color: BaseStyle.color333333,
                            fontSize: BaseStyle.fontSize28,
                          ),
                          controller: _editingController2,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0.w),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "请选择",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.w),
                        child: Icon(
                          CupertinoIcons.chevron_forward,
                          size: 40.w,
                          color: BaseStyle.color666666,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? firstDate;
                    firstDate =
                        await CarDatePicker.allTimePicker(DateTime.now());
                    _editingController3.text = DateUtil.formatDate(firstDate,
                        format: 'yyyy-MM-dd HH:mm:ss');
                    _inviteTime = DateUtil.formatDate(firstDate,
                        format: 'yyyy-MM-dd HH:mm:ss');
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32.w),
                        width: 120.w,
                        child: Text('到店时间',
                            style: TextStyle(
                              color: BaseStyle.color999999,
                              fontSize: BaseStyle.fontSize28,
                            )),
                      ),
                      50.wb,
                      Expanded(
                        child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () {
                            setState(() {});
                            // _refreshController.callRefresh();
                          },
                          onChanged: (text) {
                            setState(() {});
                          },
                          style: TextStyle(
                            color: BaseStyle.color333333,
                            fontSize: BaseStyle.fontSize28,
                          ),
                          controller: _editingController3,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0.w),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "请选择",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.w),
                        child: Icon(
                          CupertinoIcons.chevron_forward,
                          size: 40.w,
                          color: BaseStyle.color666666,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 120.w,
                      child: Text('店面地址',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,
                          )),
                    ),
                    50.wb,
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onEditingComplete: () {
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {
                          _address = text;
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
                        controller: _editingController4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 0.w),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "请输入",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 32.w),
                      width: 120.w,
                      child: Text('邀约备注',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,
                          )),
                    ),
                    24.hb,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(
                              color: BaseStyle.colordddddd, width: 2.w)),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.w, horizontal: 20.w),
                      height: 200.w,
                      child: TextField(
                        maxLines: 50,
                        keyboardType: TextInputType.text,
                        onEditingComplete: () {
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {
                          _remark = text;
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,
                        ),
                        controller: _editingController5,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          isDense: true,
                          fillColor: Colors.white,
                          hintText: "请选择",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    32.hb,
                  ],
                ),
              ],
            ),
          ),
          72.hb,
          GestureDetector(
            onTap: () async {
              if (_carId != -1 &&
                  _inviteTime.isNotEmpty &&
                  _address.isNotEmpty) {
                await OrderFunc.getAdd(
                        widget.id, _carId, _inviteTime, _address, _remark)
                    .then((value) {
                  if (value) {
                    Get.back();
                    CloudToast.show('邀约成功');
                  }
                });
              } else {
                CloudToast.show('请先完善邀约信息');
              }
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.symmetric(vertical: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: <Color>[
                    Color(0xFF0593FF),
                    Color(0xFF027AFF),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
              ),
              child: Text(
                '确  定',
                style: TextStyle(
                    color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
