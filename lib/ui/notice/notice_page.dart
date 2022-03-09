import 'dart:ui';

import 'package:cloud_car/ui/notice/notice_examination.dart';
import 'package:cloud_car/ui/user/user_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import 'notice_fashionable.dart';
import 'notice_fashionable1.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  final int noreadnum = 0;
  //final _num = number > 99 ? "99+" : number;
  List noticelist = [
    {
      'name': '客户消息提示',
      'src': 'assets/icons/message.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': 1
    },
    {
      'name': '客户付款',
      'src': 'assets/icons/payment.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': 99
    },
    {
      'name': '客户跟踪',
      'src': 'assets/icons/tracking.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': 0
    },
    {
      'name': '客户邀约提醒',
      'src': 'assets/icons/invitation.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': 54
    },
    {
      'name': '客户关怀提醒',
      'src': 'assets/icons/care.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': 4
    },
    {
      'name': '分账确认提示',
      'src': 'assets/icons/fashionable.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': 0
    },
    {
      'name': '审批提醒',
      'src': 'assets/icons/examination.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': 0
    },
    {
      'name': '系统通知',
      'src': 'assets/icons/system.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': 0
    },
  ];
  late EasyRefreshController _refreshController;

  var name;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // padding:
    // EdgeInsets.symmetric(vertical: 32.w);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            //backgroundColor: Colors.white,
            ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: ListView.builder(
              itemCount: 8,
              itemBuilder: (ctx, index) {
                return this._noticelist(this.noticelist[index]);
              }),
        ));
  }

//
  _noticelist(item) {
    return InkWell(
      onTap: () {
        switch (item['name']) {
          case '分账确认提示':
            Get.to(() => const FashionablePage());
            //print("1111111");
            break;
          case '审批提醒':
            Get.to(() => const examinationPage());
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromRGBO(238, 238, 238, 1)))),
        child: ListTile(
          leading: Container(
            width: 88.w,
            height: 88.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                    image: ExactAssetImage(item['src']), fit: BoxFit.cover)),
            // child: Container(
            //   width: 32.w,
            //   height: 32.w,
            //   decoration:
            //       BoxDecoration(borderRadius: BorderRadius.circular(16)),
            //   color: Colors.red,
            // ),
            //   child: if (item['noreadnum']==0) {
            //   print(''),
            //  } else if(item['noreadnum']>0 || item['noreadnum']<99){
            //    print(item['noreadnum']),
            //  }else{
            //   print('99+'),
            //  },
          ),
          title: Text(item["name"]),
          subtitle: Text(
            item['msg'],
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(item['time']),
        ),
      ),
    );
    // return ListTile(
    //   leading: Container(
    //     width: 88.w,
    //     height: 88.w,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(40),
    //         image: DecorationImage(
    //             image: ExactAssetImage(item['src']), fit: BoxFit.cover)),
    //   ),
    //   title: Text(item["name"]),
    //   subtitle: Text(
    //     item['msg'],
    //     overflow: TextOverflow.ellipsis,
    //   ),
    //   trailing: Text(item['time']),
    // );
  }

//已读未读数量
  _readnum(item) {}

  @override
  bool get wantKeepAlive => true;
}
