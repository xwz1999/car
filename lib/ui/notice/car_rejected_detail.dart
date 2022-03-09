import 'dart:ui';

import 'package:cloud_car/ui/home/home_page.dart';
import 'package:cloud_car/ui/home/home_title.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:hive/hive.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import '../home/car_manager_page.dart';

class CardetailPage extends StatefulWidget {
  const CardetailPage({Key? key}) : super(key: key);

  @override
  _CardetailPageState createState() => _CardetailPageState();
}

class _CardetailPageState extends State<CardetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic>? data;
  List imgliat = [
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
  ];
  // final List<Tab> tablist = <Tab>[
  //   Tab(
  //     text: '详情',
  //   ),
  //   Tab(
  //     text: '车辆轨迹',
  //   ),
  //   Tab(
  //     text: '意向客户',
  //   ),
  //   Tab(
  //     text: '订单',
  //   ),
  // ];
  //List tablist = ['详情', '车辆轨迹', '意向客户', '订单'];
  //late TabController _controller;
  // ignore: non_constant_identifier_names
  late EasyRefreshController _refreshController;
  final detaillist = [
    {
      'tltie': '基本信息',
      'number': 'LGJ83476524683243',
      'type': '二手车(中规)',
      'models': '奥迪A3 2020款 Sportback 35 TFSI 进取 运动型',
    }
  ];
  @override
  void initState() {
    //   // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    // _controller = TabController(length: tablist.length, vsync: this);
    // addListener(() {
    //   switch (_controller.index) {
    //     case 0:
    //       print(1);
    //       break;
    //     case 1:
    //       print(2);
    //       break;
    //     case 2:
    //       print(3);
    //       break;
    //     case 3:
    //       print(4);
    //       break;
    //   }
    // });
  }

  @override
  void dispose() {
    //_refreshController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.star_border)),
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
          backgroundColor: Colors.white,
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          Align(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 178.w, horizontal: 32.w),
            child: _cardetali(),
          ),
          //200.hb,
          Container(
            //width: double.infinity,
            //height: 226.w,
            padding: EdgeInsets.only(
                bottom: 700.w, top: 480.w, left: 32.w, right: 32.w),
            child: _bannerstyle(),
          ),
          Container(
            padding: EdgeInsets.only(top: 1000.w, left: 32.w),
            child: _cardetalibottom(),
          ),
          Container(
              padding: EdgeInsets.only(top: 1150.w, left: 32.w),
              child: Column(
                children: [
                  TabBar(
                    onTap: ((value) {}),
                    isScrollable: true,
                    labelPadding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 40.w),
                    controller: _tabController,
                    indicatorWeight: 4,
                    labelColor: Color.fromRGBO(51, 51, 51, 1),
                    //indicatorPadding: EdgeInsets.symmetric(horizontal: 30.w),
                    tabs: [
                      _tab(0, '详情'),
                      _tab(1, '车辆轨迹'),
                      _tab(2, '意向客户'),
                      _tab(3, '订单')
                    ],
                  ),
                  SizedBox(
                      height: 240.w,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Text('111111'),
                          Text('22222'),
                          Text('33333'),
                          Text('4444444'),
                        ],
                      ))
                ],
              ))
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}

void addListener(Null Function() param0) {}

//
_cardetali() {
  return Column(
    children: [
      Flexible(
          child: Text(
        '奥迪A3 2020款 Sportback 35 TFSI 进取运动型',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.sp,
            color: Color.fromRGBO(17, 17, 17, 1)),
      )),
      Padding(padding: EdgeInsets.only(top: 32.w)),
      Column(
        children: [
          Row(
            children: [
              _norelease('未发布'),
              16.wb,
              _textview('2020年10月'),
              16.wb,
              _textview('20.43万公里'),
              16.wb,
              _textview('国六'),
            ],
          )
        ],
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 14.w)),
      Row(
        children: [
          Text(
            '车辆信息未填写完整',
            style: TextStyle(
                color: Color.fromRGBO(230, 34, 34, 1),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      // Container(child: _bannerstyle())
      //Padding(padding: EdgeInsets.symmetric(vertical: 14.w)),
      //s_bannerstyle(),
    ],
  );
}

//未发布
_norelease(String text) {
  return Container(
    decoration: BoxDecoration(
        color: Color.fromRGBO(230, 34, 34, 0.08),
        borderRadius: BorderRadius.all(
          Radius.circular(2.w),
        )),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.w),
    child: Text(
      text,
      style: TextStyle(
        color: Color.fromRGBO(230, 34, 34, 1),
      ),
    ),
  );
}

//文本
_textview(String text) {
  return Container(
    decoration: BoxDecoration(
        color: Color.fromRGBO(79, 90, 116, 0.08),
        borderRadius: BorderRadius.all(
          Radius.circular(2.w),
        )),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.w),
    child: Text(
      text,
      style: TextStyle(
        color: Color.fromRGBO(79, 90, 116, 1),
      ),
    ),
  );
}

// //轮播
// _getswiper() {
//   return Swiper(
//     itemCount: 3,
//     itemBuilder: (context,  index) {
//       return Image.network(
//         ,
//         fit: BoxFit.fill,
//       );
//     },
//     //触发时是否停止播放
//     autoplayDisableOnInteraction: true,
//     //默认分页按钮
//     pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(size: 0)),
//   );
// }
//分页指示器
_bulidpagination() {
  return SwiperPagination(
      //指示器显示的位置
      alignment: Alignment.bottomCenter, //位置在底部
      //距离调整
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5), //坐上右下
      //指示器构建
      builder: DotSwiperPaginationBuilder(
        //点之间的间距
        space: 2,
        //没选中时的大小
        size: 6,
        //选中时的大小
        activeSize: 12,
        //没选中时的颜色
        color: Colors.black,
        //选中时的颜色
        activeColor: Colors.white,
      ));
}

