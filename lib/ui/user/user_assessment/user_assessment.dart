import 'package:cloud_car/ui/user/user_assessment/pay_num_changes.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/putup_widget.dart';
import 'package:cloud_car/widget/recharge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class AssessmentNumPage extends StatefulWidget {
  const AssessmentNumPage({Key? key}) : super(key: key);

  @override
  _AssessmentNumPageState createState() => _AssessmentNumPageState();
}

class _AssessmentNumPageState extends State<AssessmentNumPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];
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
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
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
                    Get.to(() => const PayChangesPage());
                  },
                  child: Text(
                    '次数变更',
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
          title: Text('评估次数充值', style: Theme.of(context).textTheme.headline6),
        ),
        //extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              width: 750.w,
              height: 1495.w,
              color: const Color.fromRGBO(246, 246, 246, 1),
            ),
            Positioned(left: 32.w, top: 32.w, right: 32.w, child: _getNum()),
            Positioned(top: 172.w, child: _getPice())
          ],
        ));
  }

//评估次数
  _getNum() {
    return Stack(
      children: [
        SizedBox(
          width: 750.w,
          height: 174.w,
          //padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Image.asset(
            Assets.images.assessmentBg.path,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 40.w, left: 80.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "剩余评估次数",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: kForeGroundColor),
                  ),
                  24.wb,
                  Text(
                    '49',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 42.sp,
                        color: const Color(0xFF027AFF),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Text('精准估值',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20.sp,
                          color: const Color.fromRGBO(255, 255, 255, 0.7))),
                  16.wb,
                  Text('守护您的车辆交易',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20.sp,
                          color: const Color.fromRGBO(255, 255, 255, 0.7))),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

//
  _getPice() {
    return Container(
        //padding: EdgeInsets.only(top: 348.w),
        width: 750.w,
        height: 1350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //Padding(padding: EdgeInsets.symmetric(vertical: 16.w)),
            Container(
              padding: EdgeInsets.only(top: 42.w, right: 576.w),
              child: Text(
                '展示价格',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ), // Padding(padding: EdgeInsets.only(left: 32.w,)),
            //         Text(
            //   '展示价格',
            //   style: TextStyle(fontSize: 28.sp, color: Colors.black),
            // )
            // Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),

            // 24.hb,
            Container(
              width: double.infinity,
              //height: 400.w,
              //padding: EdgeInsets.only(top),
              decoration: const BoxDecoration(
                  //scolor: Colors.red
                  ),
              clipBehavior: Clip.antiAlias,
              child: RechargeWidget(
                childAspectRatio: 216 / 98,
                callback: (String item) {},
                mainAxisSpacing: 20.w,
                crossAxisCount: 3,
                crossAxisSpacing: 24.w,
                haveButton: true,
                itemList: _piceList,
              ),
            )
            // SizedBox(
            //   height: 600.w,
            //   // width: ,
            //   child: GridView.count(
            //     crossAxisCount: 3,
            //     mainAxisSpacing: 32.w,
            //     crossAxisSpacing: 20.w,
            //     padding: EdgeInsets.symmetric(horizontal: 32.w),
            //     childAspectRatio: 1 / 0.5,
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //             color: const Color.fromRGBO(2, 122, 255, 0.1),
            //             border: Border.all(
            //                 color: const Color.fromRGBO(2, 122, 255, 1),
            //                 width: 1.w)),
            //         padding: EdgeInsets.only(top: 16.w, left: 40.w),
            //         child: Column(
            //           children: const [Flexible(child: Text('充值10次 ¥10.00'))],
            //         ),
            //       ),
            //       Container(
            //         width: 108.w,
            //         height: 48.w,
            //         color: const Color.fromRGBO(246, 246, 246, 1),
            //         padding: EdgeInsets.only(top: 16.w, left: 40.w),
            //         child: Column(
            //           children: const [Flexible(child: Text('充值20次 ¥20.00'))],
            //         ),
            //       ),
            //       Container(
            //         color: const Color.fromRGBO(246, 246, 246, 1),
            //         padding: EdgeInsets.only(top: 16.w, left: 40.w),
            //         child: Column(
            //           children: const [Flexible(child: Text('充值30次 ¥30.00'))],
            //         ),
            //       ),
            //       Container(
            //         color: const Color.fromRGBO(246, 246, 246, 1),
            //         padding: EdgeInsets.only(top: 16.w, left: 40.w),
            //         child: Column(
            //           children: const [Flexible(child: Text('充值50次 ¥50.00'))],
            //         ),
            //       ),
            //       Container(
            //         color: const Color.fromRGBO(246, 246, 246, 1),
            //         padding: EdgeInsets.only(top: 16.w, left: 40.w),
            //         child: Column(
            //           children: const [Flexible(child: Text('充值100次 ¥100.00'))],
            //         ),
            //       ),
            //       Container(
            //         color: const Color.fromRGBO(246, 246, 246, 1),
            //         padding: EdgeInsets.only(top: 16.w, left: 40.w),
            //         child: Column(
            //           children: const [Flexible(child: Text('自定义 充值次数'))],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // ElevatedButton(onPressed: () {}, child: const Text('data'))
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

// class Button {
//   Button(Null Function() param0);
// }

void column() {}
