import 'package:cloud_car/ui/user/user_order/rentalcar_order/rentaicar_alsocar_order.dart';
import 'package:cloud_car/ui/user/user_order/rentalcar_order/rentalcar_order.dart';
import 'package:cloud_car/ui/user/user_order/rentalcar_order/rentalcar_transaction_cancelled_order.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/make_deal.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/make_deal_data.dart';

import 'package:cloud_car/ui/user/user_order/sellcar_order/sales_orders_page.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/transaction_cancelled.dart';
import 'package:cloud_car/ui/user/user_order/thatcar_order/thatcar_order_page.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_order_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/car_widget.dart';

import 'package:flutter/material.dart';

class RentalcarOrderPage extends StatefulWidget {
  const RentalcarOrderPage({Key? key}) : super(key: key);

  @override
  State<RentalcarOrderPage> createState() => _RentalcarOrderPageState();
}

class _RentalcarOrderPageState extends State<RentalcarOrderPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> listWidget = []; //创建方法列表
  //List<ChooseItem> _sortList = [];
  late String title = '租车订单';
  ScreenControl screenControl = ScreenControl();
  List CarList = [
    {
      'judge': false,
      'judgename': '进行中',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '租车总价',
      'pice1': '220.00',
      'picename': '已付租金',
      'pice': '220.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '已完成',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '租车总价',
      'pice1': '220.00',
      'picename': '已付租金',
      'pice': '220.00',
      'buttomname': '',
    },
    {
      'judge': false,
      'judgename': '已取消',
      'title': '奥迪Q3 2020款 35 TFSI 进取型SUV',
      'url': Assets.images.carBanner.path,
      'pice1name': '租车总价',
      'pice1': '220.00',
      'picename': '已付租金',
      'pice': '220.00',
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
      backgroundColor: BodyColor,
      body: Column(
        children: [
          SizedBox(
            height: 88.w,
            child: Expanded(
                child: CarWidget(
              items: const [
                '全部',
                '进行中',
                '已完成',
                '已取消',
              ],
              callBack: (name) {
                setState(() {});
              },
            )),
          ),
          16.hb,
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return getCar(CarList[index]);
                },
                itemCount: CarList.length),
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
              case '进行中':
                Get.to(() => const RentalcarOrder());
                break;
              case '已完成':
                Get.to(() => const AlsocarOrder(
                      bl: true,
                    ));
                break;
              case '已取消':
                Get.to(() => const CancelOrder());
                break;
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            decoration: BoxDecoration(
                color: kForeGroundColor,
                borderRadius: BorderRadius.circular(16.w)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: Text(
                  item['judgename'],
                  style: TextStyle(
                      color: item['judgename'] != '已取消'
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
                          child: getText(
                            '自动2.0T',
                            '国VI',
                            '五座',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              40.hb,
              SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Text(
                          item['pice1name'],
                          style: TextStyle(
                              fontSize: BaseStyle.fontSize28,
                              color: BaseStyle.color999999),
                        ),
                      ),
                      16.wb,
                      SizedBox(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '¥',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: item['pice1'],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold)),
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
                              text: '¥',
                              style: TextStyle(
                                  color: item['judgename'] == '已取消'
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFFF3B02),
                                  fontSize: BaseStyle.fontSize24,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: item['pice'],
                              style: TextStyle(
                                  color: item['judgename'] == '已取消'
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFFF3B02),
                                  fontSize: BaseStyle.fontSize28,
                                  fontWeight: FontWeight.bold)),
                        ])),
                      ),
                    ],
                  ),
                  32.hb,
                ],
              ))
            ]),
          ),
        ));
  }

  getText(String num, String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
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
      ],
    );
  }
}
