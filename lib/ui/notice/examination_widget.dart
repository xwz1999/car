// import 'package:flutter/material.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
//
// import '../../widget/sort_widget.dart';
// import '../user/user_order/status.dart';
//
// class ExaminationWidget extends StatefulWidget {
//   const ExaminationWidget({Key? key}) : super(key: key);
//
//   @override
//   _ExaminationWidgetState createState() => _ExaminationWidgetState();
// }
//
// class _ExaminationWidgetState extends State<ExaminationWidget> {
//   final EasyRefreshController _easyRefreshController = EasyRefreshController();
//   List<Widget> listWidget = []; //创建方法列表
//   final List<ChooseItem> _sortList = [];
//   // List<> _salesList = [];
//   int _page = 1;
//   final int _size = 10;
//   var a = 0;
//
//   OrderSaleSearchStatus _currentStatus = OrderSaleSearchStatus.all;
//
//   Map<String, dynamic> get _params => {
//     'page': _page,
//     'size': _size,
//     'status': _currentStatus.typeNum,
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Text('d');
//   }
// }
