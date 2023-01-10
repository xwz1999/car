import 'package:cloud_car/model/car/new_car_statistics_model.dart';
import 'package:cloud_car/ui/home/car_manager/car_enum.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:velocity_x/velocity_x.dart';

import '../manager_container_item.dart';
import 'direct_sale/direct_sale_manager_page.dart';

class CarManagerPage extends StatefulWidget {
  const CarManagerPage({super.key});

  @override
  _CarManagerPageState createState() => _CarManagerPageState();
}

class _CarManagerPageState extends State<CarManagerPage> {
  // CarStatisticsModel _allCarCount = CarStatisticsModel.init;
  //
  // CarStatisticsModel _selfCarCount = CarStatisticsModel.init;

  NewCarStatisticsModel carCount = NewCarStatisticsModel.init;

  Future _getStatisticsNum() async {
    carCount = await CarFunc.getNewStatisticNum();

    // _allCarCount = await CarFunc.getStatisticNum();
    //_selfCarCount = await CarFunc.getPersonalStatisticNum();
    setState(() {});
  }

  final List<String> downItems = [
    '门店车辆',
    '公司车辆',
  ];
  String? selectedValue;
  final GlobalKey _stackKey = GlobalKey();
  final GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();

  @override
  void initState() {
    super.initState();
    _getStatisticsNum();
  }

