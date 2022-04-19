// ignore_for_file: dead_code

import 'package:cloud_car/ui/user/user_order/user_consignment_order/backup/consignment_audit.dart';
import 'package:cloud_car/widget/progress_bar.dart';
import 'package:cloud_car/widget/timelines_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/headers.dart';
import '../../../../widget/button/cloud_back_button.dart';

class ConsignmentSigned extends StatefulWidget {
  final String stat;
  const ConsignmentSigned({Key? key, required this.stat}) : super(key: key);

  @override
  State<ConsignmentSigned> createState() => _ConsignmentSignedState();
}

class _ConsignmentSignedState extends State<ConsignmentSigned> {
  late String stat = widget.stat;
  late Widget methods;
  late bool bl = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('寄卖订单',
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
                  num: 3,
                  direction: 'qw',
                  HW: 96,
                  texts: [
                    text('预定'),
                    text('签订'),
                    text('上架'),
                    text('出售'),
                    text('到账'),
                    text('成交'),
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
                    getTitle('客户信息'),
                    36.hb,
                    _getText('客户姓名', '莉丝'),
                    36.hb,
                    _getText(
                      '手机号',
                      '18912345432',
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
                              child: Image.asset(
                                Assets.images.carBanner.path,
                                fit: BoxFit.fill,
                              ),
                            ),
                            20.wb,
                            SizedBox(
                              width: 406.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('奥迪Q3 2020款 35 TFSI 进取型SUV',
                                      style: TextStyle(
                                          fontSize: BaseStyle.fontSize28,
                                          color: BaseStyle.color111111)),
                                  32.hb,
                                  Padding(
                                    padding: EdgeInsets.only(right: 16.w),
                                    child: getText('2020年10月', '20.43万公里'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ])),
              16.hb,
              stat == '待签订'
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
                            child: getTitle('预约直卖信息'),
                          ),
                          36.hb,
                          _getText('预约地址', '云云问车 浙江省宁波市海曙区宁波保险科技产业园1号楼601-3'),
                          36.hb,
                          _getText(
                            '预约时间',
                            '2021-12-30 12:00-18:00',
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
                            child: getTitle('合同信息'),
                          ),
                          36.hb,
                          _getText('合同编号', '9876524612'),
                          36.hb,
                          _getText(
                            '签订时间',
                            '2021-12-30 12:00:00',
                          )
                        ],
                      ),
                    ),
              16.hb,
              getWidget()
            ]),
            stat == '待发布'
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
    switch (stat) {
      case '待签订':
        return methods = const SizedBox();
        break;
      case '待发布':
        return methods = const SizedBox();
        break;
      case '审核中':
        return methods = Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Text(
            '注：您已提交车辆信息，平台将对车辆信息进行审核，通过后将为您发布上架！',
            style: TextStyle(
                fontSize: BaseStyle.fontSize24, color: BaseStyle.color999999),
          ),
        );
        break;
      case '在售':
        return methods = const SizedBox();
        break;
      case '已售':
        return methods = bl
            ? Column(
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
                        _getText('购车客户', '李四'),
                        36.hb,
                        _getText(
                          '手机号',
                          '18935263526',
                        ),
                        36.hb,
                        _getText(
                          '出售价格',
                          '¥300,000.00',
                        ),
                        36.hb,
                        _getText(
                          '出售时间',
                          '2021-12-30 12:00:00',
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
                        _getText('到款金额', '¥300,000.00'),
                        36.hb,
                        _getText(
                          '到款时间',
                          '2021-12-30 12:00:00',
                        ),
                        36.hb,
                        _getText(
                          '出售价格',
                          '¥300,000.00',
                        ),
                        36.hb,
                        _getPicture('到款凭证', Assets.images.carBanner.path)
                      ],
                    ),
                  )
                ],
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
                      child: getTitle('出售信息'),
                    ),
                    36.hb,
                    _getText('购车客户', '李四'),
                    36.hb,
                    _getText(
                      '手机号',
                      '18935263526',
                    ),
                    36.hb,
                    _getText(
                      '出售价格',
                      '¥300,000.00',
                    ),
                    36.hb,
                    _getText(
                      '出售时间',
                      '2021-12-30 12:00:00',
                    ),
                  ],
                ),
              );
        break;
      case '交易取消':
        return methods = Container(
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
        break;
    }
  }

  _getPicture(String title, String url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
        ),
        24.hb,
        GestureDetector(
          child: SizedBox(
            width: 200.w,
            height: 150.w,
            child: Image.asset(url),
          ),
        )
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
        Flexible(
          child: SizedBox(
            width: 478.w,
            child: Text(
              text,
              style: TextStyle(
                  color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
            ),
          ),
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
