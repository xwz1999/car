import 'package:badges/badges.dart';
import 'package:cloud_car/providers/message_provider.dart';
import 'package:cloud_car/ui/home/split_account/split_account_page.dart';
import 'package:cloud_car/ui/home/task/customer_page.dart';
import 'package:cloud_car/ui/notice/car_system_informs.dart';
import 'package:cloud_car/ui/notice/notice_examination.dart';
import 'package:cloud_car/ui/user/user_invitation/user_invitation_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;

  //final _num = number > 99 ? "99+" : number;
  List noticelist = [
    // {
    //   'name': '客户消息提示',
    //   'src': 'assets/icons/message.png',
    //   'time': '12:22',
    //   'msg': '您绑定的客户发来消息，请注意查收',
    //   'noreadnum': '1'
    // },
    // {
    //   'name': '客户付款',
    //   'src': 'assets/icons/payment.png',
    //   'time': '12:22',
    //   'msg': '您绑定的客户发来消息，请注意查收',
    //   'noreadnum': '99'
    // },
    // {
    //   'name': '客户跟踪',
    //   'src': 'assets/icons/tracking.png',
    //   'time': '12:22',
    //   'msg': '您绑定的客户发来消息，请注意查收',
    //   'noreadnum': ''
    // },
    {
      'name': '客户邀约提醒',
      'src': 'assets/icons/invitation.png',
      'time': '12:22',
      'msg': '您绑定的客户发来消息，请注意查收',
      'noreadnum': ''
    },
    // {
    //   'name': '客户关怀提醒',
    //   'src': 'assets/icons/care.png',
    //   'time': '12:22',
    //   'msg': '您绑定的客户发来消息，请注意查收',
    //   'noreadnum': ''
    // },
    {
      'name': '分账确认提示',
      'src': 'assets/icons/fashionable.png',
      'time': '12:22',
      'msg': '有新的账单',
      'noreadnum': ''
    },
    // {
    //   'name': '审批提醒',
    //   'src': 'assets/icons/examination.png',
    //   'time': '12:22',
    //   'msg': '您绑定的客户发来消息，请注意查收',
    //   'noreadnum': ''
    // },
    {
      'name': '系统通知',
      'src': 'assets/icons/system.png',
      'time': '12:22',
      'msg': '新版本可用',
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
    final message = Provider.of<MessageProvider>(context);
    return CloudScaffold(
        path: Assets.images.homeBg.path,
        systemStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        extendBody: true,
        body: Expanded(
          child: ListView(
            padding: EdgeInsets.only(top: 120.w),
            children: [
              _noticelist(
                  title: '客户邀约提醒',
                  content: message.unReadMesCount.customerInviteCount == 0
                      ? '暂无新的邀约'
                      : '您绑定的客户有新的邀约，请注意处理',
                  count: message.unReadMesCount.customerInviteCount,
                  iconPath: Assets.icons.invitation.path),
              _noticelist(
                  title: '分账确认提示',
                  content: message.unReadMesCount.billCount == 0
                      ? '暂无新的分账需要确认'
                      : '您有新的账单',
                  count: message.unReadMesCount.billCount,
                  iconPath: Assets.icons.fashionable.path),
            ],
          ),
        ));
  }


  _noticelist(
      {required String title,
      required String content,
      required int count,
      required String iconPath,
      VoidCallback? onTap}) {
    return ListTile(
        onTap: onTap,
        leading: Container(
          width: 88.w,
          height: 88.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                  image: ExactAssetImage(iconPath), fit: BoxFit.cover)),
        ),
        //绘制消息主体
        title: Row(children: [
          Expanded(flex: 1, child: Text(title)),
          // Text(
          //   item['time'],
          //   style: Theme.of(context)
          //       .textTheme
          //       .bodyText1
          //       ?.copyWith(fontSize: 20.sp, color: const Color(0xFFAAAAAA)),
          // )
        ]),
        //子标题
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(children: [
            Expanded(
                child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 20.sp, color: const Color(0xFFAAAAAA)),
            )),
            //小红点组件
            Badge(
              //文本内容为空时子组件为null时则返回一个红点
              badgeContent: Text(
                count.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              //child: Icon(Icons.settings), //子组件
              badgeColor: const Color.fromRGBO(230, 34, 34, 1),
              //小红点颜色
              showBadge: true,
              //刷新时会在右侧摆动
              animationDuration: const Duration(seconds: 10),
              //摆动时间
              toAnimate: false, //允许摆动
            )
          ]),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
