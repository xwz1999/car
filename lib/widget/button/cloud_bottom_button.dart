import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CloudBottomButton extends StatefulWidget {
  final String text;
  final Color color1;
  final Color color2;
  final Function() onTap;
  const CloudBottomButton({
    Key? key,
    this.text = '返回首页',
    this.color1 = const Color(0xFF0593FF),
    this.color2 = const Color(0xFF027AFF),
    required this.onTap,
  }) : super(key: key);

  @override
  State<CloudBottomButton> createState() => _CloudBottomButtonState();
}

class _CloudBottomButtonState extends State<CloudBottomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onTap,
      child: Material(
        color:Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15.w),
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [widget.color1, widget.color2]),
              borderRadius: BorderRadius.circular(8.w)),
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: BaseStyle.fontSize28, color: kForeGroundColor),
          ),
        ),
      ),
    );
  }
}
