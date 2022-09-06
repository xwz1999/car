import 'dart:async';

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloudSmsCodeWidget extends StatefulWidget {
  final Function(String) onChange;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String phone;
  final bool getCodeEnable;

  const CloudSmsCodeWidget(
      {super.key,
      required this.onChange,
      required this.controller,
      required this.focusNode,
      required this.phone,
      required this.getCodeEnable});

  @override
  _CloudSmsCodeWidgetState createState() => _CloudSmsCodeWidgetState();
}

class _CloudSmsCodeWidgetState extends State<CloudSmsCodeWidget> {
  bool _timerWorking = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 72.w),
      child: TextField(
        onChanged: widget.onChange,
        controller: widget.controller,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontSize: BaseStyle.fontSize36, color: BaseStyle.color999999),
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
        ],
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          enabledBorder: const UnderlineInputBorder(
            // 不是焦点的时候颜色
            borderSide: BorderSide(
              color: BaseStyle.colordddddd,
            ),
          ),
          hintText: "请输入验证码",
          hintStyle: TextStyle(
              color: BaseStyle.colorcccccc, fontSize: BaseStyle.fontSize36),
          isDense: true,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: GestureDetector(
            onTap: (!widget.getCodeEnable || _timerWorking)
                ? () {}
                : () async {
                    await apiClient.request(API.login.phoneCode, data: {
                      'phone': widget.phone,
                    });
                    _beginCountDown();
                  },
            child: Text(
              _countDownStr,
              style: TextStyle(
                  fontSize: BaseStyle.fontSize30,
                  color: (widget.getCodeEnable && !_timerWorking)
                      ? kPrimaryColor
                      : BaseStyle.colorcccccc),
            ),
          ),
        ),
      ),
    );
  }

  String _countDownStr = "发送验证码";
  int _countDownNum = 59;
  late Timer _timer;

  _beginCountDown() {
    ///开始倒计时
    setState(() {
      _timerWorking = true;
      _countDownStr = "重新获取($_countDownNum)";
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        return;
      }
      setState(() {
        if (_countDownNum == 0) {
          _countDownNum = 59;
          _countDownStr = "获取验证码";
          _timerWorking = false;
          _timer.cancel();
          return;
        }
        _countDownStr = "重新获取(${_countDownNum--})";
      });
    });
  }
}
