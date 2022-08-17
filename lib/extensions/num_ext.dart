import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExt on num {
  Widget get wb => SizedBox(width: w);

  Widget get hb => SizedBox(height: w);

  String get priceFormat =>
      (Decimal.parse(toString()) / Decimal.fromInt(10000)).toString();

}
