import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'choose_car_page.dart';

class InviteDetailPage extends StatefulWidget {
  const InviteDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  _InviteDetailPageState createState() => _InviteDetailPageState();
}

class _InviteDetailPageState extends State<InviteDetailPage> {
  late TextEditingController _editingController1;
  late TextEditingController _editingController2;
  late TextEditingController _editingController3;
  late TextEditingController _editingController4;
  late TextEditingController _editingController5;

  @override
  void initState() {
    _editingController1 = TextEditingController(text: '李四 18912345432');
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
      body: Column(
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
                          callback: (String city) {
                            _editingController2.text = city;
                            setState(() {});
                          },
                          title: '',
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
                        controller: _editingController4,
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
          Container(
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
        ],
      ),
    );
  }
}
