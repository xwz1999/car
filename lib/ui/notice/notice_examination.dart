import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../constants/enums.dart';
import '../../utils/title_drop_widget.dart';
import '../../widget/button/cloud_back_button.dart';

import '../../widget/screen_widget.dart';
import '../../widget/sort_widget.dart';
import '../home/car_manager/car_enum.dart';
import '../user/user_order/status.dart';

import 'examination_list_page.dart';

class ExaminationPage extends StatefulWidget {
  const ExaminationPage({super.key});

  @override
  _ExaminationPageState createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;

  // ReminderApprovalType
  late final EasyRefreshController _examinationRefreshController =
      EasyRefreshController();
  late final EasyRefreshController _refreshController = EasyRefreshController();

  // List<EconomicReleaseModel> releaseList=[];
  late TabController _tabController;
  var examinationState =
      UserTool.userProvider.userInfo.business.roleEM == Role.salesTraffic
          ? ExaminationType.all
          : ReminderApprovalType.all;
  Release _currentType = Release.record;
  TitleScreenControl screenControl = TitleScreenControl();
  List<ChooseItem> _sortList = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    _sortList = Release.values.map((e) => ChooseItem(name: e.typeStr)).toList();
    super.initState();
  }

  List<Widget> get listWidget => [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
              color: kForeGroundColor),
          clipBehavior: Clip.antiAlias,
          child: ScreenWidget(
            pickString: _currentType.typeStr,
            childAspectRatio: 200 / 56,
            callback: (String item, int value) {
              screenControl.screenHide();
              _currentType = Release.values[value];
              // switch (_currentType) {
              //   case Release.record:
              //     _examinationRefreshController.callRefresh();
              //     break;
              //   case Release.modify:
              //     asRefreshController.callRefresh();
              //     break;
              //   case Release.mine:
              //     pRefreshController.callRefresh();
              //     break;
              // }
              // _examinationRefreshController.callRefresh();
              if (mounted) {
                setState(() {});
              }
            },
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 24.w,
            crossAxisCount: 3,
            haveButton: true,
            itemList: _sortList,
          ),
        ),
      ];

  @override
  void dispose() {
    _examinationRefreshController.dispose();
    _refreshController.dispose();
    // asRefreshController.dispose();
    // pRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // appBar: AppBar(
      // )
      // AppBar(
      //   toolbarHeight: 88.w,
      //   backgroundColor: kForeGroundColor,
      //   leading: const CloudBackButton(
      //     isSpecial: true,
      //   ),
      //   title: PreferredSize(
      //       preferredSize: Size.fromHeight(1.w),
      //       child: SizedBox(
      //         child:
      // TabBar(
      //             // indicator:
      //             //     BoxDecoration(borderRadius: BorderRadius.circular(4.w)),
      //             indicatorColor: const Color(0xFF027AFF),
      //             indicatorPadding: EdgeInsets.only(top: 16.w),
      //             //indicatorWeight: 3,
      //             indicatorSize: TabBarIndicatorSize.label,
      //             isScrollable: true,
      //             controller: _tabController,
      //             tabs: [_tab(0, '寄卖合同'), _tab(1, '售车合同')]),
      //       )),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         Get.to(() => const SearchPage());
      //       },
      //       child: Image.asset(Assets.icons.mainSearch.path,
      //           height: 48.w, width: 48.w),
      //     ),
      //   ],
      // ),
      backgroundColor: bodyColor,
      //extendBody: true,
      extendBodyBehindAppBar: true,
      body: Builder(builder: (context) {
        return TitleDropDownWidget([_currentType.typeStr], listWidget,
            height: kToolbarHeight + MediaQuery.of(context).padding.top - 15.w,
            bottomHeight: 30.w,
            screenControl: screenControl,
            headFontSize: 36.sp,
            isSearch: true,
            callback: (text) {
              // _examinationRefreshController.callRefresh();
              // switch (text) {
              //   case '发布车辆':
              //     _examinationRefreshController.callRefresh();
              //     break;
              //   case '修改记录':
              //     _examinationRefreshController.callRefresh();
              //     break;
              //   case '我的审批':
              //     _examinationRefreshController.callRefresh();
              //     break;
              // }
              if (mounted) {
                setState(() {});
              }
            },
            leftWidget: const CloudBackButton(
              isSpecial: true,
            ),
            // screen: '筛选',
            onTap: () {
              screenControl.screenHide();
              Scaffold.of(context).openEndDrawer();
            },
            child: _getCurrentPage());
      }),
      // endDrawer: CustomDrawer(
      //     widthPercent: 0.86,
      //     backgroundColor: Colors.white,
      //     callback: (bool isOpened) {},
      //     child: const SizedBox())

      // ChooseWidget(
      //     carState: true,
      //     callBack: (index) {
      //       _releaseCarStatus = Audit.values[index];
      //       _examinationRefreshController.callRefresh();
      //       setState(() {});
      //     },
      //     items: Audit.values.map((e) => e.typeStr).toList(),
      //     item: _releaseCarStatus.typeStr,
      //   ),
    );

    // Column(
    //   children: [
    //
    //     // ChooseWidget(
    //     //   carState: true,
    //     //   callBack: (index) {
    //     //     _releaseCarStatus = Audit.values[index];
    //     //     _examinationRefreshController.callRefresh();
    //     //     setState(() {});
    //     //   },
    //     //   items: Audit.values.map((e) => e.typeStr).toList(),
    //     //   item: _releaseCarStatus.typeStr,
    //     // ),
    //     // Expanded(
    //     //     child: TabBarView(
    //     //       controller: _tabController,
    //     //       children: [
    //     //
    //     //       ,
    //     //       ,
    //     //       ],
    //     //     ))
    //   ],
    // ));

    //   Scaffold(
    //   appBar: AppBar(
    //     leading: const CloudBackButton(
    //       isSpecial: true,
    //     ),
    //     backgroundColor: kForeGroundColor,
    //     title: Text('审批提醒', style: Theme.of(context).textTheme.headline6),
    //     //leading:  Container(width: 10.w, child: const CloudBackButton()),
    //   ),
    //   extendBody: true,
    //   backgroundColor: kForeGroundColor,
    //   body:
    //
    //
    //   GridView.count(
    //     shrinkWrap: true,
    //     padding: EdgeInsets.only(left: 32.w, right: 32.w),
    //     physics: const NeverScrollableScrollPhysics(),
    //     crossAxisCount: 3,
    //     mainAxisSpacing: 24.w,
    //     //横轴间距
    //     crossAxisSpacing: 40.w,
    //     childAspectRatio: 200 / 176,
    //     children: [
    //       ManagerContainerItem(
    //         text: '出售申请',
    //         num: '0',
    //         onTap: () {
    //         },
    //       ),
    //       ManagerContainerItem(
    //         onTap: () {},
    //         text: '修改申请',
    //         num: '0',
    //       ),
    //       ManagerContainerItem(
    //         onTap: () {},
    //         text: '发布审核',
    //         num: '0',
    //       ),
    //       ManagerContainerItem(
    //         onTap: () {},
    //         text: '收购审核',
    //         num: '0',
    //       ),
    //     ],
    //   ),
    //   // Column(
    //   //   children: [
    //   //     SizedBox(
    //   //       height: kToolbarHeight + 50.w,
    //   //     ),
    //   //     SizedBox(
    //   //       height: 88.w,
    //   //       child: CarWidget(
    //   //           items: _getList(),
    //   //           callBack: (index) {
    //   //             examinationState =
    //   //                 UserTool.userProvider.userInfo.business.roleEM ==
    //   //                         Role.salesTraffic
    //   //                     ? ExaminationType.values[index]
    //   //                     : ReminderApprovalType.values[index];
    //   //             _refreshController.callRefresh();
    //   //           }),
    //   //     ),
    //   //     Expanded(
    //   //         child: EasyRefresh(
    //   //             header: ClassicalHeader(
    //   //                 infoText: '下拉刷新',
    //   //                 refreshedText: '刷新完成',
    //   //                 refreshText: '刷新中....',
    //   //                 refreshReadyText: '下拉刷新',
    //   //                 // refreshFailedText: '11111',
    //   //                 refreshingText: '刷新中....'),
    //   //             firstRefresh: true,
    //   //             controller: _refreshController,
    //   //             onRefresh: () async {},
    //   //             child: ListView.builder(
    //   //               itemBuilder: (context, index) {
    //   //                 return _release(auditList[index]);
    //   //               },
    //   //               itemCount: auditList.length,
    //   //             )))
    //   //   ],
    //   // )
    // );
  }

  _getCurrentPage() {
    switch (_currentType) {
      case Release.record:
        return ExaminationListPage(
          type: 0,
          index: 0,

          // releaseList: releaseList,
          refreshController: _examinationRefreshController, isUpdate: 1,
        );

      case Release.modify:
        return ExaminationListPage(
          type: 0,
          index: 0,
          // releaseList: releaseList,
          refreshController: _examinationRefreshController, isUpdate: 2,
        );

      case Release.mine:
        return ExaminationListPage(
          type: 0,
          index: 2,
          // releaseList: releaseList,
          refreshController: _examinationRefreshController,
          isUpdate: 1, //_examinationRefreshController,
        );
      case Release.modifyExamine:
        return ExaminationListPage(
          type: 0,
          index:2,
          // releaseList: releaseList,
          refreshController: _examinationRefreshController, isUpdate: 2,
        );
    }
  }

  // _tab(int int, String string) {
  //   return Text(
  //     string,
  //     style: TextStyle(
  //         fontSize: BaseStyle.fontSize28, color: BaseStyle.color111111),
  //   );
  // }

