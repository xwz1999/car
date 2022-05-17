
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String? path;
  final String text;
  final double paddingTop;
  const NoDataWidget({super.key, this.path, required this.text, this.paddingTop = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          paddingTop.hb,
          path!=null?Image.asset(path!,width: 328.w,height: 316.w,):Image.asset(Assets.images.noData.path,width: 328.w,height: 316.w,),
          60.hb,
          Text(
            text,style: TextStyle(
            color: const Color(0xFF333333),fontSize: 28.sp
          ),
          )
        ],
      ),
    );
  }
}
