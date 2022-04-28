// ignore_for_file: non_constant_identifier_names

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/lists_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/backup/make_deal.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../../widget/car_widget.dart';

class DealerConsignmentOrderPage extends StatefulWidget {
  final Function callBack;
  const DealerConsignmentOrderPage({Key? key, required this.callBack})
      : super(key: key);

  @override
  State<DealerConsignmentOrderPage> createState() =>
      _DealerConsignmentOrderPageState();
}

class _DealerConsignmentOrderPageState
    extends State<DealerConsignmentOrderPage> {
  List<Widget> listWidget = []; //创建方法列表
  final List<ChooseItem> _sortList = [];
  List<ListsModel> _DealerConsignmentList = [];
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  int _page = 1;
  final int _size = 10;

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
        child: ScreenWidget(
          pickString: '',
          childAspectRatio: 200 / 56,
          callback: (String item,int value) {
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
                items: const ['全部', '审核中', '已驳回', '在售', '已售', '交易取消'],
                callBack: (name) {
                  setState(() {});
                }),
          ),
          Expanded(
            child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              controller: _easyRefreshController,
              onRefresh: () async {
                _page = 1;
                _DealerConsignmentList =
                    await OrderFunc.getDealerLists(page: _page, size: _size);
                setState(() {});
              },
              onLoad: () async {
                _page++;
                var baseList = await apiClient.requestList(
                    API.order.dealerConsignmentOrderPage,
                    data: {'page': _page, 'size': _size});
                if (baseList.nullSafetyTotal > _DealerConsignmentList.length) {
                  _DealerConsignmentList.addAll(baseList.nullSafetyList
                      .map((e) => ListsModel.fromJson(e))
                      .toList());
                } else {
                  _easyRefreshController.finishLoad(noMore: true);
                }
                setState(() {});
              },
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return getCar(_DealerConsignmentList[index]);
                  },
                  itemCount: _DealerConsignmentList.length),
            ),
          ),
        ],
      ),
    );
  }

  getCar(ListsModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: GestureDetector(
        onTap: () {
          // switch (item.status) {
          //   case 1:
          //     Get.to(() => const ConsignmentSigned(
          //           stat: '待签订',
          //         ));
          //     break;
          //   case 2:
          //     Get.to(() => const ConsignmentSigned(
          //           stat: '待发布',
          //         ));
          //     break;
          //   case 3:
          //     Get.to(() => const ConsignmentSigned(
          //           stat: '审核中',
          //         ));
          //     break;
          //   case 4:
          //     Get.to(() => const ConsignmentRejected());
          //     break;
          //   case 5:
          //     Get.to(() => const ConsignmentSigned(
          //           stat: '在售',
          //         ));
          //     break;
          //   case 6:
          //     Get.to(() => const ConsignmentSigned(
          //           stat: '已售',
          //         ));
          //     break;
          //   case 8:
          //     Get.to(() => const ConsignmentSigned(
          //           stat: '交易取消',
          //         ));
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
                    model.status == 3 || model.auditStatus != 0
                        ? '已驳回'
                        : _getStatusText(model.status),
                    style: TextStyle(
                        color: model.status == 3 || model.auditStatus != 0
                            ? const Color(0xFFFF3B02)
                            : getColor(
                                _getStatusText(model.status),
                              ),
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                // 24.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 196.w,
                      height: 150.w,
                      child: const CloudImageNetworkWidget.car(
                        urls: [],
                      ),
                    ),
                    20.wb,
                    SizedBox(
                      width: 406.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(model.modeName,
                              style: TextStyle(
                                  fontSize: BaseStyle.fontSize28,
                                  color: BaseStyle.color111111)),
                          32.hb,
                          Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: getText(
                                DateUtil.formatDateMs(
                                    model.licensingDate.toInt() * 1000,
                                    format: 'yyyy年MM月'),
                                '${model.mileage}万公里'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                32.hb,
                SizedBox(
                    child: _getStatusText(model.status) == '待发布'
                        ? Padding(
                            padding: EdgeInsets.only(left: 452.w),
                            child: GestureDetector(
                              onTap: () {
                                switch (_getStatusText(model.status)) {
                                  case '待发布':
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
                                    '发布车辆',
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
    } else if (judgename == '审核中') {
      return const Color(0xFFFE8029);
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

///状态文字
_getStatusText(int num) {
  switch (num) {
    case 0:
      return '交易取消';

      ///订单取消
      // ignore: dead_code
      break;
    case 3:
      return '审核中';

      ///提交审核
      // ignore: dead_code
      break;
    case 4:
      return '在售';

      ///已上架
      // ignore: dead_code
      break;

    case 5:
      return '已售';

      ///已出售
      // ignore: dead_code
      break;

    case 6:
      return '已到账';
      // ignore: dead_code
      break;
    case 7:
      return '已售';

      ///已成交
      // ignore: dead_code
      break;
  }
}
///