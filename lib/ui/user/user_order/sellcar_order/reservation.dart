// ignore_for_file: dead_code

import 'package:cloud_car/ui/user/user_order/sellcar_order/change_name_data.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/backup/detection_data.dart';
import 'package:cloud_car/ui/user/user_order/sellcar_order/make_deal_data.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/progress_bar.dart';

import 'package:flutter/material.dart';

class Reservation extends StatefulWidget {
  final String stat;
  final bool judge;

  const Reservation({Key? key, required this.judge, required this.stat})
      : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  List<String> items = [
    '预定',
    '检测',
    '首付',
    '过户',
    '尾款',
    '完成',
  ];
  late bool judge = widget.judge;
  late Widget methods;
  late String stat = widget.stat;
  late String audit = '3';
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

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: bodyColor,
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 32.w, right: 32.w, top: 16.w, bottom: 8.w),
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
                getContainer(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: getTitle('客户信息'),
                      ),
                      36.hb,
                      _getText('客户姓名', '莉丝'),
                      36.hb,
                      _getText('手机号', '18912345432')
                    ],
                  ),
                ),
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
                                child: Image.asset(
                                  Assets.images.carBanner.path,
                                  fit: BoxFit.fill,
                                ),
                                width: 196.w,
                                height: 150.w,
                              ),
                              20.wb,
                              SizedBox(
                                width: 406.w,
                                child: Column(
                                  children: [
                                    Text('奥迪Q3 2020款 35 TFSI 进取型SUV',
                                        style: TextStyle(
                                            fontSize: BaseStyle.fontSize28,
                                            color: BaseStyle.color111111)),
                                    26.hb,
                                    getCaip('过户0次', '2020年10月', '20.43万公里')
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
                getWidget(),
                130.hb,
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

//判断页面
  getWidget() {
    switch (stat) {
      case '待预定':
        return !judge
            ? getContainer(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.w),
                      child: getTitle('合同信息'),
                    ),
                    36.hb,
                    _getText('合同编号', '98765323'),
                    36.hb,
                    _getText('签订时间', '——')
                  ],
                ),
              )
            : Column(
                children: [
                  getContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: getTitle('合同信息'),
                        ),
                        36.hb,
                        _getText('合同编号', '98765323'),
                        36.hb,
                        _getText('签订时间', '2021-12-30 15:23:48')
                      ],
                    ),
                  ),
                  getContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: getTitle('支付信息'),
                        ),
                        36.hb,
                        _getText('定金支付', '¥10,000.00'),
                        36.hb,
                        _getText('支付方式', '支付宝'),
                        36.hb,
                        _getText('支付时间', '2021-12-30 15:23:48'),
                      ],
                    ),
                  )
                ],
              );
        break;
      case '待检测':
        return Column(
          children: [
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号', '98765323'),
                  36.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
                ],
              ),
            ),
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  36.hb,
                  _getText('定金支付', '¥10,000.00'),
                  36.hb,
                  _getText('支付方式', '支付宝'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                ],
              ),
            ),
          ],
        );
        break;
      case '支付首付':
        return !judge
            ? Column(
                children: [
                  getContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: getTitle('合同信息'),
                        ),
                        36.hb,
                        _getText('合同编号', '98765323'),
                        36.hb,
                        _getText('签订时间', '2021-12-30 15:23:48')
                      ],
                    ),
                  ),
                  getContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: getTitle('支付信息'),
                        ),
                        36.hb,
                        _getText('定金支付', '¥10,000.00'),
                        36.hb,
                        _getText('支付方式', '支付宝'),
                        36.hb,
                        _getText('支付时间', '2021-12-30 15:23:48'),
                      ],
                    ),
                  ),
                  getContainer(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getTitle('车辆检测报告'),
                      36.hb,
                      Image(
                        image: Assets.images.carBanner,
                        width: 200.w,
                        height: 150.w,
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ))
                ],
              )
            : getFirst();
        break;
      case '待过户':
        return Column(
          children: [
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号', '98765323'),
                  36.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
                ],
              ),
            ),
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  36.hb,
                  _getText('定金支付', '¥10,000.00'),
                  36.hb,
                  _getText('支付方式', '支付宝'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  _getText('首付支付', '¥100,000.00'),
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
                      Image(
                        image: Assets.images.carBanner,
                        width: 200.w,
                        height: 150.w,
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ),
                  36.hb,
                ],
              ),
            ),
            getContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: getTitle('车辆检测报告'),
                ),
                36.hb,
                SizedBox(
                  width: 200.w,
                  height: 150.w,
                  child: Image.asset(
                    Assets.images.carBanner.path,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 686.w,
                )
              ],
            ))
          ],
        );
        break;
      case '支付尾款':
        return !judge
            ? Column(
                children: [
                  getContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: getTitle('合同信息'),
                        ),
                        36.hb,
                        _getText('合同编号', '98765323'),
                        36.hb,
                        _getText('签订时间', '2021-12-30 15:23:48')
                      ],
                    ),
                  ),
                  getContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: getTitle('支付信息'),
                        ),
                        36.hb,
                        _getText('定金支付', '¥10,000.00'),
                        36.hb,
                        _getText('支付方式', '支付宝'),
                        36.hb,
                        _getText('支付时间', '2021-12-30 15:23:48'),
                        40.hb,
                        _getText('首付支付', '¥100,000.00'),
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
                            Image(
                              image: Assets.images.carBanner,
                              width: 200.w,
                              height: 150.w,
                            ),
                            SizedBox(
                              width: 686.w,
                            )
                          ],
                        ),
                        36.hb,
                      ],
                    ),
                  ),
                  getContainer(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: getTitle('车辆检测报告'),
                      ),
                      36.hb,
                      SizedBox(
                        width: 200.w,
                        height: 150.w,
                        child: Image.asset(
                          Assets.images.carBanner.path,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  )),
                  getContainer(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getTitle("车辆检测报告"),
                      36.hb,
                      getPhoto('登记证书', Assets.images.carBanner.path),
                      36.hb,
                      getPhoto('行驶证', Assets.images.carBanner.path),
                      36.hb,
                      getPhoto('发票', Assets.images.carBanner.path),
                      36.hb,
                      getPhoto('保单', Assets.images.carBanner.path),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ))
                ],
              )
            : getPayment();
        break;
    }
  }

