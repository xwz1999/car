import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class ThatcarUnpaid extends StatefulWidget {
  const ThatcarUnpaid({Key? key}) : super(key: key);

  @override
  State<ThatcarUnpaid> createState() => _ThatcarUnpaidState();
}

class _ThatcarUnpaidState extends State<ThatcarUnpaid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('售车订单',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: bodyColor,
      body: ListView(
        children: const [],
      ),
    );
  }

  getCarInformation() {
    return const Text("data");
  }
}
