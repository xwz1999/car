import 'package:cloud_car/ui/user/user_order/sellcar_order/make_deal_data.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class MakeDeal extends StatefulWidget {
  const MakeDeal({Key? key}) : super(key: key);

  @override
  State<MakeDeal> createState() => _MakeDealState();
}

class _MakeDealState extends State<MakeDeal> {
  List<String> items = [
    '预定',
    '检测',
    '首付',
    '过户',
    '尾款',
    '完成',
  ];
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
        backgroundColor: BodyColor,
        body: ListView(
          children: [
            16.hb,
            Container(
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                height: 120.w,
                color: Colors.white,
                child: const Text('')
                // TimeLinesWidget(
                //   index: 1,
                //   items: [
                //     '预定',
                //     '检测',
                //     '首付',
                //     '过户',
                //     '尾款',
                //     '完成',
                //   ],
                //   number: 1,
                // )
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
                    child: getTitle('客户信息'),
                  ),
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
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.w)),
              child: GestureDetector(
                onTap: () {
                  // Get.to(() => const Reservation());
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 32.w),
                    decoration: BoxDecoration(
                        color: kForeGroundColor,
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 32.w),
                          child: getTitle('车辆信息'),
                        ),
                        24.hb,
                        Row(
                          children: [
                            32.wb,
                            Container(
                              color: Colors.blue,
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
                            312.wb,
                            SizedBox(
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: '¥',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: '300,000.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                              ])),
                            ),
                            16.wb,
                            Padding(
                              padding: EdgeInsets.only(bottom: 15.w),
                              child: SizedBox(
                                  width: 32.w,
                                  height: 32.w,
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                  )),
                            ),
                            16.wb,
                          ],
                        ),
                        Row(
                          children: [
                            32.wb,
                            _getCar('车辆定金', '10,000.00'),
                            46.wb,
                            Container(
                                width: 2.w,
                                height: 72.w,
                                decoration: BoxDecoration(
                                  color: BaseStyle.coloreeeeee,
                                  border: Border.all(width: 1.w),
                                )),
                            46.wb,
                            _getCar('车辆定金', '10,000.00'),
                            46.wb,
                            Container(
                                width: 2.w,
                                height: 72.w,
                                decoration: BoxDecoration(
                                  color: BaseStyle.coloreeeeee,
                                  border: Border.all(width: 1.w),
                                )),
                            46.wb,
                            _getCar('车辆定金', '10,000.00'),
                          ],
                        )
                      ],
                    )),
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
                    child: getTitle('合同信息'),
                  ),
                  16.hb,
                  _getText('合同编号', '98765323'),
                  16.hb,
                  _getText('签订时间', '2021-12-30 15:23:48')
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
                    child: getTitle('支付信息'),
                  ),
                  16.hb,
                  _getText('定金支付', '¥10,000.00'),
                  16.hb,
                  _getText('支付方式', '支付宝'),
                  16.hb,
                  _getText('支付时间', '2022-12-30 15:23:48'),
                  56.hb,
                  _getText('首付支付', '¥100,000.00'),
                  16.hb,
                  _getPicture2('支付凭证'),
                  16.hb,
                  _getText('支付时间', '2022-12-30 15:23:48'),
                  56.hb,
                  _getText('尾款支付', '¥190,000.00'),
                  16.hb,
                  _getText('支付形式', '按揭支付'),
                  16.hb,
                  _getText('支付时间', '2022-12-30 15:23:48'),
                ],
              ),
            ),
            16.hb,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.w),
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              child: _getPicture('车辆检测报告'),
            ),
            16.hb,
            Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.w),
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTitle('车辆检测报告'),
                    _getPicture2('登记证书'),
                    32.hb,
                    _getPicture2('行驶证'),
                    32.hb,
                    _getPicture2('发票'),
                    32.hb,
                    _getPicture2('保单'),
                    32.hb,
                  ],
                )),
            36.hb,
            Container(
                width: double.infinity,
                color: kForeGroundColor,
                padding: EdgeInsets.only(
                    top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const MakeDealData());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 32.w, top: 16.w, bottom: 16.w),
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
                ))
          ],
        )

        // body: Column(
        //   children: [
        //     Container(
        //       decoration: BoxDecoration(
        //           color: kForeGroundColor,
        //           borderRadius: BorderRadius.circular(8.w)),
        //       child: Column(children: [

        //       ]),
        //     )
        //   ],
        // ),
        );
  }

  _getPicture(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        24.hb,
        GestureDetector(
          child: Container(
            color: Colors.red,
            width: 200.w,
            height: 150.w,
          ),
        )
      ],
    );
  }

  _getPicture2(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        24.hb,
        GestureDetector(
          child: Container(
            color: Colors.red,
            width: 200.w,
            height: 150.w,
          ),
        )
      ],
    );
  }

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

  getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

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

  _getCar(String title, String text) {
    return SizedBox(
      width: 144.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: BaseStyle.fontSize24, color: BaseStyle.color333333),
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
}
