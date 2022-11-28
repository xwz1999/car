import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  final String suffixTitle;
  final VoidCallback onTap;

  const HomeTitle({
    super.key,
    required this.title,
    required this.suffixTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        32.wb,
        Stack(
          children: [
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   bottom: 4.w,
            //   child: Container(
            //     color: kPrimaryColor,
            //     height: 8.w,
            //   ),
            // ),
            Text(
                title,
              style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Spacer(),
        MaterialButton(
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          onPressed: onTap,
          child: Row(
            children: [
              Text(
                suffixTitle,
                style: TextStyle(fontSize: 28.sp),
              ),
              8.wb,
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Icon(
                  CupertinoIcons.chevron_forward,
                  size: 28.w,
                  color: const Color(0xFF999999),
                ),
              ),
            ],
          ),
        ),
        12.wb,
      ],
    );
  }
}
