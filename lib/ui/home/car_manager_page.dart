
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'direct_sale_manager_page.dart';
import 'manager_container_item.dart';

class CarManagerPage extends StatefulWidget {
  const CarManagerPage({Key? key}) : super(key: key);

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
        title: Text('车辆管理',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: Column(
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

  _getItem(String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(text,
              style: TextStyle(
                  color: BaseStyle.color333333,
                  fontSize: BaseStyle.fontSize32,
                  fontWeight: FontWeight.bold)),
        ),
        24.hb,
        GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 32.w,right: 32.w),
            physics:const NeverScrollableScrollPhysics(),
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
                childAspectRatio: 200/176),
            itemBuilder: (BuildContext context, int index) {
              //Widget Function(BuildContext context, int index)
              return GestureDetector(
                onTap: (){
                  Get.to(()=>const DirectSaleManagerPage());
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
