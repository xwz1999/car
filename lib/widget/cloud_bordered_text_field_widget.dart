import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CloudBorderedTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final String? hintText;

  const CloudBorderedTextFieldWidget({
    super.key,
    this.controller,
    this.width,
    this.height, this.hintText,
  });

  @override
  _CloudBorderedTextFieldWidgetState createState() =>
      _CloudBorderedTextFieldWidgetState();
}

class _CloudBorderedTextFieldWidgetState
    extends State<CloudBorderedTextFieldWidget> {
  late TextEditingController _editingController;
  late FocusNode _contentFocusNode;

  @override
  void initState() {
    super.initState();
    _contentFocusNode = FocusNode();
    _editingController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 140.w,
      height: widget.height ?? 42.w,
      child: TextField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        focusNode: _contentFocusNode,
        style: TextStyle(
          textBaseline: TextBaseline.ideographic,
          fontSize: 24.sp,
          color: Colors.black,
        ),
        controller: _editingController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.zero,
          hintText: widget.hintText??'请输入',
          hintStyle: TextStyle(
            color: const Color(0xFFCCCCCC),
            fontSize: 24.sp,
          ),
          fillColor: Colors.white,
          //
          enabledBorder: OutlineInputBorder(
              //
              // 不是焦点的时候颜色
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(
                  color: const Color(0xFFDDDDDD),
                  width: 1.w,
                  style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              // 焦点集中的时候颜色
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(
                  color: const Color(0xFFDDDDDD),
                  width: 1.w,
                  style: BorderStyle.solid)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(
                  color: const Color(0xFFDDDDDD),
                  width: 1.w,
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }
}
