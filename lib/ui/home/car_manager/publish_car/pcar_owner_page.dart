import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_style.dart';
import '../../../../widget/button/cloud_back_button.dart';

class CarOwnerPage extends StatefulWidget {
  const CarOwnerPage({Key? key}) : super(key: key);

  @override
  State<CarOwnerPage> createState() => _CarOwnerPageState();
}

class _CarOwnerPageState extends State<CarOwnerPage> {
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
