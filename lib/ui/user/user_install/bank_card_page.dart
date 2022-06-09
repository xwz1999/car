import 'package:cloud_car/ui/user/user_install/add_bank_card_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/utils.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:flutter/material.dart';

import '../../../widget/button/cloud_back_button.dart';

class BankCardPage extends StatefulWidget {
  const BankCardPage({super.key});

  @override
  _BankCardPageState createState() => _BankCardPageState();
}

class _BankCardPageState extends State<BankCardPage> {
  List<dynamic>? data;

  //final List<addCard> _addCardList = [];
  @override
  void initState() {
    super.initState();
    // _addCardList.add(
    //   addCard(
    //       title: 'xx银行',
    //       text: '储蓄卡',
    //       image: Assets.images.badge.path,
    //       icon: Assets.icons.agriculturalHead.path,
    //       num: '1234123412342279'),
    // );
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
          backgroundColor: kForeGroundColor, //头部颜色
          title: Text('我的银行卡',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: const Color(0xffffffff), //内容颜色
        extendBody: true,
        body: SizedBox(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            children: [
              _getCard('xx银行', '储蓄卡', Assets.images.xxbankbg.path,
                  Assets.icons.xxbankhead.path, '1234123412341214'),
              12.hb,
              _getCard('中国银行', '储蓄卡', Assets.images.chinabankbg.path,
                  Assets.icons.chinabankhead.path, '1234123412342279'),
              12.hb,
              _getCard(
                  '中国工商银行',
                  '储蓄卡',
                  Assets.images.industrialCommercialbankbg.path,
                  Assets.icons.industrialCommercialbankhead.path,
                  '1234123412342279'),
              12.hb,
              _getCard('交通银行', '储蓄卡', Assets.images.trafficbankbg.path,
                  Assets.icons.trafficbankhead.path, '1234123412342279'),
              12.hb,
              _getCard('招商银行', '储蓄卡', Assets.images.merchantsbankbg.path,
                  Assets.icons.merchantsbankhead.path, '1234123412342279'),
              12.hb,
              _getCard('中国邮政储蓄银行', '储蓄卡', Assets.images.construction.path,
                  Assets.icons.constructionHead.path, '1234123412342279'),
              12.hb,
              _getCard(
                  '兴业银行',
                  '储蓄卡',
                  Assets.images.societeGeneralebankbg.path,
                  Assets.icons.societeGeneralebankhead.path,
                  '1234123412342279'),
              32.hb,
              _getCard('上海浦东发展银行', '储蓄卡', Assets.images.shanghaibankbg.path,
                  Assets.icons.shanghaibankhead.path, '1234123412342279'),
              32.hb,
              _getCard('中信银行', '储蓄卡', Assets.images.citicbankbg.path,
                  Assets.icons.citicbankHead.path, '1234123412342279'),
              32.hb,
              _getAdd(),
              32.hb
            ],
          ),
        ));
  }

//点击添加
  _getAdd() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const AddCardPage());
        //('11111');
      },
      child: Container(
        height: 104.h,
        //margin: EdgeInsets.symmetric(horizontal: 28.w, vertical: 32.w),
        decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(12.w)),
        child: Row(
          children: [
            28.wb,
            Container(
              width: 40.w,
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.w),
              child: Stack(children: [
                Align(
                  child: Container(
                    width: 26.67.w,
                    height: 2.33.h,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(1.4.w)),
                  ),
                ),
                Positioned(
                  left: 18.w,
                  top: 6.w,
                  child: Container(
                    width: 2.33.w,
                    height: 26.67.h,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(1.4.w)),
                  ),
                )
              ]),
            ),
            16.wb,
            Text(
              '添加银行卡',
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }

//银行卡
  _getCard(String title, String text, String image, String icon, String num) {
    return GestureDetector(
        child: Stack(
      children: [
        Align(
          child: SizedBox(
              child: Image.asset(
            image,
            fit: BoxFit.fill,
          )),
        ),
        Positioned(
            top: 34.w,
            left: 32.w,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 64.w,
                      height: 64.w,
                      child: Image.asset(
                        icon,
                        fit: BoxFit.fill,
                      ),
                    ),
                    16.wb,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                title,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: const Color(0xffffffff)),
                              ),
                            ),
                            100.wb,
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Alert.show(
                                      context,
                                      NormalContentDialog(
                                        type: NormalTextDialogType.delete,
                                        title: '解绑提示',
                                        content: const Text('是否将此银行卡解除绑定'),
                                        items: const ['取消'],
                                        deleteItem: '确认',
                                        //监听器
                                        listener: (index) {
                                          Alert.dismiss(context);
                                          //Value = false;
                                          //(Value);
                                        },
                                        deleteListener: () {
                                          Alert.dismiss(context);
                                          //Value = true;
                                          //(Value);
                                        },
                                      ));
                                });
                              },
                              child: Text(
                                '解除绑定',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 0.8)),
                              ),
                            )
                          ],
                        ),
                        Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.8)),
                        )
                      ],
                    ),
                  ],
                ),
                32.hb,
                SizedBox(
                    child: Text(
                  Utils.getPayCardStr(num),
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                        fontSize: 56.sp,
                      ),
                )
                    // Row(
                    //   children: [
                    //     _getDot(),
                    //     36.wb,
                    //     _getDot(),
                    //     36.wb,
                    //     _getDot(),
                    //     Text(
                    //       num,
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .subtitle1
                    //           ?.copyWith(color: Colors.white, fontSize: 56.sp),
                    //     ),
                    //   ],
                    // )
                    )
              ],
            )),
      ],
    )

        // Container(
        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        //     child: Column(
        //   children: [Row()],
        // )),
        );
  }

//静态圆点
}

// ignore: camel_case_types
class addCard {
  late String title;
  late String text;
  late String image;
  late String icon;
  late String num;

  addCard(
      {required this.title,
      required this.text,
      required this.image,
      required this.icon,
      required this.num});
}
