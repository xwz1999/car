import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudCheckBox<T> extends StatelessWidget {
  final T value;
  final List<T> groupValue;
  final VoidCallback? onTap;

  const CloudCheckBox(
      {super.key, required this.value, required this.groupValue, this.onTap});

  @override
  Widget build(BuildContext context) {
    var selected = groupValue.contains(value);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: selected ? const Color(0xFF0593FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(16.w)),
        child: selected
            ? Icon(
                CupertinoIcons.checkmark,
                size: 24.w,
                color: Colors.white,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
