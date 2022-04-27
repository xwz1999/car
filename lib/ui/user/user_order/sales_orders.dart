// ignore_for_file: non_constant_identifier_names, unused_field
import 'package:cloud_car/ui/user/user_order/dealer_consignment_order.dart/dealer_consignment_order_page.dart';
import 'package:cloud_car/ui/user/user_order/rentalcar_order/rentalcar_page.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/sales_order_page.dart';
import 'package:cloud_car/ui/user/user_order/thatcar_order/thatcar_order_page.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_order_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/title_drop_widget.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SalesOrder extends StatefulWidget {
  const SalesOrder({Key? key}) : super(key: key);

  @override
  State<SalesOrder> createState() => _SalesOrderState();
}

class _SalesOrderState extends State<SalesOrder> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<String> _dropDownHeaderItemStrings1;
  TitleScreenControl screenControl1 = TitleScreenControl();
  List<Widget> listWidget = []; //创建方法列表
  final List<ChooseItem> _sortList = [
    ChooseItem(name: '售卖订单'),
    ChooseItem(name: '个人寄卖'),
    ChooseItem(name: '租车订单'),
    ChooseItem(name: '叫车订单'),
    ChooseItem(name: '车商寄卖'),
  ];
  late String title = '售车订单';

  List carList = [
    {
      'judge': false,
      'judgename': '待预定',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '需付定金',
      'pice': '1.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '已预定',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '已付订单',
      'pice': '1.00',
      'buttomname': '',
    },
    {
      'judge': true,
      'judgename': '待检测',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '已付定金',
      'pice': '1.00',
      'buttomname': '上传报告',
    },
    {
      'judge': false,
      'judgename': '支付首付',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '需付首付',
      'pice': '10.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '支付首付',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '已付首付',
      'pice': '10.00',
      'buttomname': '',
    },
    {
      'judge': true,
      'judgename': '待过户',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '已付首付',
      'pice': '10.00',
      'buttomname': '上传资料',
    },
    {
      'judge': false,
      'judgename': '支付尾款',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '需付尾款',
      'pice': '19.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '支付尾款',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '已付尾款',
      'pice': '19.00',
      'buttomname': '',
    },
    {
      'judge': true,
      'judgename': '支付尾款',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '已付尾款',
      'pice': '19.00',
      'buttomname': '成交订单',
    },
    {
      'judge': false,
      'judgename': '成交订单',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '已付尾款',
      'pice': '19.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '交易取消',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'picename': '',
      'pice': '',
      'buttomname': '',
    },
  ];
  @override
  void initState() {
    super.initState();
    _dropDownHeaderItemStrings1 = [
      '售卖订单',
    ];
    listWidget = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(
          pickString: '',
          childAspectRatio: 200 / 56,
          callback: (String item) {
            _dropDownHeaderItemStrings1 = [item];
            screenControl1.screenHide();
            setState(() {});
          },
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 3,
          itemList: _sortList,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          key: _scaffoldKey,
          //backgroundColor: Colors.red,
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Container(
            color: bodyColor,
            //padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: TitleDropDownWidget(
                        _dropDownHeaderItemStrings1, listWidget,
                        isBackColor: false,
                        isSearch: true,
                        height: kToolbarHeight,
                        bottomHeight: 24.w,
                        headFontSize: 36.sp,
                        leftWidget: const CloudBackButton(
                          isSpecial: true,
                        ),
                        screenControl: screenControl1,
                        child: get()))
              ],
            ),
          ),
        ));
  }

  get() {
    switch (_dropDownHeaderItemStrings1.first) {
      case '售卖订单':
        return SalesOrderPage(callBack: () {
          _scaffoldKey.currentState?.openDrawer();
        });
        // ignore: dead_code
        break;
      case '个人寄卖':
        return ConsignmentOrderPage(callBack: () {
          _scaffoldKey.currentState?.openDrawer();
        });
        // ignore: dead_code
        break;
      case '租车订单':
        return RentalcarOrderPage(callBack: () {
          _scaffoldKey.currentState?.openDrawer();
        });
        // ignore: dead_code
        break;
      case '叫车订单':
        return ThatcarOrderPage(callBack: () {
          _scaffoldKey.currentState?.openDrawer();
        });
        // ignore: dead_code
        break;
      case '车商寄卖':
        return DealerConsignmentOrderPage(callBack: () {
          _scaffoldKey.currentState?.openDrawer();
        });
        // ignore: dead_code
        break;
    }
  }

  // getCar(item) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
  //     child: GestureDetector(
  //       onTap: () {
  //         switch (item['judgename']) {
  //           case '待预定':
  //             Get.to(() => const Reservation(
  //                   stat: '待预定',
  //                   judge: false,
  //                 ));
  //             break;
  //           case '已预定':
  //             Get.to(() => const Reservation(
  //                   stat: '待预定',
  //                   judge: true,
  //                 ));
  //             break;
  //           case '待检测':
  //             Get.to(() => const Reservation(
  //                   stat: '待检测',
  //                   judge: true,
  //                 ));
  //             break;
  //           case '支付首付':
  //             switch (item['picename']) {
  //               case '需付首付':
  //                 Get.to(() => const Reservation(
  //                       stat: '支付首付',
  //                       judge: false,
  //                     ));
  //                 break;
  //               case '已付首付':
  //                 Get.to(() => const Reservation(
  //                       stat: '支付首付',
  //                       judge: true,
  //                     ));
  //                 break;
  //             }

  //             break;
  //           case '待过户':
  //             Get.to(() => const Reservation(
  //                   stat: '待过户',
  //                   judge: true,
  //                 ));
  //             break;
  //           case '支付尾款':
  //             switch (item['picename']) {
  //               case '需付尾款':
  //                 Get.to(() => const Reservation(
  //                       stat: '支付尾款',
  //                       judge: false,
  //                     ));
  //                 break;
  //               case '已付尾款':
  //                 Get.to(() => const Reservation(
  //                       stat: '支付尾款',
  //                       judge: true,
  //                     ));
  //                 break;
  //             }
  //             break;
  //           case '成交订单':
  //             Get.to(() => const MakeDealData(,));
  //             break;
  //           case '交易取消':
  //             Get.to(() => const TransactionCancelled());
  //             break;
  //         }
  //       },
  //       child: Container(
  //           padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
  //           decoration: BoxDecoration(
  //               color: kForeGroundColor,
  //               borderRadius: BorderRadius.circular(16.w)),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.only(left: 0.w),
  //                 child: Text(
  //                   item['judgename'],
  //                   style: TextStyle(
  //                       color: item['judgename'] != '交易取消'
  //                           ? const Color(0xFF027AFF)
  //                           : const Color(0xFF666666),
  //                       fontSize: BaseStyle.fontSize28),
  //                 ),
  //               ),
  //               // 24.hb,
  //               Row(
  //                 children: [
  //                   SizedBox(
  //                     width: 196.w,
  //                     height: 150.w,
  //                     child: Image.asset(item['url']),
  //                   ),
  //                   20.wb,
  //                   SizedBox(
  //                     width: 406.w,
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       children: [
  //                         Text(item['title'],
  //                             style: TextStyle(
  //                                 fontSize: BaseStyle.fontSize28,
  //                                 color: BaseStyle.color111111)),
  //                         32.hb,
  //                         Padding(
  //                           padding: EdgeInsets.only(right: 16.w),
  //                           child: getText('过户0次', '2020年10月', '20.43万公里',
  //                               item['judgename']),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               40.hb,
  //               SizedBox(
  //                   child: item['judge']
  //                       ? Column(
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.end,
  //                               children: [
  //                                 SizedBox(
  //                                   child: Text(
  //                                     '车辆总价',
  //                                     style: TextStyle(
  //                                         fontSize: BaseStyle.fontSize28,
  //                                         color: BaseStyle.color999999),
  //                                   ),
  //                                 ),
  //                                 16.wb,
  //                                 SizedBox(
  //                                   child: Text.rich(TextSpan(children: [
  //                                     TextSpan(
  //                                         text: '30.00',
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2),
  //                                     TextSpan(
  //                                         text: '万',
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2),
  //                                   ])),
  //                                 ),
  //                                 56.wb,
  //                                 SizedBox(
  //                                   child: Text(
  //                                     item['picename'],
  //                                     style: TextStyle(
  //                                         fontSize: BaseStyle.fontSize28,
  //                                         color: BaseStyle.color999999),
  //                                   ),
  //                                 ),
  //                                 16.wb,
  //                                 SizedBox(
  //                                   child: Text.rich(TextSpan(children: [
  //                                     TextSpan(
  //                                         text: item['pice'],
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2
  //                                             ?.copyWith(
  //                                                 color:
  //                                                     const Color(0xFFFF3B02))),
  //                                     TextSpan(
  //                                         text: '万',
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2
  //                                             ?.copyWith(
  //                                                 color:
  //                                                     const Color(0xFFFF3B02))),
  //                                   ])),
  //                                 ),
  //                               ],
  //                             ),
  //                             32.hb,
  //                             GestureDetector(
  //                               onTap: () {
  //                                 switch (item['buttomname']) {
  //                                   case '成交订单':
  //                                     Get.to(() => const MakeDeal());
  //                                     break;
  //                                   default:
  //                                 }
  //                               },
  //                               child: Container(
  //                                   width: 168.w,
  //                                   height: 68.w,
  //                                   padding:
  //                                       EdgeInsets.only(left: 28.w, top: 14.w),
  //                                   decoration: BoxDecoration(
  //                                       color: const Color(0xFF027AFF),
  //                                       borderRadius:
  //                                           BorderRadius.circular(8.w)),
  //                                   child: Text(
  //                                     item['buttomname'],
  //                                     style: TextStyle(
  //                                         color: kForeGroundColor,
  //                                         fontSize: BaseStyle.fontSize28),
  //                                   )),
  //                             )
  //                           ],
  //                         )
  //                       : item['judgename'] != '交易取消'
  //                           ? Row(
  //                               mainAxisAlignment: MainAxisAlignment.end,
  //                               children: [
  //                                 SizedBox(
  //                                   child: Text(
  //                                     '车辆总价',
  //                                     style: TextStyle(
  //                                         fontSize: BaseStyle.fontSize28,
  //                                         color: BaseStyle.color999999),
  //                                   ),
  //                                 ),
  //                                 16.wb,
  //                                 SizedBox(
  //                                   child: Text.rich(TextSpan(children: [
  //                                     TextSpan(
  //                                         text: '30.00',
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2),
  //                                     TextSpan(
  //                                         text: '万',
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2),
  //                                   ])),
  //                                 ),
  //                                 56.wb,
  //                                 SizedBox(
  //                                   child: Text(
  //                                     item['picename'],
  //                                     style: TextStyle(
  //                                         fontSize: BaseStyle.fontSize28,
  //                                         color: BaseStyle.color999999),
  //                                   ),
  //                                 ),
  //                                 16.wb,
  //                                 SizedBox(
  //                                   child: Text.rich(TextSpan(children: [
  //                                     TextSpan(
  //                                         text: item['pice'],
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2
  //                                             ?.copyWith(
  //                                                 color:
  //                                                     const Color(0xFFFF3B02))),
  //                                     TextSpan(
  //                                         text: '万',
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2
  //                                             ?.copyWith(
  //                                                 color:
  //                                                     const Color(0xFFFF3B02))),
  //                                   ])),
  //                                 ),
  //                               ],
  //                             )
  //                           : Row(
  //                               mainAxisAlignment: MainAxisAlignment.end,
  //                               children: [
  //                                 SizedBox(
  //                                   child: Text(
  //                                     '车辆总价',
  //                                     style: TextStyle(
  //                                         fontSize: BaseStyle.fontSize28,
  //                                         color: BaseStyle.color999999),
  //                                   ),
  //                                 ),
  //                                 16.wb,
  //                                 SizedBox(
  //                                   child: Text.rich(TextSpan(children: [
  //                                     TextSpan(
  //                                         text: '30.00',
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2),
  //                                     TextSpan(
  //                                         text: '万',
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .subtitle2),
  //                                   ])),
  //                                 ),
  //                               ],
  //                             )),
  //             ],
  //           )),
  //     ),
  //   );
  // }

  getText(String num, String time, String distance, String conditions) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: conditions != '交易取消'
                  ? const Color(0xFF027AFF).withOpacity(0.08)
                  : const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20,
                color: conditions != '交易取消'
                    ? const Color(0xFF027AFF)
                    : const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            time,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            distance,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        )
        // Padding(padding: EdgeInsets.symmetric(horizontal: 24.w)),
        // Chip(
        //   label: Text(num),
        //   labelPadding: EdgeInsets.only(left: 8.w, top: 8.w),
        //   backgroundColor: const Color(0xFF027AFF).withOpacity(0.08),
        //   labelStyle: TextStyle(
        //       fontSize: BaseStyle.fontSize20, color: const Color(0xFF027AFF)),
        //   shape:
        //       BeveledRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        // ),
        // ChipTheme(
        //     data: ChipThemeData(
        //       backgroundColor: const Color(0xFF4F5A74).withOpacity(0.08),
        //       labelStyle: TextStyle(
        //           fontSize: BaseStyle.fontSize20,
        //           color: const Color(0xFF4F5A74)),
        //       shape: BeveledRectangleBorder(
        //           borderRadius: BorderRadius.circular(4.w)),
        //       labelPadding: EdgeInsets.only(left: 8.w, top: 8.w),
        //     ),
        //     child: Wrap(
        //       children: [Chip(label: Text(time)), Chip(label: Text(distance))],
        //     ))
      ],
    );
  }
}
