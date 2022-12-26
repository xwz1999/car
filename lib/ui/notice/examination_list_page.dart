// import 'package:cloud_car/model/user/user_info_model.dart';
// import 'package:cloud_car/utils/headers.dart';
// import 'package:cloud_car/utils/user_tool.dart';
// import 'package:cloud_car/widget/button/cloud_back_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
//
// import '../../constants/enums.dart';
// import '../../utils/title_drop_widget.dart';
// import '../../widget/car_widget.dart';
// import '../../widget/screen_widget.dart';
// import '../../widget/sort_widget.dart';
// import '../home/manager_container_item.dart';
// import '../user/user_order/status.dart';
// import 'examination_details.dart';
// import 'examination_widget.dart';
//
// class ExaminationListPage extends StatefulWidget {
//   final ReminderApprovalType approvalType;
//
//   const ExaminationListPage({super.key, required this.approvalType});
//
//   @override
//   _ExaminationListPageState createState() => _ExaminationListPageState();
// }
//
// class _ExaminationListPageState extends State<ExaminationListPage> {
//   late final EasyRefreshController _refreshController = EasyRefreshController();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   late List<String> _dropDownHeaderItemStrings1;
//   bool isClick = false;
//   String orderName = '';
//   TitleScreenControl screenControl1 = TitleScreenControl();
//   List<Widget> listWidget = []; //创建方法列表
//   List<ChooseItem> get _sortList =>
//       UserTool.userProvider.userInfo.business.businessAscription ==
//           BusinessAscription.normal
//           ? [
//         ChooseItem(name: '出售申请'),
//         ChooseItem(name: '修改申请'),
//         ChooseItem(name: '发布申请'),
//         ChooseItem(name: '收购申请'),
//       ]
//           : [
//         ChooseItem(name: '出售申请'),
//         ChooseItem(name: '收购申请'),
//       ];
//
//
//   var examinationState =
//       UserTool.userProvider.userInfo.business.roleEM == Role.salesTraffic
//           ? ExaminationType.all
//           : ReminderApprovalType.all;
//
//   @override
//   void initState() {
//     _dropDownHeaderItemStrings1 = [
//       widget.approvalType.typeStr,
//     ];
//     listWidget = [
//       Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(16.w)),
//             color: kForeGroundColor),
//         clipBehavior: Clip.antiAlias,
//         child: ScreenWidget(
//           pickString: '',
//           childAspectRatio: 200 / 56,
//           callback: (String item, int value) {
//             _dropDownHeaderItemStrings1 = [item];
//             isClick = true;
//             orderName = item;
//             screenControl1.screenHide();
//             setState(() {});
//           },
//           mainAxisSpacing: 10.w,
//           crossAxisSpacing: 24.w,
//           crossAxisCount: 3,
//           itemList: _sortList,
//         ),
//       ),
//     ];
//     super.initState();
//   }
//   @override
//   void dispose() {
//     _refreshController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//         value: const SystemUiOverlayStyle(
//           statusBarIconBrightness: Brightness.dark,
//         ),
//         child: Scaffold(
//           key: _scaffoldKey,
//           //backgroundColor: Colors.red,
//           extendBodyBehindAppBar: true,
//           extendBody: true,
//           body: TitleDropDownWidget(
//               _dropDownHeaderItemStrings1, listWidget,
//               isSearch: false,
//               height: kToolbarHeight * 2,
//               bottomHeight: 30.w,
//               headFontSize: 36.sp,
//               leftWidget: const CloudBackButton(
//                 isSpecial: true,
//               ),
//               screenControl: screenControl1,
//               child: _get(
//                   isClick ? orderName : widget.approvalType.typeStr)),
//         ));
//
//
//
//     //   Scaffold(
//     //   appBar: AppBar(
//     //     leading: const CloudBackButton(
//     //       isSpecial: true,
//     //     ),
//     //     backgroundColor: kForeGroundColor,
//     //     title: Text('审批提醒', style: Theme.of(context).textTheme.headline6),
//     //     //leading:  Container(width: 10.w, child: const CloudBackButton()),
//     //   ),
//     //   extendBody: true,
//     //   backgroundColor: kForeGroundColor,
//     //   body: GridView.count(
//     //     shrinkWrap: true,
//     //     padding: EdgeInsets.only(left: 32.w, right: 32.w),
//     //     physics: const NeverScrollableScrollPhysics(),
//     //     crossAxisCount: 3,
//     //     mainAxisSpacing: 24.w,
//     //     //横轴间距
//     //     crossAxisSpacing: 40.w,
//     //     childAspectRatio: 200 / 176,
//     //     children: [
//     //
//     //     ],
//     //   ),
//     // );
//   }
//
//
//   _get(String status){
//     switch(status){
//       case '出售申请':
//         return ExaminationWidget();
//     }
//   }
// }
