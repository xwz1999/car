import 'package:cloud_car/model/car/consignment_contact_model.dart';
import 'package:cloud_car/model/order/individual_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_picture_page.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/progress_bar.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import '../../../../utils/headers.dart';
import '../../../../widget/button/cloud_back_button.dart';

class ConsignmentSignedPage extends StatefulWidget {
  //final String stat;

  final int id;
  final ConsignmentStatus statusNumber;
  final int auditStatus;
  final int licensingDate;
  final int createdAt;
  final String price;

  const ConsignmentSignedPage(
      {super.key,
      //required this.stat,

      required this.id,
      required this.statusNumber,
      required this.auditStatus,
      required this.licensingDate,
      required this.createdAt,
      required this.price});

  @override
  State<ConsignmentSignedPage> createState() => _ConsignmentSignedPageState();
}

class _ConsignmentSignedPageState extends State<ConsignmentSignedPage> {
  IndividualModel? _individualList;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () async {
      await _refresh();
      setState(() {});
    });
  }

  _refresh() async {
    _individualList = await OrderFunc.getConsignmentInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('个人寄卖',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: bodyColor,
        body: _individualList == null
            ? const SizedBox.shrink()
            : ListView(children: [
                16.hb,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  padding: EdgeInsets.only(top: 32.w),
                  height: 120.w,
                  color: Colors.white,
                  child: ProgressBar(
                    length: 6,
                    num: widget.statusNumber.progressNum,
                    direction: false,
                    cancel: widget.statusNumber.num != 0,
                    HW: 96,
                    texts: [
                      _text('预定'),
                      _text('签订'),
                      _text('上架'),
                      widget.statusNumber.num == 0
                          ? _text('交易取消')
                          : _text('出售'),
                      _text('到账'),
                      _text('成交'),
                    ],
                  ),
                ),
                16.hb,
                Offstage(
                  offstage:
                      widget.statusNumber.num != 3 && widget.auditStatus != 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    padding: EdgeInsets.all(28.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.w)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getTitle('审核驳回'),
                        36.hb,
                        _getText('审核时间', ''),
                        36.hb,
                        _getText(
                          '驳回理由',
                          '车辆信息填写有误，重新提交',
                        )
                      ],
                    ),
                  ),
                ),
                widget.statusNumber.num == 3 && widget.auditStatus == 3
                    ? 16.hb
                    : 0.hb,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  padding: EdgeInsets.all(28.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _getTitle('客户信息'),
                      36.hb,
                      _getText('客户姓名', _individualList!.customer.nickname),
                      36.hb,
                      _getText(
                        '手机号',
                        _individualList!.customer.mobile,
                      )
                    ],
                  ),
                ),
                16.hb,

                ///车辆信息
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
                                  urls: [_individualList!.car.mainPhoto],
                                ),
                              ),
                              20.wb,
                              SizedBox(
                                width: 406.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(_individualList!.car.modelName,
                                        style: TextStyle(
                                            fontSize: BaseStyle.fontSize28,
                                            color: BaseStyle.color111111)),
                                    32.hb,
                                    Padding(
                                      padding: EdgeInsets.only(right: 16.w),
                                      child: _getText1(
                                          DateUtil.formatDateMs(
                                              _individualList!.car.licensingDate
                                                      .toInt() *
                                                  1000,
                                              format: 'yyyy年MM'),
                                          '${_individualList!.car.mileage}万公里'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ])),
                16.hb,
                widget.statusNumber.num == 1
                    ? Container(
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
                              child: _getTitle('预约直卖信息'),
                            ),
                            36.hb,
                            _getText('预约地址', '云云问车 浙江省宁波市海曙区宁波保险科技产业园1号楼601-3'),
                            36.hb,
                            _getText(
                              '预约时间',
                              DateUtil.formatDateMs(
                                  widget.licensingDate.toInt() * 1000,
                                  format: DateFormats.full),
                            )
                          ],
                        ),
                      )
                    : Container(
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
                              child: _getTitle('合同信息'),
                            ),
                            36.hb,
                            _getText('合同编号', _individualList!.contractSn),
                            36.hb,
                            _getText(
                              '签订时间',
                              DateUtil.formatDateMs(
                                  _individualList!.contractSignAt.toInt() *
                                      1000,
                                  format: DateFormats.full),
                            )
                          ],
                        ),
                      ),
                16.hb,
                _getWidget()
              ]),
        bottomNavigationBar: SizedBox(
            height: 100.w,
            child: widget.statusNumber.num == 2 ||
                    (widget.statusNumber.num == 3 && widget.auditStatus == 3)
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
                            Get.to(() => CarPicturePage(
                                  isPersonal: true,
                                  consignmentContractModel:
                                      ConsignmentContractModel(
                                          masterInfo: MasterInfo()),
                                  orderId: widget.id,
                                ));
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
                                  widget.statusNumber.num == 2
                                      ? '发布车辆'
                                      : '重新发布',
                                  style: TextStyle(
                                      color: kForeGroundColor,
                                      fontSize: BaseStyle.fontSize28),
                                )),
                          ),
                        )),
                  )
                : const SizedBox()));
  }

  _getWidget() {
    switch (widget.statusNumber) {
      case ConsignmentStatus.cancel:
        // TODO: Handle this case.
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
                child: _getTitle('交易取消信息'),
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

      case ConsignmentStatus.unSign:
        return const SizedBox.shrink();
      case ConsignmentStatus.unPublish:
        return const SizedBox.shrink();
      case ConsignmentStatus.publish:
        // TODO: Handle this case.
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
            return;
        }

      case ConsignmentStatus.theUpper:
        return const SizedBox.shrink();
      case ConsignmentStatus.sale:
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
                child: _getTitle('出售信息'),
              ),
              36.hb,
              _getText('购车客户', '莉'),
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
                DateUtil.formatDateMs(_individualList!.saleAt.toInt() * 1000,
                    format: DateFormats.full),
              ),
            ],
          ),
        );

      case ConsignmentStatus.account:
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
                    child: _getTitle('出售信息'),
                  ),
                  36.hb,
                  _getText('购车客户', _individualList!.customer.nickname),
                  36.hb,
                  _getText(
                    '手机号',
                    _individualList!.customer.mobile,
                  ),
                  36.hb,
                  _getText(
                    '出售价格',
                    '¥${_individualList!.saleAmount}',
                  ),
                  36.hb,
                  _getText(
                    '出售时间',
                    DateUtil.formatDateMs(
                        _individualList!.saleAt.toInt() * 1000,
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
                    child: _getTitle('到款信息'),
                  ),
                  36.hb,
                  _getText('到款金额', '¥${widget.price}'),
                  36.hb,
                  _getText(
                    '到款时间',
                    DateUtil.formatDateMs(
                        _individualList!.paymentCreatedAt.toInt() * 1000,
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
                      urls: [_individualList!.car.mainPhoto],
                    ),
                  )
                ],
              ),
            )
          ],
        );

      case ConsignmentStatus.uFinal:
        return const SizedBox.shrink();
      case ConsignmentStatus.theDown:
        return const SizedBox.shrink();
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

  _getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(fontWeight: FontWeight.bold),
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
              color: widget.statusNumber.num == 3 && widget.auditStatus == 3
                  ? const Color(0xFFE62222)
                  : BaseStyle.color333333,
              fontSize: BaseStyle.fontSize28),
        ),
      ],
    );
  }

  _getText1(String time, String distance) {
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

  _text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: BaseStyle.color111111, fontSize: BaseStyle.fontSize24),
    );
  }
}
