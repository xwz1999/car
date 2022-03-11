import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class systemPage extends StatefulWidget {
  const systemPage({Key? key}) : super(key: key);

  @override
  _systemPageState createState() => _systemPageState();
}

class _systemPageState extends State<systemPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;

  late EasyRefreshController _refreshController;

  @override
  void initState() {
    super.initState();
  }

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
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('系统通知',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              _time(),
              32.hb,
              _picture(),
              10.hb,
              _content(),
            ],
          ),
        ));
  }

//时间
  _time() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 264.w)),
        SizedBox(
            width: double.infinity,
            height: 24.w,
            child: Container(
              padding: EdgeInsets.only(left: 284.w),
              child: Text(
                '01-12 12:44',
                style: TextStyle(
                    fontSize: 24.sp,
                    color: const Color.fromRGBO(153, 153, 153, 1)),
              ),
            )),
      ],
    );
  }

//图片
  _picture() {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: 302.w,
            child: Stack(
              alignment: const Alignment(-0.6, 1),
              children: [
                Align(
                  child: Image.asset('assets/images/system_update.png'),
                ),
                Positioned(
                    child: Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 35.w)),
                    Text(
                      '系统升级',
                      style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 0.8),
                          fontSize: 40.sp),
                    ),
                    Text(
                      'V1.0.1',
                      style: TextStyle(color: Colors.white, fontSize: 48.sp),
                    ),
                  ],
                ))
              ],
            )),
      ],
    );
  }

//更新内容
  _content() {
    return Column(
      children: [
        SizedBox(
            width: 656.w,
            height: 224.w,
            child: Container(
              // color: Colors.amberAccent[200],
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 32.w, top: 32.w, right: 32.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '更新内容',
                        style: TextStyle(
                            fontSize: 32.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 12.w,
                        height: 12.w,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6.w))),
                      )
                    ],
                  ),
                  32.hb,
                  Flexible(
                      child: Text(
                    '本次更新优化用户沟通体验细节，修复无法发送车辆链接bug。',
                    style: TextStyle(fontSize: 28.sp),
                  ))
                ],
              ),
            )),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
