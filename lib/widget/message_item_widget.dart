import 'dart:core';

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

enum TaskType {
  message,
  pay,
  track,
  invite,
  care
}


class MessageItemWidget extends StatelessWidget {
  final String title;
  final String tip;
  final String time;
  final int num;
  final String url;
  final TaskType? type;
  const MessageItemWidget(
      {Key? key,
      required this.title,
      required this.tip,
      required this.time,
      required this.num,
      required this.url, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 28.w,horizontal: 32.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //头像
            width: 88.w, height: 88.w,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.w)),
                  child:  url.contains('http')?
                  FadeInImage.assetNetwork(
                    image:  url,
                    fit: BoxFit.cover, placeholder: '',
                  ):Image.asset(url),

              ),
            ),
          ),
          24.wb,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: BaseStyle.color111111,
                      fontSize: BaseStyle.fontSize28,
                      fontWeight: FontWeight.bold
                  ),
                ),
                24.hb,
                Text(
                tip,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: const Color(0xFFAAAAAA),
                      fontSize: BaseStyle.fontSize24,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                    color: const Color(0xFFAAAAAA),
                    fontSize: BaseStyle.fontSize20,

                ),
              ),
              24.hb,
              getNumItem(num),
            ],
          )


        ],
      ),
    );
  }


  getNumItem(int num){
    return Container(
      padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 5.w,bottom: 6.w),
      height: 32.w,
      decoration: BoxDecoration(
        color: const Color(0xFFE62222),
        borderRadius: BorderRadius.all(Radius.circular(16.w)),
      ),
      child: Text(
        num>99?'99+':num.toString(),
        style: TextStyle(
          color: kForeGroundColor,
          fontSize: BaseStyle.fontSize20,
          fontWeight: FontWeight.bold
        ),
      ),
    );

  }
}
