import 'package:cloud_car/ui/home/home_page.dart';
import 'package:cloud_car/ui/user/product_manuals.dart';
import 'package:cloud_car/ui/user/user_about/about_page.dart';
import 'package:cloud_car/ui/user/user_assessment/user_assessment.dart';
import 'package:cloud_car/ui/user/user_basic_information/basic_information.dart';
import 'package:cloud_car/ui/user/user_feedback/feedback_page.dart';
import 'package:cloud_car/ui/user/user_install/system_settings.dart';
import 'package:cloud_car/ui/user/user_invitation/user_invitation.dart';
import 'package:cloud_car/ui/user/user_look_contract/consignment_contract.dart';
import 'package:cloud_car/ui/user/user_management/staff_management.dart';
import 'package:cloud_car/ui/user/user_order/myorder.dart';
import 'package:cloud_car/ui/user/user_partner_center/partner_center.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
// int assessment=0,//评估
//  int wallet=0,//钱包
//  int invitation=0,//邀请

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  late final _KingCoinUserlist = [];

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
    _KingCoinUserlist.add(
        KingCoin(name: '我的邀约', url: Assets.icons.userInvitation.path));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold(
      path: Assets.images.userBg.path,
      bodyColor: bgColor,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      appbar: Container(
        //height: kToolbarHeight + MediaQuery.of(context).padding.top,
        //height: 334.w,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(top: 78.w, bottom: 78.w),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
              left: 670.w,
            )),
            GestureDetector(
              onTap: () {
                Get.to(() => const SystemSettingPage());
              },
              child: Image.asset(Assets.icons.userSetUp.path,
                  height: 48.w, width: 48.w),
            ),
          ],
        ),
      ),
      extendBody: true,
      // extendBodyBehindAppBar: true,
      body: Expanded(
          child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            children: [
              //Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),
              _shareUser(),
              32.hb,
              _getBanner(),
              24.hb,
              _share(),
            ],
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                //Get.to(() => MyHomePage());
              },
              child: const Text('data')),
          Text("云云问车 1.0",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: const Color(0xFFCCCCCC))),
          64.hb,
        ],
      )),
      // body: Text(
      //   '',
      //   style: Theme.of(context).textTheme.bodyText1,
      // ),
    );
  }

  getCiap(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          color: title == '销售'
              ? const Color(0xFFFF3B02).withOpacity(0.08)
              : const Color(0xFF027AFF).withOpacity(0.08)),
      child: Text(
        title,
        style: TextStyle(
            color: title == '销售'
                ? const Color(0xFFFF3B02)
                : const Color(0xFF027AFF),
            fontSize: BaseStyle.fontSize20),
      ),
    );
  }

  getText(String num, String title) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case '评估':
            Get.to(() => const AssessmentNumPage());
            break;
          case '钱包':
            Get.to(() => const AssessmentNumPage());
            break;
          case '邀请':
            Get.to(() => const AssessmentNumPage());
            break;
        }
      },
      child: SizedBox(
        width: 160.w,
        child: Column(
          children: [
            Text(
              num,
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize40,
                  fontWeight: FontWeight.bold),
            ),
            8.hb,
            Text(
              title,
              style: TextStyle(
                  color: BaseStyle.color999999,
                  fontSize: BaseStyle.fontSize24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
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
            // width: 90.w,
            // height: 80.w,
            left: 566.w,
            top: 16.w,
            child: Stack(
              children: [
                Container(
                  width: 112.w,
                  height: 46.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.images.bubble.path,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.w),
                    child: Text(
                      "首月6折",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: kForeGroundColor),
                    ),
                  ),
                )
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
      margin: const EdgeInsets.only(top: 25, right: 20, left: 20),
      child: Row(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  //Get.to(() => const PartnerCenterPage());
                },
                child: Text(
                  "合伙人",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: kForeGroundColor),
                  // style: TextStyle(
                  //     fontSize: 32.sp,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold),
                ),
              ),
              16.wb,
              Text("开通即享5项权益",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white.withOpacity(0.8))
                  // TextStyle(
                  //   fontSize: 24.sp,
                  //   color: Colors.white60,
                  // ),
                  ),
            ],
          )),
          GestureDetector(
            onTap: () {
              Get.to(() => const PartnerCenterPage());
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.w),
                  color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.w),
              child: Text("立即开通",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: const Color(0xFF027AFF),
                      fontWeight: FontWeight.bold)
                  // TextStyle(
                  //     color: Colors.blue,
                  //     fontSize: 13,
                  //     fontWeight: FontWeight.bold),
                  ),
            ),
          )
        ],
      ),
    );
  }

//头像信息
  _shareUser() {
    return Container(
        padding: EdgeInsets.all(32.w),
        decoration: BoxDecoration(
          color: Colors.white, //底色
          borderRadius: BorderRadius.circular(16.w), //圆角弧度
        ),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const BasicInformationPage());
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  SizedBox(
                    //头像
                    width: 120.w, height: 120.w,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(60.w)),
                          child: Container(
                            color: Colors.blue,
                          )),
                    ),
                  ),
                  32.wb,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "张三",
                        style: Theme.of(context).textTheme.headline3,
                        // style: TextStyle(
                        //     fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Row(
                        children: [getCiap('销售'), 16.wb, getCiap('云云问车')],
                      )
                    ],
                  ),
                  255.wb,
                  SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: const Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
            ),
          ),
          48.hb,
          Row(children: [
            getText('1', '评估'),
            70.wb,
            getText('10210', '钱包'),
            70.wb,
            getText('12', '邀请'),
          ]),
        ]));
  }

//其他功能
  _share() {
    return Container(
      width: double.infinity,
      height: 460.w,
      padding: EdgeInsets.only(
        left: 32.w,
        top: 40.w,
      ),
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
              Text(
                '其他功能',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 36.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          20.hb,
          _getKingCoin(),
        ],
      ),
    );
  }

//icon间距样式
  _getKingCoin() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
            Get.to(() => const MyOrderPage());
            break;
          case '关于云云':
            Get.to(() => const AboutPage());
            break;
          case '员工管理':
            Get.to(() => const StaffManagement());
            break;
          case '查看合同':
            Get.to(() => const ConsignmentContract());
            break;
          case '产品手册':
            Get.to(() => const ProductManuals());
            break;
          case '意见反馈':
            Get.to(() => const FeedbackPage());
            break;
          case '我的邀约':
            Get.to(() => const UserInvitation());
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

  bool get wantKeepAlive => true;
}

void column() {}
