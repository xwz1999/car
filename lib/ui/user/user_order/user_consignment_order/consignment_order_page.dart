import 'package:cloud_car/ui/user/user_order/rentalcar_order/rentalcar_page.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/make_deal.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/sales_orders_page.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/transaction_cancelled.dart';
import 'package:cloud_car/ui/user/user_order/thatcar_order/thatcar_order_page.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_audit.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_rejected.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_release.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_sale.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_signed.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_sold.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../../widget/button/cloud_back_button.dart';
import '../../../../widget/car_widget.dart';

class ConsignmentOrderPage extends StatefulWidget {
  const ConsignmentOrderPage({Key? key}) : super(key: key);

  @override
  State<ConsignmentOrderPage> createState() => _ConsignmentOrderPageState();
}

class _ConsignmentOrderPageState extends State<ConsignmentOrderPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> listWidget = []; //创建方法列表
  //List<ChooseItem> _sortList = [];
  late String title = '寄卖订单';
  ScreenControl screenControl = ScreenControl();
  List carList = [
    {
      'judge': false,
      'judgename': '待签订',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      //'picename': '需付定金',
      //'pice': '1.00',
      'buttomname': '',
    },
    {
      'judge': true,
      'judgename': '待发布',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      //'picename': '已付定金',
      //'pice': '1.00',
      'buttomname': '发布车辆',
    },
    {
      'judge': false,
      'judgename': '审核中',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      //'picename': '需付首付',
      //'pice': '10.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '已驳回',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      //'picename': '已付首付',
      //'pice': '10.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '在售',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      //'picename': '需付尾款',
      //'pice': '19.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '已售',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      // 'picename': '支付尾款',
      //'pice': '19.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '交易取消',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      //'picename': '',
      //'pice': '',
      'buttomname': '',
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _sortList = [
    //   ChooseItem(name: '售车订单'),
    //   ChooseItem(name: '寄卖订单'),
    //   ChooseItem(name: '租车订单'),
    //   ChooseItem(name: '租车订单')
    // ];
    // listWidget = [
    //   Container(
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(16.w)),
    //         color: kForeGroundColor),
    //     clipBehavior: Clip.antiAlias,
    //     child: ScreenWidget(
    //       childAspectRatio: 144 / 56,
    //       callback: (String item) {},
    //       mainAxisSpacing: 10.w,
    //       crossAxisSpacing: 24.w,
    //       crossAxisCount: 3,
    //       haveButton: true,
    //       itemList: _sortList,
    //     ),
    //   ),
    // ];
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
        title: SizedBox(
          width: 200.w,
          child: PopupMenuButton(
              offset: const Offset(20, 25),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34.sp,
                        color: const Color(0xFF333333),
                      )),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black87,
                    size: 40.w,
                  ),
                ],
              ),
              onSelected: (String value) {
                setState(() {
                  title = value;
                  setState(() {
                    switch (title) {
                      case '售车订单':
                        Get.to(() => const SalesOrders());
                        break;
                      case '寄卖订单':
                        Get.to(() => const ConsignmentOrderPage());
                        break;
                      case '租车订单':
                        Get.to(() => const RentalcarOrderPage());
                        break;
                      case '叫车订单':
                        Get.to(() => const ThatcarOrderPage());
                        break;
                    }
                  });
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem(
                        value: "售车订单",
                        child: Text("售车订单",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              color: const Color(0xFF333333),
                            ))),
                    PopupMenuItem(
                        value: "寄卖订单",
                        child: Text("寄卖订单",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              color: const Color(0xFF333333),
                            ))),
                    PopupMenuItem(
                        value: "租车订单",
                        child: Text("租车订单",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              color: const Color(0xFF333333),
                            ))),
                    PopupMenuItem(
                        value: "叫车订单",
                        child: Text("叫车订单",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              color: const Color(0xFF333333),
                            ))),
                  ]),
        ),
      ),
      extendBody: true,
      backgroundColor: bodyColor,
      body: Column(
        children: [
          CarWidget(
              items: const [
                '全部',
                '待签订',
                '待发布',
                '审核中',
                '已驳回',
                '在售',
                '已售',
                '交易取消'
              ],
              callBack: (name) {
                setState(() {});
              }),
          16.hb,
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return getCar(carList[index]);
                },
                itemCount: carList.length),
          ),
        ],
      ),
    );
  }

  getCar(item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: GestureDetector(
        onTap: () {
          switch (item['judgename']) {
            case '待签订':
              Get.to(() => const ConsignmentSigned());
              break;
            case '待发布':
              Get.to(() => const ConsignmentRelease());
              break;
            case '审核中':
              Get.to(() => const ConsignmentAudit());
              break;
            case '已驳回':
              Get.to(() => const ConsignmentRejected());
              break;
            case '在售':
              Get.to(() => const ConsignmentSale());
              break;
            case '已售':
              Get.to(() => const ConsignmentSold());
              break;
            case '交易取消':
              Get.to(() => const TransactionCancelled());
              break;
          }
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            decoration: BoxDecoration(
                color: kForeGroundColor,
                borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Text(
                    item['judgename'],
                    style: TextStyle(
                        color: getColor(item['judgename']),
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                // 24.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 196.w,
                      height: 150.w,
                      child: Image.asset(item['url']),
                    ),
                    20.wb,
                    SizedBox(
                      width: 406.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(item['title'],
                              style: TextStyle(
                                  fontSize: BaseStyle.fontSize28,
                                  color: BaseStyle.color111111)),
                          32.hb,
                          Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: getText('2020年10月', '20.43万公里'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                32.hb,
                SizedBox(
                    child: item['judge']
                        ? Padding(
                            padding: EdgeInsets.only(left: 452.w),
                            child: GestureDetector(
                              onTap: () {
                                switch (item['buttomname']) {
                                  case '成交订单':
                                    Get.to(() => const MakeDeal());
                                    break;
                                  default:
                                }
                              },
                              child: Container(
                                  width: 168.w,
                                  height: 68.w,
                                  padding:
                                      EdgeInsets.only(left: 28.w, top: 14.w),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF027AFF),
                                      borderRadius: BorderRadius.circular(8.w)),
                                  child: Text(
                                    item['buttomname'],
                                    style: TextStyle(
                                        color: kForeGroundColor,
                                        fontSize: BaseStyle.fontSize28),
                                  )),
                            ),
                          )
                        : get()
                    //item['judgename'] != '交易取消'
                    //     ? Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           SizedBox(
                    //             child: Text(
                    //               '车辆总价',
                    //               style: TextStyle(
                    //                   fontSize: BaseStyle.fontSize28,
                    //                   color: BaseStyle.color999999),
                    //             ),
                    //           ),
                    //           16.wb,
                    //           SizedBox(
                    //             child: Text.rich(TextSpan(children: [
                    //               TextSpan(
                    //                   text: '30.00',
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .subtitle2),
                    //               TextSpan(
                    //                   text: '万',
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .subtitle2),
                    //             ])),
                    //           ),
                    //           56.wb,
                    //           SizedBox(
                    //             child: Text(
                    //               item['picename'],
                    //               style: TextStyle(
                    //                   fontSize: BaseStyle.fontSize28,
                    //                   color: BaseStyle.color999999),
                    //             ),
                    //           ),
                    //           16.wb,
                    //           SizedBox(
                    //             child: Text.rich(TextSpan(children: [
                    //               TextSpan(
                    //                   text: item['pice'],
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .subtitle2
                    //                       ?.copyWith(
                    //                           color:
                    //                               const Color(0xFFFF3B02))),
                    //               TextSpan(
                    //                   text: '万',
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .subtitle2
                    //                       ?.copyWith(
                    //                           color:
                    //                               const Color(0xFFFF3B02))),
                    //             ])),
                    //           ),
                    //         ],
                    //       )
                    //     : Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           SizedBox(
                    //             child: Text(
                    //               '车辆总价',
                    //               style: TextStyle(
                    //                   fontSize: BaseStyle.fontSize28,
                    //                   color: BaseStyle.color999999),
                    //             ),
                    //           ),
                    //           16.wb,
                    //           SizedBox(
                    //             child: Text.rich(TextSpan(children: [
                    //               TextSpan(
                    //                   text: '30.00',
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .subtitle2),
                    //               TextSpan(
                    //                   text: '万',
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .subtitle2),
                    //             ])),
                    //           ),
                    //         ],
                    // )
                    ),
              ],
            )),
      ),
    );
  }

  getText(String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
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

  Color getColor(String judgename) {
    if (judgename == '交易取消') {
      return const Color(0xFF666666);
    } else if (judgename == '审核中' || judgename == '已驳回') {
      return const  Color(0xFFFF3B02);
    } else {
      return const Color(0xFF027AFF);
    }
  }

  getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  get() {}
}
