import 'package:cloud_car/ui/user/user_management/access_configuration.dart';
import 'package:cloud_car/ui/user/user_management/organizational_structure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/cloud_back_button.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  late TextEditingController _permissions1;
  @override
  @override
  void initState() {
    _permissions1 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _permissions1.dispose();
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
        title: Text('新增门店',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: BodyColor,
      body: Column(
        children: [
          40.hb,
          getTitle('基本信息'),
          24.hb,
          getInformation(),
          40.hb,
          getTitle('权限分配'),
          24.hb,
          getpermissions(),
          88.hb,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            height: 72.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8.w)),
            child: SizedBox(
                child: GestureDetector(
              onTap: () {
                // Get.to(() => const PartnerRenewalPage());
              },
              child: Text(
                '新增',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: kForeGroundColor),
              ),
            )),
          )
        ],
      ),
    );
  }

  getTitle(String title) {
    return Container(
      padding: EdgeInsets.only(right: 590.w),
      child: Text(
        title,
        style: TextStyle(
            fontSize: BaseStyle.fontSize32,
            color: const Color(0xFF110000),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  getInformation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      color: kForeGroundColor,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  '姓名',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: const Color(0xFF999999)),
                ),
              ),
              SizedBox(
                  width: 300.w,
                  height: 35.w,
                  child: TextField(
                      decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                    border: InputBorder.none, //去掉下划线
                    hintText: '请输入',
                    hintStyle: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: BaseStyle.colorcccccc,
                      // onChanged: ,
                    ),
                  ))),
            ],
          ),
          32.hb,
          GestureDetector(
            child: Row(children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  '性别',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: const Color(0xFF999999)),
                ),
              ),
              SizedBox(
                  width: 300.w,
                  height: 35.w,
                  child: TextField(
                      decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                    border: InputBorder.none, //去掉下划线
                    hintText: '请选择',
                    hintStyle: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: BaseStyle.colorcccccc,
                      // onChanged: ,
                    ),
                  ))),
              Padding(
                padding: EdgeInsets.only(top: 5.w, left: 191.w),
                child: Icon(
                  CupertinoIcons.chevron_forward,
                  size: 40.w,
                  color: BaseStyle.color666666,
                ),
              )
            ]),
          ),
          32.hb,
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  '手机号',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: const Color(0xFF999999)),
                ),
              ),
              SizedBox(
                  width: 300.w,
                  height: 35.w,
                  child: TextField(
                      decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                    border: InputBorder.none, //去掉下划线
                    hintText: '请输入',
                    hintStyle: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: BaseStyle.colorcccccc,
                      // onChanged: ,
                    ),
                  ))),
            ],
          ),
          32.hb,
          GestureDetector(
            onTap: (() {
              Get.to(() => const StructurePage());
            }),
            child: Row(children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  '组织架构',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: const Color(0xFF999999)),
                ),
              ),
              SizedBox(
                  width: 300.w,
                  height: 35.w,
                  child: TextField(
                      decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                    border: InputBorder.none, //去掉下划线
                    hintText: '请选择',
                    hintStyle: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: BaseStyle.colorcccccc,
                      // onChanged: ,
                    ),
                  ))),
              Padding(
                padding: EdgeInsets.only(top: 5.w, left: 191.w),
                child: Icon(
                  CupertinoIcons.chevron_forward,
                  size: 40.w,
                  color: BaseStyle.color666666,
                ),
              )
            ]),
          ),
          16.hb,
        ],
      ),
    );
  }

  getpermissions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      color: kForeGroundColor,
      child: Column(children: [
        GestureDetector(
          onTap: () {
            Get.to(() => AccessConfiguration(callback: (String city) {
                  _permissions1.text = city;
                }));
          },
          child: Row(children: [
            SizedBox(
              width: 150.w,
              child: Text(
                '权限配置',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    color: const Color(0xFF999999)),
              ),
            ),
            SizedBox(
                width: 300.w,
                height: 35.w,
                child: TextField(
                    controller: _permissions1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                      border: InputBorder.none, //去掉下划线
                      hintText: '请选择',
                      hintStyle: TextStyle(
                        fontSize: BaseStyle.fontSize28,
                        color: BaseStyle.colorcccccc,
                        // onChanged: ,
                      ),
                    ))),
            Padding(
              padding: EdgeInsets.only(top: 5.w, left: 191.w),
              child: Icon(
                CupertinoIcons.chevron_forward,
                size: 40.w,
                color: BaseStyle.color666666,
              ),
            )
          ]),
        ),
        32.hb,
        Row(
          children: [
            SizedBox(
              width: 150.w,
              child: Text(
                '销售提成',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    color: const Color(0xFF999999)),
              ),
            ),
            SizedBox(
                width: 300.w,
                height: 35.w,
                child: TextField(
                    decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                  border: InputBorder.none, //去掉下划线
                  hintText: '请输入',
                  hintStyle: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    color: BaseStyle.colorcccccc,
                    // onChanged: ,
                  ),
                ))),
            Padding(
              padding: EdgeInsets.only(top: 5.w, left: 191.w),
              child: Text(
                '%',
                style: TextStyle(
                    color: BaseStyle.color333333,
                    fontSize: BaseStyle.fontSize28),
              ),
            )
          ],
        ),
        16.hb,
      ]),
    );
  }
}
