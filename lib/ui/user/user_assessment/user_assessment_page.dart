import 'package:cloud_car/constants/const_data.dart';
import 'package:cloud_car/ui/user/user_assessment/pay_num_changes_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/putup_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';

import 'assessment_pay_page.dart';

class UserAssessmentPage extends StatefulWidget {
  const UserAssessmentPage({super.key});

  @override
  _UserAssessmentPageState createState() => _UserAssessmentPageState();
}

class _UserAssessmentPageState extends State<UserAssessmentPage> {
  ChooseItems? _chooseItem;
  final List<ChooseItems> _piceList = [
    ChooseItems(name: '充值10次', pice: '10.00', count: 10),
    ChooseItems(name: '充值20次', pice: '20.00', count: 20),
    ChooseItems(name: '充值30次', pice: '30.00', count: 30),
    ChooseItems(name: '充值50次', pice: '50.00', count: 50),
    ChooseItems(name: '充值100次', pice: '100.00', count: 100),
    ChooseItems(name: '充值500次', pice: '500.00', count: 500),
    // ChooseItems(name: '自定义', pice: '充值次数'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  '次数记录',
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(32.w),
            child: _getNum(),
          ),
          _getPrice(),
        ],
      ),
      bottomNavigationBar: _confirmBtn(),
    );
  }

//评估次数
  _getNum() {
    return Stack(
      alignment: Alignment.center,
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
                    (UserTool.userProvider.userInfo.data.assessCount)
                        .toString(),
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
  _getPrice() {
    return Container(
        width: 750.w,
        height: 1350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 42.w, right: 576.w),
              child: Text(
                '展示价格',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            24.hb,
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              clipBehavior: Clip.antiAlias,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 32.w,
                      right: 32.w,
                    ),
                    child: SortWidget(
                      crossAxisSpacing: 24.w,
                      itemList: _piceList,
                      childAspectRatio: 216 / 98,
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.w,
                      callback: (item, index) {
                        _chooseItem = item;
                        setState(() {});
                      },
                      pickItem: _chooseItem,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        launchUrlString('tel:$servicePhone');
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 150.w,
                          height: 100.w,
                          child:
                              '联系客服'.richText.color(Colors.blueAccent).make()),
                    ),
                  ),
                  762.hb,
                  //40.hb,
                ],
              ),
            ),
          ],
        ));
  }

  _confirmBtn() {
    return GestureDetector(
      onTap: () {
        if (_chooseItem != null) {
          Get.to(() => AssessmentPayPage(
                price: _chooseItem!.pice,
                count: _chooseItem!.count,
              ));
        } else {
          CloudToast.show('请先选择一个充值类型');
          return;
        }
      },
      child: Material(
        child: Container(
          width: double.infinity,
          height: 72.w,
          padding: EdgeInsets.symmetric(vertical: 16.w),
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              left: 32.w,
              right: 32.w,
              bottom: 32.w + MediaQuery.of(context).padding.bottom),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0xFF0593FF),
                Color(0xFF027AFF),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
          child: Text(
            '充值',
            style: TextStyle(
                color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
          ),
        ),
      ),
    );
  }
}
