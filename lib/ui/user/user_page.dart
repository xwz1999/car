import 'package:cloud_car/ui/home/home_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../home/car_manager/car_manager_page.dart';
import '../home/task_page.dart';
import '../notice/car_system_informs.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
// int assessment=0,//评估
//  int wallet=0,//钱包
//  int invitation=0,//邀请

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names

  late final _KingCoinUserlist = [];
  final int assessment = 1;
  final int wallet = 10210;
  final int itation = 12;
  late EasyRefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _KingCoinUserlist.add(
        KingCoin(name: '我的订单', url: Assets.icons.usermyorder.path));
    _KingCoinUserlist.add(
        KingCoin(name: '员工管理', url: Assets.icons.userstaffmangement.path));
    _KingCoinUserlist.add(
        KingCoin(name: '查看合同', url: Assets.icons.userviewContract.path));
    _KingCoinUserlist.add(
        KingCoin(name: '产品手册', url: Assets.icons.userproduct.path));
    _KingCoinUserlist.add(
        KingCoin(name: '意见反馈', url: Assets.icons.userfeedback.path));
    _KingCoinUserlist.add(
        KingCoin(name: '关于云云', url: Assets.icons.userabout.path));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CloudScaffold(
      path: Assets.images.userBg.path,
      bodyColor: bgColor,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      appbar: Container(
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        //height: 334.w,
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
              left: 670.w,
            )),
            GestureDetector(
              onTap: () {
                Get.to(() => const TaskPage());
              },
              child: Image.asset('assets/icons/user_set_up.png',
                  height: 48.w, width: 48.w),
            ),
          ],
        ),
      ),
      extendBody: true,
      //extendBodyBehindAppBar: true,
      body: Expanded(
          // padding: EdgeInsets.symmetric(
          //   horizontal: 32.w,
          // ),
          // decoration: new BoxDecoration(
          //   color: Colors.blueGrey[50],
          // ),
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        children: [
          //Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),
          Container(
            padding: EdgeInsets.only(top: 65.w),
            child: _shareUser(),
            height: 408.w,
          ),
          32.hb,
          _getBanner(),
          24.hb,
          _share(),
          164.hb,
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 258.w)),
              const Text("云云问车1.0",
                  style: TextStyle(fontSize: 12, color: Colors.black12)),
            ],
          )
        ],
      )),
      // body: Text(
      //   '',
      //   style: Theme.of(context).textTheme.bodyText1,
      // ),
    );
  }

//banner
  _getBanner() {
    return SizedBox(
      width: double.infinity,
      height: 160.w,
      //padding: EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        children: [
          Align(child: Image.asset(Assets.images.bannerUser.path)),
          Positioned(
            child: _getBannerFont(),
          ),
          Positioned(
            width: 90.w,
            height: 80.w,
            left: 270,
            top: 0,
            child: Stack(
              children: [
                Align(
                  child: Image.asset("assets/images/bubble.png"),
                ),
                const Positioned(
                    left: 7,
                    top: 13,
                    child: Text(
                      "首月6折",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    )),
              ],
            ),
          ),
        ],

        //
      ),
    );
  }