  @override
  void dispose() {
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
        title: Text(
          '车辆管理',
          style: Theme.of(context).textTheme.headline4,
        ),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: ListView(
        children: [
          _buildMainClassification(
              screening: true,
              items: selectedValue == '门店车辆'
                  ? [
                      ManagerContainerItem(
                        text: '在售',
                        num: '${carCount.storeCount.sellCount}',
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 0,
                                initType: CarManageType.all,
                              ));
                        },
                      ),
                      ManagerContainerItem(
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 1,
                                initType: CarManageType.all,
                              ));
                        },
                        text: '签订中',
                        num: '${carCount.storeCount.signingCount}',
                      ),
                      ManagerContainerItem(
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 2,
                                initType: CarManageType.all,
                              ));
                        },
                        text: '交易中',
                        num: '${carCount.storeCount.reserveCount}',
                      ),
                      ManagerContainerItem(
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 3,
                                initType: CarManageType.all,
                              ));
                        },
                        text: '已售',
                        num: '${carCount.storeCount.soldCount}',
                      ),
                      ManagerContainerItem(
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 4,
                                initType: CarManageType.all,
                              ));
                        },
                        text: '退库',
                        num: '${carCount.storeCount.backOutCount}',
                      ),
                      // ManagerContainerItem(
                      //   onTap: () {
                      //     Get.to(() =>
                      //     const DirectSaleManagerPage(
                      //       initIndex: 4,
                      //       initType: CarManageType.all,
                      //     ));
                      //   },
                      //   text: '已签订',
                      //   num: '${carCount.storeCount.signedCount}',
                      // ),
                    ]
                  : [
                      ManagerContainerItem(
                        text: '在售',
                        num: '${carCount.businessCount.sellCount}',
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 0,
                                initType: CarManageType.company,
                              ));
                        },
                      ),
                      ManagerContainerItem(
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 1,
                                initType: CarManageType.company,
                              ));
                        },
                        text: '签订中',
                        num: '${carCount.businessCount.signingCount}',
                      ),
                      ManagerContainerItem(
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 2,
                                initType: CarManageType.company,
                              ));
                        },
                        text: '交易中',
                        num: '${carCount.businessCount.reserveCount}',
                      ),
                      ManagerContainerItem(
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 3,
                                initType: CarManageType.company,
                              ));
                        },
                        text: '已售',
                        num: '${carCount.businessCount.soldCount}',
                      ),
                      ManagerContainerItem(
                        onTap: () {
                          Get.to(() => const DirectSaleManagerPage(
                                initIndex: 4,
                                initType: CarManageType.company,
                              ));
                        },
                        text: '退库',
                        num: '${carCount.businessCount.backOutCount}',
                      ),
                      // ManagerContainerItem(
                      //   onTap: () {
                      //     Get.to(() =>
                      //     const DirectSaleManagerPage(
                      //       initIndex: 3,
                      //       initType: CarManageType.company,
                      //     ));
                      //   },
                      //   text: '已签订',
                      //   num: '${carCount.businessCount.signedCount}',
                      // ),
                    ],
              text: downItems[0]),
          40.hb,
          // _buildMainClassification(screening: true, text: '公司车辆', items: [
          //   ManagerContainerItem(
          //     text: '在售',
          //     num: '${carCount.businessCount.sellCount}',
          //     onTap: () {
          //       Get.to(() => const DirectSaleManagerPage(
          //             initIndex: 0,
          //             initType: CarManageType.company,
          //           ));
          //     },
          //   ),
          //   ManagerContainerItem(
          //     onTap: () {
          //       Get.to(() => const DirectSaleManagerPage(
          //             initIndex: 1,
          //             initType: CarManageType.company,
          //           ));
          //     },
          //     text: '签订中',
          //     num: '${carCount.businessCount.signingCount}',
          //   ),
          //   ManagerContainerItem(
          //     onTap: () {
          //       Get.to(() => const DirectSaleManagerPage(
          //             initIndex: 2,
          //             initType: CarManageType.company,
          //           ));
          //     },
          //     text: '交易中',
          //     num: '${carCount.businessCount.reserveCount}',
          //   ),
          //   ManagerContainerItem(
          //     onTap: () {
          //       Get.to(() => const DirectSaleManagerPage(
          //             initIndex: 3,
          //             initType: CarManageType.company,
          //           ));
          //     },
          //     text: '已售',
          //     num: '${carCount.businessCount.soldCount}',
          //   ),
          //   ManagerContainerItem(
          //     onTap: () {
          //       Get.to(() => const DirectSaleManagerPage(
          //             initIndex: 4,
          //             initType: CarManageType.company,
          //           ));
          //     },
          //     text: '退库',
          //     num: '${carCount.businessCount.backOutCount}',
          //   ),
          //   // ManagerContainerItem(
          //   //   onTap: () {
          //   //     Get.to(() =>
          //   //     const DirectSaleManagerPage(
          //   //       initIndex: 3,
          //   //       initType: CarManageType.company,
          //   //     ));
          //   //   },
          //   //   text: '已签订',
          //   //   num: '${carCount.businessCount.signedCount}',
          //   // ),
          // ]),
          // 40.hb,
          _buildMainClassification(text: '个人寄卖', items: [
            ManagerContainerItem(
              text: '在售',
              num: '${carCount.ownCount.sellCount}',
              onTap: () {
                Get.to(() => const DirectSaleManagerPage(
                      initIndex: 0,
                      initType: CarManageType.person,
                    ));
              },
            ),
            ManagerContainerItem(
              onTap: () {
                Get.to(() => const DirectSaleManagerPage(
                      initIndex: 1,
                      initType: CarManageType.person,
                    ));
              },
              text: '签订中',
              num: '${carCount.ownCount.signingCount}',
            ),
            ManagerContainerItem(
              onTap: () {
                Get.to(() => const DirectSaleManagerPage(
                      initIndex: 2,
                      initType: CarManageType.person,
                    ));
              },
              text: '交易中',
              num: '${carCount.ownCount.reserveCount}',
            ),
            ManagerContainerItem(
              onTap: () {
                Get.to(() => const DirectSaleManagerPage(
                      initIndex: 3,
                      initType: CarManageType.person,
                    ));
              },
              text: '已售',
              num: '${carCount.ownCount.soldCount}',
            ),
            ManagerContainerItem(
              onTap: () {
                Get.to(() => const DirectSaleManagerPage(
                      initIndex: 4,
                      initType: CarManageType.person,
                    ));
              },
              text: '退库',
              num: '${carCount.ownCount.backOutCount}',
            ),
            // ManagerContainerItem(
            //   onTap: () {
            //     Get.to(() =>
            //     const DirectSaleManagerPage(
            //       initIndex: 5,
            //       initType: CarManageType.person,
            //     ));
            //   },
            //   text: '已签订',
            //   num: '${carCount.ownCount.signedCount}',
            // ),
          ]),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     32.hb,
          //     Padding(
          //       padding: const EdgeInsets.only(left: 12),
          //       child: Text('库存预警',
          //           style: Theme
          //               .of(context)
          //               .textTheme
          //               .subtitle1
          //               ?.copyWith(
          //               color: const Color(0xFF333333),
          //               fontWeight: FontWeight.bold)),
          //     ),
          //     24.hb,
          //     Row(
          //       children: [
          //         32.wb,
          //         Expanded(child: Container(
          //           height: 176.w,
          //           decoration:  BoxDecoration(
          //             gradient: const LinearGradient(
          //                 colors: [Color(0xFFFFD700), Color(0xFFFFDA4A),Color(0xFFFFAE00),],
          //                 begin: Alignment.centerLeft,
          //                 end: Alignment.centerRight),
          //             borderRadius: BorderRadius.circular(8.w)
          //           ),
          //           padding: EdgeInsets.only(left: 22.w),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               '12'
          //                   .text
          //                   .size(48.sp)
          //                   .color(Colors.white).bold
          //                   .make(),
          //               16.hb,
          //               '超期30天'
          //                   .text
          //                   .size(28.sp)
          //                   .color(Colors.white)
          //                   .make()
          //             ],
          //           ),
          //         )),
          //         32.wb,
          //         Expanded(child: Container(
          //           height: 176.w,
          //           decoration:  BoxDecoration(
          //             gradient: const LinearGradient(
          //                 colors: [Color(0xFFDB2323), Color(0xFFF84141),Color(0xFFB50F0F),],
          //                 begin: Alignment.centerLeft,
          //                 end: Alignment.centerRight),
          //               borderRadius: BorderRadius.circular(8.w)
          //           ),
          //           padding: EdgeInsets.only(left: 22.w),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               '12'
          //                   .text
          //                   .size(48.sp)
          //                   .color(Colors.white).bold
          //                   .make(),
          //               16.hb,
          //               '超期30天'
          //                   .text
          //                   .size(28.sp)
          //                   .color(Colors.white)
          //                   .make()
          //             ],
          //           ),
          //         )),
          //         32.wb,
          //       ],
          //     ),
          //     32.hb
          //   ],
          // ),
        ],
      ),
    );
  }

  _buildMainClassification(
      {required String text,
      required List<Widget> items,
      bool screening = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: screening
              ? Container(
                  width: 200.w,
                  height: 100.w,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        text,
                        style:Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.bold),
                      ),
                      items: downItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: const Color(0xFF333333),
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        selectedValue = value as String;
                        setState(() {
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 140,
                      itemHeight: 40,
                    ),
                  ),
                )
              : Text(text,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.bold)),
        ),
        24.hb,
        GridView.count(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 32.w, right: 32.w),
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 24.w,
          //横轴间距
          crossAxisSpacing: 40.w,
          childAspectRatio: 200 / 176,
          children: items,
        ),
      ],
    );
  }
}
