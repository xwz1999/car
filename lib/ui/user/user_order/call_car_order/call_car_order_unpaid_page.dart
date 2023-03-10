import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/utils/drop_down_body.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/user_tool.dart';

class CallCarUnpaidPage extends StatefulWidget {
  final CallCarStatus status;
  final String statusText;

  const CallCarUnpaidPage(
      {super.key, required this.status, required this.statusText});

  @override
  State<CallCarUnpaidPage> createState() => _CallCarUnpaidPageState();
}

class _CallCarUnpaidPageState extends State<CallCarUnpaidPage> {
  //late String stat = widget.stat;

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
      body: ListView(
        children: [
          _getCarInformation(),
          _getCarBox(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '订单信息',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Alert.show(
                          context,
                          NormalContentDialog(
                            type: NormalTextDialogType.delete,
                            title: '',
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 238.w,
                                  height: 174.w,
                                  child: Image.asset(
                                    Assets.images.immediately.path,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                48.hb,
                                Text(
                                  '183-****-1289',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                      fontSize: BaseStyle.fontSize40),
                                ),
                                16.hb,
                                Text(
                                  '使用虚拟号联系绑定销售',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            ),
                            items: const ['取消'],
                            deleteItem: '立即联系',
                            //监听器
                            listener: (index) {
                              Alert.dismiss(context);
                              //Value = false;
                              //(Value);
                            },
                            deleteListener: () {
                              Alert.dismiss(context);
                              //Value = true;
                              //(Value);
                            },
                          ));
                    },
                    child: Text(
                      '联系车务',
                      style: TextStyle(
                          color: const Color(0xFF027AFF),
                          fontSize: BaseStyle.fontSize28),
                    ),
                  )
                ],
              ),
              32.hb,
              _getText('客户姓名', '李四'),
              16.hb,
              _getText('联系方式', '18998785432'),
              16.hb,
              _getText('绑定销售', '${UserTool.userProvider.userInfo.nickname}三'),
              16.hb,
              _getText('上门地址', '浙江省宁波市海曙区宁波保险科技产业园1号楼601-3'),
              16.hb,
              _getText('上门时间', '2022-01-04 12:00'),
            ],
          )),
          widget.status.typeNum == 1
              ? const SizedBox()
              : _getCarBox(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getTitle('支付信息'),
              32.wb,
              _getText('支付方式', '支付宝'),
              16.hb,
              _getText('支付时间', '2022-01-04 12:00'),
            ],
          ))
        ],
      ),
    );
  }

  _getCarBox(Widget widget) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w), color: kForeGroundColor),
      child: widget,
    );
  }

  _getCarInformation() {
    return _getCarBox(Column(
      children: [
        Row(
          children: [
            _getTitle('叫车车辆信息'),
            350.wb,
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                decoration: BoxDecoration(
                  color: widget.status.typeNum == 3 || widget.status.typeNum == 4
                      ? const Color(0xFF027AFF).withOpacity(0.1)
                      : const Color(0xFFFE8029).withOpacity(0.1),
                ),
                child: Text(
                  widget.statusText,
                  style: TextStyle(
                    fontSize: BaseStyle.fontSize24,
                    color: widget.status.typeNum == 3 || widget.status.typeNum == 4
                        ? const Color(0xFF027AFF)
                        : const Color(0xFFFE8029),
                  ),
                ))
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
                _getChip('过户0次', '2020年10月', '20.43万公里'),
              ],
            )
          ],
        ),
        24.hb,
        _getList(),
      ],
    ));
  }

  _getChip(String num, String time, String distance) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: widget.status.typeNum == 4
                  ? const Color(0xFF4F5A74).withOpacity(0.08)
                  : const Color(0xFF027AFF).withOpacity(0.08)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20,
                color: widget.status.typeNum == 4
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
  _getList() {
    return DropDown(
      title: _getTitle('订单总价'),
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
  _getTitle(String title) {
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
