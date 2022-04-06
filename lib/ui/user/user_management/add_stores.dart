import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class AddStores extends StatefulWidget {
  const AddStores({Key? key}) : super(key: key);

  @override
  State<AddStores> createState() => _AddStoresState();
}

class _AddStoresState extends State<AddStores> {
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
      backgroundColor: bodyColor,
      body: Column(
        children: [
          16.hb,
          Container(
            padding: EdgeInsets.only(right: 590.w),
            child: Text(
              '基本信息',
              style: TextStyle(
                  fontSize: BaseStyle.fontSize32,
                  color: const Color(0xFF110000)),
            ),
          ),
          32.hb,
          _real(),
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

_real() {
  return Container(
    width: 750.w,
    color: Colors.white,
    padding: EdgeInsets.only(top: 16.w),
    child: Row(children: [
      36.wb,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getText('门店名称', '请输入门店名称'),
          64.hb,
          _getText('门店地址', '请输入门店地址'),
          64.hb,
        ],
      ),
    ]),
  );
}

_getText(String title, String text) {
  return Row(
    children: [
      SizedBox(
        width: 150.w,
        child: Text(
          title,
          style: TextStyle(
              fontSize: BaseStyle.fontSize28, color: const Color(0xFF999999)),
        ),
      ),
      SizedBox(
          width: 300.w,
          height: 35.w,
          child: TextField(
              decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
            border: InputBorder.none, //去掉下划线
            hintText: text,
            hintStyle: TextStyle(
              fontSize: BaseStyle.fontSize28, color: BaseStyle.colorcccccc,
              // onChanged: ,
            ),
          )))
    ],
  );
}
