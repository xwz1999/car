import 'package:cloud_car/model/user/lists_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/backup/make_deal.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_rejected.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/consignment_signed.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../../widget/car_widget.dart';

class ConsignmentOrderPage extends StatefulWidget {
  final Function callBack;
  const ConsignmentOrderPage({Key? key, required this.callBack})
      : super(key: key);

  @override
  State<ConsignmentOrderPage> createState() => _ConsignmentOrderPageState();
}

class _ConsignmentOrderPageState extends State<ConsignmentOrderPage> {
  List<Widget> listWidget = []; //创建方法列表
  final List<ChooseItem> _sortList = [];
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  ScreenControl screenControl = ScreenControl();
  List<ListsModel> carList = [];
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

  // int _page = 1;
  // final int _size = 10;
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
          ),
          16.hb,
          EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              controller: _easyRefreshController,
              onRefresh: () async {
                //_page = 1;
                carList = await OrderFunc.getLists();
                setState(() {});
              },
              child: Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return getCar(carList[index]);
                    },
                    itemCount: carList.length),
              )),
        ],
      ),
    );
  }

  getCar(ListsModel item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: GestureDetector(
        onTap: () {
          switch (item.status) {
            case 1:
              Get.to(() => const ConsignmentSigned(
                    stat: '待签订',
                  ));
              break;
            case 2:
              Get.to(() => const ConsignmentSigned(
                    stat: '待发布',
                  ));
              break;
            case 3:
              Get.to(() => const ConsignmentSigned(
                    stat: '审核中',
                  ));
              break;
            case 4:
              Get.to(() => const ConsignmentRejected());
              break;
            case 5:
              Get.to(() => const ConsignmentSigned(
                    stat: '在售',
                  ));
              break;
            case 6:
              Get.to(() => const ConsignmentSigned(
                    stat: '已售',
                  ));
              break;
            case 8:
              Get.to(() => const ConsignmentSigned(
                    stat: '交易取消',
                  ));
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
                    ' item.',
                    style: TextStyle(
                        color: getColor(item.modeNamel),
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                // 24.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 196.w,
                      height: 150.w,
                      child: Image.asset(item.modeNamel),
                    ),
                    20.wb,
                    SizedBox(
                      width: 406.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(item.modeNamel,
                              style: TextStyle(
                                  fontSize: BaseStyle.fontSize28,
                                  color: BaseStyle.color111111)),
                          32.hb,
                          Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: getText(
                                DateUtil.formatDateMs(
                                    item.licensingDate.toInt() * 1000,
                                    format: 'yyyy年MM月'),
                                '${item.mileage}万公里'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                32.hb,
                SizedBox(
                    child: item.mileage == 'asas'
                        ? Padding(
                            padding: EdgeInsets.only(left: 452.w),
                            child: GestureDetector(
                              onTap: () {
                                switch (item.modeNamel) {
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
                                    item.modeNamel,
                                    style: TextStyle(
                                        color: kForeGroundColor,
                                        fontSize: BaseStyle.fontSize28),
                                  )),
                            ),
                          )
                        : const SizedBox()
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
      return const Color(0xFFFF3B02);
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
}
