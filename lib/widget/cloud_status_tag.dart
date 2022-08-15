import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CloudStatusTag extends StatelessWidget {
  final String text;
  const CloudStatusTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
      decoration: BoxDecoration(
          color: const Color(0xFFFF3B02).withOpacity(0.08),
          borderRadius: BorderRadius.circular(4.w)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: BaseStyle.fontSize20, color: const Color(0xFFFF3B02)),
      ),
    );
  }
}
