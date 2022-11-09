
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';


class SystemPage extends StatefulWidget {
  const SystemPage({super.key});

  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  final EasyRefreshController _refreshController = EasyRefreshController();

  List<dynamic>? data;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
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
          title: Text('系统通知', style: Theme.of(context).textTheme.headline6),
        ),
        body: Expanded(
          child: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            controller: _refreshController,
            onRefresh: () async {

              setState(() {});
            },
            child:ListView.builder(
              //padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
              itemCount: 3,
              itemBuilder: (context, index) {
                return    Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      50.hb,
                      _time(),
                      32.hb,
                      _picture(),
                      _content(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),



     );
  }

//时间
  _time() {
    return Text(
      '01-12 12:44',
      style: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: const Color(0xFF999999)),
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
                  child: Image.asset(Assets.images.systemUpdate.path),
                ),
                Positioned(
                    child: Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 35.w)),
                    Text(
                      '系统升级',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 40.sp,
                          color: const Color.fromRGBO(255, 255, 255, 0.8)),
                    ),
                    Text(
                      UserTool.appProvider.packageInfo.version,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 48.sp, color: const Color(0xffffffff)),
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
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontWeight: FontWeight.bold),
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
                    style: Theme.of(context).textTheme.subtitle2,
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
