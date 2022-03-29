import 'package:cloud_car/ui/user/user_partner_center/partner_renewal.dart';
import 'package:cloud_car/ui/user/user_recommended/user_recommended.dart';
import 'package:cloud_car/ui/user/user_wallet/wallet_certification.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PartnerCenterPage extends StatefulWidget {
  const PartnerCenterPage({Key? key}) : super(key: key);

  @override
  _PartnerCenterPageState createState() => _PartnerCenterPageState();
}

class _PartnerCenterPageState extends State<PartnerCenterPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];

  late EasyRefreshController _refreshController;
  late bool certification;
  @override
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text('合伙人中心', style: Theme.of(context).textTheme.headline6

              // TextStyle(
              //     color: BaseStyle.color111111,
              //     fontSize: BaseStyle.fontSize36,
              //     fontWeight: FontWeight.bold)

              ),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              width: 750.w,
              height: 1495.w,
              color: const Color.fromRGBO(246, 246, 246, 1),
            ),
            //Positioned(top: 868.w, child: _getButton()),
            Positioned(top: 238.w, child: _getInterests()),
            Positioned(left: 32.w, top: 66.w, right: 32.w, child: _shareUser()),
          ],
        ));
  }

//底部按钮
  _getButton() {
    return Container(
      height: 227.w,
      width: 750.w,
      //color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w), topRight: Radius.circular(16.w)),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.18),
                offset: Offset(0.0, 0.0),
                blurRadius: 12.0,
                spreadRadius: 0.0)
          ]),
      child: Column(children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 80.w)),
            Radio(
              value: true,
              onChanged: (Value) {
                setState(() {
                  Alert.show(
                      context,
                      NormalContentDialog(
                        type: NormalTextDialogType.delete,
                        title: '确认提示',
                        content: const Text('是否确认屏幕下方屏幕协议'),
                        items: const ['取消'],
                        deleteItem: '确认',
                        //监听器
                        listener: (index) {
                          Alert.dismiss(context);
                          Value = false;
                          (Value);
                        },
                        deleteListener: () {
                          Alert.dismiss(context);
                          Value = true;
                          (Value);
                        },
                      ));
                });
              },
              groupValue: Value,
            ),
            // RichText(
            //   text: TextSpan(
            //       text: '我已阅读并了解',
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyText1
            //           ?.copyWith(color: Color(0xFFAAAAAA)),
            //       children: [TextSpan(children: Text.rich(OnTap(){

            //       }))]),
            // )
            Row(
              children: [
                Text(
                  '我已阅读并了解',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: const Color(0xFFAAAAAA)),
                ),
                GestureDetector(
                  onTap: (() {}),
                  child: Text(
                    '《付款服务协议》',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: const Color(0xFF027AFF)),
                  ),
                )
              ],
            ),
            _getBubbles(),
          ],
        ),
        Container(
          width: double.infinity,
          height: 72.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(8.w)),
          child: SizedBox(
              child: GestureDetector(
            onTap: () {
              Get.to(() => const PartnerRenewalPage());
            },
            child: Text(
              '确认协议并续费¥1500.00',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: const Color(0xffffffff)),
            ),
          )),
        )
      ]),
    );
  }

