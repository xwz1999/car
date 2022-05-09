import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/History_model.dart';
import 'package:cloud_car/ui/user/interface/user_func.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';

import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PayChangesPage extends StatefulWidget {
  const PayChangesPage({Key? key}) : super(key: key);

  @override
  _PayChangesPageState createState() => _PayChangesPageState();
}

class _PayChangesPageState extends State<PayChangesPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  List<HistoryModel> payNumList = [];
  //List<String> timeList = [];
  late int num = 0;
  // late int timeNum = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () async {
      await _refresh();
      setState(() {});
    });
  }

  int page = 1;
  final int size = 10;
  _refresh() async {
    payNumList = await User.getHistory(
      page: page,
      size: size,
    );
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
        title: Text('次数记录', style: Theme.of(context).textTheme.headline6),
      ),
      extendBody: true,
      //extendBodyBehindAppBar: true,
      body: EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        controller: _easyRefreshController,
        onRefresh: () async {
          page = 1;
          payNumList = await User.getHistory(page: page, size: size);
          payNumList = [
            const HistoryModel(
                id: 23, type: 3, count: -1, createdAt: 1651149932),
            const HistoryModel(
                id: 23, type: 2, count: -1, createdAt: 1651148299),
            const HistoryModel(
                id: 23, type: 1, count: 20, createdAt: 1651148072),
          ];
          // for (var i = 0; i < payNumList.length; i++) {
          //   if (DateUtil.formatDateMs(payNumList[i].createdAt.toInt() * 1000,
          //           format: 'yyyy年MM月') !=
          //       DateUtil.formatDateMs(
          //           payNumList[i + 1].createdAt.toInt() * 1000,
          //           format: 'yyyy年MM月')) {
          //     timeList.add(DateUtil.formatDateMs(
          //         payNumList[i].createdAt.toInt() * 1000,
          //         format: 'yyyy年MM月'));
          //   }
          // }
          setState(() {});
        },
        onLoad: () async {
          page++;
          var baseList =
              await apiClient.requestList(API.user.wallet.assessHistory, data: {
            'page': page,
            'size': size,
          });
          if (baseList.nullSafetyTotal > payNumList.length) {
            payNumList.addAll(baseList.nullSafetyList
                .map((e) => HistoryModel.fromJson(e))
                .toList());
          } else {
            _easyRefreshController.finishLoad(noMore: true);
          }
          setState(() {});
        },
        child: _getChanges(),
        // child: ListView.builder(
        //   itemBuilder: (context, index) {
        //     return _getChanges();
        //   },
        //   itemCount: timeNum,
        // )
      ),
    );
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
                    '2022年04月',
                    // DateUtil.formatDateMs(.createdAt.toInt() * 1000,
                    //     format: 'yyyy年MM月'),
                    //payNumList[],
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
            Offstage(
              offstage: num % 2 != 0,
              child: SizedBox(
                  height: 700.w,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return getSc(payNumList[index]);
                      // GestureDetector(
                      //     onTap: () {
                      //       Get.to(() => const Withdrawal(
                      //           pice: '100', //timeList[index]['pice'],
                      //           bankName: '银行卡', //timeList[index]['bankname'],
                      //           time: '2022年')); //timeList[index]['time']));
                      //     },
                      //     child: Container(
                      //       width: 750.w,
                      //       height: 140.w,
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: 32.w, vertical: 24.w),
                      //       color: kForeGroundColor,
                      //       child: Row(
                      //         children: [
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 '提现到银行卡',
                      //                 style:
                      //                     Theme.of(context).textTheme.subtitle1,
                      //               ),
                      //               Text(
                      //                 '11111',
                      //                 style: TextStyle(
                      //                     color: BaseStyle.color999999,
                      //                     fontSize: BaseStyle.fontSize24),
                      //               ),
                      //             ],
                      //           ),
                      //           const Spacer(),
                      //           Row(
                      //             children: [
                      //               Text(
                      //                 '111111',
                      //                 style:
                      //                     Theme.of(context).textTheme.subtitle2,
                      //               ),
                      //               SizedBox(
                      //                   width: 40.w,
                      //                   height: 40.w,
                      //                   child: const Icon(
                      //                     Icons.keyboard_arrow_right,
                      //                   ))
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     ));
                    },
                    itemCount: payNumList.length,
                  )),
            )
            //getList()
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

  getSc(HistoryModel model) {
    switch (model.type) {
      case 2:
        return GestureDetector(
          onTap: () {
            // Get.to(() => const Withdrawal(
            //     pice: '100', //timeList[index]['pice'],
            //     bankName: '银行卡', //timeList[index]['bankname'],
            //     time: '2022年')); //timeList[index]['time']));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
            color: kForeGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '评估车辆1次',
                      style: TextStyle(
                          color: BaseStyle.color333333, fontSize: 28.sp),
                    ),
                    const Spacer(),
                    Text(
                      (model.count).toString(),
                      style: TextStyle(
                          color: BaseStyle.color333333, fontSize: 28.sp),
                    )
                  ],
                ),
                8.hb,
                Text(
                  DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
                      format: 'MM月dd日 HH:mm:ss'),
                  style:
                      TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
                )
              ],
            ),
          ),
        );
        // ignore: dead_code
        break;
      case 3:
        return GestureDetector(
          onTap: () {
            // Get.to(() => const Withdrawal(
            //     pice: '100', //timeList[index]['pice'],
            //     bankName: '银行卡', //timeList[index]['bankname'],
            //     time: '2022年')); //timeList[index]['time']));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
            color: kForeGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '评估车辆1次',
                      style: TextStyle(
                          color: BaseStyle.color333333, fontSize: 28.sp),
                    ),
                    const Spacer(),
                    Text(
                      (model.count).toString(),
                      style: TextStyle(
                          color: BaseStyle.color333333, fontSize: 28.sp),
                    )
                  ],
                ),
                8.hb,
                Text(
                  DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
                      format: 'MM月dd日 HH:mm:ss'),
                  style:
                      TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
                )
              ],
            ),
          ),
        );
        // ignore: dead_code
        break;
      case 1:
        return GestureDetector(
          onTap: () {
            // Get.to(() => Withdrawal(
            //       pice: (model.count).toString(), //timeList[index]['pice'],
            //       bankName: '银行卡', //timeList[index]['bankname'],
            //       time: DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
            //           format: 'MM月dd日 HH:mm:ss'),
            //     )); //timeList[index]['time']));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
            color: kForeGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '充值次数',
                      style: TextStyle(
                          color: BaseStyle.color333333, fontSize: 28.sp),
                    ),
                    const Spacer(),
                    Text(
                      '+${(model.count).toString()}',
                      style: TextStyle(
                          color: BaseStyle.color333333, fontSize: 28.sp),
                    )
                  ],
                ),
                8.hb,
                Text(
                  '扣款金额：¥${model.count}',
                  style:
                      TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
                ),
                8.hb,
                Text(
                  DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
                      format: 'MM月dd日 HH:mm:ss'),
                  style:
                      TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
                ),
              ],
            ),
          ),
        );
        // ignore: dead_code
        break;
    }
  }
}
