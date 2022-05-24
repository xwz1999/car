import 'package:cloud_car/model/order/Sale_info.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/change_name_data.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/detection_data.dart';
import 'package:cloud_car/utils/drop_down_body.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/progress_bar.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class Reservation extends StatefulWidget {
  final int orderId;
  final String status;
  final int statusNum;
  final int statusNumber;

  const Reservation(
      {super.key,
      required this.orderId,
      required this.status,
      required this.statusNum,
      required this.statusNumber});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
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
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 32.w, right: 32.w, top: 16.w, bottom: 8.w),
                  padding: EdgeInsets.only(top: 32.w),
                  height: 120.w,
                  color: Colors.white,
                  child: ProgressBar(
                    length: 6,
                    num: widget.statusNumber,
                    direction: false,
                    cancel: widget.statusNum != 0,
                    HW: 96,
                    texts: [
                      text('预定'),
                      text('检测'),
                      widget.statusNum == 0 ? text('订单取消') : text('首付'),
                      text('过户'),
                      text('尾款'),
                      text('完成'),
                    ],
                  ),
                ),
                getContainer(
                  ///客户信息
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: getTitle('客户信息'),
                      ),
                      36.hb,
                      _getText('客户姓名', '莉丝', BaseStyle.color333333),
                      36.hb,
                      _getText('手机号', '111112112122', BaseStyle.color333333)
                    ],
                  ),
                ),

                ///车辆信息
                getContainer(
                  GestureDetector(
                    onTap: () {
                      //Get.to(() => const Reservation(judge: null,));
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTitle('车辆信息'),
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
                                    getCaip(
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
                          getList(),
                        ]),
                  ),
                ),

                ///合同信息
                getContract(widget.statusNum),

                ///支付信息
                Offstage(
                  offstage: widget.statusNum == 1,
                  child: getPay(widget.statusNum),
                ),

                ///车辆检测报告
                Offstage(
                  offstage: widget.statusNum == 1 ||
                      widget.statusNum == 3 ||
                      widget.statusNum == 10,
                  child: getReport(),
                ),
                widget.statusNum == 0
                    ? getContainer(
                        ///订单取消
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0.w),
                              child: getTitle('订单取消信息'),
                            ),
                            36.hb,
                            _getText('取消人员', '云云问车平台', BaseStyle.color333333),
                            36.hb,
                            _getText(
                                '取消时间', '111112112122', BaseStyle.color333333)
                          ],
                        ),
                      )
                    : const SizedBox(),

                ///车辆检测报告2
                Offstage(
                  offstage: !(widget.statusNum == 40 ||
                      widget.statusNum == 41 ||
                      widget.statusNum == 50),
                  child: getReport2(),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: getPayPass(),
            )
          ],
        ));
  }

  //合同信息
  getContract(int number) {
    return getContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: getTitle('合同信息'),
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
  getPay(int number) {
    return getContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: getTitle('支付信息'),
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
          widget.statusNum == 20 || widget.statusNum == 20
              ? widget.statusNum == 20
                  ? _getText(
                      '首付支付',
                      '¥${_consignmentInfoList.contract.downPayment}(审核中)',
                      const Color(0xFF027AFFA))
                  : _getText(
                      '首付支付',
                      '¥${_consignmentInfoList.contract.downPayment}(审核驳回)',
                      const Color(0xFFE62222))
              : _getText(
                  '首付支付',
                  '¥${_consignmentInfoList.contract.downPayment}',
                  BaseStyle.color333333),
          widget.statusNum == 20 ? 36.hb : 0.hb,
          Offstage(
            offstage: widget.statusNum != 20,
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
          widget.statusNum == 40 ||
                  widget.statusNum == 41 ||
                  widget.statusNum == 50
              ? 36.hb
              : 0.hb,
          Offstage(
            offstage: !(widget.statusNum == 40 ||
                widget.statusNum == 41 ||
                widget.statusNum == 50),
            child: Column(
              children: [
                widget.statusNum == 40 || widget.statusNum == 40
                    ? widget.statusNum == 40
                        ? _getText(
                            '尾款支付',
                            '¥${_consignmentInfoList.contract.balancePayment}(审核中)',
                            const Color(0xFF027AFFA))
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
                  offstage: widget.statusNum != 2222,
                  child: _getText('驳回理由', '未收到银行汇款款项', const Color(0xFFE62222)),
                ),
                widget.statusNum == 222 ? 36.hb : 0.hb,
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
  getReport() {
    return getContainer(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTitle('车辆检测报告'),
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
  getReport2() {
    return getContainer(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTitle("车辆检测报告"),
        36.hb,
        getPhoto(
          '登记证书',
          CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.means.certificate],
          ),
        ),
        36.hb,
        getPhoto(
          '行驶证',
          CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.means.vehicleLicense],
          ),
        ),
        36.hb,
        getPhoto(
          '发票',
          CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.means.invoice],
          ),
        ),
        36.hb,
        getPhoto(
          '保单',
          CloudImageNetworkWidget.car(
            urls: [_consignmentInfoList.means.guaranteeSlip],
          ),
        ),
        SizedBox(
          width: 686.w,
        )
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
  getPayPass() {
    switch (widget.statusNum) {
      case 1:
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
      case 10:
        return Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
            margin: EdgeInsets.only(top: 16.w),
            child: GestureDetector(
              onTap: () {
                Get.to(() => DetectionData(
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
      case 20:
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
      case 30:
        return Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
            margin: EdgeInsets.only(top: 16.w),
            child: GestureDetector(
              onTap: () {
                Get.to(() => ChangeNameData(
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
      case 40:
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
      case 41:
        return Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
            margin: EdgeInsets.only(top: 16.w),
            child: GestureDetector(
              onTap: () async {
                // Get.to(() => const MakeDealData());
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
      default:
        return const SizedBox();
    }
  }

//body框架
  getContainer(Widget widget) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: widget,
    );
  }

//文字加图片样式
  getPhoto(String title, CloudImageNetworkWidget url) {
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
  getCaip(String num, String time, String distance) {
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
  getTitle(String title) {
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
  getList() {
    return DropDown(
      border: true,
      title: getTitle('车辆总价'),
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

  text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: BaseStyle.color111111, fontSize: BaseStyle.fontSize24),
    );
  }
}
