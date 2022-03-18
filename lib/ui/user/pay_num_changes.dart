import 'dart:math';

import 'package:cloud_car/ui/notice/notice_fashionable.dart';
import 'package:cloud_car/ui/user/pay_results.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../home/car_manager/assessment_page.dart';

class PayChangesPage extends StatefulWidget {
  const PayChangesPage({Key? key}) : super(key: key);

  @override
  _PayChangesPageState createState() => _PayChangesPageState();
}

class _PayChangesPageState extends State<PayChangesPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];

  late EasyRefreshController _refreshController;

  @override
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text('次数变更', style: Theme.of(context).textTheme.headline6),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
          //padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: Column(
            children: [
              //Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),
              _getChanges()
            ],
          ),
        ));
  }

//列表
  _getChanges() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        initiallyExpanded: true,
        //collapsedTextColor: Colors.red,选中时颜色
        textColor: Colors.black,

        trailing: Container(
          padding: EdgeInsets.only(right: 416.w),
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Color.fromRGBO(102, 102, 102, 1),
          ),
        ),

        title: Text(
          '2022年12月',
          style: Theme.of(context).textTheme.subtitle1,
        ),

        //leading: Icon(Icons.list),
        children: [
          ListTile(
            //minVerticalPadding: ,
            title: Text(
              '评估车辆1次',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Text(
              '12月1日 16:34:09',
              style: TextStyle(
                  fontSize: 24.sp,
                  color: const Color.fromRGBO(153, 153, 153, 1)),
            ),
            trailing: Text(
              '-1',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              '评估车辆1次',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Text('12月1日 16:34:09',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Color(0xFF999999))),
            trailing: Text('-1', style: Theme.of(context).textTheme.subtitle2),
          ),
          ListTile(
            title: Text(
              '评估车辆1次',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Text('12月1日 16:34:09',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Color(0xFF999999))),
            trailing: Text('-1', style: Theme.of(context).textTheme.subtitle2),
          ),
          ListTile(
            title: Text(
              '充值次数',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Column(
              //左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('扣款银行卡: 工商银行，尾号0909 扣款金额：¥20.00',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Color(0xFF999999),
                          overflow: TextOverflow.ellipsis,
                        )),
                8.hb,
                Text('12月1日 16:34:09',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Color(0xFF999999),
                        )),
              ],
            ),
            trailing: Text('+20', style: Theme.of(context).textTheme.subtitle2),
          ),
          ListTile(
            title: Text(
              '充值次数',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Column(
              //左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('支付宝付款：¥20.0',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Color(0xFF999999),
                          overflow: TextOverflow.ellipsis,
                        )),
                8.hb,
                Text('12月1日 16:34:09',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Color(0xFF999999),
                          overflow: TextOverflow.ellipsis,
                        )),
              ],
            ),
            trailing: Text('+20', style: Theme.of(context).textTheme.subtitle2),
          ),
          ListTile(
            title: Text(
              '充值次数',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Column(
              //左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('微信付款：¥20.00',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Color(0xFF999999),
                          overflow: TextOverflow.ellipsis,
                        )),
                8.hb,
                Text('12月1日 16:34:09',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Color(0xFF999999),
                          overflow: TextOverflow.ellipsis,
                        )),
              ],
            ),
            trailing: Text('+20', style: Theme.of(context).textTheme.subtitle2),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class Button {
//   Button(Null Function() param0);
// }

void column() {}
