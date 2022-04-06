import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class ThatcarUnpaid extends StatefulWidget {
  final String stat;
  const ThatcarUnpaid({Key? key, required this.stat}) : super(key: key);

  @override
  State<ThatcarUnpaid> createState() => _ThatcarUnpaidState();
}

class _ThatcarUnpaidState extends State<ThatcarUnpaid> {
  late String stat = widget.stat;
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
      backgroundColor: BodyColor,
      body: ListView(
        children: const [],
      ),
    );
  }

  getCarBox(Widget widget) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.w)),
      child: widget,
    );
  }

  _getCarInformation(String stat) {
    return getCarBox(Column(
      children: [
        Row(
          children: [
            Text(
              '叫车车辆信息',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFE8029).withOpacity(0.01),
              ),
              child: Text(
                stat,
                style: TextStyle(
                    fontSize: BaseStyle.fontSize24,
                    color: const Color(0xFFFE8029)),
              ),
            )
          ],
        ),
        24.hb,
        Row(
          children: [
            SizedBox(
              width: 196.w,
              height: 150.w,
              child: Image.asset(
                Assets.images.carBanner.path,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
        Column(
          children: [
            Text(
              '奥迪Q3 2020款 35 TFSI 进取型SUV',
              style: TextStyle(color: BaseStyle.color111111),
            )
          ],
        )
      ],
    ));
  }
}
