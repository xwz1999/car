import 'dart:ui';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'choose_car_page.dart';

class InitiateContractPage extends StatefulWidget {
  const InitiateContractPage({
    Key? key,
  }) : super(key: key);

  @override
  _InitiateContractPageState createState() => _InitiateContractPageState();
}

class _InitiateContractPageState extends State<InitiateContractPage> {
  late TextEditingController _editingController1;
  late TextEditingController _editingController2;
  late TextEditingController _editingController3;
  late TextEditingController _editingController4;
  late TextEditingController _editingController5;

  final List<int> _selectIndex1 = [];

  final List<int> _selectIndex2 = [];

  final List<int> _selectIndex3 = [];

  final List<String> _models1 = ['全款', '按揭'];

  final List<String> _models2 = ['本地', '外迁'];

  final List<String> _models3 = ['零售', '批发', '中介'];

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
        title: Text('发起合同',
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
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '* ',
                              style: TextStyle(
                                color: const Color(0xFFE62222),
                                fontSize: BaseStyle.fontSize28,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 18.w),
                            height: 50.w,
                          ),
                          Text('成交价',
                              style: TextStyle(
                                color: BaseStyle.color999999,
                                fontSize: BaseStyle.fontSize28,
                              )),
                        ],
                      ),
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
                        controller: _editingController1,
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
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      child: Text('万元',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,
                          )),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 120.w,
                      child: Text('定金',
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
                        controller: _editingController1,
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
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      child: Text('元',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,
                          )),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 150.w,
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '* ',
                              style: TextStyle(
                                color: const Color(0xFFE62222),
                                fontSize: BaseStyle.fontSize28,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 18.w),
                            height: 50.w,
                          ),
                          Text('付款方式',
                              style: TextStyle(
                                color: BaseStyle.color999999,
                                fontSize: BaseStyle.fontSize28,
                              )),
                        ],
                      ),
                    ),
                    20.wb,
                    SizedBox(
                      height: 50.w,
                      child: getChooseList(
                          (String choice) {}, _models1, _selectIndex1),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 150.w,
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '* ',
                              style: TextStyle(
                                color: const Color(0xFFE62222),
                                fontSize: BaseStyle.fontSize28,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 18.w),
                            height: 50.w,
                          ),
                          Text('过户方式',
                              style: TextStyle(
                                color: BaseStyle.color999999,
                                fontSize: BaseStyle.fontSize28,
                              )),
                        ],
                      ),
                    ),
                    20.wb,
                    SizedBox(
                      height: 50.w,
                      child: getChooseList(
                          (String choice) {}, _models2, _selectIndex2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 150.w,
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '* ',
                              style: TextStyle(
                                color: const Color(0xFFE62222),
                                fontSize: BaseStyle.fontSize28,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 18.w),
                            height: 50.w,
                          ),
                          Text('销售类型',
                              style: TextStyle(
                                color: BaseStyle.color999999,
                                fontSize: BaseStyle.fontSize28,
                              )),
                        ],
                      ),
                    ),
                    20.wb,
                    SizedBox(
                      height: 50.w,
                      child: getChooseList(
                          (String choice) {}, _models3, _selectIndex3),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 120.w,
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '* ',
                              style: TextStyle(
                                color: const Color(0xFFE62222),
                                fontSize: BaseStyle.fontSize28,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 18.w),
                            height: 50.w,
                          ),
                          Text('销售',
                              style: TextStyle(
                                color: BaseStyle.color999999,
                                fontSize: BaseStyle.fontSize28,
                              )),
                        ],
                      ),
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
                        controller: _editingController1,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChooseCarPage(
                          callback: (String city) {
                            _editingController2.text = city;
                            setState(() {});
                          },
                        ));
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32.w),
                        width: 150.w,
                        child: Text('全款到期日',
                            style: TextStyle(
                              color: BaseStyle.color999999,
                              fontSize: BaseStyle.fontSize28,
                            )),
                      ),
                      20.wb,
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
                    ],
                  ),
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

  getChooseList(Function(String) callBack, List models, List<int> choices) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        ...models
            .mapIndexed((currentValue, index) => GestureDetector(
                  onTap: () {
                    if (choices.contains(index)) {
                      choices.remove(index);
                    } else {
                      choices.clear();
                      choices.add(index);
                    }
                    setState(() {});
                  },
                  child: Container(
                    width: 160.w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        BeeCheckRadio(
                          value: index,
                          groupValue: choices,
                        ),
                        16.wb,
                        Text(
                          currentValue,
                          style: TextStyle(
                              color: BaseStyle.color333333,
                              fontSize: BaseStyle.fontSize28),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }
}
