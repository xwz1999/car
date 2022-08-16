import 'package:cloud_car/model/order/sale_info.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/change_name_data_page.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/detection_data_page.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/utils/drop_down_body.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/progress_bar.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  final int orderId;

  final OrderSaleStatus status;

  //final OrderSaleStatus status1;

  const ReservationPage({
    super.key,
    required this.orderId,
    required this.status,

    //required this.status1
  });

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  //late bool judge = widget.judge;
  late Widget methods;

  late String audit = '3';

  SaleInfo _consignmentInfoList = SaleInfo.init;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 0), () async {
      await _refresh();
      setState(() {});
    });
  }

  _refresh() async {
    _consignmentInfoList = await OrderFunc.getSaleInfo(widget.orderId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('售车订单',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: bodyColor,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 32.w, right: 32.w, top: 16.w, bottom: 8.w),
              padding: EdgeInsets.only(top: 32.w),
              height: 120.w,
              color: Colors.white,
              child: ProgressBar(
                length: 6,
                num: widget.status.progressNum,
                direction: false,
                cancel: widget.status.num != 0,
                HW: 96,
                texts: [
                  _text('预定'),
                  _text('检测'),
                  widget.status.num == 0 ? _text('订单取消') : _text('首付'),
                  _text('过户'),
                  _text('尾款'),
                  _text('完成'),
                ],
              ),
            ),
            _getContainer(
              ///客户信息
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: _getTitle('客户信息'),
                  ),
                  36.hb,
                  _getText('客户姓名', '莉丝', BaseStyle.color333333),
                  36.hb,
                  _getText('手机号', '111112112122', BaseStyle.color333333)
                ],
              ),
            ),

            ///车辆信息
            _getContainer(
              GestureDetector(
                onTap: () {
                  //Get.to(() => const Reservation(judge: null,));
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _getTitle('车辆信息'),
                      24.hb,
                      Row(
                        children: [
                          SizedBox(
                            width: 196.w,
                            height: 150.w,
                            child: CloudImageNetworkWidget.car(urls: [
                              _consignmentInfoList.car.modelName,
                            ]),
                          ),
                          20.wb,
                          SizedBox(
                            width: 406.w,
                            child: Column(
                              children: [
                                Text(_consignmentInfoList.car.modelName,
                                    style: TextStyle(
                                        fontSize: BaseStyle.fontSize28,
                                        color: BaseStyle.color111111)),
                                26.hb,
                                _getChip(
                                  '过户${_consignmentInfoList.car.transfer}次',
                                  DateUtil.formatDateMs(
                                      _consignmentInfoList.car.licensingDate
                                              .toInt() *
                                          1000,
                                      format: 'yyyy年 '),
                                  '${_consignmentInfoList.car.mileage}万公里',
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      40.hb,
                      _getList(),
                    ]),
              ),
            ),

            ///合同信息
            _getContract(widget.status.num),

            ///支付信息
            Offstage(
              offstage: widget.status.num == 1,
              child: _getPay(),
            ),

            ///车辆检测报告
            Offstage(
              offstage: widget.status.num == 1 ||
                  widget.status.num == 3 ||
                  widget.status.num == 10,
              child: _getReport(),
            ),
            widget.status.num == 0
                ? _getContainer(
                    ///订单取消
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: _getTitle('订单取消信息'),
                        ),
                        36.hb,
                        _getText('取消人员', '云云问车平台', BaseStyle.color333333),
                        36.hb,
                        _getText('取消时间', '111112112122', BaseStyle.color333333)
                      ],
                    ),
                  )
                : const SizedBox(),

            ///车辆检测报告2
            Offstage(
              offstage: !(widget.status.num == 40 ||
                  widget.status.num == 41 ||
                  widget.status.num == 50),
              child: _getReport2(),
            ),
          ],
        ),
        // Positioned(
        //   left: 0,
        //   right: 0,
        //   bottom: 0,
        //   child: _getPayPass(),
        // )

        bottomNavigationBar: SizedBox(
          height: 128.w,
          child: _getPayPass(),
        ));
  }

  //合同信息
  _getContract(int number) {
    return _getContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: _getTitle('合同信息'),
          ),
          36.hb,
          _getText('合同编号', (_consignmentInfoList.contract.contract).toString(),
              BaseStyle.color333333),
          36.hb,
          _getText(
              '签订时间',
              number == 1
                  ? '-'
                  : DateUtil.formatDateMs(
                      (_consignmentInfoList.contract.signAt.toInt()) * 1000,
                      format: DateFormats.full),
              BaseStyle.color333333)
        ],
      ),
    );
  }

