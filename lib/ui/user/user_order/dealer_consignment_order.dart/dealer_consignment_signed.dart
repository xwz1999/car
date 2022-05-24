// ignore_for_file: dead_code

import 'package:cloud_car/model/order/individual_model.dart';
import 'package:cloud_car/ui/user/user_order/user_consignment_order/backup/consignment_audit.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/progress_bar.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import '../../../../utils/headers.dart';
import '../../../../widget/button/cloud_back_button.dart';

class DealerConsignmentSigned extends StatefulWidget {
  //final String stat;
  final int statusNum;
  final int id;
  final int auditStatus;
  final int status;
  final String price;

  const DealerConsignmentSigned(
      {super.key,
      //required this.stat,
      required this.auditStatus,
      required this.statusNum,
      required this.id,
      required this.status,
      required this.price});

  @override
  State<DealerConsignmentSigned> createState() =>
      _DealerConsignmentSignedState();
}

class _DealerConsignmentSignedState extends State<DealerConsignmentSigned> {
  // late String stat = widget.stat;
  // late Widget methods;
  // late bool bl = true;
  // getConsignmentInfo
  late IndividualModel _individualList;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () async {
      await _refresh();
      setState(() {});
    });
  }

  _refresh() async {
    //_individualList = (await OrderFunc.getConsignmentInfo(widget.id))!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('车商寄卖',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: bodyColor,
        body: Stack(
          children: [
            ListView(children: [
              16.hb,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                padding: EdgeInsets.only(top: 32.w),
                height: 120.w,
                color: Colors.white,
                child: ProgressBar(
                  length: 6,
                  num: widget.statusNum,
                  direction: false,
                  cancel: widget.status != 0,
                  HW: 96,
                  texts: [
                    text('发布'),
                    text('上架'),
                    widget.status == 0 ? text('订单取消') : text('出售'),
                    text('到账'),
                    text('成交'),
                  ],
                ),
              ),
              16.hb,
              widget.status == 1 && widget.auditStatus == 3
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 32.w),
                      padding: EdgeInsets.all(28.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.w)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTitle('审核驳回'),
                          36.hb,
                          _getText('审核时间', _individualList.customer.nickname),
                          36.hb,
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  '驳回理由',
                                  style: TextStyle(
                                      color: BaseStyle.color333333,
                                      fontSize: BaseStyle.fontSize28),
                                ),
                              ),
                              32.wb,
                              Flexible(
                                child: SizedBox(
                                  width: 478.w,
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: BaseStyle.fontSize28),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          _getText(
                            '驳回理由',
                            _individualList.customer.mobile,
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              16.hb,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                padding: EdgeInsets.all(28.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTitle('车商信息'),
                    36.hb,
                    _getText('车商编号', _individualList.customer.nickname),
                    36.hb,
                    _getText(
                      '车商名称',
                      _individualList.customer.mobile,
                    )
                  ],
                ),
              ),
              16.hb,
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  decoration: BoxDecoration(
                      color: kForeGroundColor,
                      borderRadius: BorderRadius.circular(16.w)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: Text(
                            '车辆信息',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        24.hb,
                        Row(
                          children: [
                            SizedBox(
                              width: 196.w,
                              height: 150.w,
                              child: CloudImageNetworkWidget.car(
                                urls: [_individualList.car.mainPhoto],
                              ),
                            ),
                            20.wb,
                            SizedBox(
                              width: 406.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(_individualList.car.modelName,
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color111111)),
                                  32.hb,
                                  Padding(
                                    padding: EdgeInsets.only(right: 16.w),
                                    child: getText(
                                        DateUtil.formatDateMs(
                                            _individualList.car.licensingDate
                                                    .toInt() *
                                                1000,
                                            format: 'yyyy年MM'),
                                        '${_individualList.car.mileage}万公里'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ])),
              16.hb,
              getWidget()
            ]),
            widget.status == 3 && widget.auditStatus == 3
                ? Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        width: double.infinity,
                        color: kForeGroundColor,
                        padding: EdgeInsets.only(
                            top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const ConsignmentAudit());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 16.w),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 38.w, top: 16.w, bottom: 16.w),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF027AFF),
                                    borderRadius: BorderRadius.circular(8.w)),
                                child: Text(
                                  '重新发布',
                                  style: TextStyle(
                                      color: kForeGroundColor,
                                      fontSize: BaseStyle.fontSize28),
                                )),
                          ),
                        )),
                  )
                : const SizedBox()
          ],
        ));
  }

  getWidget() {
    switch (widget.status) {
      case 1:
        switch (widget.auditStatus) {
          case 1:
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Text(
                '注：您已提交车辆信息，平台将对车辆信息进行审核，通过后将为您发布上架！',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize24,
                    color: BaseStyle.color999999),
              ),
            );
          default:
            return const SizedBox();
        }
        break;
      case 4:
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('出售信息'),
                  ),
                  36.hb,
                  _getText('购车客户', _individualList.customer.nickname),
                  36.hb,
                  _getText(
                    '手机号',
                    _individualList.customer.mobile,
                  ),
                  36.hb,
                  _getText(
                    '出售价格',
                    '¥${_individualList.saleAmount}',
                  ),
                  36.hb,
                  _getText(
                    '出售时间',
                    DateUtil.formatDateMs(_individualList.saleAt.toInt() * 1000,
                        format: DateFormats.full),
                  ),
                ],
              ),
            ),
            16.hb,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('到款信息'),
                  ),
                  36.hb,
                  _getText('到款金额', '¥${widget.price}'),
                  36.hb,
                  _getText(
                    '到款时间',
                    DateUtil.formatDateMs(
                        _individualList.paymentCreatedAt.toInt() * 1000,
                        format: DateFormats.full),
                  ),
                  36.hb,
                  _getText(
                    '出售价格',
                    '¥${widget.price}',
                  ),
                  36.hb,
                  _getPicture(
                    '到款凭证',
                    CloudImageNetworkWidget.car(
                      urls: [_individualList.car.mainPhoto],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      case 3:
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          padding: EdgeInsets.all(28.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: getTitle('出售信息'),
              ),
              36.hb,
              _getText('购车客户', '莉丝'),
              36.hb,
              _getText(
                '手机号',
                '18935263526',
              ),
              36.hb,
              _getText(
                '出售价格',
                '¥${widget.price}',
              ),
              36.hb,
              _getText(
                '出售时间',
                DateUtil.formatDateMs(_individualList.saleAt.toInt() * 1000,
                    format: DateFormats.full),
              ),
            ],
          ),
        );

      case 0:
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          padding: EdgeInsets.all(28.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: getTitle('交易取消信息'),
              ),
              36.hb,
              _getText('取消人员', '云云问车平台'),
              36.hb,
              _getText(
                '取消时间',
                '2021-12-30 12:00:00',
              ),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }

  _getPicture(String title, dynamic url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
        ),
        24.hb,
        url
      ],
    );
  }

  getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  _getText(String title, String text) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            title,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
        ),
        32.wb,
        Text(
          text,
          style: TextStyle(
              color: widget.status == 1 && widget.auditStatus == 3
                  ? const Color(0xFFE62222)
                  : BaseStyle.color333333,
              fontSize: BaseStyle.fontSize28),
        ),
      ],
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

  text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: BaseStyle.color111111, fontSize: BaseStyle.fontSize24),
    );
  }
}
