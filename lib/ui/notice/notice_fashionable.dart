import 'dart:ui';
import 'package:cloud_car/ui/home/home_page.dart';
import 'package:cloud_car/ui/home/home_title.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:hive/hive.dart';
import '../home/car_manager_page.dart';

class FashionablePage extends StatefulWidget {
  const FashionablePage({Key? key}) : super(key: key);

  @override
  _FashionablePageState createState() => _FashionablePageState();
}

class _FashionablePageState extends State<FashionablePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  final fashionablelist = [
    {
      'title': '奥迪A3分账群',
      'content': '买车',
      'name': '张三',
      'money': '50000元/1000000元',
      'time': '2020—12-30 12:20',
      'conditions': '0',
    },
    {
      'title': '宝马CLS级分账群',
      'content': '洗车',
      'name': '张三',
      'money': '10元/50元',
      'time': '2020—12-30 12:20',
      'conditions': '1',
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
          title: Text('分账确认'),
          backgroundColor: Colors.white,
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (ctx, index) {
              return this._fashionablecard(this.fashionablelist[index]);
            },
          ),
        ));
  }

//已读 未读
  _read() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
          color: Color.fromRGBO(2, 122, 255, 0.1),
          child: Text(
            "已读",
            style: TextStyle(color: Color.fromRGBO(2, 122, 255, 1)),
          ),
        )
      ],
    );
  }

  _noread() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
          color: Color.fromRGBO(153, 153, 153, 0.1),
          child: Text(
            "未读",
            style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
          ),
        )
      ],
    );
  }

  _fashionablecard(item) {
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
                  child: item['conditions'] == '0' ? _read() : _noread()
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
            height: 320.w,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '分账内容',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['content'],
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
                      '操作人',
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
                      '出资金额/分账金额',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['money'],
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
                      '操作时间',
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

//

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}

void column() {}