//支付信息
  _getPay() {
    return _getContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: _getTitle('支付信息'),
          ),
          36.hb,
          _getText('定金支付', '¥${_consignmentInfoList.contract.deposit}',
              BaseStyle.color333333),
          36.hb,
          _getText('支付方式', '支付宝', BaseStyle.color333333),
          36.hb,
          _getText(
              '支付时间',
              DateUtil.formatDateMs(
                  _consignmentInfoList.deposit.createdAt.toInt() * 1000,
                  format: DateFormats.full),
              BaseStyle.color333333),
          40.hb,
          widget.status.num == 20 || widget.status.num == 20
              ? widget.status.num == 20
                  ? _getText(
                      '首付支付',
                      '¥${_consignmentInfoList.contract.downPayment}(审核中)',
                      const Color(0xFF027AFF))
                  : _getText(
                      '首付支付',
                      '¥${_consignmentInfoList.contract.downPayment}(审核驳回)',
                      const Color(0xFFE62222))
              : _getText(
                  '首付支付',
                  '¥${_consignmentInfoList.contract.downPayment}',
                  BaseStyle.color333333),
          widget.status.num == 20 ? 36.hb : 0.hb,
          Offstage(
            offstage: widget.status.num != 20,
            child: _getText('驳回理由', '凭证金额与汇款金额不符', const Color(0xFFE62222)),
          ),
          36.hb,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '支付凭证',
                style: TextStyle(
                    color: BaseStyle.color333333,
                    fontSize: BaseStyle.fontSize28),
              ),
              16.hb,
              SizedBox(
                width: 200.w,
                height: 150.w,
                child: const CloudImageNetworkWidget.car(
                  urls: [],
                ),
              ),
              SizedBox(
                width: 686.w,
              )
            ],
          ),
          36.hb,
          _getText(
              '支付时间',
              DateUtil.formatDateMs(
                  _consignmentInfoList.downPayment.createdAt.toInt() * 1000,
                  format: DateFormats.full),
              BaseStyle.color333333),
          widget.status.num == 40 ||
                  widget.status.num == 41 ||
                  widget.status.num == 50
              ? 36.hb
              : 0.hb,
          Offstage(
            offstage: !(widget.status.num == 40 ||
                widget.status.num == 41 ||
                widget.status.num == 50),
            child: Column(
              children: [
                widget.status.num == 40 || widget.status.num == 40
                    ? widget.status.num == 40
                        ? _getText(
                            '尾款支付',
                            '¥${_consignmentInfoList.contract.balancePayment}(审核中)',
                            const Color(0xFF027AFF))
                        : _getText(
                            '尾款支付',
                            '¥${_consignmentInfoList.contract.balancePayment}(审核驳回)',
                            const Color(0xFFE62222))
                    : _getText(
                        '尾款支付',
                        '¥${_consignmentInfoList.contract.balancePayment}',
                        BaseStyle.color333333),
                36.hb,
                Offstage(
                  offstage: widget.status.num != 2222,
                  child: _getText('驳回理由', '未收到银行汇款款项', const Color(0xFFE62222)),
                ),
                widget.status.num == 222 ? 36.hb : 0.hb,
                _getText('支付形式', '按揭支付', BaseStyle.color333333),
                36.hb,
                _getText(
                    '支付时间',
                    DateUtil.formatDateMs(
                        _consignmentInfoList.balancePayment.createdAt.toInt() *
                            1000,
                        format: DateFormats.full),
                    BaseStyle.color333333),
              ],
            ),
          ),
        ],
      ),
    );
  }

// //首付支付审核
//   getPayAudit() {
//     switch (widget.statusNum) {
//       case 20:
//         return _getText(
//             '首付支付',
//             '¥${_consignmentInfoList.contract.downPayment}(审核中)',
//             const Color(0xFF027AFFA));
//       case 21:
//         _getText('首付支付', '¥${_consignmentInfoList.contract.downPayment}',
//             BaseStyle.color333333);
//     }
//   }

