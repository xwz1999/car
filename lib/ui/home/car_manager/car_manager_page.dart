import 'package:cloud_car/model/car/car_statistics_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

import '../manager_container_item.dart';
import 'assessment_page.dart';
import 'direct_sale/direct_sale_manager_page.dart';

class CarManagerPage extends StatefulWidget {
  const CarManagerPage({super.key});

  @override
  _CarManagerPageState createState() => _CarManagerPageState();
}

class _CarManagerPageState extends State<CarManagerPage> {
  CarStatisticsModel _model = CarStatisticsModel.init;

  Future _getStatisticsNum() async {
    _model = await CarFunc.getStatisticNum();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getStatisticsNum();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text(
          '车辆管理',
          style: Theme.of(context).textTheme.headline4,
        ),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: ListView(
        children: [
          _getItem('直卖车辆'),
          40.hb,
          // _getItem('收购车辆'),
          // 40.hb,
          // _getItem('评估车辆'),
        ],
      ),
    );
  }

  _getItem(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(text,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: const Color(0xFF333333), fontWeight: FontWeight.bold)),
        ),
        24.hb,
        GridView.count(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 32.w, right: 32.w),
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 24.w,
          //横轴间距
          crossAxisSpacing: 40.w,
          childAspectRatio: 200 / 176,
          children: [
            GestureDetector(
              onTap: () {
                if (text == '评估车辆') {
                  Get.to(() => const AssessmentPage());
                } else {
                  Get.to(() => const DirectSaleManagerPage());
                }
              },
              child: ManagerContainerItem(
                text: '在售',
                num: '${_model.allSellCount}',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (text == '评估车辆') {
                  Get.to(() => const AssessmentPage());
                } else {
                  Get.to(() => const DirectSaleManagerPage(
                    initIndex: 1,
                  ));
                }
              },
              child: ManagerContainerItem(
                text: '已预订',
                num: '${_model.reserveCount}',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (text == '评估车辆') {
                  Get.to(() => const AssessmentPage());
                } else {
                  Get.to(() => const DirectSaleManagerPage(initIndex: 2,));
                }
              },
              child: ManagerContainerItem(
                text: '已售',
                num: '${_model.soldCount}',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (text == '评估车辆') {
                  Get.to(() => const AssessmentPage());
                } else {
                  Get.to(() => const DirectSaleManagerPage(initIndex: 3,));
                }
              },
              child: ManagerContainerItem(
                text: '退库',
                num: '${_model.backOutCount}',
              ),
            )
          ],
        ),
      ],
    );
  }
}
