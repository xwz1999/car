import 'package:cloud_car/ui/notice/notice_examination.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../home/search_page.dart';
import '../home/task_page.dart';
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

    return CloudScaffold(
      path: Assets.images.homeBg.path,
      bodyColor: bgColor,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      extendBody: true,
      appbar: Container(
        color: Colors.transparent,
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            32.wb,
            SizedBox(
              //头像
              width: 64.w, height: 64.w,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.w)),
                    child: Container(
                      color: Colors.blue,
                    )),
              ),
            ),
            16.wb,
            Text('Hi,张三',
                style: TextStyle(
                    color: BaseStyle.color111111,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp)),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.mainSearch.path,
                  height: 48.w, width: 48.w),
            ),
            24.wb,
            GestureDetector(
              onTap: () {
                Get.to(() => const TaskPage());
              },
              child: Image.asset(Assets.icons.mainMenu.path,
                  height: 48.w, width: 48.w),
            ),
            32.wb,
          ],
        ),
      ),
    );
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
              Get.to(() => const examinationPage());
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
                fontSize: 20.sp, color: Color.fromRGBO(170, 170, 170, 1)),
          )
        ]),
        //子标题
        subtitle: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Row(children: [
            Expanded(
                child: Text(
              item['msg'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 24.sp, color: Color.fromRGBO(170, 170, 170, 1)),
            )),
            Container(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(16.w)),
              //child: Text(item[noreadnum]!),
            )
          ]),
        ));
  }

//已读未读数量
  _readnum(item) {}

  @override
  bool get wantKeepAlive => true;
}
