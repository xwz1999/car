import 'package:bot_toast/bot_toast.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class AlsocarOrder extends StatefulWidget {
  final bool bl;
  const AlsocarOrder({Key? key, required this.bl}) : super(key: key);

  @override
  State<AlsocarOrder> createState() => _AlsocarOrderState();
}

class _AlsocarOrderState extends State<AlsocarOrder> {
  List<String> items = [
    '下单',
    '交车',
    '还车',
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    late bool BL = widget.bl;
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('租车订单',
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.w)),
              child: GestureDetector(
                onTap: () {
                  //Get.to(() => const Detection());
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
                                  32.hb,
                                  getCaip('自动2.0T', '国VI', '五座')
                                ],
                              ),
                            )
                          ],
                        ),
                        40.hb,
                        getList(),
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
                    child: getTitle('订单信息'),
                  ),
                  16.hb,
                  _getText('客户姓名', '莉丝'),
                  16.hb,
                  _getText('联系方式', '18912345432'),
                  16.hb,
                  _getText('取车地址', '浙江省宁波市海曙区宁波保险科技产业园1号楼601-3'),
                  16.hb,
                  _getText('租赁时间', '01-04 12:00 至 01-05 12:00'),
                  16.hb,
                  _getText('还车地址', '与取车地址相同'),
                  16.hb,
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
                  _getText('支付方式', '支付宝'),
                  16.hb,
                  _getText('支付时间', '2022-01-03 11:00')
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
                    child: getTitle('交车凭证'),
                  ),
                  16.hb,
                  getPicture('押金支付凭证', Assets.images.carBanner.path),
                  16.hb,
                  getPicture('人车合影', Assets.images.carBanner.path),
                  16.hb,
                  _getText('上传时间', '2022-01-03 11:00')
                ],
              ),
            ),
            32.hb,
            !BL
                ? Container(
                    width: double.infinity,
                    color: kForeGroundColor,
                    padding: EdgeInsets.only(
                        top: 36.w, left: 526.w, bottom: 36.w, right: 32.w),
                    child: GestureDetector(
                      onTap: () {
                        //Get.to(() => const ());
                        BotToast.showText(text: '确认成功');
                      },
                      child: Container(
                          width: 168.w,
                          height: 68.w,
                          padding: EdgeInsets.only(left: 38.w, top: 14.w),
                          decoration: BoxDecoration(
                              color: const Color(0xFF027AFF),
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Text(
                            '确认还车',
                            style: TextStyle(
                                color: kForeGroundColor,
                                fontSize: BaseStyle.fontSize28),
                          )),
                    ))
                : const SizedBox()
          ],
        ));
  }

  getPicture(String title, String url) {
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.w)),
            width: 200.w,
            height: 150.w,
            child: Image.asset(
              url,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }

  getList() {
    return ExpansionTile(
      //backgroundColor: const Color(0xFF027AFF).withOpacity(0.1),
      //leading: Icon(Icons.),
      collapsedBackgroundColor: kForeGroundColor,
      title: Row(
        children: [
          getTitle('订单总额'),
          310.wb,
          SizedBox(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: '¥',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: '220.00',
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
                _getCar('车辆定金', '10,000.00'),
              ],
            ))
      ],
    );
  }

//标题
  getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

//文字
  _getText(String title, String text) {
    return Row(
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
        SizedBox(
          width: 478.w,
          child: Flexible(
            child: Text(
              text,
              style: TextStyle(
                  color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
            ),
          ),
        )
      ],
    );
  }

//标签
  getCaip(String num, String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
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

//
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
}