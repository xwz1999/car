import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/user/history_model.dart';
import 'package:cloud_car/ui/user/interface/user_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
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
  List<HistoryModel> payNumList = []; //内容列表
  final List<List<HistoryModel>> _sortList = []; //时间列表

  List<bool> _foldStatus = []; //判断是否点击
  //List<String> timeList = [];
  //bool num = true;
  //late int num = 0;
  // List<int> num = [];
  // List<String> timeList = [];
  // late int timeNum = 0;
  // List<String> timeList1 = [];
  // List<int> number1 = [];
  void sortByDate() {
    if (payNumList.isEmpty) {
      return;
    }
    var currentMonth = payNumList.first.createDateTime.month; //月
    var currentYear = payNumList.first.createDateTime.year; //年
    int count = 0;
    _sortList.clear();
    _sortList.add(<HistoryModel>[]);

    for (var item in payNumList) {
      if (item.createDateTime.year == currentYear &&
          item.createDateTime.month == currentMonth) {
        _sortList[count].add(item);
      } else {
        count++;
        currentMonth = item.createDateTime.month;
        currentYear = item.createDateTime.year;
        _sortList.add(<HistoryModel>[]);
        _sortList[count].add(item);
      }
    }
    _foldStatus = List.filled(payNumList.length, true);
  }

  @override
  void initState() {
    // for (var i = 0; i < payNumList.length; i++) {
    //   timeList.add(
    //     DateUtil.formatDateMs(payNumList[i].createdAt.toInt() * 1000,
    //         format: 'yyyy年MM月'),
    //   );
    // }
    // timeList1 = timeList.toSet().toList();
    // for (var i = 0; i < timeList1.length; i++) {
    //   num.add(0);
    // }
    // print(num);
    super.initState();
  }

  int page = 1;
  final int size = 10;

  _refresh() async {
    payNumList = await User.getHistory(
      page: page,
      size: size,
    );
    sortByDate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
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
            await _refresh();

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
              'kind': 1,
            });
            if (baseList.nullSafetyTotal > payNumList.length) {
              payNumList.addAll(baseList.nullSafetyList
                  .map((e) => HistoryModel.fromJson(e))
                  .toList());
              sortByDate();
            } else {
              _easyRefreshController.finishLoad(noMore: true);
            }
            setState(() {});
          },
          child: payNumList.isEmpty
              ? const SizedBox()
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return _getChanges(_sortList[index], index);
                  },
                  itemCount: _sortList.length,
                ),
        ));
  }

//列表
  _getChanges(List<HistoryModel> models, int number) {
    return GestureDetector(
        onTap: (() {
          _foldStatus[number] = !_foldStatus[number];
          setState(() {});
        }),
        child: Column(
          children: [
            Container(
              width: 750.w,
              height: 96.h,
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
                    DateUtil.formatDate(
                        models.isEmpty
                            ? DateTime.now()
                            : models.first.createDateTime,
                        format: DateFormats.zh_y_mo),
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
                      child: Image.asset(_foldStatus[number]
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
                offstage: _foldStatus[number], //num % 2 != 0,
                child: _getJudge(models, number))
          ],
        ));
  }

  _getJudge(List<HistoryModel> models, int number) {
    // number1.clear();
    // for (var i = 0; i < payNumList.length; i++) {
    //   if (timeList1[number] ==
    //       DateUtil.formatDateMs(payNumList[i].createdAt.toInt() * 1000,
    //           format: 'yyyy年MM月')) {
    //     number1.add(i);
    //     //return getSc(payNumList[i]);
    //     //getSc();
    //     continue;
    //   }
    // }
    // print(number1);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _getSc(models[index]);
      },
      itemCount: models.length,
    );
  }

  _getSc(HistoryModel model) {
    switch (model.type) {
      case 2:
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
                      '评估车辆${model.count.abs()}次',
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
                  DateUtil.formatDate(model.createDateTime,
                      format: 'MM月dd日 HH:mm:ss'),
                  style:
                      TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
                )
              ],
            ),
          ),
        );
      // case 3:
      // return GestureDetector(
      //   onTap: () {
      //     // Get.to(() => const Withdrawal(
      //     //     pice: '100', //timeList[index]['pice'],
      //     //     bankName: '银行卡', //timeList[index]['bankname'],
      //     //     time: '2022年')); //timeList[index]['time']));
      //   },
      //   child: Container(
      //     padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 24.w),
      //     color: kForeGroundColor,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           children: [
      //             Text(
      //               '评估车辆1次',
      //               style: TextStyle(
      //                   color: BaseStyle.color333333, fontSize: 28.sp),
      //             ),
      //             const Spacer(),
      //             Text(
      //               (model.count).toString(),
      //               style: TextStyle(
      //                   color: BaseStyle.color333333, fontSize: 28.sp),
      //             )
      //           ],
      //         ),
      //         8.hb,
      //         Text(
      //           DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
      //               format: 'MM月dd日 HH:mm:ss'),
      //           style:
      //               TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
      //         )
      //       ],
      //     ),
      //   ),
      // );
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
                  DateUtil.formatDate(model.createDateTime,
                      format: 'MM月dd日 HH:mm:ss'),
                  style:
                      TextStyle(color: BaseStyle.color999999, fontSize: 24.sp),
                ),
              ],
            ),
          ),
        );
    }
  }
}
