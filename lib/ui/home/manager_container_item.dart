
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';



class ManagerContainerItem extends StatelessWidget {
  final String num;
  final String text;
  const ManagerContainerItem({super.key, required this.num, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: 22.w,top: 32.w),
      decoration:  BoxDecoration(
          color: const Color(0xFFF5F6F7),
          borderRadius: BorderRadius.circular(8.w)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(num,
              style: TextStyle(
                color: const Color(0xFF027AFF),
                fontSize: BaseStyle.fontSize48,
                fontWeight: FontWeight.bold
              )),
          32.hb,
          Text(text,
              style: TextStyle(
                color: const Color(0xFF828CA0),
                fontSize: BaseStyle.fontSize28,
              )),
        ],
      ),
    );
  }



}