//是否支付尾款
  getPayment() {
    switch (audit) {
      case '1':
        return Column(
          children: [
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号', '98765323'),
                  36.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
                ],
              ),
            ),
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  36.hb,
                  _getText('定金支付', '¥10,000.00'),
                  36.hb,
                  _getText('支付方式', '支付宝'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  _getText('首付支付', '¥100,000.00'),
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
                      Image(
                        image: Assets.images.carBanner,
                        width: 200.w,
                        height: 150.w,
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  getJudge(),
                  36.hb,
                  _getText('支付形式', '按揭支付'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                ],
              ),
            ),
            getContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: getTitle('车辆检测报告'),
                ),
                36.hb,
                SizedBox(
                  width: 200.w,
                  height: 150.w,
                  child: Image.asset(
                    Assets.images.carBanner.path,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 686.w,
                )
              ],
            )),
            getContainer(Column(
              children: [
                getTitle("车辆检测报告"),
                36.hb,
                getPhoto('登记证书', Assets.images.carBanner.path),
                36.hb,
                getPhoto('行驶证', Assets.images.carBanner.path),
                36.hb,
                getPhoto('发票', Assets.images.carBanner.path),
                36.hb,
                getPhoto('保单', Assets.images.carBanner.path),
                SizedBox(
                  width: 686.w,
                )
              ],
            ))
          ],
        );
        break;
      case '2':
        return Column(
          children: [
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号', '98765323'),
                  36.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
                ],
              ),
            ),
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  36.hb,
                  _getText('定金支付', '¥10,000.00'),
                  36.hb,
                  _getText('支付方式', '支付宝'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  _getText('首付支付', '¥100,000.00'),
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
                      Image(
                        image: Assets.images.carBanner,
                        width: 200.w,
                        height: 150.w,
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  getJudge(),
                  36.hb,
                  _getText('支付形式', '按揭支付'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                ],
              ),
            ),
            getContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: getTitle('车辆检测报告'),
                ),
                36.hb,
                SizedBox(
                  width: 200.w,
                  height: 150.w,
                  child: Image.asset(
                    Assets.images.carBanner.path,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 686.w,
                )
              ],
            )),
            getContainer(Column(
              children: [
                getTitle("车辆检测报告"),
                36.hb,
                getPhoto('登记证书', Assets.images.carBanner.path),
                36.hb,
                getPhoto('行驶证', Assets.images.carBanner.path),
                36.hb,
                getPhoto('发票', Assets.images.carBanner.path),
                36.hb,
                getPhoto('保单', Assets.images.carBanner.path),
                SizedBox(
                  width: 686.w,
                )
              ],
            ))
          ],
        );
        break;
      case '3':
        return Column(
          children: [
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号', '98765323'),
                  36.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
                ],
              ),
            ),
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  36.hb,
                  _getText('定金支付', '¥10,000.00'),
                  36.hb,
                  _getText('支付方式', '支付宝'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  _getText('首付支付', '¥100,000.00'),
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
                      Image(
                        image: Assets.images.carBanner,
                        width: 200.w,
                        height: 150.w,
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  _getText('尾款支付', '¥190,000.00'),
                  36.hb,
                  _getText('支付形式', '按揭支付'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                ],
              ),
            ),
            getContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: getTitle('车辆检测报告'),
                ),
                36.hb,
                SizedBox(
                  width: 200.w,
                  height: 150.w,
                  child: Image.asset(
                    Assets.images.carBanner.path,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 686.w,
                )
              ],
            )),
            getContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitle("车辆检测报告"),
                36.hb,
                getPhoto('登记证书', Assets.images.carBanner.path),
                36.hb,
                getPhoto('行驶证', Assets.images.carBanner.path),
                36.hb,
                getPhoto('发票', Assets.images.carBanner.path),
                36.hb,
                getPhoto('保单', Assets.images.carBanner.path),
                SizedBox(
                  width: 686.w,
                )
              ],
            ))
          ],
        );
        break;
    }
  }

