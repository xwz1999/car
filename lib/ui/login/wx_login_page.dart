import 'dart:async';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class WxLoginPage extends StatefulWidget {
  const WxLoginPage({Key? key}) : super(key: key);

  @override
  _WxLoginPageState createState() => _WxLoginPageState();
}

class _WxLoginPageState extends State<WxLoginPage>{

  bool _getCodeEnable = false;
  late Timer _timer;
  String _countDownStr = "发送验证码";
  int _countDownNum = 59;
  late TextEditingController _phoneController;
  late TextEditingController _smsCodeController;
  late FocusNode _phoneFocusNode;
  late FocusNode _smsCodeFocusNode;
  bool _loginEnable = false;
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
      // title: '',
      // bodyColor:
      backgroundColor: kForeGroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            250.hb,

            Text(
              '微信账号绑定手机号',
              style: TextStyle(
                  color: BaseStyle.color333333,
                  fontSize: BaseStyle.fontSize48),
            ),
            100.hb,
            _phoneTFWidget(),
            20.hb,
            _codeWidget(),


            94.hb,
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              decoration:  BoxDecoration(
                borderRadius:BorderRadius.circular(8.w),
                gradient:  const LinearGradient(
                    colors: [Color(0xFF0593FF), kPrimaryColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('提       交');
                  }
                },
                elevation: 0,
                height: 72.w,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w)),
                child:    Text(
                  '提       交',
                  style: TextStyle(
                      color: kForeGroundColor,
                      fontSize: BaseStyle.fontSize28),
                ),
              ),
            ),


          ],
        ),
      ),
    );
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
                          _loginEnable = _verifyLoginEnable();
                        } else {
                          _getCodeEnable = false;
                          _loginEnable = false;
                        }
                      });
                    },
                    controller: _phoneController,
                    focusNode: _phoneFocusNode,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: BaseStyle.fontSize36,color: BaseStyle.color999999),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                    ],
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(
                      //     left: rSize(10), top: rSize(13)),
                      prefixIcon:

                      Container(
                        width: 10.w,

                        alignment: Alignment.centerLeft,
                        child: Text(
                          "+86",
                          style: TextStyle(
                            fontSize: BaseStyle.fontSize36,
                            color: BaseStyle.color999999,),
                        ),
                      ),
                        enabledBorder:  const UnderlineInputBorder( // 不是焦点的时候颜色
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
                          fontSize: BaseStyle.fontSize36 ),

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
                      setState(() {
                        _loginEnable = _verifyLoginEnable();
                      });
                    },
                    controller: _smsCodeController,
                    focusNode: _smsCodeFocusNode,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: BaseStyle.fontSize36,color: BaseStyle.color999999),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabledBorder:  const UnderlineInputBorder( // 不是焦点的时候颜色
                          borderSide: BorderSide(
                            color: BaseStyle.colordddddd,
                          ),
                        ),
                      hintText: "请输入验证码",
                      hintStyle: TextStyle(
                          color: BaseStyle.colorcccccc,
                          fontSize: BaseStyle.fontSize36 ),
                      suffixIcon: GestureDetector(
                        onTap: !_getCodeEnable?(){}:(){
                          if (_cantSelected) return;
                          _cantSelected = true;
                          Future.delayed(const Duration(seconds: 2), () {
                            _cantSelected = false;
                          });
                        },
                        child: Container(
                          width: 160.w,
                          alignment: Alignment.centerRight,
                          color: Colors.transparent,
                          child: Text(
                              _countDownStr,style: TextStyle(color: _getCodeEnable?kPrimaryColor:BaseStyle.colorcccccc),
                          ),
                        ),
                      )


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
  _verifyLoginEnable() {
    if (!TextUtils.verifyPhone(_phoneController.text)) {
      setState(() {
      });
      return false;
    }
    return _smsCodeController.text.length == 4;
  }

  _beginCountDown() {///开始倒计时
    setState(() {
      _getCodeEnable = false;
      _countDownStr = "重新获取($_countDownNum)";
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if ( !mounted) {
        return;
      }
      setState(() {
        if (_countDownNum == 0) {
          _countDownNum = 59;
          _countDownStr = "获取验证码";
          _getCodeEnable = true;
          _timer.cancel();
          return;
        }
        _countDownStr = "重新获取(${_countDownNum--})";
      });
    });
  }


}

