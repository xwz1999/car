import 'package:cloud_car/model/user/History_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class PayChangesPage extends StatefulWidget {
  const PayChangesPage({Key? key}) : super(key: key);

  @override
  _PayChangesPageState createState() => _PayChangesPageState();
}

class _PayChangesPageState extends State<PayChangesPage> {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  List<HistoryModel> timeList = [];

  late int num = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () async {
      await _refresh();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
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
    return GestureDetector(
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
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
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
                      child: Icon(
                        num % 2 == 0
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                        color:
                            num % 2 == 0 ? Colors.blue : BaseStyle.color999999,
                      ))
                ],
              ),
            ),
            getList()
          ],
        ));
    //leading: Icon(Icons.list),

    // ListTile(
    //   //minVerticalPadding: ,
    //   title: Text(
    //     '评估车辆1次',
    //     style: Theme.of(context).textTheme.subtitle2,
    //   ),
    //   subtitle: Text(
    //     '12月1日 16:34:09',
    //     style: TextStyle(
    //         fontSize: 24.sp,
    //         color: const Color.fromRGBO(153, 153, 153, 1)),
    //   ),
    //   trailing: Text(
    //     '-1',
    //     style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
    //   ),
    // ),
    // ListTile(
    //   title: Text(
    //     '充值次数',
    //     style: Theme.of(context).textTheme.subtitle2,
    //   ),
    //   subtitle: Column(
    //     //左对齐
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text('扣款银行卡: 工商银行，尾号0909 扣款金额：¥20.00',
    //           style: Theme.of(context).textTheme.bodyText1?.copyWith(
    //                 color: const Color(0xFF999999),
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //       8.hb,
    //       Text('12月1日 16:34:09',
    //           style: Theme.of(context).textTheme.bodyText1?.copyWith(
    //                 color: const Color(0xFF999999),
    //               )),
    //     ],
    //   ),
    //   trailing: Text('+20', style: Theme.of(context).textTheme.subtitle2),
    // ),
  }

  getList() {
    return Offstage(
      offstage: num % 2 != 0,
      child: SizedBox(
          height: 700.w,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    // Get.to(() => Withdrawal(
                    //     pice: timeList[index]['pice'],
                    //     bankName: timeList[index]['bankname'],
                    //     time: timeList[index]['time']));
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
                              '',
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
                              '',
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

  _refresh() async {
    //timeList = await User.getHistory();
  }
}
