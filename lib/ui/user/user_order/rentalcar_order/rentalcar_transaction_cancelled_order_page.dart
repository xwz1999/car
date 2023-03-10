import 'package:cloud_car/utils/drop_down_body.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/progress_bar.dart';
import 'package:flutter/material.dart';

class CancelOrderPage extends StatefulWidget {
  const CancelOrderPage({
    super.key,
  });

  @override
  State<CancelOrderPage> createState() => _CancelOrderPageState();
}

class _CancelOrderPageState extends State<CancelOrderPage> {
  List<String> items = [
    '下单',
    '交车',
    '还车',
  ];

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: bodyColor,
        body: ListView(
          children: [
            16.hb,
            Container(
              margin: EdgeInsets.only(
                  left: 32.w, right: 32.w, top: 16.w, bottom: 8.w),
              padding: EdgeInsets.only(top: 32.w),
              height: 120.w,
              color: Colors.white,
              child: ProgressBar(
                length: 3,
                num: 2,
                cancel: false,
                direction: false,
                HW: 250,
                texts: [
                  _text('下单'),
                  _text('交易取消'),
                  _text('还车'),
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
                          child: _getTitle('车辆信息'),
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
                                  _getChip('自动2.0T', '国VI', '五座')
                                ],
                              ),
                            )
                          ],
                        ),
                        40.hb,
                        _getList(),
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
                    child: _getTitle('订单信息'),
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
                  _getText('备注', '-'),
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
                    child: _getTitle('支付信息'),
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
                    child: _getTitle('交易取消信息'),
                  ),
                  16.hb,
                  _getText('取消人员', '莉丝'),
                  16.hb,
                  _getText('取消时间', '2021-12-30 12:00:00')
                ],
              ),
            ),
            16.hb,
          ],
        ));
  }

  //车辆信息下拉
  _getList() {
    return DropDown(
      title: _getTitle('订单总额'),
      text: SizedBox(
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
      ]))),
      widget: Container(
          padding: EdgeInsets.only(left: 32.w, top: 16.w),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getCar(
                  '车辆租赁费',
                  //(_consignmentInfoList.contractSignAt).toString()),
                  '200.00'),
              36.wb,
              Container(
                width: 1.w,
                height: 72.w,
                color: BaseStyle.coloreeeeee,
              ),
              36.wb,
              _getCar('服务费用', '20.00'),
            ],
          )),
    );
  }

//标题
  _getTitle(String title) {
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

//标签
  _getChip(String num, String time, String distance) {
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

  _text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: BaseStyle.color111111, fontSize: BaseStyle.fontSize24),
    );
  }
}
