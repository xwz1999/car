import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class PreferredCardDetailPage extends StatefulWidget {
  const PreferredCardDetailPage({Key? key}) : super(key: key);

  @override
  _PreferredCardDetailPageState createState() => _PreferredCardDetailPageState();
}

class _PreferredCardDetailPageState extends State<PreferredCardDetailPage>
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

  late bool bl = true;
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
            32.wb,
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(Assets.icons.back.path,
                  height: 48.w, width: 48.w),
            ),
            446.wb,
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.carDetail.path,
                  height: 48.w, width: 48.w),
            ),
            24.wb,
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.collection.path,
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
            16.wb,
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
                  _tabDetail(),
                  14.hb,
                  Divider(
                    height: 1.w,
                    color: const Color(0xFFDDDDDD),
                  ),
                  60.hb,
                  _bottonBar()
                ],
              )
              // Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),

              ),
        ],
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
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: const Color(0xFF111111), fontSize: 40.sp),
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
              _noRelease('在售'),
              16.wb,
              _noRelease('在厅'),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '27.43',
              style: TextStyle(
                  color: const Color(0xFFFF3B02),
                  fontSize: BaseStyle.fontSize40)),
          TextSpan(
              text: '万',
              style: TextStyle(
                  color: const Color(0xFFFF3B02),
                  fontSize: BaseStyle.fontSize32))
        ]))
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
      child: Container(
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
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '26.12万',
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
                        '系统估价',
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
            13.wb,
            SizedBox(
              width: 1.w,
              height: 40.w,
              child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey)),
            ),
            13.wb,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
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
                              ('object');
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
            13.wb,
            SizedBox(
              width: 1.w,
              height: 40.w,
              child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey)),
            ),
            13.wb,
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

    // Row(children: [
    //   Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
    // ]),
  }

  //栏
  _tabDetail() {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(left: 280.w, top: 24.w),
        width: 750.w,
        height: 76.w,
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: const Color(0xFFDDDDDD)),
            // border: Border(
            //     bottom: BorderSide(width: 1.w, color: const Color(0xFFDDDDDD))),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.w),
                bottomRight: Radius.circular(16.w))),
        child: Text(
          '车辆详情',
          style: TextStyle(
              color: const Color(0xFF027AFF), fontSize: BaseStyle.fontSize28),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '基本信息',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            24.hb,
            _getText('车架号', 'LGJ83476524683243'),
            24.hb,
            _getText('车辆类型', '二手车(中规)'),
            24.hb,
            _getText('品牌车型', '奥迪A3 2020款 Sportback 35 TFSI 进取运动型'),
          ],
        ),
      )
    ]);
  }

  //底部

  _bottonBar() {
    return Container(
      width: 750.w,
      height: 98.w,
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        children: [
          SizedBox(
            width: 150.w,
            height: 98.w,
            child: Column(
              children: [
                SizedBox(
                  width: 56.w,
                  height: 56.w,
                  child: Image.asset(Assets.icons.noEditor.path),
                ),
                4.hb,
                Text(
                  '重新编辑',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150.w,
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
                  child: Image.asset(Assets.icons.upload.path),
                ),
                Text(
                  '出售',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150.w,
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
                  style: Theme.of(context).textTheme.bodyText1,
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
          color: text == '在售'
              ? const Color(0xFFFF3B02).withOpacity(0.08)
              : const Color(0xFF027AFF).withOpacity(0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: text == '在售'
                ? const Color(0xFFFF3B02)
                : const Color(0xFF027AFF)),
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
    return SwiperPagination(

        //指示器显示的位置
        alignment: Alignment.bottomCenter, //位置在底部
        //距离调整
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5), //坐上右下
        //指示器构建
        builder: FractionPaginationBuilder(
            color: Colors.white, activeFontSize: 20.sp, fontSize: 20.sp)
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
        ('点击$index');
      },
      //布局方法
      //用户进行操作时停止自动翻页
      autoplayDisableOnInteraction: true,
      //无限轮播
      loop: true,
    );
  }

//
  _getText(String title, String text) {
    return Row(
      children: [
        SizedBox(
          width: 130.w,
          child: Text(
            title,
            style: TextStyle(
                color: BaseStyle.color999999, fontSize: BaseStyle.fontSize28),
          ),
        ),
        32.wb,
        SizedBox(
          width: 514.w,
          child: Text(
            text,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
