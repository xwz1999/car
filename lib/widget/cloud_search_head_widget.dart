import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudSearchHeadWidget extends StatefulWidget {
  final Function(String) onSearch;

  const CloudSearchHeadWidget({super.key, required this.onSearch});

  @override
  _CloudSearchHeadWidgetState createState() => _CloudSearchHeadWidgetState();
}

class _CloudSearchHeadWidgetState extends State<CloudSearchHeadWidget> {
  final TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        32.wb,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.w),
              border: Border.all(width: 2.w, color: const Color(0xFFE7E7E7))),
          width: 606.w,
          height: 72.w,
          child: TextField(
            style: TextStyle(
              textBaseline: TextBaseline.ideographic,
              fontSize: 32.sp,
              color: Colors.black,
            ),
            controller: _editingController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20.w, bottom: 10.w),
              filled: true,
              fillColor: Colors.white,
              hintText: "请输入员工名称",
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                size: 16,
              ),
              enabledBorder: UnderlineInputBorder(
                //
                // 不是焦点的时候颜色
                borderRadius: BorderRadius.circular(36.w),
                borderSide: const BorderSide(
                  color: kForeGroundColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                // 焦点集中的时候颜色
                borderRadius: BorderRadius.circular(36.w),
                borderSide: const BorderSide(color: kForeGroundColor),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36.w),
                  borderSide: const BorderSide(color: kForeGroundColor)),
            ),
          ),
        ),
        24.wb,
        GestureDetector(
          onTap: () => widget.onSearch(_editingController.text),
          child: Text('搜索',
              style: TextStyle(color: BaseStyle.color333333, fontSize: 28.sp)),
        ),
        20.wb,
      ],
    );
  }
}
