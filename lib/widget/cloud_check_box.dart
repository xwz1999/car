import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';

class CloudCheckBox<T> extends StatelessWidget {
  final T value;
  // final T selectValue
  const CloudCheckBox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
          color: const Color(0xFF0593FF),
          borderRadius: BorderRadius.circular(16.w)),
      child: Icon(
        CupertinoIcons.checkmark,
        size: 24.w,
      ),
    );
  }
}
