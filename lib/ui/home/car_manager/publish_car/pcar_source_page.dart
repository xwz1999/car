import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_style.dart';
import '../../../../widget/button/cloud_back_button.dart';

class CarSourcePage extends StatefulWidget {
  const CarSourcePage({Key? key}) : super(key: key);

  @override
  State<CarSourcePage> createState() => _CarSourcePageState();
}

class _CarSourcePageState extends State<CarSourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('寄卖合同',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0x99eeeeee),
        ),
      ),
    );
  }
}
