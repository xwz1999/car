// ignore_for_file: unused_element, prefer_const_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/user/no_withdrawal.dart';
import 'package:cloud_car/utils/headers.dart';

import 'package:cloud_car/widget/cloud_back_button.dart';

import 'package:flutter/material.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
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
          title: Text('注销账号',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: Color(0xffffffff), //内容颜色
        extendBody: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              Text(
                '请先验证身份',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontSize: 48.w),
              ),
              128.hb,
              SizedBox(
                width: 606.w,
                height: 80.w,
                child: TextField(
                  autofocus: true, //是否自动对焦
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 24.w), //文字与边框的距离
                      //border: InputBorder.none, //去掉下划线
                      //border: BorderSide(color: Color(0xfffffff)),

                      prefixText: '+86',
                      prefixStyle: TextStyle(
                          fontSize: BaseStyle.fontSize36,
                          color: Color(0xFF999999)),
                      hintText: '请输入手机号',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(
                              color: const Color(0xFF999999), fontSize: 36.sp)),
                  // onChanged: ,
                ),
              ),
              54.hb,
              SizedBox(
                width: 606.w,
                height: 80.w,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 24.w), //文字与边框的距离
                      //border: InputBorder.none, //去掉下划线
                      //border: BorderSide(color: Color(0xfffffff)),

                      suffixIcon: GestureDetector(
                          child: Text(
                        '发送验证码',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Color(0xFF027AFF)),
                      )),
                      hintText: '输入验证码',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(
                              color: const Color(0xFF999999), fontSize: 36.sp)),
                  // onChanged: ,
                ),
              ),
              94.hb,
              _getBottom(),
            ],
          ),
        )

        // Column(
        //   color: Colors.red,

        //   children[],

        // ))
        );
  }

//

//

//底部按钮
  _getBottom() {
    return GestureDetector(
      onTap: () {
        //BotToast.showText(text: '验证码输入错误');
        Get.to(() => const NoWithddrawalPage());
      },
      child: Container(
        width: 686.w,
        height: 72.w,
        padding: EdgeInsets.only(left: 318.w, top: 22.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF0593FF), Color(0xFF027AFF)])),
        child: SizedBox(
          width: 252.w,
          height: 28.w,
          child: Text(
            '提交',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: const Color(0xffffffff)),
          ),
        ),
      ),
    );
  }
}
