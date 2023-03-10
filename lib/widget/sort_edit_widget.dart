// ignore_for_file: unused_field

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

typedef TextCallback = Function(String content);
@Deprecated('use CloudBorderedTextFieldWidget instead')
class SortEditWidget extends StatefulWidget {
  final TextCallback callback;

  const SortEditWidget({
    super.key,
    required this.callback,
  });

  @override
  _SortEditWidgetState createState() => _SortEditWidgetState();
}

class _SortEditWidgetState extends State<SortEditWidget> {
  late TextEditingController _editingController;
  final String _text = "";
  late FocusNode _contentFocusNode;

  @override
  void initState() {
    super.initState();
    _contentFocusNode = FocusNode();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        // border: Border.all(width: 1.w,color: const Color(0xFFDDDDDD))
      ),
      width: 140.w,
      height: 42.w,
      child: TextField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        onEditingComplete: () {
          setState(() {});
          // _refreshController.callRefresh();
        },
        focusNode: _contentFocusNode,
        onChanged: (text) {
          setState(() {});
        },
        onTap: () {},
        onSubmitted: (submitted) async {
          setState(() {});
        },
        style: TextStyle(
          textBaseline: TextBaseline.ideographic,
          fontSize: 24.sp,
          color: Colors.black,
        ),
        controller: _editingController,
        decoration: InputDecoration(
          filled: true,
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
