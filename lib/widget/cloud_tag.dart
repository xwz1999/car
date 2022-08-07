import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CloudTag extends StatelessWidget {
  final String text;
  final List<Color> backGroundColor;

  const CloudTag.def({
    super.key,
    required this.text,
  })  : backGroundColor = const [Color(0xFFFE822F),Color(0xFFFEC42F)];

  CloudTag.blue({
    super.key,
    required this.text,
  })  : backGroundColor = [const Color(0xFF3D8AFF),const Color(0xFF38C3FF)];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 40.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors:backGroundColor,begin: Alignment.centerLeft,end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(8.w)),
      child: text.text.size(12.sp).color(Colors.white).make(),
    );
  }
}
