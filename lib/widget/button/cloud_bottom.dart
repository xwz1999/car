import 'package:cloud_car/utils/headers.dart';

import 'package:flutter/cupertino.dart';

class CloudBottom extends StatefulWidget {
  final String text;
  final Color color1;
  final Color color2;
  final Function() ontap;
  const CloudBottom({
    Key? key,
    this.text = '返回我的',
    this.color1 = const Color(0xFF0593FF),
    this.color2 = const Color(0xFF027AFF),
    required this.ontap,
  }) : super(key: key);

  @override
  State<CloudBottom> createState() => _CloudBottomState();
}

class _CloudBottomState extends State<CloudBottom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontap();
      },
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
    );
  }
}
