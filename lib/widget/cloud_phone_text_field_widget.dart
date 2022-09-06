import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloudPhoneTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChange;
  const CloudPhoneTextFieldWidget({super.key, required this.controller, required this.focusNode, required this.onChange});

  @override
  _CloudPhoneTextFieldWidgetState createState() => _CloudPhoneTextFieldWidgetState();
}

class _CloudPhoneTextFieldWidgetState extends State<CloudPhoneTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 72.w,vertical: 20.w),
      margin: EdgeInsets.only(bottom: 20.w),
      child: TextField(
        onChanged: widget.onChange,
        controller: widget.controller,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontSize: BaseStyle.fontSize36,
            color: BaseStyle.color999999),
        inputFormatters: [
          LengthLimitingTextInputFormatter(11),
        ],
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          isDense: true,
          border: const UnderlineInputBorder(),
          prefixIconConstraints: const BoxConstraints(minHeight: 0,minWidth: 0),
          prefixIcon:  Text(
            "+86  ",
            style: TextStyle(
                fontSize: BaseStyle.fontSize36,
                color: BaseStyle.color999999,
                height: 1.4
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            // 不是焦点的时候颜色
            borderSide: BorderSide(
              color: BaseStyle.colordddddd,
            ),
          ),
          hintText: "请输入手机号",
          hintStyle: TextStyle(
              color: BaseStyle.colorcccccc,
              fontSize: BaseStyle.fontSize36),
        ),
      ),
    );
  }
}