//车辆检测报告
  _getReport() {
    return _getContainer(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle('车辆检测报告'),
        36.hb,
        SizedBox(
          width: 200.w,
          height: 150.w,
          child: CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.report.path],
          ),
        ),
        SizedBox(
          width: 686.w,
        )
      ],
    ));
  }

  //车辆检测报告2
  _getReport2() {
    return _getContainer(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle("车辆检测报告"),
        36.hb,
        _getPhoto(
          '登记证书',
          CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.means.certificate],
          ),
        ),
        36.hb,
        _getPhoto(
          '行驶证',
          CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.means.vehicleLicense],
          ),
        ),
        36.hb,
        _getPhoto(
          '发票',
          CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.means.invoice],
          ),
        ),
        36.hb,
        _getPhoto(
          '保单',
          CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.means.guaranteeSlip],
          ),
        ),
        SizedBox(
          width: 686.w,
        ),
      ],
    ));
  }

//是否驳回
//   getRejected() {
//     return Row(
//       children: [
//         SizedBox(
//           child: Text(
//             '驳回理由',
//             style: TextStyle(
//                 color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
//           ),
//         ),
//         32.wb,
//         Padding(
//           padding: EdgeInsets.only(left: 0.w),
//           child: Text(
//             '凭证金额与汇款金额不符',
//             style: TextStyle(
//                 color: const Color(0xFFE62222), fontSize: BaseStyle.fontSize28),
//           ),
//         )
//       ],
//     );
//   }

//支付是否成功
  _getPayPass() {
    switch (widget.status) {
      case OrderSaleStatus.cancel:
        return const SizedBox.shrink();
      case OrderSaleStatus.unSign:
        return Container(
          width: double.infinity,
          color: kForeGroundColor,
          padding: EdgeInsets.only(right: 32.w, top: 36.w, bottom: 36.w),
          margin: EdgeInsets.only(top: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: Text(
                  '等待支付定金',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              24.wb,
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '¥',
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize28,
                        color: const Color(0xFFFF3B02))),
                TextSpan(
                    text: _consignmentInfoList.contract.deposit,
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize32,
                        color: const Color(0xFFFF3B02)))
              ]))
            ],
          ),
        );

      case OrderSaleStatus.sign:
        return const SizedBox.shrink();
      case OrderSaleStatus.deposit:
        return const SizedBox.shrink();
      case OrderSaleStatus.testReport:
        return Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
            margin: EdgeInsets.only(top: 16.w),
            child: GestureDetector(
              onTap: () {
                Get.to(() => DetectionDataPage(
                      orderId: widget.orderId,
                    ));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: Container(
                    padding:
                        EdgeInsets.only(left: 32.w, top: 16.w, bottom: 16.w),
                    decoration: BoxDecoration(
                        color: const Color(0xFF027AFF),
                        borderRadius: BorderRadius.circular(8.w)),
                    child: Text(
                      '上传报告',
                      style: TextStyle(
                          color: kForeGroundColor,
                          fontSize: BaseStyle.fontSize28),
                    )),
              ),
            ));

      case OrderSaleStatus.uploadTestReport:
        return const SizedBox.shrink();
      case OrderSaleStatus.downPaymentAudit:
        return Container(
          width: double.infinity,
          color: kForeGroundColor,
          padding: EdgeInsets.only(right: 32.w, top: 36.w, bottom: 36.w),
          margin: EdgeInsets.only(top: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: Text(
                  '等待支付首付',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              24.wb,
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '¥',
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize28,
                        color: const Color(0xFFFF3B02))),
                TextSpan(
                    text: _consignmentInfoList.contract.downPayment,
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize32,
                        color: const Color(0xFFFF3B02)))
              ]))
            ],
          ),
        );

      case OrderSaleStatus.dowPaymentAdopt:
        return const SizedBox.shrink();
      case OrderSaleStatus.transfer:
        return Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
            margin: EdgeInsets.only(top: 16.w),
            child: GestureDetector(
              onTap: () {
                Get.to(() => ChangeNameDataPage(
                      orderId: widget.orderId,
                    ));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: Container(
                    padding:
                        EdgeInsets.only(left: 32.w, top: 16.w, bottom: 16.w),
                    decoration: BoxDecoration(
                        color: const Color(0xFF027AFF),
                        borderRadius: BorderRadius.circular(8.w)),
                    child: Text(
                      '上传资料',
                      style: TextStyle(
                          color: kForeGroundColor,
                          fontSize: BaseStyle.fontSize28),
                    )),
              ),
            ));
      case OrderSaleStatus.transferFinal:
        return const SizedBox.shrink();
      case OrderSaleStatus.balancePaymentAudit:
        return Container(
          width: double.infinity,
          color: kForeGroundColor,
          padding: EdgeInsets.only(right: 32.w, top: 36.w, bottom: 36.w),
          margin: EdgeInsets.only(top: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: Text(
                  '等待支付尾款',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              24.wb,
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '¥',
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize28,
                        color: const Color(0xFFFF3B02))),
                TextSpan(
                    text: _consignmentInfoList.contract.balancePayment,
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize32,
                        color: const Color(0xFFFF3B02)))
              ]))
            ],
          ),
        );
      case OrderSaleStatus.balancePaymentAdopt:
        return Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
            margin: EdgeInsets.only(top: 16.w),
            child: GestureDetector(
              onTap: () async {
                var re = await OrderFunc.getFinal(widget.orderId);
                if (re) {
                  Get.back();
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: Container(
                    padding:
                        EdgeInsets.only(left: 32.w, top: 16.w, bottom: 16.w),
                    decoration: BoxDecoration(
                        color: const Color(0xFF027AFF),
                        borderRadius: BorderRadius.circular(8.w)),
                    child: Text(
                      '成交订单',
                      style: TextStyle(
                          color: kForeGroundColor,
                          fontSize: BaseStyle.fontSize28),
                    )),
              ),
            ));
      case OrderSaleStatus.orderFinal:
        return const SizedBox.shrink();
    }
  }

