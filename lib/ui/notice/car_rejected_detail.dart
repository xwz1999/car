import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/task_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class CardetailPage extends StatefulWidget {
  const CardetailPage({Key? key}) : super(key: key);

  @override
  _CardetailPageState createState() => _CardetailPageState();
}

class _CardetailPageState extends State<CardetailPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  late TabController _tabController;
  late EasyRefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
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
      path: Assets.images.noticeBg.path,
      appbar: Container(
        color: Colors.transparent,
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(
          children: [
            32.wb,
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset('assets/icons/back.png',
                  height: 48.w, width: 48.w),
            ),
            522.wb,
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset('assets/icons/ic_favorite1.png',
                  height: 48.w, width: 48.w),
            ),
            24.wb,
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset('assets/icons/ic_share.png',
                  color: Colors.black, height: 48.w, width: 48.w),
            ),
            16.wb,
          ],
        ),
      ),
      extendBody: true,
      //extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        //Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),
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
            _tabDetail(),
            14.hb,
            _bottonBar(),
          ],
        ),
      ),
    );
  }

  //标题
  _title() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 96.w,
          child: Flexible(
              child: Text(
            '奥迪A3 2020款 Sportback 35 TFSI 进取运动型',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.sp,
                color: const Color.fromRGBO(17, 17, 17, 1)),
          )),
        ),
      ],
    );
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
          children: const [
            SizedBox(
              child: Text(
                '车辆信息未填写完整',
                style: TextStyle(
                    color: Color.fromRGBO(230, 34, 34, 1),
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
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: 116.w,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0.0, 4.0),
                        color: Color.fromRGBO(2, 122, 255, 0.11))
                  ]),
              padding: EdgeInsets.only(top: 24.w, left: 24.w),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '9.08-11.68万',
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: const Color.fromRGBO(51, 51, 51, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 28.w,
                            height: 28.w,
                            child: Image.asset('assets/icons/detail_file.png'),
                          ),
                          // Icon(
                          //   Icons.timer,
                          //   size: 20,
                          // ),
                          Text(
                            '参考行情',
                            style: TextStyle(
                                color: const Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 24.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                  27.wb,
                  SizedBox(
                    width: 1.w,
                    height: 40.w,
                    child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey)),
                  ),
                  27.wb,
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '张斯斯',
                            style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color.fromRGBO(51, 51, 51, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          8.wb,
                          Text.rich(TextSpan(
                              text: '立即联系',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.sp),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (() {
                                  ('object');
                                })))
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 28.w,
                            height: 28.w,
                            child: Image.asset('assets/icons/detail_file.png'),
                          ),
                          // Icon(
                          //   Icons.timer,
                          //   size: 20,
                          // ),
                          Text(
                            '车务',
                            style: TextStyle(
                                color: const Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 24.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                  27.wb,
                  SizedBox(
                    width: 1.w,
                    height: 40.w,
                    child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey)),
                  ),
                  27.wb,
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 68.w)),
                      Text(
                        '893627',
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: const Color.fromRGBO(51, 51, 51, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 28.w,
                            height: 28.w,
                            child: Image.asset('assets/icons/detail_file.png'),
                          ),
                          // Icon(
                          //   Icons.timer,
                          //   size: 20,
                          // ),
                          Text(
                            '车辆编号',
                            style: TextStyle(
                                color: const Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 24.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )

            // Row(children: [
            //   Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),

            // ]),
            )
      ],
    );
  }

  //栏
  _tabDetail() {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: 365.w,
            child: Column(
              children: [
                TabBar(
                  onTap: ((value) {}),
                  isScrollable: true,
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 10.w, horizontal: 40.w),
                  controller: _tabController,
                  indicatorWeight: 4,
                  labelColor: const Color.fromRGBO(2, 122, 255, 1), //选中时的颜色
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
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: const Color.fromRGBO(
                                                51, 51, 51, 1),
                                            fontWeight: FontWeight.bold),
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
                                              style: TextStyle(
                                                  fontSize: 28.sp,
                                                  color: const Color.fromRGBO(
                                                      102, 102, 102, 1)),
                                            ),
                                            48.wb,
                                            Text(
                                              'LGJ83476524683243',
                                              // detaillist[0]
                                              //     ['number']!, //??不确定的添加条件   ！确定
                                              style: TextStyle(
                                                  fontSize: 28.sp,
                                                  color: const Color.fromRGBO(
                                                      51, 51, 51, 1)),
                                            )
                                          ],
                                        ),
                                        14.hb,
                                        Row(
                                          children: [
                                            Text(
                                              '车辆类型',
                                              style: TextStyle(
                                                  fontSize: 28.sp,
                                                  color: const Color.fromRGBO(
                                                      102, 102, 102, 1)),
                                            ),
                                            24.wb,
                                            Text(
                                              '二手车(中规)',
                                              // detaillist[0]['type']!,
                                              style: TextStyle(
                                                  fontSize: 28.sp,
                                                  color: const Color.fromRGBO(
                                                      51, 51, 51, 1)),
                                            )
                                          ],
                                        ),
                                        14.hb,
                                        Row(
                                          children: [
                                            Text(
                                              '品牌车型',
                                              style: TextStyle(
                                                  fontSize: 28.sp,
                                                  color: const Color.fromRGBO(
                                                      102, 102, 102, 1)),
                                            ),
                                            24.wb,
                                            Flexible(
                                                child: Text(
                                              '奥迪A3 2020款 Sportback 35 TFSI 进取 运动型',
                                              // detaillist[0]['models']!,
                                              style: TextStyle(
                                                  fontSize: 28.sp,
                                                  color: const Color.fromRGBO(
                                                      51, 51, 51, 1)),
                                            )),
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
      ],
    );
  }

  //底部
  _bottonBar() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 118.w,
          child: TabBar(
            onTap: ((value) {}),
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(
              vertical: 10.w,
            ),
            controller: _tabController,
            indicatorWeight: 4,
            labelColor: const Color.fromRGBO(2, 122, 255, 1), //选中时的颜色
            unselectedLabelColor: const Color.fromRGBO(51, 51, 51, 1), //未选中颜色
            indicatorColor: Colors.white, //下划线颜色
            //indicatorPadding: EdgeInsets.symmetric(horizontal: 30.w),
            tabs: [
              Tab(
                child: MaterialButton(
                  child: Column(
                    children: [
                      //Image(image: ),
                      SizedBox(
                        width: 56.w,
                        height: 56.w,
                        child: Image.asset('assets/icons/editor.png'),
                      ),
                      // const Icon(
                      //   Icons.crop_3_2,
                      //   color: Color.fromRGBO(2, 122, 255, 1),
                      // ),
                      Text(
                        '重新编辑',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text(''),
                          children: <Widget>[
                            SimpleDialogOption(
                              child: const Text('这是重新编辑'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ).then((val) {
                      (val);
                    });
                  },
                ),
              ),
              Tab(
                child: MaterialButton(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 56.w,
                        height: 56.w,
                        child: Image.asset('assets/icons/no_transmission.png'),
                      ),
                      // const Icon(
                      //   Icons.crop_3_2,
                      //   color: Color.fromRGBO(153, 153, 153, 1),
                      // ),
                      Text('调价', style: TextStyle(fontSize: 24.sp)),
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text(''),
                          children: <Widget>[
                            SimpleDialogOption(
                              child: const Text('这是调价'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ).then((val) {
                      print(val);
                    });
                  },
                ),
              ),
              Tab(
                child: MaterialButton(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 56.w,
                        height: 56.w,
                        child: Image.asset('assets/icons/no_upload.png'),
                      ),
                      // const Icon(
                      //   Icons.crop_3_2,
                      //   color: Color.fromRGBO(153, 153, 153, 1),
                      // ),
                      Text('出售', style: TextStyle(fontSize: 24.sp)),
                    ],
                  ),
                  onPressed: () {
                    showDialog<Null>(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text(''),
                          children: <Widget>[
                            SimpleDialogOption(
                              child: const Text('这是出售'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ).then((val) {
                      (val);
                    });
                  },
                ),
              ),
              Tab(
                child: MaterialButton(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 56.w,
                        height: 56.w,
                        child: Image.asset('assets/icons/no_download.png'),
                      ),
                      // const Icon(
                      //   Icons.crop_3_2,
                      //   color: Color.fromRGBO(153, 153, 153, 1),
                      // ),
                      Text('下架/退库', style: TextStyle(fontSize: 24.sp)),
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text(''),
                          children: <Widget>[
                            SimpleDialogOption(
                              child: const Text('这是下架/退库'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ).then((val) {
                      (val);
                    });
                  },
                ),
              ),
            ],
          ),
        )
      ],
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
        style: TextStyle(
            color: const Color.fromRGBO(230, 34, 34, 1), fontSize: 24.sp),
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
      child: Text(
        text,
        style: TextStyle(
          color: const Color.fromRGBO(79, 90, 116, 1),
          fontSize: 24.sp,
        ),
      ),
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
          'assets/images/car_banner.png',
          fit: BoxFit.fill,
        );
      },
      //自动翻页
      autoplay: true,
      //分页指示
      pagination: _bulidPagination(),
      //点击事件
      onTap: (index) {
        print('点击' + index.toString());
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
