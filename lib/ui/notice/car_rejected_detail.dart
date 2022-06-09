import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class CardetailPage extends StatefulWidget {
  const CardetailPage({super.key});

  @override
  _CardetailPageState createState() => _CardetailPageState();
}

class _CardetailPageState extends State<CardetailPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CloudScaffold(
      path: Assets.images.noticeBg.path,
      bodyColor: kForeGroundColor,
      appbar: Container(
        color: Colors.transparent,
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        //alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(
          children: [
            const CloudBackButton(
              isSpecial: true,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.icFavorite1.path,
                  height: 48.w, width: 48.w),
            ),
            24.wb,
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.icShare.path,
                  color: Colors.black, height: 48.w, width: 48.w),
            ),
            32.wb,
          ],
        ),
      ),
      extendBody: true,
      //extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  _title(),
                  14.hb,
                  _label(),
                  14.hb,
                  _information(),
                  14.hb,
                  _shuffling(),
                  32.hb,
                  _informations(),
                  48.hb,
                ],
              )
              // Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),

              ),
          Column(
            children: [
              _tabDetail(),
              28.hb,
              _bottonBar(),
            ],
          ),
        ],
      ),
    );
  }

  //标题
  _title() {
    return SizedBox(
        width: 686.w,
        child: Text(
          '奥迪A3 2020款 Sportback 35 TFSI 进取运动型',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: const Color(0xFF111111), fontSize: 40.sp),
        ));
  }

  //标签
  _label() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 41.w,
          child: Row(
            children: [
              _noRelease('未发布'),
              16.wb,
              _textview('2020年10月'),
              16.wb,
              _textview('20.43万公里'),
              16.wb,
              _textview('国六'),
            ],
          ),
        ),
      ],
    );
  }

  //提示信息
  _information() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              child: Text(
                '车辆信息未填写完整',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: const Color(0xFFE62222),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //轮播
  _shuffling() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 456.w,
          child: _bannerStyle(),
        )
      ],
    );
  }

  //信息栏
  _informations() {
    return SizedBox(
      width: 686.w,
      height: 116.w,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0.0, 4.0),
                  blurRadius: 14.0,
                  spreadRadius: 0.0,
                  color: Color.fromRGBO(2, 122, 255, 0.11)),
              // BoxShadow(
              //     offset: Offset(0.0, 0.0),
              //     color: Color.fromRGBO(2, 122, 255, 0.11))
            ]),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '9.09—11.68万',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: Image.asset(Assets.icons.systemEstimate.path),
                      ),
                      // Icon(
                      //   Icons.timer,
                      //   size: 20,
                      // ),
                      Text(
                        '参考行情',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: const Color(0xFF999999)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 1.w,
              height: 40.w,
              child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '张斯斯',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      8.wb,
                      Text.rich(TextSpan(
                          text: '立即联系',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color: const Color(0xFF027AFF),
                                  fontSize: 20.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              //('object');
                            })))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: Image.asset(Assets.icons.traffic.path),
                      ),
                      // Icon(
                      //   Icons.timer,
                      //   size: 20,
                      // ),
                      Text(
                        '车务',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: const Color(0xFF999999)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 1.w,
              height: 40.w,
              child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 68.w)),
                  Text(
                    '893627',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: Image.asset(Assets.icons.carNumber.path),
                      ),
                      // Icon(
                      //   Icons.timer,
                      //   size: 20,
                      // ),
                      Text(
                        '车辆编号',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: const Color(0xFF999999)),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //栏
  _tabDetail() {
    return Column(
      children: [
        SizedBox(
            width: 750.w,
            height: 385.w,
            //color: Colors.white,
            child: Column(
              children: [
                TabBar(
                  onTap: ((value) {}),
                  isScrollable: true,
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 10.w, horizontal: 40.w),
                  controller: _tabController,
                  indicatorWeight: 4,
                  labelColor: const Color(0xFF027AFF), //选中时的颜色
                  unselectedLabelColor:
                      const Color.fromRGBO(51, 51, 51, 1), //未选中颜色
                  indicatorColor: Colors.white, //下划线颜色
                  //indicatorPadding: EdgeInsets.symmetric(horizontal: 30.w),
                  tabs: [
                    _tab(0, '详情'),
                    _tab(1, '车辆轨迹'),
                    _tab(2, '意向客户'),
                    _tab(3, '订单')
                  ],
                ),
                const Divider(
                  height: 10.0,
                  indent: 0.0,
                  color: Color.fromRGBO(221, 221, 221, 1),
                ),
                SizedBox(
                    height: 288.w,
                    width: double.infinity,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 32.w, top: 16.w)),
                                      Text(
                                        '基本信息',
                                        //item['title'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 250.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 32.w, vertical: 32.w),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '车架号',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2
                                                  ?.copyWith(
                                                      color: const Color(
                                                          0xFF999999)),
                                            ),
                                            48.wb,
                                            Text(
                                              'LGJ83476524683243',
                                              // detaillist[0]
                                              //     ['number']!, //??不确定的添加条件   ！确定
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2,
                                            )
                                          ],
                                        ),
                                        14.hb,
                                        Row(
                                          children: [
                                            Text(
                                              '车辆类型',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2
                                                  ?.copyWith(
                                                      color: const Color(
                                                          0xFF999999)),
                                            ),
                                            24.wb,
                                            Text(
                                              '二手车(中规)',
                                              // detaillist[0]['type']!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2,
                                            )
                                          ],
                                        ),
                                        14.hb,
                                        Row(
                                          children: [
                                            Text(
                                              '品牌车型',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2
                                                  ?.copyWith(
                                                      color: const Color(
                                                          0xFF999999)),
                                            ),
                                            24.wb,
                                            Flexible(
                                                child: Text(
                                                    '奥迪A3 2020款 Sportback 35 TFSI 进取 运动型',
                                                    // detaillist[0]['models']!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const Text('22222'),
                        const Text('33333'),
                        const Text('4444444'),
                      ],
                    ))
              ],
            )),
        const Divider(
          height: 10.0,
          indent: 0.0,
          color: Color.fromRGBO(221, 221, 221, 1),
        ),
      ],
    );
  }

  //底部
  _bottonBar() {
    return Container(
      width: 750.w,
      height: 98.w,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          SizedBox(
            width: 170.w,
            height: 98.w,
            child: Column(
              children: [
                SizedBox(
                  width: 56.w,
                  height: 56.w,
                  child: Image.asset(Assets.icons.editor.path),
                ),
                Text(
                  '重新编辑',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 170.w,
            height: 98.w,
            child: Column(
              children: [
                SizedBox(
                  width: 56.w,
                  height: 56.w,
                  child: Image.asset(Assets.icons.noTransmission.path),
                ),
                Text(
                  '调价',
                  style: TextStyle(fontSize: 24.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 170.w,
            height: 98.w,
            child: Column(
              children: [
                SizedBox(
                  width: 56.w,
                  height: 56.w,
                  child: Image.asset(Assets.icons.noUpload.path),
                ),
                Text(
                  '出售',
                  style: TextStyle(fontSize: 24.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 170.w,
            height: 98.w,
            child: Column(
              children: [
                SizedBox(
                  width: 56.w,
                  height: 56.w,
                  child: Image.asset(Assets.icons.noDownload.path),
                ),
                Text(
                  '下架/退库',
                  style: TextStyle(fontSize: 24.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//部分
//未发布
  _noRelease(String text) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(230, 34, 34, 0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: const Color(0xFFE62222)),
      ),
    );
  }

//文本
  _textview(String text) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(79, 90, 116, 0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: const Color(0xFF4F5A74))),
    );
  }

//分页指示器
  _bulidPagination() {
    return const SwiperPagination(
        //指示器显示的位置
        alignment: Alignment.bottomCenter, //位置在底部
        //距离调整
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5), //坐上右下
        //指示器构建
        builder:
            FractionPaginationBuilder(color: Colors.white, activeFontSize: 15)

        // builder: DotSwiperPaginationBuilder(
        //   //点之间的间距
        //   space: 2,
        //   //没选中时的大小
        //   size: 6,
        //   //选中时的大小
        //   activeSize: 12,
        //   //没选中时的颜色
        //   color: Colors.black,
        //   //选中时的颜色
        //   activeColor: Colors.white,
        // )
        );
  }

//图片样式
  _bannerStyle() {
    return Swiper(
      itemCount: 6,
      //横向
      scrollDirection: Axis.horizontal,
      //布局构建
      itemBuilder: (context, index) {
        // return Image.network(
        //   'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
        //   fit: BoxFit.fill,
        // );
        return Image.asset(
          Assets.images.carBanner.path,
          fit: BoxFit.fill,
        );
      },
      //自动翻页
      autoplay: true,
      //分页指示
      pagination: _bulidPagination(),
      //点击事件
      onTap: (index) {
        // ('点击$index');
      },
      //布局方法
      //用户进行操作时停止自动翻页
      autoplayDisableOnInteraction: true,
      //无限轮播
      loop: true,
    );
  }

//
  _tab(int index, String text) {
    return Text(text);
  }

  @override
  bool get wantKeepAlive => true;
}
