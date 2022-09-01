import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CloudCarBox extends StatelessWidget {
  final String title;
  final List<Widget> items;
  final Widget? action;

  const CloudCarBox(
      {super.key, required this.title, required this.items, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: const Color(0xFFFFFFFF)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              action ?? const SizedBox.shrink(),
            ],
          ),
          ...items
        ],
      ),
    );
  }
}
