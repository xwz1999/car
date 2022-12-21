import 'package:cloud_car/utils/headers.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/drop_down_body.dart';
import '../../widget/cloud_image_network_widget.dart';

class SellWidget extends StatefulWidget {
  const SellWidget({Key? key}) : super(key: key);

  @override
  _SellWidgetState createState() => _SellWidgetState();
}

class _SellWidgetState extends State<SellWidget> {
  bool middleSide=true; ///居间方   无
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '价格信息',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            GestureDetector(
              onTap: () {
                //Get.to(() => const Reservation(judge: null,));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.hb,
                    Row(
                      children: [
                        SizedBox(
                          width: 196.w,
                          height: 150.w,
                          child: const CloudImageNetworkWidget.car(urls: []),
                        ),
                        20.wb,
                        SizedBox(
                          width: 406.w,
                          child: Column(
                            children: [
                              Text("奥迪Q3 2020款 35 TFSI 进取型 SUV",
                                  style: TextStyle(
                                      fontSize: BaseStyle.fontSize28,
                                      color: BaseStyle.color111111)),
                              26.hb,
                              _getChip(
                                '过户${1}次',
                                DateUtil.formatDateMs(6700383.toInt() * 1000,
                                    format: 'yyyy年 '),
                                '${10}万公里',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    40.hb,
                    _getList(),
                    32.hb,
                    Row(
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: Text(
                            '付款方式',
                            style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color(0xFF999999)),
                          ),
                        ),
                        Text(
                          '全款',
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w700),
                        ),
                        92.wb,
                        SizedBox(
                          width: 160.w,
                          child: Text(
                            '过户方式',
                            style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color(0xFF999999)),
                          ),
                        ),
                        Text(
                          '本地',
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ]),
            ),
          ],
        )),
        _gexFramework(
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '买方信息',
            style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.w800),
          ),
          32.hb,
          _getTitle('客户姓名', '里斯'),
              16.hb,
          _getTitle('手机号', '133xxxxxx'),
              16.hb,
          _getTitle('身份证号', '73647813473241'),
              16.hb,
          _getTitle('地址', '浙江省宁波事鄞州区茂城西路xx新校区35栋907室'),
              16.hb,
          _getTitle('付款人', '里斯'),
              16.hb,
          _getTitle('开户行', '中国银行'),
              16.hb,
          _getTitle('银行卡号', '7348926496418'),
              16.hb,
          _getTitle('备注', '蓝色，无损坏'),
        ])),
        middleSide? _gexFramework(
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '居间方信息',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800),
              ),
              32.hb,
              _getTitle('居间方', '云云问车'),
              16.hb,
              _getTitle('卖方服务费', '1%'),
              16.hb,
              _getTitle('服务费金额', '3000'),
              16.hb,
              _getTitle('买方服务费', '1%'),
              16.hb,
              _getTitle('服务费金额', '30000'),


            ])):_gexFramework(
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '居间方信息',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800),
              ),
              32.hb,
              _getTitle('居间方', '无'),
            ])),
      ],
    );
  }

  _gexFramework(Widget? child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: child,
    );
  }

  _getTitle(String title, String text) {
    return Row(
      children: [
        SizedBox(
          width: 160.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
          ),
        ),
        Flexible(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 28.sp,
          ),
        ))
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

  //车辆信息下拉
  _getList() {
    return DropDown(
      border: true,
      title: Text(
        '车辆总价',
        style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w800),
      ),
      text: SizedBox(
          child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '¥',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold)),
        TextSpan(
            text: '90,000,000',
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
                  '100000'),
              46.wb,
              Container(
                width: 1.w,
                height: 72.w,
                color: BaseStyle.coloreeeeee,
              ),
              46.wb,
              _getCar('车辆首付', '800000'),
              46.wb,
              Container(
                width: 1.w,
                height: 72.w,
                color: BaseStyle.coloreeeeee,
              ),
              46.wb,
              _getCar('车辆尾款', '7000000'),
            ],
          )),
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
}
