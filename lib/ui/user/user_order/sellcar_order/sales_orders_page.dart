// ignore_for_file: non_constant_identifier_names, unused_field
import 'package:cloud_car/ui/user/user_order/rentalcar_order/rentalcar_page.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/backup/make_deal.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/make_deal_data.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/reservation.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/transaction_cancelled.dart';
import 'package:cloud_car/ui/user/user_order/thatcar_order/thatcar_order_page.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_order_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/title_drop_widget.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/car_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'backup/make_deal.dart';

class SalesOrders extends StatefulWidget {
  const SalesOrders({Key? key}) : super(key: key);

  @override
  State<SalesOrders> createState() => _SalesOrdersState();
}

class _SalesOrdersState extends State<SalesOrders> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<String> _dropDownHeaderItemStrings1;
  List<Widget> listWidget = []; //创建方法列表
  final List<ChooseItem> _sortList = [
    ChooseItem(name: '售卖订单'),
    ChooseItem(name: '寄卖订单'),
    ChooseItem(name: '租车订单'),
    ChooseItem(name: '叫车订单'),
  ];
  late String title = '售车订单';
  TitleScreenControl screenControl = TitleScreenControl();
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
    // _sortList = [
    //   ChooseItem(name: '售车订单'),
    //   ChooseItem(name: '寄卖订单'),
    //   ChooseItem(name: '租车订单'),
    //   ChooseItem(name: '租车订单')
    // ];
    listWidget = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(
          childAspectRatio: 200 / 56,
          callback: (String item) {
            _dropDownHeaderItemStrings1 = [item];
            screenControl.screenHide();
            setState(() {});
          },
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 3,
          //haveButton: true,
          itemList: _sortList,
        ),
      ),
    ];
    _dropDownHeaderItemStrings1 = [
      '售卖订单',
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
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
                  // onTap() {
                  //   switch (title) {
                  //     case '寄卖订单':
                  //       Get.to(() => const ConsignmentOrderPage());
                  //       //BotToast.showText(text: '寄卖订单');
                  //       break;
                  //     default:
                  //   }
                  // }

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
          SizedBox(
              height: 88.w,
              child: CarWidget(
                items: const [
                  '全部',
                  '待预定',
                  '已预定',
                  '待检测',
                  '支付首付',
                  '待过户',
                  '支付尾款',
                  '交易完成',
                  '交易取消'
                ],
                callBack: (name) {
                  setState(() {});
                },
              )),
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
            case '待预定':
              Get.to(() => const Reservation(
                    stat: '待预定',
                    judge: false,
                  ));
              break;
            case '已预定':
              Get.to(() => const Reservation(
                    stat: '待预定',
                    judge: true,
                  ));
              break;
            case '待检测':
              Get.to(() => const Reservation(
                    stat: '待检测',
                    judge: true,
                  ));
              break;
            case '支付首付':
              switch (item['picename']) {
                case '需付首付':
                  Get.to(() => const Reservation(
                        stat: '支付首付',
                        judge: false,
                      ));
                  break;
                case '已付首付':
                  Get.to(() => const Reservation(
                        stat: '支付首付',
                        judge: true,
                      ));
                  break;
              }

              break;
            case '待过户':
              Get.to(() => const Reservation(
                    stat: '待过户',
                    judge: true,
                  ));
              break;
            case '支付尾款':
              switch (item['picename']) {
                case '需付尾款':
                  Get.to(() => const Reservation(
                        stat: '支付尾款',
                        judge: false,
                      ));
                  break;
                case '已付尾款':
                  Get.to(() => const Reservation(
                        stat: '支付尾款',
                        judge: true,
                      ));
                  break;
              }
              break;
            case '成交订单':
              Get.to(() => const MakeDealData());
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
                        color: item['judgename'] != '交易取消'
                            ? const Color(0xFF027AFF)
                            : const Color(0xFF666666),
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
                            child: getText('过户0次', '2020年10月', '20.43万公里',
                                item['judgename']),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                40.hb,
                SizedBox(
                    child: item['judge']
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      '车辆总价',
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: '30.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                      TextSpan(
                                          text: '万',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    ])),
                                  ),
                                  56.wb,
                                  SizedBox(
                                    child: Text(
                                      item['picename'],
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: item['pice'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFFFF3B02))),
                                      TextSpan(
                                          text: '万',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFFFF3B02))),
                                    ])),
                                  ),
                                ],
                              ),
                              32.hb,
                              GestureDetector(
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
                                        borderRadius:
                                            BorderRadius.circular(8.w)),
                                    child: Text(
                                      item['buttomname'],
                                      style: TextStyle(
                                          color: kForeGroundColor,
                                          fontSize: BaseStyle.fontSize28),
                                    )),
                              )
                            ],
                          )
                        : item['judgename'] != '交易取消'
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      '车辆总价',
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: '30.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                      TextSpan(
                                          text: '万',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    ])),
                                  ),
                                  56.wb,
                                  SizedBox(
                                    child: Text(
                                      item['picename'],
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: item['pice'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFFFF3B02))),
                                      TextSpan(
                                          text: '万',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFFFF3B02))),
                                    ])),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      '车辆总价',
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: '30.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                      TextSpan(
                                          text: '万',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    ])),
                                  ),
                                ],
                              )),
              ],
            )),
      ),
    );
  }

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
