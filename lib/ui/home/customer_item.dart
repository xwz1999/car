
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';



class CustomerItem extends StatelessWidget {

  const CustomerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 24.w,horizontal: 32.w),
      decoration:  BoxDecoration(
        color: kForeGroundColor,
        borderRadius: BorderRadius.circular(8.w)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('支付定金提醒',
                  style: TextStyle(
                      color: BaseStyle.color333333,
                      fontSize: BaseStyle.fontSize32,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              getState('看车'),
            ],
          ),
          32.hb,
          Row(
            children: [
              Text('客户名称',
                  style: TextStyle(
                      color: BaseStyle.color666666,
                      fontSize: BaseStyle.fontSize28,
                      )),
              48.wb,
              Text('支付定金提醒',
                  style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
          32.hb,
          Row(
            children: [
              Text('剩余时间',
                  style: TextStyle(
                    color: BaseStyle.color666666,
                    fontSize: BaseStyle.fontSize28,
                  )),
              48.wb,
              Text('支付定金提醒',
                  style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
          32.hb,
          Row(
            children: [
              Text('邀约时间',
                  style: TextStyle(
                    color: BaseStyle.color666666,
                    fontSize: BaseStyle.fontSize28,
                  )),
              48.wb,
              Text('支付定金提醒',
                  style: Theme.of(context).textTheme.subtitle2),
            ],
          )
        ],
      ),
    );
  }


  getState(String state ){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w,horizontal: 16.w),
      decoration: BoxDecoration(
        color:getContainerColor(state),
        borderRadius: BorderRadius.circular(4.w)
      ),
      child: Text(state,
          style: TextStyle(
              color: getTextColor(state),
              fontSize: BaseStyle.fontSize24,
              fontWeight: FontWeight.bold)),
    );
  }

  getTextColor(String state ){
    switch(state){
      case '未读':
        return const Color(0xFF027AFF);
      case '看车':
        return const Color(0xFF027AFF);
      case '保险':
        return const Color(0xFF027AFF);
      case '检车':
        return const Color(0xFFFE8029);
      case '年检':
        return const Color(0xFFFE8029);
      case '已读':
        return const Color(0xFF999999);
      case '过期':
        return const Color(0xFF999999);
    }
  }

  getContainerColor(String state ){
    switch(state){
      case '未读':
        return const Color(0xFFE5F1FF);
      case '看车':
        return const Color(0xFFE5F1FF);
      case '保险':
        return const Color(0xFFE5F1FF);
      case '检车':
        return const Color(0xFFFEF2E9);
      case '年检':
        return const Color(0xFFFEF2E9);
      case '已读':
        return const Color(0xFFF4F4F4);
      case '过期':
        return const Color(0xFFF4F4F4);
    }
  }
}