//驳回 通过
//   _isPass(int state) {
//     return Row(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
//           margin: EdgeInsets.only(left: 150.w),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.w),
//               color: state == 1
//                   ? const Color(0xFF027AFF).withOpacity(0.1)
//                   : const Color(0xFF999999).withOpacity(0.1)),
//           child: Text(
//             state == 1 ? "待审核" : '已审核',
//             style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                 color: state == 1
//                     ? const Color(0xFF027AFF)
//                     : const Color(0xFF999999)),
//           ),
//         )
//       ],
//     );
//   }
//
//   ///判断列表
//   List<String> _getList() {
//     if (UserTool.userProvider.userInfo.business.roleEM == Role.manager ||
//         UserTool.userProvider.userInfo.business.roleEM == Role.carService ||
//         UserTool.userProvider.userInfo.business.roleEM == Role.settlers) {
//       return ReminderApprovalType.values.map((e) => e.typeStr).toList();
//     } else if (UserTool.userProvider.userInfo.business.roleEM ==
//         Role.salesTraffic) {
//       return ExaminationType.values.map((e) => e.typeStr).toList();
//     } else {
//       return [];
//     }
//   }

  // ///审批提醒 店长身份
  // _release(item) {
  //   return GestureDetector(
  //     onTap: () {
  //       Get.to(() => ExaminationDetails(
  //             state: item['conditionsState'],
  //             auditState: item['noPass'],
  //             reasonText: item['reasonText'],
  //           ));
  //       // showModalBottomSheet(
  //       //     context: context,
  //       //     isDismissible: true,
  //       //     isScrollControlled: true,
  //       //     shape: const RoundedRectangleBorder(
  //       //         borderRadius: BorderRadius.only(
  //       //             topLeft: Radius.circular(15),
  //       //             topRight: Radius.circular(15))),
  //       //     builder: (BuildContext context) {
  //       //       return Container(
  //       //         width: double.infinity,
  //       //         height: 500.w,
  //       //         decoration: BoxDecoration(
  //       //             color: BaseStyle.colorf6f6f6,
  //       //             borderRadius: BorderRadius.all(Radius.circular(16.w))),
  //       //         child: Column(
  //       //           crossAxisAlignment: CrossAxisAlignment.center,
  //       //           children: [
  //       //             Row(
  //       //               children: [
  //       //                 GestureDetector(
  //       //                   onTap: () {
  //       //                     Get.back();
  //       //                   },
  //       //                   child: Container(
  //       //                     padding: EdgeInsets.all(32.w),
  //       //                     child: Text(
  //       //                       '拒绝',
  //       //                       style: TextStyle(
  //       //                           color: const Color(0xFF999999),
  //       //                           fontSize: 28.sp),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 Expanded(
  //       //                   child: Text(
  //       //                     '车辆确认',
  //       //                     textAlign: TextAlign.center,
  //       //                     style: TextStyle(
  //       //                         color: const Color(0xFF111111),
  //       //                         fontSize: 32.sp),
  //       //                   ),
  //       //                 ),
  //       //                 GestureDetector(
  //       //                   onTap: () {
  //       //                     Get.back();
  //       //                   },
  //       //                   child: Container(
  //       //                     padding: EdgeInsets.all(32.w),
  //       //                     child: Text(
  //       //                       '同意',
  //       //                       style: TextStyle(
  //       //                           color: const Color(0xFF027AFF),
  //       //                           fontSize: 28.sp),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ],
  //       //             ),
  //       //             Text(
  //       //               '客户对你的这辆车有购买意愿，是否同意出售',
  //       //               style: TextStyle(
  //       //                   color: const Color(0xFF333333), fontSize: 28.sp),
  //       //             ),
  //       //             Container(
  //       //               margin: EdgeInsets.all(24.w),
  //       //               decoration: BoxDecoration(
  //       //                 boxShadow: [
  //       //                   BoxShadow(
  //       //                     offset: Offset(10.w, 17.w),
  //       //                     blurRadius: 10.w,
  //       //                     spreadRadius: -10.w,
  //       //                     color: const Color(0x33027AFF),
  //       //                   )
  //       //                 ],
  //       //               ),
  //       //               child: CarItemWidget(
  //       //                 widgetPadding: EdgeInsets.all(24.w),
  //       //                 name: '奥迪A8',
  //       //                 time: '2022-11-04',
  //       //                 distance: '2万公里',
  //       //                 standard: '国六',
  //       //                 url: '',
  //       //                 price: '27.43',
  //       //               ),
  //       //             ),
  //       //           ],
  //       //         ),
  //       //       );
  //       //     });
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
  //       margin: EdgeInsets.only(top: 10.w, left: 32.w, right: 32.w),
  //       padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
  //       child: Column(children: [
  //         Row(
  //           children: [
  //             Text(
  //               ReminderApprovalType.getValue(item['conditionsState']).typeStr,
  //               style: TextStyle(
  //                   fontSize: 32.sp,
  //                   color: const Color.fromRGBO(51, 51, 51, 1)),
  //             ),
  //             const Spacer(),
  //             _isPass(item['noPass'])
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
  //               item['conditionsState'] == 1 || item['conditionsState'] == 3
  //                   ? '发布时间'
  //                   : '审核时间',
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
  //         item['conditionsState'] == 1 ? 28.hb : 0.hb,
  //         item['reasonText'] != ''
  //             ? Row(
  //                 children: [
  //                   item['reasonText'] == ''
  //                       ? const SizedBox()
  //                       : Text(
  //                           '驳回原因',
  //                           style: TextStyle(
  //                               fontSize: 28.sp,
  //                               color: const Color.fromRGBO(102, 102, 102, 1)),
  //                         ),
  //                   48.wb,
  //                   Flexible(
  //                       child: Text(
  //                     item['reasonText'],
  //                     style: TextStyle(
  //                         fontSize: 28.sp,
  //                         color: const Color.fromRGBO(51, 51, 51, 1)),
  //                   ))
  //                 ],
  //               )
  //             : const SizedBox(),
  //       ]),
  //     ),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;

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
