import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Fashionable1Page extends StatefulWidget {
  const Fashionable1Page({Key? key}) : super(key: key);

  @override
  _Fashionable1PageState createState() => _Fashionable1PageState();
}

class _Fashionable1PageState extends State<Fashionable1Page>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  final yd = 2;
  final wd = 3;
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
        title: Text("分账确认"),
        backgroundColor: Colors.white,
      ),

      extendBody: true,
      extendBodyBehindAppBar: true,
      body: //Container(
          //     child: Column(
          //   children: [_fashionablecard()],
          // )),16.hb,
          ListView(
        //horizontal左右
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        children: [
          //上下
          Padding(padding: EdgeInsets.symmetric(vertical: 93.w)),
          Container(
            //padding: EdgeInsets.symmetric(vertical: 16.w),
            child: _fashionablecard(),
          ),
          _fashionablecard2(),
        ],
      ),
      // Text('',
      //   style: Theme.of(context).textTheme.bodyText1,
      // ),
    );
  }

//奥迪分账群
  _fashionablecard() {
    return Card(
        child: Column(children: [
      Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 32.w, top: 24.w)),
          Text(
            '奥迪A3分账群',
            style: TextStyle(
                fontSize: 32.sp, color: Color.fromRGBO(51, 51, 51, 1)),
          ),
          Container(
            padding: EdgeInsets.only(left: 293.w, top: 20.w),
            child: _read(),
          )
        ],
      ),
      // ListTile(
      //   title: Text(
      //     "奥迪A3分账群",
      //     style: TextStyle(
      //         fontSize: 32.sp, color: Color.fromRGBO(51, 51, 51, 1)),
      //   ),
      // ),
      // Positioned(
      //     child: Container(
      //   padding: EdgeInsets.symmetric(vertical: 26.w),
      //   child: _read(),
      // )
      //     //_read()
      //     )
      Column(
        children: [_textbox()],
      )
    ]));
  }

//宝马分账群
  _fashionablecard2() {
    return Card(
        child: Column(children: [
      Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 32.w, top: 24.w)),
          Text(
            '宝马CLS级分账群',
            style: TextStyle(
                fontSize: 32.sp, color: Color.fromRGBO(51, 51, 51, 1)),
          ),
          Container(
            padding: EdgeInsets.only(left: 243.w, top: 20.w),
            child: _noread(),
          )
        ],
      ),
      Column(
        children: [_textbox2()],
      )
    ]));
  }

  //文本内容
  _textbox() {
    return Container(
      width: double.infinity,
      height: 320.w,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '分账内容',
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                "买车",
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '操作人',
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                "张三",
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '出资金额/分账金额',
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                "50000元/1000000元",
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '操作时间',
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                "2021—12—01 12:00:22",
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
        ],
      ),
    );
  }

  _textbox2() {
    return Container(
      width: double.infinity,
      height: 320.w,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '分账内容',
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                "洗车",
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '操作人',
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                "张三",
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '出资金额/分账金额',
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                "10元/50元",
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '操作时间',
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                "2021—12—01 12:00:22",
                style: TextStyle(
                    fontSize: 28.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
        ],
      ),
    );
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

//判断
  _judge() {
    if (yd == 2) {
      _read();
    } else {
      _noread();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