//是否付款文字样式
  getJudge() {
    switch (audit) {
      case '1':
        return Row(
          children: [
            SizedBox(
              child: Text(
                '首付支付',
                style: TextStyle(
                    color: BaseStyle.color333333,
                    fontSize: BaseStyle.fontSize28),
              ),
            ),
            32.wb,
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '¥',
                  style: TextStyle(
                      color: const Color(0xFF027AFF),
                      fontSize: BaseStyle.fontSize28)),
              TextSpan(
                  text: ' 190,000.00',
                  style: TextStyle(
                      color: const Color(0xFF027AFF),
                      fontSize: BaseStyle.fontSize28)),
              TextSpan(
                  text: '(待审核)',
                  style: TextStyle(
                      color: const Color(0xFF027AFF),
                      fontSize: BaseStyle.fontSize28)),
            ]))
          ],
        );
        break;
      case '2':
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  child: Text(
                    '尾款支付',
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                32.wb,
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '¥',
                      style: TextStyle(
                          color: const Color(0xFFE62222),
                          fontSize: BaseStyle.fontSize28)),
                  TextSpan(
                      text: '190,000.00',
                      style: TextStyle(
                          color: const Color(0xFFE62222),
                          fontSize: BaseStyle.fontSize28)),
                  TextSpan(
                      text: '(审核驳回)',
                      style: TextStyle(
                          color: const Color(0xFFE62222),
                          fontSize: BaseStyle.fontSize28)),
                ]))
              ],
            ),
            36.hb,
            Row(
              children: [
                SizedBox(
                  child: Text(
                    '驳回理由',
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
                32.wb,
                Text(
                  '未收到银行汇款款项',
                  style: TextStyle(
                      color: const Color(0xFFE62222),
                      fontSize: BaseStyle.fontSize28),
                )
              ],
            )
          ],
        );
        break;
    }
  }

//是否首付
  getFirst() {
    switch (audit) {
      case '1':
        return methods = Column(
          children: [
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号', '98765323'),
                  36.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
                ],
              ),
            ),
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  36.hb,
                  _getText('定金支付', '¥10,000.00'),
                  36.hb,
                  _getText('支付方式', '支付宝'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          '首付支付',
                          style: TextStyle(
                              color: BaseStyle.color333333,
                              fontSize: BaseStyle.fontSize28),
                        ),
                      ),
                      32.wb,
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: Text(
                          '¥100,000.00(审核中)',
                          style: TextStyle(
                              color: const Color(0xFF027AFF),
                              fontSize: BaseStyle.fontSize28),
                        ),
                      )
                    ],
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
                        child: Image.asset(
                          Assets.images.carBanner.path,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ),
                  36.hb,
                ],
              ),
            ),
            getContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: getTitle('车辆检测报告'),
                ),
                36.hb,
                SizedBox(
                  width: 200.w,
                  height: 150.w,
                  child: Image.asset(
                    Assets.images.carBanner.path,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 686.w,
                )
              ],
            ))
          ],
        );

        break;
      case '2':
        return methods = Column(
          children: [
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号', '98765323'),
                  36.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
                ],
              ),
            ),
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  36.hb,
                  _getText('定金支付', '¥10,000.00'),
                  36.hb,
                  _getText('支付方式', '支付宝'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          '首付支付',
                          style: TextStyle(
                              color: BaseStyle.color333333,
                              fontSize: BaseStyle.fontSize28),
                        ),
                      ),
                      32.wb,
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: Text(
                          '¥100,000.00(审核驳回)',
                          style: TextStyle(
                              color: const Color(0xFFE62222),
                              fontSize: BaseStyle.fontSize28),
                        ),
                      )
                    ],
                  ),
                  36.hb,
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          '驳回理由',
                          style: TextStyle(
                              color: BaseStyle.color333333,
                              fontSize: BaseStyle.fontSize28),
                        ),
                      ),
                      32.wb,
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: Text(
                          '凭证金额与汇款金额不符',
                          style: TextStyle(
                              color: const Color(0xFFE62222),
                              fontSize: BaseStyle.fontSize28),
                        ),
                      )
                    ],
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
                      Image(
                        image: Assets.images.carBanner,
                        width: 200.w,
                        height: 150.w,
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ),
                  36.hb,
                ],
              ),
            ),
            getContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: getTitle('车辆检测报告'),
                ),
                36.hb,
                SizedBox(
                  width: 200.w,
                  height: 150.w,
                  child: Image.asset(
                    Assets.images.carBanner.path,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 686.w,
                )
              ],
            ))
          ],
        );

        break;
      case '3':
        return methods = Column(
          children: [
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号', '98765323'),
                  36.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
                ],
              ),
            ),
            getContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  36.hb,
                  _getText('定金支付', '¥10,000.00'),
                  36.hb,
                  _getText('支付方式', '支付宝'),
                  36.hb,
                  _getText('支付时间', '2021-12-30 15:23:48'),
                  40.hb,
                  _getText('首付支付', '¥100,000.00'),
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
                      Image(
                        image: Assets.images.carBanner,
                        width: 200.w,
                        height: 150.w,
                      ),
                      SizedBox(
                        width: 686.w,
                      )
                    ],
                  ),
                  36.hb,
                ],
              ),
            ),
            getContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: getTitle('车辆检测报告'),
                ),
                36.hb,
                SizedBox(
                  width: 200.w,
                  height: 150.w,
                  child: Image.asset(
                    Assets.images.carBanner.path,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 686.w,
                )
              ],
            ))
          ],
        );

        break;
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

