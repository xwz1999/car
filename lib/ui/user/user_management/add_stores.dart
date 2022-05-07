// ignore_for_file: unused_local_variable

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/user/interface/business_func.dart';
import 'package:cloud_car/ui/user/user_management/text_editingcontroller.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class AddStores extends StatefulWidget {
  const AddStores({Key? key}) : super(key: key);

  @override
  State<AddStores> createState() => _AddStoresState();
}

late String storesName = '';
late String storesAddress = '';
late bool zhi = false;

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
          CloudBottomButton(
            onTap: () async {
              if (storesName.isEmpty) {
                BotToast.showText(text: '请填写门店名称');
              } else {
                if (storesAddress.isEmpty) {
                  BotToast.showText(text: '请输入门店地址');
                } else {
                  Future.delayed(const Duration(milliseconds: 0), () async {
                    await _refresh();
                    setState(() {});
                    BotToast.showText(text: '新增成功');
                  });
                }
              }
            },
            text: '新 建',
          )
        ],
      ),
    );
  }

  _refresh() async {
    zhi = await BusinessFunc.getStoreadd(storesName, storesAddress);
  }
}

_real() {
  return Container(
    width: 750.w,
    color: Colors.white,
    padding: EdgeInsets.only(top: 16.w, left: 32.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextEditItemWidget(
          callback: (String content) {
            storesName = content;
          },
          ontap: () {},
          title: '门店名称',
          tips: '请输入门店名称',
        ),
        64.hb,
        TextEditItemWidget(
          callback: (String content) {
            storesAddress = content;
          },
          ontap: () {},
          title: '门店地址',
          tips: '请输入门店地址',
        ),
        64.hb,
      ],
    ),
  );
}
