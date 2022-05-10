import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';

class VehiclesRelease extends StatefulWidget {
  const VehiclesRelease({Key? key}) : super(key: key);

  @override
  State<VehiclesRelease> createState() => _VehiclesReleaseState();
}

class _VehiclesReleaseState extends State<VehiclesRelease> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        title: Text('车辆发布',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        backgroundColor: kForeGroundColor,

        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          112.hb,
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: SizedBox(
                width: 200.w,
                height: 200.w,
                child: Image.asset(Assets.icons.successful.path)),
          ),
          36.hb,
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: Text(
              '提交成功',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          72.hb,
          CloudBottomButton(
            onTap: () {},
            text: '返回我的',
          )
        ],
      ),
    );
  }
}
