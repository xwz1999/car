import 'package:cloud_car/ui/notice/notice_examination.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:badges/badges.dart';
import '../user/user_page.dart';
import 'notice_fashionable.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;

  //final _num = number > 99 ? "99+" : number;
  List noticelist = [
    {
      'name': '客户消息提示',
      'src': 'assets/icons/message.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': '1'
    },
    {
      'name': '客户付款',
      'src': 'assets/icons/payment.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': '99'
    },
    {
      'name': '客户跟踪',
      'src': 'assets/icons/tracking.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': ''
    },
    {
      'name': '客户邀约提醒',
      'src': 'assets/icons/invitation.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': ''
    },
    {
      'name': '客户关怀提醒',
      'src': 'assets/icons/care.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': ''
    },
    {
      'name': '分账确认提示',
      'src': 'assets/icons/fashionable.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': ''
    },
    {
      'name': '审批提醒',
      'src': 'assets/icons/examination.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': ''
    },
    {
      'name': '系统通知',
      'src': 'assets/icons/system.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': ''
    },
  ];
  late EasyRefreshController _refreshController;
  List num = [];
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
    return CloudScaffold(
        path: Assets.images.homeBg.path,
        systemStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        // appbar: Container(
        //   color: Colors.transparent,
        //   height: kToolbarHeight + MediaQuery.of(context).padding.top,
        //   alignment: Alignment.centerLeft,
        //   padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        // ),
        extendBody: true,
        // extendBodyBehindAppBar: true,
        body: Expanded(
          //padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.builder(
              padding: EdgeInsets.only(top: 128.w),
              itemCount: 8,
              itemBuilder: (ctx, index) {
                return _noticelist(noticelist[index]);
              }),
        ));
  }

//
  _noticelist(item) {
    return ListTile(
        onTap: () {
          switch (item['name']) {
            case '分账确认提示':
              Get.to(() => const FashionablePage());
              //print("1111111");
              break;
            case '审批提醒':
              Get.to(() => const ExaminationPage());
              break;
            case '系统通知':
              Get.to(() => const UserPage());
              break;
          }
        },
        //头像
        leading: Container(
          width: 88.w,
          height: 88.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                  image: ExactAssetImage(item['src']), fit: BoxFit.cover)),
        ),
        //绘制消息主体
        title: Row(children: [
          Expanded(flex: 1, child: Text(item['name'])),
          Text(
            item['time'],
            style: TextStyle(
                fontSize: 20.sp, color: const Color.fromRGBO(170, 170, 170, 1)),
          )
        ]),
        //子标题
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(children: [
            Expanded(
                child: Text(
              item['msg'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 24.sp,
                  color: const Color.fromRGBO(170, 170, 170, 1)),
            )),
            //小红点组件
            Badge(
              //文本内容为空时子组件为null时则返回一个红点
              badgeContent: const Text(
                '1'
                // item['noreadnum'].toString()
                ,
                style: TextStyle(color: Colors.white),
              ),
              //child: Icon(Icons.settings), //子组件
              badgeColor: const Color.fromRGBO(230, 34, 34, 1), //小红点颜色
              showBadge: true, //刷新时会在右侧摆动
              animationDuration: const Duration(seconds: 10), //摆动时间
              toAnimate: false, //允许摆动
            )
          ]),
        ));
  }

//已读未读数量
  _readnum(item) {}

  @override
  bool get wantKeepAlive => true;
}
