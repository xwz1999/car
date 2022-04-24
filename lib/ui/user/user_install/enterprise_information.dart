import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';

class EnterpriseInformationPage extends StatefulWidget {
  const EnterpriseInformationPage({Key? key}) : super(key: key);

  @override
  _EnterpriseInformationPageState createState() =>
      _EnterpriseInformationPageState();
}

class _EnterpriseInformationPageState extends State<EnterpriseInformationPage> {
  List<dynamic>? data;

  @override
  void initState() {
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
          title: Text('系统设置',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: bodyColor,
        extendBody: true,
        //body: ,
        body: Expanded(
          child: ListView(
            children: [
              20.hb,
              _title('基本信息'),
              24.hb,
              _information(),
              40.hb,
              _title('企业资料'),
              24.hb,
              _data(),
              40.hb,
              _title('法人资料'),
              24.hb,
              _legal(),
              32.hb
            ],
          ),
        ));
  }

//标题
  _title(String title) {
    return Container(
      padding: EdgeInsets.only(left: 32.w),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: const Color(0xFF110000), fontWeight: FontWeight.bold),
      ),
    );
  }

//法人资料
  _legal() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 32.w),
      child: Row(children: [
        36.wb,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.hb,
            _getText('法人姓名', 'xxxxxx'),
            16.hb,
            _getText('身份证号码', 'xxxxxxxx'),
            16.hb,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '身份证照',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontSize: 28.sp,
                        color: const Color(0xFF999999),
                      ),
                ),
                24.hb,
                Row(
                  children: [
                    Container(
                      width: 200.w,
                      height: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8.w)),
                    ),
                    44.wb,
                    Container(
                      width: 200.w,
                      height: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8.w)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ]),
    );
  }

//企业资料
  _data() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 32.w),
      child: Row(children: [
        36.wb,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.hb,
            _getText('执照公司名', 'xxxxxxx'),
            16.hb,
            _getText('公司性质', 'xx'),
            16.hb,
            _getText('注册资本', 'xxxxxxxxxx'),
            16.hb,
            _getText('营业期限', 'xxxxx——xxxxx'),
            16.hb,
            _getText('认证资料', '信用代码'),
            16.hb,
            _getText('信用代码', 'xxxxxxxxxxx'),
            16.hb,
            _getText2('门店照'),
            16.hb,
            _getText2('营业执照')
          ],
        ),
      ]),
    );
  }

//基本信息
  _information() {
    return Container(
      padding: EdgeInsets.only(bottom: 32.w),
      color: Colors.white,
      child: Row(children: [
        36.wb,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.hb,
            _getText('公司名称', '云云问车'),
            16.hb,
            _getText('所在地区', '浙江省宁波市海曙区'),
            16.hb,
            _getText('地址', '宁波保险科技产业园1号楼601—3'),
            16.hb,
          ],
        ),
      ]),
    );
  }

//文本样式
  _getText(String title, String content) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 28.sp, color: const Color(0xFF999999)),
          ),
        ),
        20.wb,
        Text(
          content,
          style: TextStyle(
            fontSize: 28.sp,
            color: BaseStyle.color333333,
          ),
        ),
      ],
    );
  }

//文本带图片
  _getText2(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140.w,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: const Color(0xFF999999)),
          ),
        ),
        Container(
          width: 200.w,
          height: 150.w,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(8.w)),
        )
      ],
    );
  }
}
