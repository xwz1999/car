import 'package:cloud_car/model/user/user_info_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../constants/enums.dart';
import '../../widget/car_widget.dart';
import '../user/user_order/status.dart';

class ExaminationPage extends StatefulWidget {
  const ExaminationPage({super.key});

  @override
  _ExaminationPageState createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage> {
  List<dynamic>? data;

  final auditlist = [
    {
      'name': '奥迪A3',
      'time': '2021-12-01 12:00:22',
      'text': '车辆信息未填写完整',
      'conditions': 1,
    },
    {
      'name': '奥迪A3',
      'time': '2021-12-01 12:00:22',
      'text': '',
      'conditions': 2,
    },
  ];
  late final EasyRefreshController _refreshController = EasyRefreshController();
  ReminderApprovalType examinationState = ReminderApprovalType.all;

  @override
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('审批提醒', style: Theme.of(context).textTheme.headline6),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        extendBody: false,
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            SizedBox(
              height: kToolbarHeight + 50.w,
            ),
            SizedBox(
              height: 88.w,
              child: CarWidget(
                  items:_getList(),
                  callBack: (index) {
                    examinationState = ReminderApprovalType.values[index];
                    _refreshController.callRefresh();
                  }),
            ),
            Expanded(
                child: EasyRefresh(
                    child: ListView.builder(
              itemBuilder: (context, index) {
                return _release(auditlist[index]);
              },
              itemCount: auditlist.length,
            )))
          ],
        ));
  }

//驳回 通过
  _isPass(int state) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
          margin: EdgeInsets.only(left: 150.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: state == 2
                  ? const Color(0xFF027AFF).withOpacity(0.1)
                  : const Color(0xFF999999).withOpacity(0.1)),
          child: Text(
            state == 2 ? "未读" : '已读',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: state == 2
                    ? const Color(0xFF027AFF)
                    : const Color(0xFF999999)),
          ),
        )
      ],
    );
  }


  ///判断列表
 List<String> _getList(){
    if(  UserTool.userProvider.userInfo.business.roleEM== Role.manager ||UserTool.userProvider.userInfo.business.roleEM== Role.carService){
      return  ReminderApprovalType.values.map((e) => e.typeStr).toList();
    }else if( UserTool.userProvider.userInfo.business.roleEM== Role.salesTraffic){
      return ExaminationType.values.map((e) => e.typeStr).toList();
    }else{
      return [];
    }
  }

  ///审批提醒 店长身份
  _release(item) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isDismissible: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 500.w,
                decoration: BoxDecoration(
                    color: BaseStyle.colorf6f6f6,
                    borderRadius: BorderRadius.all(Radius.circular(16.w))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(32.w),
                            child: Text(
                              '拒绝',
                              style: TextStyle(
                                  color: const Color(0xFF999999),
                                  fontSize: 28.sp),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '车辆确认',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xFF111111),
                                fontSize: 32.sp),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(32.w),
                            child: Text(
                              '同意',
                              style: TextStyle(
                                  color: const Color(0xFF027AFF),
                                  fontSize: 28.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '客户对你的这辆车有购买意愿，是否同意出售',
                      style: TextStyle(
                          color: const Color(0xFF333333), fontSize: 28.sp),
                    ),
                    Container(
                      margin: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(10.w, 17.w),
                            blurRadius: 10.w,
                            spreadRadius: -10.w,
                            color: const Color(0x33027AFF),
                          )
                        ],
                      ),
                      child: CarItemWidget(
                        widgetPadding: EdgeInsets.all(24.w),
                        name: '奥迪A8',
                        time: '2022-11-04',
                        distance: '2万公里',
                        standard: '国六',
                        url: '',
                        price: '27.43',
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
        margin: EdgeInsets.only(top: 10.w, left: 32.w, right: 32.w),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
        child: Column(children: [
          Row(
            children: [
              Text(
                item['conditions'] == 2 ? "修改审核" : "发布审核",
                style: TextStyle(
                    fontSize: 32.sp,
                    color: const Color.fromRGBO(51, 51, 51, 1)),
              ),
              const Spacer(),
              _isPass(item['conditions'])
            ],
          ),
          24.hb,
          Row(
            children: [
              Text(
                '车辆名称',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                item['name'],
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '审核时间',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                item['time'],
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          item['conditions'] == 1 ? 28.hb : 0.hb,
          item['conditions'] == 1
              ? Row(
                  children: [
                    Text(
                      '驳回原因',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: const Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['text'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: const Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                )
              : const SizedBox(),
        ]),
      ),
    );
  }

  ///审批提醒 经纪人身份和车务身份
// _release1(item) {
//   return GestureDetector(
//     onTap: () {
//     },
//     child: Container(
//       decoration:  BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8.w)),
//       margin: EdgeInsets.only(top: 10.w, left: 32.w, right: 32.w),
//       padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
//       child: Column(children: [
//         Row(
//           children: [
//             Text(
//               item['conditions'] == 2 ? "出售申请" : "发布审核",
//               style: TextStyle(
//                   fontSize: 32.sp,
//                   color: const Color.fromRGBO(51, 51, 51, 1)),
//             ),
//             const Spacer(),
//             _isPass(item['conditions'])
//           ],
//         ),
//         24.hb,
//         Row(
//           children: [
//             Text(
//               '车辆名称',
//               style: TextStyle(
//                   fontSize: 28.sp,
//                   color: const Color.fromRGBO(102, 102, 102, 1)),
//             ),
//             48.wb,
//             Text(
//               item['name'],
//               style: TextStyle(
//                   fontSize: 28.sp,
//                   color: const Color.fromRGBO(51, 51, 51, 1)),
//             )
//           ],
//         ),
//         28.hb,
//         Row(
//           children: [
//             Text(
//               '审核状态',
//               style: TextStyle(
//                   fontSize: 28.sp,
//                   color: const Color.fromRGBO(102, 102, 102, 1)),
//             ),
//             48.wb,
//             Text(
//               '驳回',
//               style: TextStyle(
//                   fontSize: 28.sp,
//                   color: const Color.fromRGBO(51, 51, 51, 1)),
//             )
//           ],
//         ),
//         item['conditions'] == 1 ? 28.hb : 0.hb,
//         item['conditions'] == 1
//             ? Row(
//           children: [
//             Text(
//               '驳回原因',
//               style: TextStyle(
//                   fontSize: 28.sp,
//                   color: const Color.fromRGBO(102, 102, 102, 1)),
//             ),
//             48.wb,
//             Text(
//               item['text'],
//               style: TextStyle(
//                   fontSize: 28.sp,
//                   color: const Color.fromRGBO(51, 51, 51, 1)),
//             )
//           ],
//         )
//             : const SizedBox(),
//
//         28.hb,
//         Row(
//           children: [
//             Text(
//               '审核时间',
//               style: TextStyle(
//                   fontSize: 28.sp,
//                   color: const Color.fromRGBO(102, 102, 102, 1)),
//             ),
//             48.wb,
//             Text(
//               item['time'],
//               style: TextStyle(
//                   fontSize: 28.sp,
//                   color: const Color.fromRGBO(51, 51, 51, 1)),
//             )
//           ],
//         ),
//       ]),
//     ),
//   );
// }

}
