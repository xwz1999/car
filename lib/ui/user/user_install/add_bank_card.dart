// ignore_for_file: unused_element
//  银行卡添加 35
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';

import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
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
          backgroundColor: kForeGroundColor, //头部颜色
          title: Text('我的银行卡',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: const Color(0xFFF6F6F6), //内容颜色
        extendBody: true,
        body: Column(
          children: [
            96.hb,
            _getTitle(),
            56.hb,
            _getBody(),
            72.hb,
            CloudBottomButton(
                text: '确认',
                onTap: () {
                  BotToast.showText(text: '绑定成功');
                })
          ],
        ));
  }

//标题
  _getTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '添加银行卡',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontSize: 36.w, color: const Color(0xFF111111)),
        ),
        32.hb,
        Text(
          '请绑定持卡人本人的银行卡',
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }

//Expanded ,Flexible
//内容
  _getBody() {
    return Container(
      height: 450.w,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          32.hb,
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  '持卡人',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: const Color(0xFF999999)),
                ),
              ),
              SizedBox(
                width: 300.w,
                height: 35.w,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                      border: InputBorder.none, //去掉下划线
                      hintText: '持卡人姓名',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: const Color(0xFFCCCCCC))),
                  // onChanged: ,
                ),
              )
            ],
          ),
          64.hb,
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  '卡号',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: const Color(0xFF999999)),
                ),
              ),
              SizedBox(
                width: 300.w,
                height: 35.w,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                      border: InputBorder.none, //去掉下划线
                      hintText: '持卡人本热银行卡号',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: const Color(0xFFCCCCCC))),
                  // onChanged: ,
                ),
              ),
              164.wb,
              SizedBox(
                width: 32.w,
                height: 32.w,
                child:
                    GestureDetector(child: Image.asset(Assets.icons.scan.path)),
              ),
            ],
          ),
          64.hb,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  '银行卡照片',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: const Color(0xFF999999)),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                    width: 200.w,
                    height: 120.w,
                    child: Image.asset(Assets.images.addcar.path)),
              )
            ],
          ),
          32.hb,
        ],
      ),
    );
  }
}
