import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base/base_style.dart';


class CarPickerBox extends StatelessWidget {
  final VoidCallback? onPressed;
  final String confirmString;
  final String? title;
  final Widget child;

  const CarPickerBox(
      {Key? key,
      this.onPressed,
      this.confirmString = '确定',
      this.title,
      required this.child,})
      : super(key: key);

  _buildButton({
    required String title,
    required VoidCallback? onPressed,
    required Color color,
  }) {
    return SizedBox(
      // height: 48.w,
      child: TextButton(
        onPressed: onPressed,
        child: Text(title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kForeGroundColor,
      child: SizedBox(
        height: 650.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 88.w,
              child: NavigationToolbar(
                leading: _buildButton(
                  title: '取消',
                  onPressed: () => Navigator.pop(context),
                  color:Colors.black26,
                ),
                middle: Text(
                  title ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                trailing: _buildButton(
                  title: confirmString,
                  onPressed: onPressed,
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
