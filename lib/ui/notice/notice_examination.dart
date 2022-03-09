import 'dart:ui';

import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'car_rejected_detail.dart';

class examinationPage extends StatefulWidget {
  const examinationPage({Key? key}) : super(key: key);

  @override
  _examinationPageState createState() => _examinationPageState();
}

class _examinationPageState extends State<examinationPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  final auditlist = [
    {
      'title': '发布审核',
      'name': '奥迪A3',
      'time': '2021-12-01 12:00:22',
      'text': '车辆信息未填写完整',
      'conditions': '1',
    },
  ];
  final noauditlist = [
    {
      'title': '修改审核',
      'name': '宝马CLS级',
      'time': '2021-11-23 15:34:12',
      'conditions': '0',
    },
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
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('审批提醒'),
        backgroundColor: Colors.white,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
          child: ListView(children: [
            //引用列表数据
            ...auditlist.map(
              (e) => _release(e),
            ),
            ...noauditlist.map(
              (e) => _modify(e),
            ),
            //_release(auditlist[0]),
            //_modify(noauditlist[0])
          ]
              // children: [

              // ],
              )),
    );
  }

//驳回 通过
  _pass() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
          color: Color.fromRGBO(6, 180, 77, 0.1),
          child: Text(
            "通过",
            style: TextStyle(color: Color.fromRGBO(6, 180, 77, 1)),
          ),
        )
      ],
    );
  }

  _rejected() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
          color: Color.fromRGBO(230, 34, 34, 0.1),
          child: Text(
            "驳回",
            style: TextStyle(color: Color.fromRGBO(230, 34, 34, 1)),
          ),
        )
      ],
    );
  }

//发布审核
  _release(item) {
    return InkWell(
      onTap: () {
        switch (item['title']) {
          case '发布审核':
            Get.to(() => const CardetailPage());
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 32.w, top: 16.w)),
              Text(
                item['title'],
                style: TextStyle(
                    fontSize: 32.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              ),
              Container(
                  padding: EdgeInsets.only(left: 243.w, top: 20.w),
                  //child: item['conditions'] == 0 ? print('0') : print('1');
                  child: item['conditions'] == '0' ? _pass() : _rejected()
                  // if(item['conditions']=='0') {
                  //   _read();
                  // } else {
                  //   _noread();
                  // }

                  )
            ],
          ),
          Container(
            width: double.infinity,
            height: 260.w,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '车辆名称',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['name'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
                28.hb,
                Row(
                  children: [
                    Text(
                      '审核时间',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['time'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
                28.hb,
                Row(
                  children: [
                    Text(
                      '驳回原因',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['text'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

//修改审核
  _modify(item) {
    return Card(
      //onTap: () {},
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 32.w, top: 16.w)),
              Text(
                item['title'],
                style: TextStyle(
                    fontSize: 32.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              ),
              Container(
                  padding: EdgeInsets.only(left: 243.w, top: 20.w),
                  //child: item['conditions'] == 0 ? print('0') : print('1');
                  child: item['conditions'] == '0' ? _pass() : _rejected()
                  // if(item['conditions']=='0') {
                  //   _read();
                  // } else {
                  //   _noread();
                  // }

                  )
            ],
          ),
          Container(
            width: double.infinity,
            height: 200.w,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '车辆名称',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['name'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
                28.hb,
                Row(
                  children: [
                    Text(
                      '审核时间',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['time'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}

void column() {}
