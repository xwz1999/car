import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

abstract class ThatcarWidget extends StatefulWidget {
  final String title;
  final String text;
  const ThatcarWidget({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
    );


  }

  getThatcar() {
    return Column(
      children: [title=="叫车车辆信息"?Row(children: [Text(title,style:TextStyle(color: BaseStyle.color333333,fontSize: BaseStyle.fontSize28) ,)],)],
    );
  }
}


