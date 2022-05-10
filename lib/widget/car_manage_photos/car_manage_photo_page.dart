import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';

class CarManagePhotoPage extends StatefulWidget {
  final List<String> tabs;

  const CarManagePhotoPage({Key? key, required this.tabs}) : super(key: key);

  @override
  _CarManagePhotoPageState createState() => _CarManagePhotoPageState();
}

class _CarManagePhotoPageState extends State<CarManagePhotoPage> {
  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
      title: '车辆图片管理',
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              '确定',
              style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xFF027AFF),
              ),
            ))
      ],
      appBarBottom: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          tabs: widget.tabs.map((e) => Tab(text: e)).toList()),
      body: Container(),
    );
  }
}
