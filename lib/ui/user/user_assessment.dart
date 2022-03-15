import 'package:cloud_car/ui/notice/notice_fashionable.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/putup_widget.dart';
import 'package:cloud_car/widget/recharge_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../home/car_manager/assessment_page.dart';

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
  Widget build(BuildContext context) {
    //super.build(context);
    return CloudScaffold(
        bodyColor: bgColor,
        appbar: Container(
          color: Colors.transparent,
          height: kToolbarHeight + MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(children: [
            32.wb,
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset('assets/icons/back.png',
                  height: 48.w, width: 48.w),
            ),
            188.wb,
            Text(
              '评估次数充值',
              style: TextStyle(
                  fontSize: 36.sp, color: const Color.fromRGBO(17, 17, 17, 1)),
            ),
            122.wb,
            Text.rich(TextSpan(
                text: '次数记录',
                style: TextStyle(color: Colors.blue, fontSize: 28.sp),
                recognizer: TapGestureRecognizer()
                  ..onTap = (() {
                    Get.to(() => const AssessmentPage());
                  })))
          ]),
        ),
        extendBody: true,
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
            'assets/images/assessment_bg.png',
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
                    style: TextStyle(color: Colors.white, fontSize: 32.sp),
                  ),
                  24.wb,
                  Text(
                    '49',
                    style: TextStyle(
                        color: const Color.fromRGBO(2, 122, 255, 1),
                        fontSize: 48.sp),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '精准估值',
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.7),
                      fontSize: 20.sp,
                    ),
                  ),
                  16.wb,
                  Text(
                    '守护您的车辆交易',
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.7),
                      fontSize: 20.sp,
                    ),
                  ),
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
                style: TextStyle(fontSize: 28.sp, color: Colors.black),
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
