
import 'package:cloud_car/ui/home/user_manager/user_manager_detail_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import '../manager_container_item.dart';

class UserManagerPage extends StatefulWidget {
  const UserManagerPage({Key? key}) : super(key: key);

  @override
  _UserManagerPageState createState() => _UserManagerPageState();
}

class _UserManagerPageState extends State<UserManagerPage> {
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
        title: Text('客户管理',
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
          _getItem('客户统计'),
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
                    Get.to(()=>UserManagerDetailPage());

                },
                child: const ManagerContainerItem(
                  text: '浏览客户',
                  num: '12',
                ),
              );
            }),
      ],
    );
  }

}