//banner内部文字
  _getBannerFont() {
    return Container(
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10), color: Colors.red),
      // child: Image.asset(Assets.images.Banner.path),
      margin: const EdgeInsets.only(top: 25, right: 20, left: 20),
      child: Row(
        children: [
          //Image.asset(Assets.images.Banner.path),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  "合伙人",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "开通即享5项权益",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white60,
                ),
              ),
            ],
          )),
          Container(
            width: 65,
            height: 28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.w), color: Colors.white),
            padding: const EdgeInsets.only(left: 6, top: 5),
            child: const Text(
              "立即开通",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

//头像信息
  _shareUser() {
    return Container(
        //width: double.infinity,
        //height: 163,
        // margin: EdgeInsets.only(
        //   left: 20,
        //   right: 20,
        // ),
        //上下留白symmetric
        //padding: EdgeInsets.only(left: 10, top: 16),
        padding: EdgeInsets.all(32.w),
        decoration: BoxDecoration(
          color: Colors.white, //底色
          borderRadius: BorderRadius.circular(10), //圆角弧度
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  32.wb,
                  SizedBox(
                    //头像
                    width: 100.w, height: 100.w,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(60.w)),
                          child: Container(
                            color: Colors.blue,
                          )),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "张三",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Row(
                        children: [
                          Container(
                            width: 18,
                            height: 8,
                            color: const Color.fromARGB(255, 245, 205, 146),
                            padding: const EdgeInsets.only(
                                top: 1, left: 4, right: 4),
                            child: const Text(
                              "销售",
                              style: TextStyle(
                                  fontSize: 5,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Container(
                            width: 30,
                            height: 8,
                            color: const Color.fromARGB(255, 164, 229, 245),
                            padding: const EdgeInsets.only(
                                top: 1, left: 4, right: 4),
                            child: const Text(
                              "云云问车",
                              style: TextStyle(
                                  fontSize: 5,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // RawChip(
                          //   label: Text(
                          //     "销售",
                          //     style: TextStyle(fontSize: 5, color: Colors.orange),
                          //   ),
                          //   backgroundColor: Colors.orange[50],
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(2)),

                          // )
                        ],
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(right: 245.w)),
                  RawChip(
                    label: const Icon(Icons.keyboard_arrow_right),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                  ),
                ],
              ),
            ],
          ),
          Column(children: [
            const Padding(padding: EdgeInsets.only(top: 25, left: 50)),
            Row(children: [
              const Padding(
                  padding: EdgeInsets.only(
                top: 10,
                right: 15,
                left: 20,
              )),
              Column(
                children: [
                  Text.rich(TextSpan(
                      text: '$assessment',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          letterSpacing: 1,
                          fontFamily: 'Bebas'),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {

                        }))),

                  // Text(
                  //   '$assessment',
                  //   style: const TextStyle(
                  //       fontSize: 20,
                  //       color: Colors.black,
                  //       letterSpacing: 1,
                  //       fontFamily: 'Bebas'),
                  // ),
                  const RawChip(
                    label: Text(
                      '评估',
                      style: TextStyle(fontSize: 10, color: Colors.black45),
                    ),
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 10,
                right: 15,
                left: 20,
              )),
              Column(
                children: [
                  Text(
                    '$wallet',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontFamily: 'Bebas'),
                  ),
                  const RawChip(
                    label: Text(
                      '钱包',
                      style: TextStyle(fontSize: 10, color: Colors.black45),
                    ),
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 30,
              )),
              Column(
                children: [
                  Text(
                    '$itation',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontFamily: 'Bebas'),
                  ),
                  const RawChip(
                    label: Text(
                      '邀请',
                      style: TextStyle(fontSize: 10, color: Colors.black45),
                    ),
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            ]),
          ]),
        ]));
  }

//其他功能
  _share() {
    return Container(
      width: double.infinity,
      height: 460.w,
      //margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: Colors.white, //底色
        borderRadius: BorderRadius.circular(10), //圆角弧度
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(padding: EdgeInsets.only(left: 32.w, top: 48.w, right: 510.w)),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(top: 48.w, left: 32.w)),
              const Text(
                '其他功能',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _getKingCoin(),
        ],
      ),
      //child: _getkingcoin(),
    );
  }

//icon间距样式
  _getKingCoin() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: _KingCoinUserlist.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //横轴元素个数
        crossAxisCount: 4,
        //纵轴间距
        mainAxisSpacing: 4,
        //横纵轴间距
        crossAxisSpacing: 10,
        //子组件宽高长度比例
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _kingCoinzItem(
            _KingCoinUserlist[index].name, _KingCoinUserlist[index].url);
      },
    );
  }

  _kingCoinzItem(String name, String url) {
    return GestureDetector(
      onTap: () {
        switch (name) {
          case '我的订单':
            Get.to(() => const CarManagerPage());
            break;
          case '关于云云':
            Get.to(() => const systemPage());
            break;
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(
            url,
            width: 100.w,
            height: 95.w,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyText1,
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
