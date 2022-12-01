
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../../widget/button/cloud_back_button.dart';

class DetailedPricePage extends StatelessWidget {
  const DetailedPricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text("调价记录",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34.sp,
              color: const Color(0xFF333333),
            )),
      ),
      backgroundColor: kForeGroundColor,
    );
  }
}