//body框架
  _getContainer(Widget widget) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: widget,
    );
  }

//文字加图片样式
  _getPhoto(String title, CloudImageNetworkWidget url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
        ),
        GestureDetector(
          child: SizedBox(
            width: 200.w,
            height: 150.w,
            child: url,
          ),
        )
      ],
    );
  }

//文本样式
  _getText(String title, String text, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 150.w,
          child: Text(
            title,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
        ),
        32.wb,
        Padding(
          padding: EdgeInsets.only(left: 0.w),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: BaseStyle.fontSize28),
          ),
        )
      ],
    );
  }

//标签样式
  _getChip(String num, String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF027AFF).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF027AFF)),
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

//模块标题样式
  _getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

//车辆信息底部文字样式
  _getCar(String title, String text) {
    return SizedBox(
      width: 144.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: BaseStyle.fontSize24, color: BaseStyle.color999999),
          ),
          24.hb,
          Text.rich(TextSpan(children: [
            TextSpan(
                text: '¥',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize20,
                    color: BaseStyle.color333333,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: text,
                style: TextStyle(
                    fontSize: BaseStyle.fontSize24,
                    color: BaseStyle.color333333,
                    fontWeight: FontWeight.bold))
          ]))
        ],
      ),
    );
  }

//车辆信息下拉
  _getList() {
    return DropDown(
      border: true,
      title: _getTitle('车辆总价'),
      text: SizedBox(
          child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '¥',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold)),
        TextSpan(
            text: _consignmentInfoList.contract.totalAmount,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(fontWeight: FontWeight.bold)),
      ]))),
      widget: Container(
          padding: EdgeInsets.only(top: 16.w),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getCar(
                  '车辆定金',
                  //(_consignmentInfoList.contractSignAt).toString()),
                  _consignmentInfoList.contract.deposit),
              46.wb,
              Container(
                width: 1.w,
                height: 72.w,
                color: BaseStyle.coloreeeeee,
              ),
              46.wb,
              _getCar('车辆首付', _consignmentInfoList.contract.downPayment),
              46.wb,
              Container(
                width: 1.w,
                height: 72.w,
                color: BaseStyle.coloreeeeee,
              ),
              46.wb,
              _getCar('车辆尾款', _consignmentInfoList.contract.balancePayment),
            ],
          )),
    );
  }

  _text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: BaseStyle.color111111, fontSize: BaseStyle.fontSize24),
    );
  }
}
