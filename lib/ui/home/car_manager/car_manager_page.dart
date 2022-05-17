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
  List<dynamic>? data;

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
          _getItem('收购车辆'),
          40.hb,
          _getItem('评估车辆'),
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
        GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                crossAxisCount: 3,
                //纵轴间距
                mainAxisSpacing: 10,
                //横轴间距
                crossAxisSpacing: 15,
                //子组件宽高长度比例
                childAspectRatio: 200 / 176),
            itemBuilder: (BuildContext context, int index) {
              //Widget Function(BuildContext context, int index)
              return GestureDetector(
                onTap: () {
                  if (text == '评估车辆') {
                    Get.to(() => const AssessmentPage());
                  } else {
                    Get.to(() => const DirectSaleManagerPage());
                  }
                },
                child: const ManagerContainerItem(
                  text: '在售',
                  num: '12',
                ),
              );
            }),
      ],
    );
  }
}
