import 'package:cloud_car/ui/user/user_wallet/withdrawal_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class WithdrawalRecordPage extends StatefulWidget {
  const WithdrawalRecordPage({super.key});

  @override
  _WithdrawalRecordPageState createState() => _WithdrawalRecordPageState();
}

class _WithdrawalRecordPageState extends State<WithdrawalRecordPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;

  // ignore: non_constant_identifier_names
  late final Rect position;
  late final double menuHeight;
  int num = 1;

  @override
  @override
  void dispose() {
    super.dispose();
  }

  List timeList = [
    {'time': '12月2日 12:00:09', 'pice': '¥15,000.00', 'bankname': '工商银行'},
    {'time': '12月20日 14:00:09', 'pice': '¥15,000.00', 'bankname': '工商银行'}
  ];

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text('提现记录', style: Theme.of(context).textTheme.headline6),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body:
            // ElevatedButton(
            //   onPressed: () {
            //     Get.to(() => Withdrawal(
            //         pice: timeList[0]['pice'],
            //         bankName: '银行',
            //         time: timeList[0]['time']));
            //   },
            //   child: Text('data'),
            // )
            GestureDetector(
                onTap: (() {
                  num++;
                  setState(() {});
                }),
                child: Column(
                  children: [
                    Container(
                      color: kForeGroundColor,
                      width: 750.w,
                      height: 96.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.w, vertical: 22.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '2022年12月',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(fontSize: 32.w),
                          ),
                          16.wb,
                          SizedBox(
                              width: 32.w,
                              height: 32.w,
                              child: Image.asset(
                                num.isOdd
                                    ? Assets.icons.icGoto.path
                                    : Assets.icons.down.path,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                    _getList()
                  ],
                )));
  }

  _getList() {
    return Offstage(
      offstage: num.isOdd,
      child: SizedBox(
          height: 700.w,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Get.to(() => WithdrawalPage(
                        price: timeList[index]['pice'],
                        bankName: timeList[index]['bankname'],
                        time: timeList[index]['time']));
                  },
                  child: Container(
                    width: 750.w,
                    height: 140.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
                    color: kForeGroundColor,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '提现到银行卡',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              timeList[index]['time'],
                              style: TextStyle(
                                  color: BaseStyle.color999999,
                                  fontSize: BaseStyle.fontSize24),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              timeList[index]['pice'],
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: const Icon(
                                  Icons.keyboard_arrow_right,
                                ))
                          ],
                        )
                      ],
                    ),
                  ));
            },
            itemCount: timeList.length,
          )),
    );
  }

//自定义下拉列表

  @override
  bool get wantKeepAlive => true;
}

void column() {}
