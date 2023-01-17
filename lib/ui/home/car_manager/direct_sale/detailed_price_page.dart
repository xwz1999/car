import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../../widget/button/cloud_back_button.dart';

class DetailedPricePage extends StatelessWidget {
  const DetailedPricePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List priceList = [
    //   {
    //     'state': '改价',
    //     'date': '2022-03-07 20:03:32',
    //     'difference': '2000',
    //     'price': '3390900',
    //   },
    //   {
    //     'state': '改价',
    //     'date': '2022-03-07 20:03:32',
    //     'difference': '2000',
    //     'price': '3390900',
    //   },
    //   {
    //     'state': '改价',
    //     'date': '2022-03-07 20:03:32',
    //     'difference': '2000',
    //     'price': '3390900',
    //   },
    // ];
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
        body: ListView(
          children: [
            _getSox(),
            _getNSox(),
          ],
        ));
  }

  _getSox() {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(width: 2.w, color: const Color(0xFF027AFF))),
        ),
        Container(
          width: 32.w,
          height: 4.w,
          color: const Color(0xFF027AFF),
        )
      ],
    );
  }

  _getNSox() {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(width: 2.w, color: const Color(0xFFE8E8E8))),
        ),
        Container(
          width: 32.w,
          height: 4.w,
          color: const Color(0xfffe8e8e8),
        )
      ],
    );
  }
}
