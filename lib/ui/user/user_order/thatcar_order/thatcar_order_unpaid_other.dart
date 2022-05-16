import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/utils/drop_down_body.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/user_tool.dart';

class UnpaidOther extends StatefulWidget {
  final String stat;
  const UnpaidOther({Key? key, required this.stat}) : super(key: key);

  @override
  State<UnpaidOther> createState() => _UnpaidOtherState();
}

class _UnpaidOtherState extends State<UnpaidOther> {
  late String stat = widget.stat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('叫车订单',
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
                _getCarInformation(),
                getCarBox(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTitle('订单信息'),
                    32.hb,
                    _getText('客户姓名', '**'),
                    16.hb,
                    _getText('联系方式', '189****5432'),
                    16.hb,
                    _getText('绑定销售', UserTool.userProvider.userInfo.nickname),
                    16.hb,
                    _getText('上门地址', '浙江省宁波市海曙区宁波保险科技产业园1号楼601-3'),
                    16.hb,
                    _getText('上门时间', '2022-01-04 12:00'),
                  ],
                )),
                stat == '待支付'
                    ? const SizedBox()
                    : getCarBox(Column(
                        children: [
                          getTitle('支付信息'),
                          32.wb,
                          _getText('支付方式', '支付宝'),
                          16.hb,
                          _getText('支付时间', '2022-01-04 12:00'),
                        ],
                      )),
              ],
            ),
            stat == '待交车'
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        width: double.infinity,
                        color: kForeGroundColor,
                        padding: EdgeInsets.only(
                            top: 36.w, left: 526.w, bottom: 10.w, right: 32.w),
                        child: GestureDetector(
                          onTap: () {
                            BotToast.showText(text: '订单完成');
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
                                  '车已上门',
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

  getCarBox(Widget widget) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w), color: kForeGroundColor),
      child: widget,
    );
  }

  _getCarInformation() {
    return getCarBox(Column(
      children: [
        Row(
          children: [
            getTitle('叫车车辆信息'),
            350.wb,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFE8029).withOpacity(0.01),
              ),
              child: Text(
                stat,
                style: TextStyle(
                    fontSize: BaseStyle.fontSize24,
                    color: const Color(0xFFFE8029)),
              ),
            )
          ],
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
            Column(
              children: [
                SizedBox(
                  width: 406.w,
                  height: 64.w,
                  child: Text(
                    '奥迪Q3 2020款 35 TFSI 进取型SUV',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: BaseStyle.color111111,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                32.hb,
                getChip('过户0次', '2020年10月', '20.43万公里'),
              ],
            )
          ],
        ),
        24.hb,
        getList(),
      ],
    ));
  }

  getChip(String num, String time, String distance) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: stat == '已取消'
                  ? const Color(0xFF4F5A74).withOpacity(0.08)
                  : const Color(0xFF027AFF).withOpacity(0.08)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20,
                color: stat == '已取消'
                    ? const Color(0xFF4F5A74)
                    : const Color(0xFF027AFF)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: const Color(0xFF4F5A74).withOpacity(0.08)),
          child: Text(
            time,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: const Color(0xFF4F5A74).withOpacity(0.08)),
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
  getList() {
    return DropDown(
      title: getTitle('订单总价'),
      text: SizedBox(
          child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '¥',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold)),
        TextSpan(
            text: '100.00',
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
                  '车辆上门费',
                  //(_consignmentInfoList.contractSignAt).toString()),
                  '100.00'),
              36.wb,
              Container(
                width: 1.w,
                height: 72.w,
                color: BaseStyle.coloreeeeee,
              ),
              36.wb,
              _getCar('其他费用', '10.00'),
            ],
          )),
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

//标题
  getTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
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
}
