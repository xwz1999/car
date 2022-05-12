import 'package:cloud_car/ui/user/user_recommended/share_detail_customer.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../utils/user_tool.dart';

class RecommendedPage extends StatefulWidget {
  const RecommendedPage({Key? key}) : super(key: key);

  @override
  _RecommendedPageState createState() => _RecommendedPageState();
}

class _RecommendedPageState extends State<RecommendedPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        //path: Assets.images.shareFirstFigure.path,

        extendBody: true,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                primary: false,
                floating: false,
                //固定顶部
                pinned: true,
                snap: false,
                elevation: 0, //阴影
                // toolbarHeight:
                //     MediaQuery.of(context).padding.top + kToolbarHeight,
                //展开高度
                expandedHeight: 762.w, //

                leadingWidth: 0,
                titleSpacing: 0,
                //标题
                title: Container(
                    //color: Colors.red,
                    height: kToolbarHeight + MediaQuery.of(context).padding.top,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Row(
                      children: [
                        32.wb,
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            Assets.icons.back.path,
                            height: 48.w,
                            width: 48.w,
                            color: Colors.white,
                          ),
                        ),
                        206.wb,
                        Text(
                          '我的推荐码',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: kForeGroundColor),
                        ),
                      ],
                    )),

                //左侧标题
                leading: const SizedBox(),
                //collapsedHeight: kToolbarHeight,
                backgroundColor: const Color(0xFFF6F6F6),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  background: Container(
                    alignment: Alignment.center,
                    child: _flexibleSpace(),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight - 12.w),
                  child: Container(
                    height: 76.w,
                    width: 750.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.w),
                            bottomRight: Radius.circular(16.w))),
                    child: TabBar(
                        onTap: (index) {
                          setState(() {});
                        },
                        isScrollable: true,
                        //文本间距
                        labelPadding: EdgeInsets.symmetric(
                            vertical: 12.w, horizontal: 48.w),
                        controller: _tabController,
                        indicatorWeight: 3,
                        //选中与未选中的文字颜色
                        labelColor: kPrimaryColor,
                        unselectedLabelColor: BaseStyle.color333333,
                        // indicatorPadding: EdgeInsets.symmetric(
                        //     horizontal: 30.w, vertical: 30.w),
                        //indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                        ),
                        indicator: const BoxDecoration(),
                        indicatorColor: kPrimaryColor,
                        tabs: [_tab(0, '我邀请的客户')]),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.only(top: 0.w),
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: ListView(
                    children: [
                      Text(
                        '共找到2条信息',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: const Color(0xFF999999)),
                      ),
                      16.hb,
                      GestureDetector(
                        onTap: () {
                          //Get.to(()=>const UserInfoPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              color: kForeGroundColor),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Image.asset(
                                  Assets.images.importantUser.path,
                                  width: 130.w,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.hb,
                                  Row(
                                    children: [
                                      36.wb,
                                      Image.asset(
                                        Assets.icons.icUser.path,
                                        width: 32.w,
                                        height: 32.w,
                                      ),
                                      5.wb,
                                      Text(
                                        '李四',
                                        style: TextStyle(
                                            fontSize: 32.sp,
                                            color: BaseStyle.color333333,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      // GestureDetector(
                                      //   onTap: () {},
                                      //   child: Text(
                                      //     '设为重要',
                                      //     style: TextStyle(
                                      //       fontSize: 24.sp,
                                      //       color: BaseStyle.color999999,
                                      //     ),
                                      //   ),
                                      // ),
                                      // 24.wb,
                                    ],
                                  ),
                                  //10.hb,
                                  // const Divider(
                                  //   height: 2,
                                  //   color: BaseStyle.colorf6f6f6,
                                  // ),
                                  Row(
                                    children: [
                                      36.wb,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          16.hb,
                                          _getText('最近跟进', '发起客户邀约'),
                                          16.hb,
                                          _getText(
                                              '更进时间', '2021—12-01 12:22:12'),
                                          16.hb,
                                          _getText('联系方式', '18912345432'),
                                          16.hb,
                                          _getText(
                                              '销售',
                                              UserTool.userProvider.userInfo
                                                  .nickname),
                                          24.hb,
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      16.hb,
                      GestureDetector(
                        onTap: () {
                          //Get.to(()=>const UserInfoPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              color: kForeGroundColor),
                          child: Stack(
                            children: [
                              // Positioned(
                              //   child: Image.asset(
                              //     Assets.images.importantUser.path,
                              //     width: 130.w,
                              //     fit: BoxFit.fitWidth,
                              //   ),
                              //   right: 0,
                              //   top: 0,
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.hb,
                                  Row(
                                    children: [
                                      36.wb,
                                      Image.asset(
                                        Assets.icons.icUser.path,
                                        width: 32.w,
                                        height: 32.w,
                                      ),
                                      5.wb,
                                      Text(
                                        '王武',
                                        style: TextStyle(
                                            fontSize: 32.sp,
                                            color: BaseStyle.color333333,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          '设为重要',
                                          style: TextStyle(
                                            fontSize: 24.sp,
                                            color: BaseStyle.color999999,
                                          ),
                                        ),
                                      ),
                                      24.wb,
                                    ],
                                  ),
                                  // 10.hb,
                                  // const Divider(
                                  //   height: 2,
                                  //   color: BaseStyle.colorf6f6f6,
                                  // ),
                                  Row(
                                    children: [
                                      36.wb,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          16.hb,
                                          _getText('最近跟进', '客户电话咨询车辆信息'),
                                          16.hb,
                                          _getText(
                                              '更进时间', '2021—12-01 12:22:12'),
                                          16.hb,
                                          _getText('联系方式', '18912345432'),
                                          16.hb,
                                          _getText(
                                              '销售',
                                              UserTool.userProvider.userInfo
                                                  .nickname),
                                          24.hb,
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 32.w),
                //   child: ListView(
                //     children: [
                //       Text(
                //         '共找到2条信息',
                //         style: Theme.of(context)
                //             .textTheme
                //             .subtitle2
                //             ?.copyWith(color: const Color(0xFF999999)),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           //Get.to(()=>const UserInfoPage());
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(16.w),
                //               color: kForeGroundColor),
                //           child: Stack(
                //             children: [
                //               Positioned(
                //                 child: Image.asset(
                //                   Assets.images.importantUser.path,
                //                   width: 130.w,
                //                   fit: BoxFit.fitWidth,
                //                 ),
                //                 right: 0,
                //                 top: 0,
                //               ),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   20.hb,
                //                   Row(
                //                     children: [
                //                       36.wb,
                //                       Image.asset(
                //                         Assets.icons.icUser.path,
                //                         width: 32.w,
                //                         height: 32.w,
                //                       ),
                //                       5.wb,
                //                       Text(
                //                         '李四',
                //                         style: TextStyle(
                //                             fontSize: 32.sp,
                //                             color: BaseStyle.color333333,
                //                             fontWeight: FontWeight.bold),
                //                       ),
                //                       const Spacer(),
                //                       GestureDetector(
                //                         onTap: () {},
                //                         child: Text(
                //                           '设为重要',
                //                           style: TextStyle(
                //                             fontSize: 24.sp,
                //                             color: BaseStyle.color999999,
                //                           ),
                //                         ),
                //                       ),
                //                       24.wb,
                //                     ],
                //                   ),
                //                   10.hb,
                //                   const Divider(
                //                     height: 2,
                //                     color: BaseStyle.colorf6f6f6,
                //                   ),
                //                   Row(
                //                     children: [
                //                       36.wb,
                //                       Column(
                //                         children: [
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号1', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890',
                //                               isRed: true),
                //                           20.hb,
                //                         ],
                //                       )
                //                     ],
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           //Get.to(()=>const UserInfoPage());
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(16.w),
                //               color: kForeGroundColor),
                //           child: Stack(
                //             children: [
                //               Positioned(
                //                 child: Image.asset(
                //                   Assets.images.importantUser.path,
                //                   width: 130.w,
                //                   fit: BoxFit.fitWidth,
                //                 ),
                //                 right: 0,
                //                 top: 0,
                //               ),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   20.hb,
                //                   Row(
                //                     children: [
                //                       36.wb,
                //                       Image.asset(
                //                         Assets.icons.icUser.path,
                //                         width: 32.w,
                //                         height: 32.w,
                //                       ),
                //                       5.wb,
                //                       Text(
                //                         '李四',
                //                         style: TextStyle(
                //                             fontSize: 32.sp,
                //                             color: BaseStyle.color333333,
                //                             fontWeight: FontWeight.bold),
                //                       ),
                //                       const Spacer(),
                //                       GestureDetector(
                //                         onTap: () {},
                //                         child: Text(
                //                           '设为重要',
                //                           style: TextStyle(
                //                             fontSize: 24.sp,
                //                             color: BaseStyle.color999999,
                //                           ),
                //                         ),
                //                       ),
                //                       24.wb,
                //                     ],
                //                   ),
                //                   10.hb,
                //                   const Divider(
                //                     height: 2,
                //                     color: BaseStyle.colorf6f6f6,
                //                   ),
                //                   Row(
                //                     children: [
                //                       36.wb,
                //                       Column(
                //                         children: [
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号1', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890'),
                //                           16.hb,
                //                           _getText('车架号', 'GDL26173890989890',
                //                               isRed: true),
                //                           20.hb,
                //                         ],
                //                       )
                //                     ],
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ));
  }

//图片叠加
  _flexibleSpace() {
    return Stack(
      children: [
        Align(
          child: Container(
            width: 750.w,
            height: 780.w,
            padding: EdgeInsets.only(bottom: 10.w),
            child: Image.asset(Assets.images.shareFirstFigure.path,
                fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 472.w,
          left: 32.w,
          child: Row(
            children: [
              _getcustomer(),
              // 30.wb, _getpartner()
            ],
          ),
        )
      ],
    );
  }

  _tab(int index, String text) {
    return Text(text);
  }
//

  _getText(String title, String content, {bool isRed = false}) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 140.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 28.sp, color: BaseStyle.color666666),
          ),
        ),
        20.wb,
        Text(
          content,
          style: TextStyle(
            fontSize: 28.sp,
            color: isRed ? const Color(0xFFFF3B02) : BaseStyle.color333333,
          ),
        ),
      ],
    );
  }

//
  //邀请客户
  _getcustomer() {
    return Stack(
      children: [
        Container(
            width: 328.w,
            height: 158.w,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: const Color(0x40D14A16),
                  offset: const Offset(0.0, 2.0),
                  blurRadius: 14.w,
                  spreadRadius: 2.w)
            ]),
            child: Image.asset(Assets.images.inviteCustomers.path)),
        Positioned(
            left: 32.w,
            top: 40.w,
            child: Column(
              children: [
                Text(
                  '邀请客户',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: const Color(0xFFFF8129)),
                ),
                16.hb,
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ShareDetailCustomerPage());
                  },
                  child: Text(
                    "立即邀请>>>",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: const Color.fromRGBO(255, 129, 41, 0.8)),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  //邀请合伙人
  // _getpartner() {
  //   return Stack(
  //     children: [
  //       SizedBox(
  //           width: 328.w,
  //           height: 158.w,
  //           child: Image.asset(Assets.images.invitePartners.path)),
  //       Positioned(
  //           left: 32.w,
  //           top: 40.w,
  //           child: Column(
  //             children: [
  //               Text(
  //                 '邀请合伙人',
  //                 style: Theme.of(context)
  //                     .textTheme
  //                     .subtitle1
  //                     ?.copyWith(color: const Color(0xFF3C95F6)),
  //               ),
  //               16.hb,
  //               GestureDetector(
  //                 onTap: () {
  //                   Get.to(() => const ShareDetailPartnerPage());
  //                 },
  //                 child: Text(
  //                   "立即邀请>>>",
  //                   style: Theme.of(context).textTheme.bodyText1?.copyWith(
  //                       color: const Color.fromRGBO(60, 149, 246, 0.8)),
  //                 ),
  //               ),
  //             ],
  //           ))
  //     ],
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}
