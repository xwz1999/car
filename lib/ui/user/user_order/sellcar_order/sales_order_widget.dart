import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/salelists_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/change_name_data_page.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/detection_data_page.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/reservation_page.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/widget/car_widget.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SalesOrderWidget extends StatefulWidget {
  final Function callBack;

  const SalesOrderWidget({
    super.key,
    required this.callBack,
  });

  @override
  State<SalesOrderWidget> createState() => _SalesOrderWidgetState();
}

class _SalesOrderWidgetState extends State<SalesOrderWidget> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  List<Widget> listWidget = []; //创建方法列表
  final List<ChooseItem> _sortList = [];
  List<SalelistsModel> _salesList = [];
  int _page = 1;
  final int _size = 10;
  var a = 0;

  ConsignmentSearchStatus _currentStatus = ConsignmentSearchStatus.all;

  Map<String, dynamic> get _params => {
        'page': _page,
        'size': _size,
        'status': _currentStatus.typeNum,
      };

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
          callback: (String item, int value) {
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
          SizedBox(
            height: kToolbarHeight + 50.w,
          ),
          SizedBox(
              height: 88.w,
              child: CarWidget(
                items: ConsignmentSearchStatus.values
                    .map((e) => e.typeStr)
                    .toList(),
                callBack: (index) {
                  _currentStatus = ConsignmentSearchStatus.values[index];
                  _easyRefreshController.callRefresh();
                },
              )),
          Expanded(
            child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              controller: _easyRefreshController,
              onRefresh: () async {
                _page = 1;
                _salesList = await OrderFunc.getSaleList(
                     data: _params);
                setState(() {});
              },
              onLoad: () async {
                _page++;

                var baseList = await apiClient.requestList(API.order.saleLists,
                    data: _params);
                if (baseList.nullSafetyTotal > _salesList.length) {
                  _salesList.addAll(baseList.nullSafetyList
                      .map((e) => SalelistsModel.fromJson(e))
                      .toList());
                } else {
                  _easyRefreshController.finishLoad(noMore: true);
                }
                setState(() {});
              },
              child: _salesList.isEmpty
                  ? const NoDataWidget(
                      text: '暂无相关车辆信息',
                      paddingTop: 300,
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return _getSales(_salesList[index]);
                      },
                      itemCount: _salesList.length),
            ),
          ),
        ],
      ),
    );
  }

  // getDisplay(String state) {
  //   switch (state) {
  //   }
  // }

  _getSales(SalelistsModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ReservationPage(
                //judge: false
                //statusNumber: model.statusEnum.progressNum,
                orderId: model.id,
                status: model.statusEnum,
                //status1: model.statusEnum1,
                // status1: model.statusEnum,
              ));
          // switch (_getText(model.status)) {
          //   case '待预定':
          //     Get.to(() => Reservation(
          //           judge: false,
          //           orderId: model.id,
          //           status: _getText(model.status),
          //           statusNum: _getStatusNum(model.status),
          //         ));
          //     break;
          //   case '已预定':
          //     Get.to(() => Reservation(
          //           statusNum: _getStatusNum(model.status),
          //           orderId: model.id,
          //           status: _getText(model.status),
          //           judge: true,
          //         ));
          //     break;
          //   case '申请检测':
          //     Get.to(() => Reservation(
          //           statusNum: _getStatusNum(model.status),
          //           status: _getText(model.status),
          //           judge: true,
          //           orderId: model.id,
          //         ));
          //     break;
          //   case '上传检测报告':
          //     Get.to(() => Reservation(
          //           statusNum: _getStatusNum(model.status),
          //           status: _getText(model.status),
          //           judge: false,
          //           orderId: model.id,
          //         ));
          //     break;
          //   case '首付审核':
          //     Get.to(() => Reservation(
          //           statusNum: _getStatusNum(model.status),
          //           status: _getText(model.status),
          //           judge: true,
          //           orderId: model.id,
          //         ));
          //     break;
          //   case '首付审核通过':
          //   case '过户':
          //     Get.to(() => Reservation(
          //           statusNum: _getStatusNum(model.status),
          //           status: _getText(model.status),
          //           judge: true,
          //           orderId: model.id,
          //         ));
          //     break;
          //       case '过户完成':
          //         Get.to(() => Reservation(
          //               statusNum: _getStatusNum(model.status),
          //               orderId: model.id,
          //               judge: false,
          //               status: _getText(model.status),
          //             ));
          //         break;
          //       case '尾款审核通过':
          //         Get.to(() => Reservation(
          //               statusNum: _getStatusNum(model.status),
          //               status: _getText(model.status),
          //               judge: true,
          //               orderId: model.id,
          //             ));
          //         break;
          //   case '交易完成':
          //     Get.to(() => MakeDealData(
          //           id: model.id,
          //           statusNum: _getStatusNum(model.status),
          //         ));
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
                ///状态
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Text(
                    //StatusPage(num: model.status),
                    //item['judgename'],
                    model.statusEnum.str,
                    style: TextStyle(
                        color: model.status != 0
                            ? const Color(0xFF027AFF)
                            : const Color(0xFF666666),
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                // 24.hb,
                Row(
                  children: [
                    ///图片
                    SizedBox(
                      width: 196.w,
                      height: 150.w,
                      child: CloudImageNetworkWidget.car(
                        urls: [model.mainPhoto],
                      ),
                    ),
                    20.wb,

                    ///右侧内容
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

                          ///标签
                          Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: _getText(
                                '过户${0}次',
                                DateUtil.formatDateMs(
                                    model.licensingDate.toInt() * 1000,
                                    format: 'yyyy年MM月'),
                                '${model.mileage}万公里',
                                model.status,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                40.hb,
                SizedBox(
                    child: model.status == 10 &&
                            model.status == 30 &&
                            model.status == 40
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ///汽车总价
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
                                          text:
                                              (num.parse(model.amount) / 10000)
                                                  .toString(),
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
                                      model.statusEnum.str,
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text:
                                              (num.parse(model.deposit) / 10000)
                                                  .toString(), //item['pice'],
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
                                  switch (model.status) {
                                    case 10:
                                      Get.to(() => DetectionDataPage(
                                            orderId: model.id,
                                          ));
                                      break;
                                    case 30:
                                      Get.to(() => ChangeNameDataPage(
                                            orderId: model.id,
                                          ));
                                      break;
                                    case 41:
                                      //Get.to(() => const ());
                                      break;
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
                                      _getButtonText(model.status),
                                      style: TextStyle(
                                          color: kForeGroundColor,
                                          fontSize: BaseStyle.fontSize28),
                                    )),
                              )
                            ],
                          )
                        : model.status != 0

                            ///判断交易是否取消
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
                                          text:
                                              (num.parse(model.amount) / 10000)
                                                  .toString(),
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
                                      model.statusEnum.str,
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color999999),
                                    ),
                                  ),
                                  16.wb,
                                  SizedBox(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text:
                                              (num.parse(model.deposit) / 10000)
                                                  .toString(),
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
                                          text:
                                              (num.parse(model.amount) / 10000)
                                                  .toString(),
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

  _getText(String num, String time, String distance, int conditions) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: conditions != 0
                  ? const Color(0xFF027AFF).withOpacity(0.08)
                  : const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20,
                color: conditions != 0
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

///状态按钮文字
_getButtonText(int num) {
  switch (num) {
    case 10:
      return '上传报告';
      // ignore: dead_code
      break;
    case 30:
      return '上传资料';
      // ignore: dead_code
      break;
    case 41:
      return '成交订单';
      // ignore: dead_code
      break;
  }
}
