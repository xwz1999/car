import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CloudChip extends StatelessWidget {
  final String text;
  const CloudChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF1F2F4),
          borderRadius: BorderRadius.all(Radius.circular(2.w))),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.w),
      child: Text(
        text,
        style: TextStyle(color: const Color(0xFF4F5A74), fontSize: 18.sp),
      ),
    );
  }
}