//合伙人享有权益
  _getInterests() {
    return Stack(
      children: [
        Container(
          width: 750.w,
          height: 1250.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
          padding: EdgeInsets.only(top: 194.w, left: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  '合伙人享有权益',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontSize: 30.sp),
                ),
              ),
              32.hb,
              Container(
                height: 900.w,
                width: 696.w,
                padding: EdgeInsets.only(left: 24.w),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7.0,
                    mainAxisSpacing: 8.0,
                    //maxCrossAxisExtent: 120.0,
                    childAspectRatio: 2.5,
                  ),
                  children: [
                    GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(color: Colors.black)),
                          // margin: EdgeInsets.only(top: 18.w, right: 18.w),
                          padding: EdgeInsets.only(right: 8.w, top: 4.w),
                          child: Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.w)),
                                  Text(
                                    '客户管理',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  8.hb,
                                  Text('海量车源，随心挑选',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: const Color(0xFF999999)))
                                ],
                              ),
                              22.wb,
                              SizedBox(
                                width: 48.w,
                                height: 48.w,
                                child: Image.asset(
                                    Assets.icons.customerManagement.path),
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const RecommendedPage());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(color: Colors.black)),
                          // margin: EdgeInsets.only(top: 18.w, right: 18.w),
                          padding: EdgeInsets.only(right: 8.w, top: 4.w),
                          child: Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.w)),
                                  Text(
                                    '我的推荐码',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  8.hb,
                                  Text('海量车源，随心挑选',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: const Color(0xFF999999)))
                                ],
                              ),
                              22.wb,
                              SizedBox(
                                width: 48.w,
                                height: 48.w,
                                child: Image.asset(
                                    Assets.icons.recommendedCode.path),
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const WalletCertificationPage());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(color: Colors.black)),
                          // margin: EdgeInsets.only(top: 18.w, right: 18.w),
                          padding: EdgeInsets.only(right: 8.w, top: 4.w),
                          child: Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.w)),
                                  Text(
                                    '我的钱包',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  8.hb,
                                  Text('海量车源，随心挑选',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: const Color(0xFF999999)))
                                ],
                              ),
                              22.wb,
                              SizedBox(
                                width: 48.w,
                                height: 48.w,
                                child: Image.asset(Assets.icons.myWallet.path),
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(color: Colors.black)),
                          // margin: EdgeInsets.only(top: 18.w, right: 18.w),
                          padding: EdgeInsets.only(right: 8.w, top: 4.w),
                          child: Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.w)),
                                  Text(
                                    '产看合同',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  8.hb,
                                  Text('海量车源，随心挑选',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: const Color(0xFF999999)))
                                ],
                              ),
                              22.wb,
                              SizedBox(
                                width: 48.w,
                                height: 48.w,
                                child:
                                    Image.asset(Assets.icons.myContract.path),
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(color: Colors.black)),
                          // margin: EdgeInsets.only(top: 18.w, right: 18.w),
                          padding: EdgeInsets.only(right: 8.w, top: 4.w),
                          child: Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.w)),
                                  Text(
                                    '我的订单',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  8.hb,
                                  Text('海量车源，随心挑选',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: const Color(0xFF999999)))
                                ],
                              ),
                              22.wb,
                              SizedBox(
                                width: 48.w,
                                height: 48.w,
                                child: Image.asset(Assets.icons.myOrder.path),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(top: 1080.w, child: _getButton())
      ],
    );
  }

//头像框
  _shareUser() {
    return SizedBox(
      //padding: EdgeInsets.symmetric(horizontal: 32.w),
      height: 328.w,
      child: Stack(children: [
        Image.asset(Assets.images.partnerCenterBg.path),
        Positioned(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
              vertical: 16.w,
            )),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
                Row(
                  children: [
                    32.wb,
                    SizedBox(
                      //头像
                      width: 100.w, height: 100.w,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.w)),
                            child: Container(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    16.wb,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "张三",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: const Color(0xffffffff)),
                        ),
                        Text(
                          '189****3627',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: const Color(0xffffffff)),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: 64.w,
                top: 16.w,
              ),
              child: Text(
                '还未成为云云问车合伙人',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: const Color.fromRGBO(255, 255, 255, 0.8)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 64.w, top: 32.w),
              child: GestureDetector(
                onTap: () {
                  ///Get.to(() => const ());
                },
                child: Container(
                  width: 160.w,
                  height: 66.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.w),
                      color: Colors.white),
                  padding: EdgeInsets.only(left: 24.w, top: 10.w),
                  child: Text("立即开通",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: const Color(0xFF027AFF))),
                ),
              ),
            ),
          ],
        )),
        Positioned(left: 172.w, top: 188.w, child: _getBubbles()),
      ]),
    );
  }

//气泡框
  _getBubbles() {
    return Stack(
      children: [
        SizedBox(
          width: 112.w,
          height: 46.w,
          child: Image.asset(
            Assets.images.bubble.path,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            left: 10.w,
            top: 6.w,
            child: Text(
              "首月6折",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: const Color(0xffffffff)),
            )),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}

void column() {}