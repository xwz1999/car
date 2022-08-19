import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/task/task_invite_list_model.dart';
import 'package:cloud_car/ui/home/func/task_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'invitation_details_page.dart';

class LookAtCarView extends StatefulWidget {
  const LookAtCarView({super.key});

  @override
  _LookAtCarViewState createState() => _LookAtCarViewState();
}

class _LookAtCarViewState extends State<LookAtCarView> {

  List<TaskInviteListModel> invitationList = [];

  final EasyRefreshController _invitationRefreshController =
  EasyRefreshController();
  int _page = 1;
  final int _size = 10;

  @override
  void dispose() {
    _invitationRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        firstRefresh: true,
        controller: _invitationRefreshController,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          _page = 1;
          var list = await TaskFunc.getCarList(page: _page, size: _size);
          invitationList = list;
          setState(() {});
        },
        onLoad: () async {
          _page++;
          var baseList = await apiClient.requestList(API.task.getInviteLists,
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
            padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
            // padding: EdgeInsets.only(top: 10.w),
            itemBuilder: (context, index) {
              return _getInvitation(invitationList[index]);
            },
            separatorBuilder: (_, __) {
              return SizedBox(
                height: 16.w,
              );
            },
            itemCount: invitationList.length));
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
                  _getInvitationStatus(model)
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
                      hourLag <= 24 && hourLag > 0 ? '小于$hourLag小时' : '',
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

  ///邀约状态
  _getInvitationStatus(TaskInviteListModel model) {
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

}
