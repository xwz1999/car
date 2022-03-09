import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExt on num {
  Widget get wb => SizedBox(width: w);

  Widget get hb => SizedBox(height: w);
}
