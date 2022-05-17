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
  const PayChangesPage({super.key});

  @override
  _PayChangesPageState createState() => _PayChangesPageState();
}

class _PayChangesPageState extends State<PayChangesPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  List<HistoryModel> payNumList = [
    const HistoryModel(id: 23, type: 3, count: -1, createdAt: 1651149932),
    const HistoryModel(id: 23, type: 2, count: -1, createdAt: 1232312313),
    const HistoryModel(id: 23, type: 1, count: 20, createdAt: 1732432432),
    const HistoryModel(id: 23, type: 1, count: 20, createdAt: 1732432432),
    const HistoryModel(id: 23, type: 1, count: 20, createdAt: 1732432432),
    const HistoryModel(id: 23, type: 1, count: -1, createdAt: 1732432432),
  ];

  //List<String> timeList = [];
  //bool num = true;
  //late int num = 0;
  List<int> num = [];

  List<String> timeList = [];

  // late int timeNum = 0;
  List<String> timeList1 = [];
  List<int> number1 = [];

  @override
  void initState() {
    for (var i = 0; i < payNumList.length; i++) {
      timeList.add(
        DateUtil.formatDateMs(payNumList[i].createdAt.toInt() * 1000,
            format: 'yyyy年MM月'),
      );
    }
    timeList1 = timeList.toSet().toList();
    for (var i = 0; i < timeList1.length; i++) {
      num.add(0);
    }
    print(num);
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
        body: Column(children: [
          const SizedBox(),
          Expanded(
              child: EasyRefresh(
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
                    id: 23, type: 2, count: -1, createdAt: 1232312313),
                const HistoryModel(
                    id: 23, type: 1, count: 20, createdAt: 1732432432),
                const HistoryModel(
                    id: 23, type: 1, count: 20, createdAt: 1732432432),
                const HistoryModel(
                    id: 23, type: 1, count: 20, createdAt: 1732432432),
                const HistoryModel(
                    id: 23, type: 2, count: -1, createdAt: 1732432432),
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
              var baseList = await apiClient
                  .requestList(API.user.wallet.assessHistory, data: {
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
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _getChanges(timeList1[index], index);
              },
              itemCount: timeList1.length,
            ),
          ))
        ]));
  }

//列表
  _getChanges(String model, int number) {
    return GestureDetector(
        onTap: (() {
          print(number1);
          //print(timeList1);
          // var a = timeList[0];
          // var b = DateUtil.formatDateMs(
          //     payNumList.first.createdAt.toInt() * 1000,
          //     format: 'yyyy年MM月');
          // print(a);
          // print(b);
          // print(a == b);
          num[number]++;
          //num = false;
          setState(() {});
        }),
        child: Column(
          children: [
            Container(
              width: 750.w,
              height: 96.w,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
              decoration: BoxDecoration(
                  color: kForeGroundColor,
                  border: Border(
                      bottom: BorderSide(
                          color: BaseStyle.colorcccccc, width: 1.w))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model,
                    // DateUtil.formatDateMs(.createdAt.toInt() * 1000,
                    //     format: 'yyyy年MM月'),
                    //payNumList[],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 32.w, fontWeight: FontWeight.bold),
                  ),
                  16.wb,
                  SizedBox(
                      width: 32.w,
                      height: 32.w,
                      child: Image.asset(num[number].isEven
                          ? Assets.icons.down.path
                          : Assets.icons.icGoto.path)
                      // Icon(
                      //   num % 2 == 0
                      //       ? Icons.keyboard_arrow_down
                      //       : Icons.keyboard_arrow_right,
                      //   color:
                      //       num % 2 == 0 ? Colors.blue : BaseStyle.color999999,
                      // )
                      )
                ],
              ),
            ),
            Offstage(
                offstage: num[number].isOdd, //num % 2 != 0,
                child: getJubge(number)

                //
                //     ListView.builder(
                //   shrinkWrap: true,
                //   itemExtent: 140.w,
                //   itemBuilder: (context, index) {
                //     return timeList1[number] ==
                //             DateUtil.formatDateMs(
                //                 payNumList[index].createdAt.toInt() * 1000,
                //                 format: 'yyyy年MM月')
                //         ? getSc(payNumList[index])
                //         : '';
                //
                //     //getSc(payNumList[index]);
                //   },
                //   itemCount: 3,
                // ),
                )
            //getList()
          ],
        ));
  }

  getJubge(int number) {
    number1.clear();
    for (var i = 0; i < payNumList.length; i++) {
      if (timeList1[number] ==
          DateUtil.formatDateMs(payNumList[i].createdAt.toInt() * 1000,
              format: 'yyyy年MM月')) {
        number1.add(i);
        //return getSc(payNumList[i]);
        //getSc();
        continue;
      }
    }
    print(number1);
    return ListView.builder(
      shrinkWrap: true,
      itemExtent: 140.w,
      itemBuilder: (context, index) {
        return getSc(payNumList[number1[index]]);
      },
      itemCount: number1.length,
    );
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
            padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 24.w),
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
            padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 24.w),
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
            padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 24.w),
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
