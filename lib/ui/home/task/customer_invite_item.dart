import 'package:cloud_car/model/task/task_invite_list_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class CustomerInviteItem extends StatelessWidget {
  // final int type;///1为客服付款 2为客户跟踪 3客户邀约
  final TaskInviteListModel model;

  const CustomerInviteItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      decoration: BoxDecoration(
          color: kForeGroundColor, borderRadius: BorderRadius.circular(8.w)),
      child: Column(
        children: [
          Row(
            children: [
              Text('看车邀约提醒',
                  style: TextStyle(
                      color: BaseStyle.color333333,
                      fontSize: BaseStyle.fontSize32,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              getState(model.type),
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
              Text(model.customerNickname,
                  style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
          32.hb,
          getRemainingTime(
                      DateUtil.getDateTimeByMs(model.inviteAt.toInt() * 1000)) >
                  0
              ? Row(
                  children: [
                    Text('剩余时间',
                        style: TextStyle(
                          color: BaseStyle.color666666,
                          fontSize: BaseStyle.fontSize28,
                        )),
                    48.wb,
                    Text(
                        '剩余时间小于${getRemainingTime(DateUtil.getDateTimeByMs(model.inviteAt.toInt() * 1000))}小时',
                        style: Theme.of(context).textTheme.subtitle2),
                  ],
                )
              : const SizedBox(),
          getRemainingTime(DateUtil.getDateTimeByMs(
                      model.inviteAt.toInt() * 1000)) <=
                  0
              ? const SizedBox()
              : 32.hb,
          Row(
            children: [
              Text('邀约时间',
                  style: TextStyle(
                    color: BaseStyle.color666666,
                    fontSize: BaseStyle.fontSize28,
                  )),
              48.wb,
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Text(
                    DateUtil.formatDate(
                        DateUtil.getDateTimeByMs(model.inviteAt.toInt() * 1000),
                        format: 'yyyy-MM-dd HH:mm'),
                    style: Theme.of(context).textTheme.subtitle2),
              ),
            ],
          )
        ],
      ),
    );
  }

  getRemainingTime(DateTime dateTime) {
    if (dateTime.difference(DateTime.now()).inHours > 0) {
      return (dateTime.difference(DateTime.now()).inHours + 1);
      // return '剩余时间小于+${ dateTime.difference(DateTime.now()).inHours+1}小时';
    } else {
      return (dateTime.difference(DateTime.now()).inHours + 1);
      // ignore: dead_code
      return '剩余时间小于+${dateTime.difference(DateTime.now()).inHours + 1}小时';
    }
  }

  getState(int type) {
    String state = '';
    if (type == 1) {
      state = '看车';
    } else if (type == 2) {
      state = '检车';
    }
    if (getRemainingTime(
            DateUtil.getDateTimeByMs(model.inviteAt.toInt() * 1000)) <=
        0) {
      state = '过期';
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
      decoration: BoxDecoration(
          color: getContainerColor(state),
          borderRadius: BorderRadius.circular(4.w)),
      child: Text(state,
          style: TextStyle(
              color: getTextColor(state),
              fontSize: BaseStyle.fontSize24,
              fontWeight: FontWeight.bold)),
    );
  }

  getTextColor(String state) {
    switch (state) {
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

  getContainerColor(String state) {
    switch (state) {
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
