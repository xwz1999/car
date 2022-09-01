import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CloudBoxTile extends StatelessWidget {
  final String title;
  final String text;
  const CloudBoxTile({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            title,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
        ),
        32.wb,
        SizedBox(
          width: 478.w,
          child: Text(
            text,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
        ),
      ],
    );
  }
}