//支付是否成功
  getPayPass() {
    switch (stat) {
      case '待预定':
        return judge
            ? const SizedBox()
            : Container(
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
                          text: '10,000.00',
                          style: TextStyle(
                              fontSize: BaseStyle.fontSize32,
                              color: const Color(0xFFFF3B02)))
                    ]))
                  ],
                ),
              );
        break;
      case '待检测':
        return Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
            margin: EdgeInsets.only(top: 16.w),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const DetectionData());
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
        break;
      case '支付首付':
        return !judge
            ? Container(
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
                          text: '100,000.00',
                          style: TextStyle(
                              fontSize: BaseStyle.fontSize32,
                              color: const Color(0xFFFF3B02)))
                    ]))
                  ],
                ),
              )
            : const SizedBox();
        break;
      case '待过户':
        return Container(
            width: double.infinity,
            color: kForeGroundColor,
            padding: EdgeInsets.only(
                top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
            margin: EdgeInsets.only(top: 16.w),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const ChangeNameData());
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
        break;
      case '支付尾款':
        if (!judge) {
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
                      text: '190,000.00',
                      style: TextStyle(
                          fontSize: BaseStyle.fontSize32,
                          color: const Color(0xFFFF3B02)))
                ]))
              ],
            ),
          );
        } else if (judge || audit == '3') {
          return Container(
              width: double.infinity,
              color: kForeGroundColor,
              padding: EdgeInsets.only(
                  top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
              margin: EdgeInsets.only(top: 16.w),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const MakeDealData());
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
        } else {
          const SizedBox();
        }
        break;
    }
  }

//文字加图片样式
  getPhoto(String title, String url) {
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
            child: Image.asset(url),
          ),
        )
      ],
    );
  }

//文本样式
  _getText(String title, String text) {
    return Row(
      children: [
        SizedBox(
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
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
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

//车辆信息下拉
  getList() {
    return ExpansionTile(
      //backgroundColor: const Color(0xFF027AFF).withOpacity(0.1),
      //leading: Icon(Icons.),
      collapsedBackgroundColor: kForeGroundColor,

      title: Row(
        children: [
          getTitle('车辆总价'),
          185.wb,
          SizedBox(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: '¥',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: '300,000.00',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ])),
          ),
        ],
      ),
      children: [
        Container(
            color: kForeGroundColor,
            child: Row(
              children: [
                32.wb,
                _getCar('车辆定金', '10,000.00'),
                46.wb,
                Container(
                  width: 1.w,
                  height: 72.w,
                  color: BaseStyle.coloreeeeee,
                ),
                46.wb,
                _getCar('车辆首付', '10,000.00'),
                46.wb,
                _getCar('车辆尾款', '150,000.00'),
              ],
            ))
      ],
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

  text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: BaseStyle.color111111, fontSize: BaseStyle.fontSize24),
    );
  }
}
