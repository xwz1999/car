import 'package:flutter/material.dart';

extension ColorExt on Color {
  ///获得此颜色的互补色
  Color get complementary {
    var r = ~red;
    var g = ~green;
    var b = ~blue;
    return Color.fromARGB(alpha, r, g, b);
  }
}
