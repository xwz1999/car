import 'package:cloud_car/base/base_style.dart';
import 'package:cloud_car/gen/assets.gen.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

import 'citylist_custom_header_page.dart';

class DirectSaleManagerPage extends StatefulWidget {
  const DirectSaleManagerPage({Key? key}) : super(key: key);

  @override
  _DirectSaleManagerPageState createState() => _DirectSaleManagerPageState();
}

class _DirectSaleManagerPageState extends State<DirectSaleManagerPage> {
  final List<String> _dropDownHeaderItemStrings = [
    '城市',
    '品牌',
    '价格',
    '排序',
  ];
  final GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();
  List<dynamic>? data;
  List<Widget> listWidget = [];
  ScreenControl screenControl = ScreenControl();

  final GlobalKey _stackKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey _headKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    listWidget = [
      CityListCustomHeaderPage(),
      Container(color: Colors.red,width: double.infinity,height: 500.w,),
      Container(color: Colors.blue,width: double.infinity,height: 500.w,),
      Container(color: Colors.yellow,width: double.infinity,height: 500.w,),];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,

          title: Text('直卖车辆',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        endDrawer: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 4, top: 0),
          color: Colors.white,
//        child: Container(color: Colors.red,child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: TextField(),
//        ),),
          child: ListView(
            children: <Widget>[
              TextField(),
            ],
          ),
        ),
        backgroundColor: Color(0xFFF6F6F6),
        extendBody: true,
        body: DropDownWidget(
          _dropDownHeaderItemStrings,
          listWidget,
          height: 80.r,
          bottomHeight: 400.r,
          screenControl: screenControl,
          headFontSize: 16.sp,
          child: Container(
            margin: EdgeInsets.only(top: 80.r),
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(15.r),
                child: Text("item $index"),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xffeeeeee), width: 0.4.r))),
              );
            }),
          ),
          screen: '筛选',
        ));
//         Stack(
//           key: _stackKey,
//           children: [
//             Column(
//               children: [
//                 Container(
//                   color: Colors.white,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                           child: GestureDetector(
//                         onTap: () {
//                           _showCity();
//                         },
//                         child: getTitle(
//                           '城市',
//                         ),
//                       )),
//                       Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               _showCity();
//                             },
//                             child: getTitle(
//                               '品牌',
//                             ),
//                           )),
//                       Container(
//                         alignment: Alignment.center,
//                         //padding: EdgeInsets.only(top: 20.w),
//                         key: _headKey,
//                         color: Colors.red,
//                         height: 20.w,
//                         width: MediaQuery.of(context).size.width / 5 * 3,
//                         child: GZXDropDownHeader(
//                           // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
//                           items: [
//                             // GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
//                             // GZXDropDownHeaderItem(
//                             //   _dropDownHeaderItemStrings[1],
//                             //   style: TextStyle(
//                             //     fontSize: 28.sp,
//                             //   ),
//                             //   iconData: Icons.keyboard_arrow_down,
//                             //   iconDropDownData: Icons.keyboard_arrow_up,
//                             // ),
//                             GZXDropDownHeaderItem(
//                               _dropDownHeaderItemStrings[2],
//                               iconData: Icons.arrow_upward,
//                               iconDropDownData: Icons.arrow_downward,
//                             ),
//                             GZXDropDownHeaderItem(
//                               _dropDownHeaderItemStrings[3],
//                               iconData: Icons.arrow_upward,
//                               iconDropDownData: Icons.arrow_downward,
//                             ),
//                           ],
//                           // GZXDropDownHeader对应第一父级Stack的key
//                           stackKey: _stackKey,
//                           // controller用于控制menu的显示或隐藏
//                           controller: _dropdownMenuController,
//                           // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
//                           onItemTap: (index) {},
// //                // 头部的高度
// //                height: 40,
// //                // 头部背景颜色
// //                color: Colors.red,
// //                // 头部边框宽度
// //                borderWidth: 1,
// //                // 头部边框颜色
//
//                           borderColor: Colors.transparent,
// //                // 分割线高度
// //                dividerHeight: 20,
// //                // 分割线颜色
//                           dividerColor: Colors.transparent,
// //                // 文字样式
//                           style: Theme.of(context).textTheme.subtitle2 ??
//                               TextStyle(
//                                 fontSize: 28.sp,
//                                 color: const Color(0xFF333333),
//                               ),
// //                // 下拉时文字样式
//                           dropDownStyle: TextStyle(
//                             fontSize: 28.sp,
//                             color: Theme.of(context).primaryColor,
//                           ),
// //                // 图标大小
// //                iconSize: 20,
// //                // 图标颜色
// //                iconColor: Color(0xFFafada7),
// //                // 下拉时图标颜色
// //                iconDropDownColor: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                       Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               _showDrawn();
//                             },
//                             child: getTitle(
//                               '筛选',
//                             ),
//                           )),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.separated(
//                       shrinkWrap: true,
//                       //physics: NeverScrollableScrollPhysics(),
//                       //padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 32.w),
//                       padding:
//                           EdgeInsets.only(top: 10.w, left: 24.w, right: 24.w),
//                       itemBuilder: (context, index) {
//                         return  CarItemWidget(
//                           price: '27.43万',
//                           url: Assets.icons.customerCare.path,
//                           distance: '20.43万公里',
//                           standard: '国六',
//                           name: '奥迪Q3 2020款 35 TFSI 进取型SUV',
//                           time: '2020年10月',
//                         );
//                       },
//                       separatorBuilder: (_, __) {
//                         return 16.hb;
//                       },
//                       itemCount: 6),
//                 ),
//               ],
//             ),
//             GZXDropDownMenu(
//               // controller用于控制menu的显示或隐藏
//               controller: _dropdownMenuController,
//               // 下拉菜单显示或隐藏动画时长
//               animationMilliseconds: 300,
//               // 下拉后遮罩颜色
// //          maskColor: Theme.of(context).primaryColor.withOpacity(0.5),
// //          maskColor: Colors.red.withOpacity(0.5),
//               dropdownMenuChanging: (isShow, index) {
//                 setState(() {});
//               },
//               dropdownMenuChanged: (isShow, index) {
//                 setState(() {});
//               },
//               // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
//               menus: [
//                 GZXDropdownMenuBuilder(
//                     dropDownHeight: 700.w,
//                     dropDownWidget: Container(
//                       height: 700.w,
//                       color: Colors.red,
//                       width: double.infinity,
//                     )),
//                 GZXDropdownMenuBuilder(
//                     dropDownHeight: 700.w, dropDownWidget: SizedBox()),
//               ],
//             ),
//           ],
//         ));
  }

  getTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        color: Colors.white,
        height: 70.w,
        alignment: Alignment.center,
        // width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 20.wb,
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                //  Icon(
                //   Icons.keyboard_arrow_down,
                //   color: Color(0xFFafada7),
                //   size: 20,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCity() {
    if (_dropdownMenuController.isShow) {
      _dropdownMenuController.hide();
    }
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height - 220.w,
              child: CityListCustomHeaderPage());
        });
  }

  void _showDrawn() {
    if (_dropdownMenuController.isShow) {
      _dropdownMenuController.hide();
    }

    _scaffoldKey.currentState!.openEndDrawer();
  }
}
