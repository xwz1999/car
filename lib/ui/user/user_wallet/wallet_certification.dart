import 'package:cloud_car/ui/user/user_wallet/Withdrawal_record.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:cloud_car/widget/putup_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../widget/alert.dart';

class WalletCertificationPage extends StatefulWidget {
  const WalletCertificationPage({Key? key}) : super(key: key);

  @override
  _WalletCertificationPageState createState() =>
      _WalletCertificationPageState();
}

class _WalletCertificationPageState extends State<WalletCertificationPage> {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];
  // ignore: unused_field
  final List<ChooseItem> _piceList = [
    ChooseItem(name: '充值10次', pice: '¥10.00'),
    ChooseItem(name: '充值20次', pice: '¥20.00'),
    ChooseItem(name: '充值30次', pice: '¥30.00'),
    ChooseItem(name: '充值50次', pice: '¥50.00'),
    ChooseItem(name: '充值100次', pice: '¥100.00'),
    ChooseItem(name: '自定义', pice: '充值次数'),
  ];

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
          backgroundColor: kForeGroundColor,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          actions: [
            Column(
              children: [
                SizedBox(
                  height: 45.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const WithdrawalRecordPage());
                  },
                  child: Text(
                    '提现记录',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: const Color(0xFF027AFF)),
                  ),
                ),
              ],
            ),
            30.wb,
          ],
          title: Text('我的钱包', style: Theme.of(context).textTheme.headline6),
        ),
        //extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
          width: 750.w,
          height: 1624.w,
          color: const Color(0xFFF6F6F6),
          child: Column(
            children: [
              _getWalletPice(),
              16.hb,
              _balance(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Alert.show(
                        context,
                        NormalContentDialog(
                          type: NormalTextDialogType.delete,
                          title: '解绑提示',
                          content: const Text('为保障您钱包功能的使用，请先完成实名认证。'),
                          items: const ['取消'],
                          deleteItem: '去认证',
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
                  });
                },
                child: Container(
                  width: 686.w,
                  height: 72.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 312.w, vertical: 11.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF0593FF), Color(0xFF027AFF)])),
                  child: Text(
                    '提现',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: kForeGroundColor),
                  ),
                ),
              )
            ],
          ),
        ));
  }

//钱包余额
  _getWalletPice() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      color: Colors.white,
      child: Stack(
        children: [
          SizedBox(
            width: 686.w,
            height: 160.w,
            child: Image.asset(
              'assets/images/my_wallet.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              //color: Colors.red,
              left: 43.w,
              top: 56.w,
              child: Row(
                children: [
                  Text(
                    '钱包余额',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: const Color(0xFFFE8029)),
                  ),
                  10.wb,
                  Text('¥',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: const Color(0xFFFE8029),
                          fontWeight: FontWeight.bold)),
                  10.wb,
                  Text('100,000.00',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: const Color(0xFFFE8029),
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp)),
                ],
              )),
        ],
      ),
    );
  }

//余额明细
  _balance() {
    return ExpansionTile(
      initiallyExpanded: true,
      backgroundColor: kForeGroundColor,
      title: Text(
        '余额明细',
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      //collapsedTextColor: const Color(0xFF666666), //选中时颜色
      textColor: const Color(0xFF666666),
      trailing: SizedBox(
        //padding: EdgeInsets.only(left: 80.w),
        width: 236.w,
        child: Row(
          children: [
            Text('2022年12月',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold)),
            16.wb,
            SizedBox(
              width: 32.w,
              height: 32.w,
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromRGBO(102, 102, 102, 1),
              ),
            )
          ],
        ),
      ),
      children: [
        ListTile(
          //minVerticalPadding: ,
          title: Text(
            '余额提现',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          subtitle: Text(
            '12月1日 16:34:09',
            style: TextStyle(
                fontSize: 24.sp, color: const Color.fromRGBO(153, 153, 153, 1)),
          ),
          trailing: Text(
            '- ¥15,000.00',
            style: TextStyle(
              fontSize: 28.sp,
            ),
          ),
        ),
        ListTile(
          title: Text(
            '出售车辆，提成增加',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          subtitle: Text('12月1日 16:34:09',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: const Color(0xFF999999))),
          trailing: Text('+¥100,000.00',
              style: Theme.of(context).textTheme.subtitle2),
        ),
        ListTile(
          title: Text(
            '出售车辆,提成增加',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          subtitle: Text('12月1日 16:34:09',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: const Color(0xFF999999))),
          trailing:
              Text('+¥15,000.00', style: Theme.of(context).textTheme.subtitle2),
        ),
      ],
    );
  }

  bool get wantKeepAlive => true;
}

// class Button {
//   Button(Null Function() param0);
// }

void column() {}
