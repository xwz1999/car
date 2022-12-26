import 'package:badges/badges.dart';
import 'package:cloud_car/providers/message_provider.dart';
import 'package:cloud_car/ui/home/user_manager/user_manager_detail_page.dart';
import 'package:cloud_car/ui/home/user_manager/user_manager_page.dart';
import 'package:cloud_car/ui/user/user_invitation/user_invitation_page.dart';
import 'package:cloud_car/ui/user/user_order/sales_orders_page.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';

import 'car_system_informs.dart';
import 'notice_examination.dart';
import 'notice_fashionable.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<Message> messageLists = [];

  final EasyRefreshController _refreshController = EasyRefreshController();
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

    return CloudScaffold(
      path: Assets.images.homeBg.path,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      extendBody: true,
      body: Expanded(
        child: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          controller: _refreshController,
          onRefresh: () async {
            messageLists = [
              Message(
                  title: '客户付款',
                  msg: '您发起的购车合同，客户已付定金',
                  date: '01-01 11:11',
                  type: 1),
              //Message(title:'客户跟踪',msg:'您的绑定客服浏览了车辆信息',date: '01-01 11:11',type: 2 ),
              Message(
                  title: '客户邀约提醒',
                  msg: '您的邀约客户将于24小时后到店',
                  date: '01-01 11:11',
                  type: 2),
              Message(
                  title: '分账确认提示', msg: '分账公告', date: '01-01 11:11', type: 3),
              Message(
                  title: '合同审批',
                  msg: '你有新的出售合同待审批',
                  date: '01-01 11:11',
                  type: 4),
              Message(
                  title: '车辆审批',
                  msg: '您有车辆发布审批待查看',
                  date: '01-01 11:11',
                  type: 5),

              ///Message(title:'系统通知',msg:'1.0.1版本功能升级了，立即查看>>>',date: '01-01 11:11',type: 6 ),
            ];
            setState(() {});
          },
          child: ListView.separated(
            //physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 120.w),
            itemBuilder: (BuildContext context, int index) {
              return _messageItem(
                messageLists[index].title ?? '',
                messageLists[index].msg ?? '',
                messageLists[index].date ?? '',
                messageLists[index].type ?? 1,
              );
            },
            itemCount: messageLists.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 2.w,
                thickness: 2.w,
                color: const Color(0xFFf9f9f9),
                indent: 10.w,
                endIndent: 10.w,
              );
            },
          ),
        ),
      ),
    );
  }

  _messageItem(String title, String content, String date, int type) {
    return GestureDetector(
      onTap: () {
        switch (type) {
          case 1:
            Get.to(() => const SalesOrderPage(orderType: OrderType.personal));
            break;
          // case 2:
          //   Get.to(() => const UserManagerDetailPage(
          //         customerClassify: CustomerClassify.normal,
          //       ));
          //   break;
          case 2:
            Get.to(() => const UserInvitationPage());
            break;
          case 3:
            Get.to(() => const FashionablePage());
            break;
          case 4:
            Get.to(() => const ExaminationPage());
            break;
          case 5:
            Get.to(() => const SystemPage());
            break;
          // case 7:
          //   Get.to(()=>)
          //   break;
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              getPath(type),
              width: 88.w,
              height: 88.w,
            ),
            20.wb,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(title), Text(date)],
                  ),
                  10.hb,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(content),
                      getCount(type, context) <= 0
                          ? const SizedBox()
                          : Badge(
                              //文本内容为空时子组件为null时则返回一个红点
                              badgeContent: Text(
                                getCount(type, context).toString(),
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
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getPath(int type) {
    switch (type) {
      case 1:
        return Assets.icons.noticeCustomerPay.path;
      // case 2:
      //   return Assets.icons.customerTrack.path;
      case 2:
        return Assets.icons.noticeCustomerInvite.path;
      case 3:
        return Assets.icons.noticeFashionable.path;
      case 4:
        return Assets.icons.noticeExamination.path;
      case 5:
        return Assets.icons.carOptions.path;
      // case 6:
      //   return Assets.icons.carOptions.path;
    }
  }

  getCount(int type, BuildContext context) {
    final message = Provider.of<MessageProvider>(context);
    switch (type) {
      case 1:
        return message.unReadMesCount.customerPayCount;
      // case 2:
      //   return message.unReadMesCount.customerTrailCount;
      case 2:
        return message.unReadMesCount.customerInviteCount;
      case 3:
        return message.unReadMesCount.billCount;
      case 4:
        return message.unReadMesCount.carAuditCount;
      case 5:
        return message.unReadMesCount.normalCount;
      case 6:
        return message.unReadMesCount.carAuditCount;
    }
  }

  // _noticelist(
  //     {required String title,
  //     required String content,
  //     required int type,
  //     VoidCallback? onTap}) {
  //   return ListTile(
  //       onTap: onTap,
  //       leading: Container(
  //         width: 88.w,
  //         height: 88.w,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(40),
  //             image: DecorationImage(
  //                 image: ExactAssetImage(iconPath), fit: BoxFit.cover)),
  //       ),
  //       //绘制消息主体
  //       title: Row(children: [
  //         Expanded(flex: 1, child: Text(title)),
  //         // Text(
  //         //   item['time'],
  //         //   style: Theme.of(context)
  //         //       .textTheme
  //         //       .bodyText1
  //         //       ?.copyWith(fontSize: 20.sp, color: const Color(0xFFAAAAAA)),
  //         // )
  //       ]),
  //       //子标题
  //       subtitle: Padding(
  //         padding: const EdgeInsets.only(top: 5),
  //         child: Row(children: [
  //           Expanded(
  //               child: Text(
  //             content,
  //             overflow: TextOverflow.ellipsis,
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .bodyText1
  //                 ?.copyWith(fontSize: 20.sp, color: const Color(0xFFAAAAAA)),
  //           )),
  //           //小红点组件
  //           Badge(
  //             //文本内容为空时子组件为null时则返回一个红点
  //             badgeContent: Text(
  //               count.toString(),
  //               style: const TextStyle(color: Colors.white),
  //             ),
  //             //child: Icon(Icons.settings), //子组件
  //             badgeColor: const Color.fromRGBO(230, 34, 34, 1),
  //             //小红点颜色
  //             showBadge: true,
  //             //刷新时会在右侧摆动
  //             animationDuration: const Duration(seconds: 10),
  //             //摆动时间
  //             toAnimate: false, //允许摆动
  //           )
  //         ]),
  //       ));
  // }

  @override
  bool get wantKeepAlive => true;
}

class Message {
  String? title;
  String? msg;
  String? date;
  int? type;

  Message({
    this.title,
    this.msg,
    this.date,
    this.type,
  });
}
