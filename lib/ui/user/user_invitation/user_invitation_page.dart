// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/task/task_invite_list_model.dart';
import 'package:cloud_car/ui/home/func/task_func.dart';
import 'package:cloud_car/ui/user/user_invitation/invitation_details_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../widget/button/cloud_back_button.dart';

class UserInvitationPage extends StatefulWidget {
  const UserInvitationPage({super.key});

  @override
  _UserInvitationPageState createState() => _UserInvitationPageState();
}

class _UserInvitationPageState extends State<UserInvitationPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<TaskInviteListModel> invitationList = [];

  List<TaskInviteListModel> subscribeList = [];
  final EasyRefreshController _invitationRefreshController =
      EasyRefreshController();
  final EasyRefreshController _directRefreshController =
      EasyRefreshController();
  List<dynamic>? data;
  int _page = 1;
  final int _size = 10;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _invitationRefreshController.dispose();
    _directRefreshController.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const CloudBackButton(
              isSpecial: true,
            ),
            backgroundColor: kForeGroundColor,
            title: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.only(right: 72.w, top: 30.w),
              unselectedLabelColor: BaseStyle.color999999,
              labelStyle: const TextStyle(
                  color: BaseStyle.color111111, fontWeight: FontWeight.bold),
              indicatorPadding: EdgeInsets.only(right: 72.w, top: 16.w),
              // indicator:
              //     BoxDecoration(borderRadius: BorderRadius.circular(4.w)),
              tabs: [
                _tab(0, '看车邀约'),
                _tab(1, '直卖预约'),
              ],
            )
            //leading:  Container(width: 10.w, child: const CloudBackButton()),
            ),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: TabBarView(
          controller: _tabController,
          children: [
            EasyRefresh(
                firstRefresh: true,
                controller: _invitationRefreshController,
                header: MaterialHeader(),
                footer: MaterialFooter(),
                onRefresh: () async {
                  _page = 1;
                  var list =
                      await TaskFunc.getCarList(page: _page, size: _size);
                  invitationList.clear();
                  invitationList.addAll(list);
                  setState(() {});
                },
                onLoad: () async {
                  _page++;
                  var baseList = await apiClient.requestList(
                      API.task.getInviteLists,
                      data: {'page': _page, 'size': 10});
                  if (baseList.nullSafetyTotal > invitationList.length) {
                    invitationList.addAll(baseList.nullSafetyList
                        .map((e) => TaskInviteListModel.fromJson(e)));
                  } else {
                    _invitationRefreshController.finishLoad(noMore: true);
                  }
                  setState(() {});
                },
                child: ListView.separated(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
                    // padding: EdgeInsets.only(top: 10.w),
                    itemBuilder: (context, index) {
                      return _getInvitation(invitationList[index]);
                    },
                    separatorBuilder: (_, __) {
                      return SizedBox(
                        height: 16.w,
                      );
                    },
                    itemCount: invitationList.length)),
            EasyRefresh(
                firstRefresh: true,
                controller: _directRefreshController,
                header: MaterialHeader(),
                footer: MaterialFooter(),
                onRefresh: () async {
                  _page = 1;
                  var list =
                      await TaskFunc.getCarList(page: _page, size: _size);
                  subscribeList.clear();
                  subscribeList.addAll(list);
                  setState(() {});
                },
                onLoad: () async {
                  _page++;
                  var baseList = await apiClient.requestList(
                      API.task.getInviteLists,
                      data: {'page': _page, 'size': 10});
                  if (baseList.nullSafetyTotal > subscribeList.length) {
                    subscribeList.addAll(baseList.nullSafetyList
                        .map((e) => TaskInviteListModel.fromJson(e)));
                  } else {
                    _directRefreshController.finishLoad(noMore: true);
                  }
                  setState(() {});
                },
                child: ListView.separated(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
                    // padding: EdgeInsets.only(top: 10.w),
                    itemBuilder: (context, index) {
                      return _getSubscribe(subscribeList[index]);
                    },
                    separatorBuilder: (_, __) {
                      return SizedBox(
                        height: 16.w,
                      );
                    },
                    itemCount: subscribeList.length)),
          ],
        ));
  }

  ///看车邀约
  _getInvitation(TaskInviteListModel model) {
    var subscribeTime =
        DateTime.fromMillisecondsSinceEpoch(model.inviteAt * 1000);
    var newTime = DateTime.now();
    var hourLag = newTime.difference(subscribeTime).inHours;
    return GestureDetector(
      onTap: () {
        Get.to(() => InvitaionDetailsPage(
              model: model,
            ));
      },
      child: Offstage(
        offstage: model.type == 2,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '看车邀约',
                    style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 32.w,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  getIncitation(model)
                ],
              ),
              32.hb,
              Row(
                children: [
                  Text(
                    '客户信息',
                    style: TextStyle(
                        color: const Color(0xFF666666),
                        fontSize: BaseStyle.fontSize28),
                  ),
                  48.wb,
                  Text(
                    model.customerNickname,
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ],
              ),
              hourLag >= 24 ? 0.hb : 32.hb,
              Offstage(
                offstage: hourLag > 1000,
                child: Row(
                  children: [
                    Text(
                      '剩余时间',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize28),
                    ),
                    48.wb,
                    Text(
                      hourLag <= 24 && hourLag > 0 ? '小于${hourLag}小时' : '',
                      style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28),
                    ),
                  ],
                ),
              ),
              32.hb,
              Row(
                children: [
                  Text(
                    '邀约时间',
                    style: TextStyle(
                      color: const Color(0xFF666666),
                      fontSize: BaseStyle.fontSize28,
                    ),
                  ),
                  48.wb,
                  Text(
                    DateUtil.formatDateMs(model.inviteAt.toInt() * 1000,
                        format: 'yyyy-MM-dd HH:mm:ss'),
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///直卖预约
  _getSubscribe(TaskInviteListModel model) {
    var subscribeTime =
        DateTime.fromMillisecondsSinceEpoch(model.inviteAt * 1000);
    var newTime = DateTime.now();
    var hourLag = newTime.difference(subscribeTime).inHours;
    return GestureDetector(
      onTap: () {
        Get.to(() => InvitaionDetailsPage(
              model: model,
            ));
      },
      child: Offstage(
        offstage: model.type == 1,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '直卖预约',
                    style: TextStyle(
                        color: const Color(0xFF333333), fontSize: 32.w),
                  ),
                  const Spacer(),
                  getSubscribe(model)
                ],
              ),
              32.hb,
              Row(
                children: [
                  Text(
                    '客户信息',
                    style: TextStyle(
                        color: const Color(0xFF666666),
                        fontSize: BaseStyle.fontSize28),
                  ),
                  48.wb,
                  Text(
                    model.customerNickname,
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ],
              ),
              hourLag >= 24 ? 0.hb : 32.hb,
              Offstage(
                offstage: hourLag > 1000,
                child: Row(
                  children: [
                    Text(
                      '剩余时间',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize28),
                    ),
                    48.wb,
                    Text(
                      hourLag <= 24 && hourLag > 0 ? '小于${hourLag}小时' : '',
                      style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28),
                    ),
                  ],
                ),
              ),
              32.hb,
              Row(
                children: [
                  Text(
                    '邀约时间',
                    style: TextStyle(
                        color: const Color(0xFF666666),
                        fontSize: BaseStyle.fontSize28),
                  ),
                  48.wb,
                  Text(
                    DateUtil.formatDateMs(model.inviteAt.toInt() * 1000,
                        format: 'yyyy-MM-dd HH:mm:ss'),
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///邀约状态
  getIncitation(TaskInviteListModel model) {
    var subscribeTime =
        DateTime.fromMillisecondsSinceEpoch(model.inviteAt * 1000);
    var newTime = DateTime.now();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
      decoration: BoxDecoration(
          color: newTime.difference(subscribeTime).inHours >= 24
              ? const Color(0xFF999999).withOpacity(0.1)
              : const Color(0xFF027AFF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(4.w)),
      child: Text(newTime.difference(subscribeTime).inHours >= 24 ? '过期' : '看车',
          style: TextStyle(
              color: newTime.difference(subscribeTime).inHours >= 24
                  ? const Color(0xFF999999)
                  : const Color(0xFF027AFF),
              fontSize: BaseStyle.fontSize24,
              fontWeight: FontWeight.bold)),
    );
  }

  ///预约状态
  getSubscribe(TaskInviteListModel model) {
    var subscribeTime =
        DateTime.fromMillisecondsSinceEpoch(model.inviteAt * 1000);
    var newTime = DateTime.now();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
      decoration: BoxDecoration(
          color: newTime.difference(subscribeTime).inHours >= 24
              ? const Color(0xFF999999).withOpacity(0.1)
              : const Color(0xFF027AFF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(4.w)),
      child: Text(newTime.difference(subscribeTime).inHours >= 24 ? '过期' : '直卖',
          style: TextStyle(
              color: newTime.difference(subscribeTime).inHours >= 24
                  ? const Color(0xFF999999)
                  : const Color(0xFF027AFF),
              fontSize: BaseStyle.fontSize24,
              fontWeight: FontWeight.bold)),
    );
  }

  _tab(int index, String text) {
    return Text(text);
  }

  @override
  bool get wantKeepAlive => true;
}