//图片样式
_bannerstyle() {
  return Container(
    //width: double.infinity,
    //height: 226.w,
    //条目个数
    child: Swiper(
      itemCount: 6,
      //横向
      scrollDirection: Axis.horizontal,
      //布局构建
      itemBuilder: (context, index) {
        return Image.network(
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1910021010125G2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649300928&t=fff0ffcc2c57eb09695f619918828ca8',
          fit: BoxFit.fill,
        );
      },
      //自动翻页
      autoplay: true,
      //分页指示
      pagination: _bulidpagination(),
      //点击事件
      onTap: (index) {
        print('点击' + index.toString());
      },
      //布局方法
      //用户进行操作时停止自动翻页
      autoplayDisableOnInteraction: true,
      //无限轮播
      loop: true,
    ),
  );
}

//
_cardetalibottom() {
  return Column(
    children: [
      //Padding(padding: EdgeInsets.symmetric(horizontal: .w)),
      Container(
        width: 686.w,
        height: 116.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        margin: EdgeInsets.symmetric(vertical: 8.w),
        decoration: BoxDecoration(
          color: Colors.white, // 底色
          boxShadow: [
            BoxShadow(
                blurRadius: 2, //阴影范围
                spreadRadius: 1, //阴影浓度
                color: Color.fromRGBO(2, 122, 255, 0.11), //阴影颜色
                offset: Offset(0, 4) //阴影相偏移量
                ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        // decoration: BoxDecoration(color: Colors.white, boxShadow: [
        //   BoxShadow(
        //     color: Color.fromRGBO(2, 122, 255, 0.11),
        //     offset: Offset(0, 4),
        //     //blurRadius: 4.0,
        //   )
        // ]),
        child: Row(
          children: [
            Container(
              width: 200.w,
              height: 116.w,
              padding: EdgeInsets.only(right: 18.w),
              child: Column(
                children: [
                  Text(
                    '9.08-11.68万',
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.timer,
                      //   size: 20,
                      // ),
                      Text(
                        '参考行情',
                        style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 24.sp),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 200.w,
              height: 116.w,
              padding: EdgeInsets.only(right: 32.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '张斯斯',
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: Color.fromRGBO(51, 51, 51, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 80.w,
                        height: 20.w,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text('立即联系'),
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 10.sp),
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(2, 122, 255, 1))),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.timer,
                      //   size: 20,
                      // ),
                      Text(
                        '车务',
                        style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 24.sp),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 200.w,
              height: 116.w,
              //padding: EdgeInsets.only(right: 18.w),
              child: Column(
                children: [
                  Text(
                    '893627',
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.timer,
                      //   size: 20,
                      // ),
                      Text(
                        '车辆编码',
                        style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 24.sp),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],

          // children: [
          //   Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
          //   Column(
          //     children: [
          //       Text(
          //         '9.08-11.68万',
          //         style: TextStyle(
          //             fontSize: 28.sp,
          //             color: Color.fromRGBO(51, 51, 51, 1),
          //             fontWeight: FontWeight.bold),
          //       ),
          //       Row(
          //         children: [
          //           Icon(
          //             Icons.timer,
          //             size: 20,
          //           ),
          //           Text(
          //             '参考行情',
          //             style: TextStyle(
          //                 color: Color.fromRGBO(153, 153, 153, 1),
          //                 fontSize: 24.sp),
          //           )
          //         ],
          //       ),
          //     ],
          //   )
          // ],
        ),
      ),
      Column()
      //底部导航栏
      // Row(
      //   children: [
      //     BottomAppBar(
      //       child: TabBar(tabs: [
      //         Tab(
      //           icon: Icon(Icons.crop_din),
      //           text: '重新编辑',
      //         ),
      //         Tab(
      //           icon: Icon(Icons.crop_din),
      //           text: '调价',
      //         ),
      //         Tab(
      //           icon: Icon(Icons.crop_din),
      //           text: '出售',
      //         ),
      //         Tab(
      //           icon: Icon(Icons.crop_din),
      //           text: '下架/退库',
      //         ),
      //       ]),
      //     )
      //   ],
      // )
    ],
  );
}

//标签内容
_detalitext(item) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 32.w, top: 16.w)),
              Text(
                item['title'],
                style: TextStyle(
                    fontSize: 32.sp, color: Color.fromRGBO(51, 51, 51, 1)),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 260.w,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '车架号',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['number'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
                28.hb,
                Row(
                  children: [
                    Text(
                      '车辆类型',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['type'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
                28.hb,
                Row(
                  children: [
                    Text(
                      '品牌车型',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['models'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      )
    ],
  );
}

// unselectedLabelColor: Color.fromRGBO(51, 51, 51, 1), //未选中时的字体颜色样式优先级最高
// unselectedLabelStyle: TextStyle(fontSize: 14.sp), //未选中字体的大小
// labelColor: Color.fromRGBO(2, 122, 255, 1), //选中时的字体颜色
// labelStyle: TextStyle(fontSize: 14.sp),
// isScrollable: true, //允许左右滑动
// //选中下划线的颜色 indicatorColor: Colors.red,
// //选中下划线的长度，长度与文本内容一样 indicatorSize: TabBarIndicatorSize.label,
// //选中下划线的高度，值越大高度越高默认2.0 indicatorWeight: 6.0,
// //用于设定选中状态下的展示样式 indicator: BoxDecoration(),
class Button {
  Button(Null Function() param0);
}

_tab(int index, String text) {
  return Text(text);
}

void column() {}
