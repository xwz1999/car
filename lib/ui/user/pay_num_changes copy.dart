// ignore_for_file: file_names

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

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
  // ignore: must_call_super
  Widget build(BuildContext context) {
    //super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text('次数变更',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
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

        trailing: const Icon(
          Icons.keyboard_arrow_down,
          color: Color.fromRGBO(102, 102, 102, 1),
        ),

        title: Text(
          '2022年12月',
          style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
        ),

        //leading: Icon(Icons.list),
        children: [
          ListTile(
            title: Text(
              '评估车辆1次',
              style: TextStyle(
                fontSize: 28.sp,
              ),
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
            title: Text('评估车辆1次',
                style: TextStyle(
                  fontSize: 28.sp,
                )),
            subtitle: Text(
              '12月1日 16:34:09',
              style: TextStyle(
                  fontSize: 24.sp,
                  color: const Color.fromRGBO(153, 153, 153, 1)),
            ),
            trailing: Text('-1',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('评估车辆1次',
                style: TextStyle(
                  fontSize: 28.sp,
                )),
            subtitle: Text(
              '12月1日 16:34:09',
              style: TextStyle(
                  fontSize: 24.sp,
                  color: const Color.fromRGBO(153, 153, 153, 1)),
            ),
            trailing: Text('-1',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('充值次数',
                style: TextStyle(
                  fontSize: 28.sp,
                )),
            subtitle: Column(
              //左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '扣款银行卡: 工商银行，尾号0909 扣款金额：¥20.00',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: const Color.fromRGBO(153, 153, 153, 1),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                16.hb,
                Text(
                  '12月1日 16:34:09',
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: const Color.fromRGBO(153, 153, 153, 1)),
                ),
              ],
            ),
            trailing: Text('+20',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('充值次数',
                style: TextStyle(
                  fontSize: 28.sp,
                )),
            subtitle: Column(
              //左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '支付宝付款：¥20.0',
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: const Color.fromRGBO(153, 153, 153, 1),
                      overflow: TextOverflow.ellipsis),
                ),
                16.hb,
                Text(
                  '12月1日 16:34:09',
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: const Color.fromRGBO(153, 153, 153, 1),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            trailing: Text('+20',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('充值次数',
                style: TextStyle(
                  fontSize: 28.sp,
                )),
            subtitle: Column(
              //左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '微信付款：¥20.00',
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: const Color.fromRGBO(153, 153, 153, 1)),
                ),
                16.hb,
                Text(
                  '12月1日 16:34:09',
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: const Color.fromRGBO(153, 153, 153, 1)),
                ),
              ],
            ),
            trailing: Text('+20',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold)),
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
