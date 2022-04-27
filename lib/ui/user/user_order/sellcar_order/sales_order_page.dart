// ignore_for_file: non_constant_identifier_names, unused_field
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/salelists_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/backup/make_deal.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/make_deal_data.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/reservation.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/transaction_cancelled.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/car_widget.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'backup/make_deal.dart';

class SalesOrderPage extends StatefulWidget {
  final Function callBack;

  const SalesOrderPage({
    Key? key,
    required this.callBack,
  }) : super(key: key);

  @override
  State<SalesOrderPage> createState() => _SalesOrderPageState();
}

class _SalesOrderPageState extends State<SalesOrderPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  List<Widget> listWidget = []; //创建方法列表
  final List<ChooseItem> _sortList = [];
  List<SalelistsModel> _SalesList = [];
  int _page = 1;
  final int _size = 10;
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
    listWidget = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(pickString: '',
          childAspectRatio: 200 / 56,
          callback: (String item) {
            if (kDebugMode) {
              print(item);
            }

            ///调研接口 按照item进行排序
            // screenControl.screenHide();
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
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callBack();
      },
      child: Column(
        children: [
          const SizedBox(
            height: kToolbarHeight,
          ),
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
          Expanded(
            child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              controller: _easyRefreshController,
              onRefresh: () async {
                _SalesList =
                    await OrderFunc.getSaleList(page: _page, size: _size);

                setState(() {});
              },
              onLoad: () async {
                _page++;
                var baseList =
                    await apiClient.requestList(API.order.saleLists, data: {
                  'page': _page,
                  'size': _size,
                });
                if (baseList.nullSafetyTotal > _SalesList.length) {
                  _SalesList.addAll(baseList.nullSafetyList
                      .map((e) => SalelistsModel.fromJson(e))
                      .toList());
                } else {
                  _easyRefreshController.finishLoad(noMore: true);
                }
                setState(() {});
              },
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return getSales(_SalesList[index]);
                  },
                  itemCount: carList.length),
            ),
          ),
        ],
      ),
    );
  }

  getSales(SalelistsModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: GestureDetector(
        onTap: () {
          switch (model.status) {
            case 0:

              ///交易取消
              Get.to(() => const TransactionCancelled());
              break;
            case 1:

              ///待预定
              Get.to(() => const Reservation(
                    stat: '待预定',
                    judge: false,
                  ));
              break;
            case 2:

              ///已预定
              Get.to(() => const Reservation(
                    stat: '待预定',
                    judge: true,
                  ));
              break;
            case 3:

              ///待检测
              Get.to(() => const Reservation(
                    stat: '待检测',
                    judge: true,
                  ));
              break;
            // case 4:
            //   ///支付首付
            //   switch () {
            //     case '需付首付':
            //       Get.to(() => const Reservation(
            //             stat: '支付首付',
            //             judge: false,
            //           ));
            //       break;
            //     case '已付首付':
            //       Get.to(() => const Reservation(
            //             stat: '支付首付',
            //             judge: true,
            //           ));
            //       break;
            //   }
            //   break;
            // case '待过户':///待过户
            //   Get.to(() => const Reservation(
            //         stat: '待过户',
            //         judge: true,
            //       ));
            //   break;
            // case '支付尾款':///支付尾款
            //   switch (item['picename']) {
            //     case '需付尾款':
            //       Get.to(() => const Reservation(
            //             stat: '支付尾款',
            //             judge: false,
            //           ));
            //       break;
            //     case '已付尾款':
            //       Get.to(() => const Reservation(
            //             stat: '支付尾款',
            //             judge: true,
            //           ));
            //       break;
            //   }
            //   break;
            case 50:

              ///成交订单
              Get.to(() => const MakeDealData());
              break;
          }
          // switch (item['judgename']) {
          //   case '待预定':
          //     Get.to(() => const Reservation(
          //           stat: '待预定',
          //           judge: false,
          //         ));
          //     break;
          //   case '已预定':
          //     Get.to(() => const Reservation(
          //           stat: '待预定',
          //           judge: true,
          //         ));
          //     break;
          //   case '待检测':
          //     Get.to(() => const Reservation(
          //           stat: '待检测',
          //           judge: true,
          //         ));
          //     break;
          //   case '支付首付':
          //     switch (item['picename']) {
          //       case '需付首付':
          //         Get.to(() => const Reservation(
          //               stat: '支付首付',
          //               judge: false,
          //             ));
          //         break;
          //       case '已付首付':
          //         Get.to(() => const Reservation(
          //               stat: '支付首付',
          //               judge: true,
          //             ));
          //         break;
          //     }
          //     break;
          //   case '待过户':
          //     Get.to(() => const Reservation(
          //           stat: '待过户',
          //           judge: true,
          //         ));
          //     break;
          //   case '支付尾款':
          //     switch (item['picename']) {
          //       case '需付尾款':
          //         Get.to(() => const Reservation(
          //               stat: '支付尾款',
          //               judge: false,
          //             ));
          //         break;
          //       case '已付尾款':
          //         Get.to(() => const Reservation(
          //               stat: '支付尾款',
          //               judge: true,
          //             ));
          //         break;
          //     }
          //     break;
          //   case '成交订单':
          //     Get.to(() => const MakeDealData());
          //     break;
          //   case '交易取消':
          //     Get.to(() => const TransactionCancelled());
          //     break;
          // }
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
                    _getText(model.status),
                    //item['judgename'],
                    style: TextStyle(
                        color: model.status != 50
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
                      child: CloudImageNetworkWidget.car(
                        urls: [model.mainPhoto],
                      ),
                    ),
                    20.wb,
                    SizedBox(
                      width: 406.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(model.modelName,
                              style: TextStyle(
                                  fontSize: BaseStyle.fontSize28,
                                  color: BaseStyle.color111111)),
                          32.hb,
                          Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: getText(
                                '过户0次',
                                DateUtil.formatDateMs(
                                    model.licensingDate.toInt() * 1000,
                                    format: 'yyyy年MM月'),
                                '${model.mileage}万公里',
                                _getText(model.status),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                40.hb,
                SizedBox(
                    child: model.status != 1 || model.status != 2
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
                                          text: model.amount,
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
                                      '定价',
                                      // item['picename'],
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: model.deposit, //item['pice'],
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
                                //item['buttomname']
                                onTap: () {
                                  switch (model.modelName) {
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
                                      model.deposit, // item['buttomname'],
                                      style: TextStyle(
                                          color: kForeGroundColor,
                                          fontSize: BaseStyle.fontSize28),
                                    )),
                              )
                            ],
                          )
                        : model.status == 0
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
                                          text: model.balancePayment,
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
                                      _getText(model.status),
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: model.deposit,
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
                                          text: model.balancePayment,
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

  _getText(int num) {
    switch (num) {
      case 0:
        return '订单取消';
        // ignore: dead_code
        break;
      case 1:
        return '待签订';
        // ignore: dead_code
        break;
      case 2:
        return '已签订';
        // ignore: dead_code
        break;
      case 3:
        return '已支付定金';
        // ignore: dead_code
        break;
      case 10:
        return '申请检测';
        // ignore: dead_code
        break;
      case 11:
        return '上传检测报告';
        // ignore: dead_code
        break;
      case 20:
        return '首付审核';
        // ignore: dead_code
        break;
      case 21:
        return '首付审核通过';
        // ignore: dead_code
        break;
      case 30:
        return '过户';
        // ignore: dead_code
        break;
      case 31:
        return '过户完成';
        // ignore: dead_code
        break;
      case 40:
        return '尾款审核';
        // ignore: dead_code
        break;
      case 41:
        return '尾款审核通过';
        // ignore: dead_code
        break;
      case 50:
        return '交车';
        // ignore: dead_code
        break;
      default:
    }
  }
}
