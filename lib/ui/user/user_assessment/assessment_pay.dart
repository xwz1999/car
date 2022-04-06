//评估次数充值 62

import 'package:cloud_car/ui/user/user_assessment/pay_results.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/colud_check_radio.dart';

class AssessmentPayPage extends StatefulWidget {
  const AssessmentPayPage({Key? key}) : super(key: key);

  @override
  _AssessmentPayPageState createState() => _AssessmentPayPageState();
}

class _AssessmentPayPageState extends State<AssessmentPayPage> {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];
  List<int> _selectIndex1 = [];
  //List<int> _selectIndex2 = [];
  //List payList = ['微信支付', '支付宝支付'];
  List payList = [
    {'微信支付', Assets.icons.wxPay.path},
    {'支付宝支付', Assets.icons.zfbPay.path}
  ];
  //List payList2 = ['支付宝支付'];

  // late EasyRefreshController _refreshController;

  @override
  @override
  void dispose() {
    // _refreshController.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    //super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text('评估次数充值', style: Theme.of(context).textTheme.headline6),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: Column(
            children: [
              //Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),
              // Text('data')
              _getPice(),
              56.hb,
              // Container(
              //   height: 500.w,
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(16.w)),
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         //height: 100.w,
              //         child: getChooseList(
              //             (String choices) => null, payList, _selectIndex1),
              //       ),
              //       // SizedBox(
              //       //   height: 100.w,
              //       //   child: getChooseList(
              //       //       (String choices) => null, payList2, _selectIndex2),
              //       // ),
              //     ],
              //   ),
              // ),
              // 500.hb,
              Container(
                width: double.infinity,
                height: 72.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.w)),
                child: SizedBox(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => const PayResultsPage());
                  },
                  child: Text(
                    '确认支付',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: kForeGroundColor),
                  ),
                )),
              )
            ],
          ),
        ));
  }

//

//充值金额
  _getPice() {
    return Container(
      padding: EdgeInsets.only(top: 74.w, left: 248.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            child: Text(
              '¥',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 40.sp),
            ),
          ),
          14.wb,
          SizedBox(
            child: Text(
              '20.00',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 64.sp),
            ),
          ),
        ],
      ),
    );
  }

//支付
  _getPay() {
    return Container(
      height: 500.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
      child: Column(
        children: [
          SizedBox(
            height: 100.w,
            child:
                getChooseList((String choices) => null, payList, _selectIndex1),
          ),
          // SizedBox(
          //   height: 100.w,
          //   child: getChooseList(
          //       (String choices) => null, payList2, _selectIndex2),
          // ),
        ],
      ),
    );
  }
//支付判断

  getChooseList(Function(String) callBack, List models, List<int> choices) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 30.w),
      shrinkWrap: true,
      children: [
        ...models
            .mapIndexed((currentValue, index) => GestureDetector(
                  onTap: () {
                    if (choices.contains(index)) {
                      choices.remove(index);
                    } else {
                      choices.clear();
                      choices.add(index);
                    }
                    setState(() {});
                  },
                  child: Container(
                      width: 686.w,
                      height: 100.w,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(
                            child: Image.asset(models[index]),
                          ),
                          20.wb,
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              currentValue,
                              style: TextStyle(
                                  color: BaseStyle.color333333,
                                  fontSize: BaseStyle.fontSize28),
                            ),
                          ),
                          200.wb,
                          BeeCheckRadio(
                            value: index,
                            groupValue: choices,
                          ),
                        ],
                      )),
                ))
            .toList(),
      ],
    );
  }
  // _getPayList(item) {
  //   return Column(
  //     children: [
  //       ListTile(
  //         leading: Image.asset(item['icon']),
  //         title: Text(item['title']),
  //         trailing: Radio(
  //           //单选框的值
  //           value: payList, //item['checked'],
  //           //当前单选框的值
  //           groupValue: grouoId,
  //           //单选框的颜色
  //           activeColor: Colors.blue,
  //           onChanged: (value) {
  //             setState(() {
  //               item['checked'] = value;
  //               // for (var i = 0; i < payList.length; i++) {
  //               //   payList[i]['checked'] = false;
  //               // }
  //               // item['checked'] = true;
  //             });
  //           },
  //         ),
  //         // trailing: item['checked'] ? const Icon(Icons.check) : const Text(''),
  //         // onTap: () {
  //         //   setState(() {
  //         //     for (var i = 0; i < payList.length; i++) {
  //         //       payList[i]['checked'] = false;
  //         //     }
  //         //     item['checked'] = true;
  //         //   });
  //         // },
  //       ),
  //       const Divider()
  //     ],
  //   );
  // }

//单选框

  @override
  bool get wantKeepAlive => true;
}


// 
// class Button {
//   Button(Null Function() param0);
// }

// void column() {}
