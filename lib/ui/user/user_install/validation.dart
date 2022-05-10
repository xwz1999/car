import 'dart:async';

import 'package:cloud_car/ui/user/user_install/no_withdrawal.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widget/button/cloud_back_button.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  List<dynamic>? data;
  bool _getCodeEnable = false;
  // late Timer _timer;
  final String _countDownStr = "发送验证码";
  // int _countDownNum = 59;
  late TextEditingController _phoneController;
  late TextEditingController _smsCodeController;
  late FocusNode _phoneFocusNode;
  late FocusNode _smsCodeFocusNode;
  bool _cantSelected = false;
  @override
  void initState() {
    super.initState();
    _phoneFocusNode = FocusNode();
    _smsCodeFocusNode = FocusNode();

    _phoneController = TextEditingController();
    _smsCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _smsCodeFocusNode.dispose();
    _phoneController.dispose();
    _smsCodeController.dispose();
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
        backgroundColor: kForeGroundColor, //内容颜色
        extendBody: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              72.hb,
              Text(
                '请先验证身份',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontSize: 48.w),
              ),
              // SizedBox(
              //   width: 606.w,
              //   height: 80.w,
              //   child: TextField(
              //     autofocus: true, //是否自动对焦
              //     decoration: InputDecoration(
              //         contentPadding: EdgeInsets.only(bottom: 24.w), //文字与边框的距离
              //         //border: InputBorder.none, //去掉下划线
              //         //border: BorderSide(color: Color(0xfffffff)),
              //         prefixText: '+86',
              //         prefixStyle: TextStyle(
              //             fontSize: BaseStyle.fontSize36,
              //             color: Color(0xFF999999)),
              //         hintText: '请输入手机号',
              //         hintStyle: Theme.of(context)
              //             .textTheme
              //             .subtitle2
              //             ?.copyWith(
              //                 color: const Color(0xFF999999), fontSize: 36.sp)),
              //     // onChanged: ,
              //   ),
              // ),
              54.hb,
              // SizedBox(
              //   width: 606.w,
              //   height: 80.w,
              //   child: TextField(
              //     decoration: InputDecoration(
              //         contentPadding: EdgeInsets.only(bottom: 24.w), //文字与边框的距离
              //         //border: InputBorder.none, //去掉下划线
              //         //border: BorderSide(color: Color(0xfffffff)),
              _phoneTFWidget(),
              20.hb,
              _codeWidget(),
              //         suffixIcon: GestureDetector(
              //             child: Text(
              //           '发送验证码',
              //           style: Theme.of(context)
              //               .textTheme
              //               .subtitle1
              //               ?.copyWith(color: Color(0xFF027AFF)),
              //         )),
              //         hintText: '输入验证码',
              //         hintStyle: Theme.of(context)
              //             .textTheme
              //             .subtitle2
              //             ?.copyWith(
              //                 color: const Color(0xFF999999), fontSize: 36.sp)),
              //     // onChanged: ,
              //   ),
              // ),
              94.hb,
              CloudBottomButton(
                  text: '提交',
                  onTap: () {
                    Get.to(() => const NoWithddrawalPage());
                  })
            ],
          ),
        ));
  }

  _phoneTFWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 72.w),
      height: 40 * 2.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (String phone) {
                      setState(() {
                        if (phone.length >= 11) {
                          _getCodeEnable = true;
                        } else {
                          _getCodeEnable = false;
                        }
                        if (kDebugMode) {
                          //print(_loginEnable);
                        }
                      });
                    },
                    controller: _phoneController,
                    focusNode: _phoneFocusNode,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize36,
                        color: BaseStyle.color999999),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                    ],
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(
                      //     left: rSize(10), top: rSize(13)),
                      prefixIcon: Container(
                        width: 10.w,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "+86",
                          style: TextStyle(
                            fontSize: BaseStyle.fontSize36,
                            color: BaseStyle.color999999,
                          ),
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        // 不是焦点的时候颜色
                        borderSide: BorderSide(
                          color: BaseStyle.colordddddd,
                        ),
                      ),
                      // focusedBorder:  const UnderlineInputBorder( // 焦点集中的时候颜色
                      //   borderSide: BorderSide(
                      //       color: Color(0x19000000)
                      //   ),
                      // ),
                      //border: InputBorder.none,
                      hintText: "请输入手机号",
                      hintStyle: TextStyle(
                          color: BaseStyle.colorcccccc,
                          fontSize: BaseStyle.fontSize36),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //_bottomLineWidget(),
        ],
      ),
    );
  }

  _codeWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      //margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 72.w),
      height: 40 * 2.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (String phone) {
                      setState(() {});
                    },
                    controller: _smsCodeController,
                    focusNode: _smsCodeFocusNode,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize36,
                        color: BaseStyle.color999999),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          // 不是焦点的时候颜色
                          borderSide: BorderSide(
                            color: BaseStyle.colordddddd,
                          ),
                        ),
                        hintText: "请输入验证码",
                        hintStyle: TextStyle(
                            color: BaseStyle.colorcccccc,
                            fontSize: BaseStyle.fontSize36),
                        suffixIcon: GestureDetector(
                          onTap: !_getCodeEnable
                              ? () {}
                              : () {
                                  if (_cantSelected) return;
                                  _cantSelected = true;
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    _cantSelected = false;
                                  });
                                },
                          child: Container(
                            width: 160.w,
                            alignment: Alignment.centerRight,
                            color: Colors.transparent,
                            child: Text(
                              _countDownStr,
                              style: TextStyle(
                                  color: _getCodeEnable
                                      ? kPrimaryColor
                                      : BaseStyle.colorcccccc),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          //_bottomLineWidget(),
        ],
      ),
    );
  }

  // _verifyLoginEnable() {
  //   if (!TextUtils.verifyPhone(_phoneController.text)) {
  //     setState(() {});
  //     return false;
  //   }
  //   return _smsCodeController.text.length == 4;
  // }
  //
  // _beginCountDown() {
  //   ///开始倒计时
  //   setState(() {
  //     _getCodeEnable = false;
  //     _countDownStr = "重新获取($_countDownNum)";
  //   });
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {
  //       if (_countDownNum == 0) {
  //         _countDownNum = 59;
  //         _countDownStr = "获取验证码";
  //         _getCodeEnable = true;
  //         _timer.cancel();
  //         return;
  //       }
  //       _countDownStr = "重新获取(${_countDownNum--})";
  //     });
  //   });
  // }
}
