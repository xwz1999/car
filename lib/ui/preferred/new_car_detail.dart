import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class NewCarPage extends StatefulWidget {
  const NewCarPage({super.key});

  @override
  _NewCarPageState createState() => _NewCarPageState();
}

class _NewCarPageState extends State<NewCarPage>
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
            const Spacer(),
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

  //??????
  _title() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 96.w,
          child: Flexible(
              child: Text(
            '??????A3 2020??? Sportback 35 TFSI ???????????????',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: const Color(0xFF111111), fontSize: 40.sp),
          )),
        ),
      ],
    );
  }

  //??????
  _label() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 41.w,
          child: Row(
            children: [
              _noRelease('??????'),
              16.wb,
              _textview('??????'),
            ],
          ),
        ),
      ],
    );
  }

  //????????????
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
              text: '???',
              style: TextStyle(
                  color: const Color(0xFFFF3B02),
                  fontSize: BaseStyle.fontSize32))
        ]))
      ],
    );
  }

  //??????
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

  //?????????
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
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '26.12???',
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
                        '????????????',
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
                        '??????',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: Image.asset(Assets.icons.carColor.path),
                      ),
                      // Icon(
                      //   Icons.timer,
                      //   size: 20,
                      // ),
                      Text(
                        '????????????',
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
                        '????????????',
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

  //???
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
          '????????????',
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
              '????????????',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            24.hb,
            _getText('?????????', 'LGJ83476524683243'),
            24.hb,
            _getText('????????????', '??????(??????)'),
            24.hb,
            _getText('????????????', '??????A3 2020??? Sportback 35 TFSI ???????????????'),
          ],
        ),
      )
    ]);
  }

  //??????

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
                  '????????????',
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
                  '??????',
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
                  child: Image.asset(Assets.icons.noUpload.path),
                ),
                Text(
                  '??????',
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
                  '??????/??????',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//??????
//?????????
  _noRelease(String text) {
    return Container(
      decoration: BoxDecoration(
          color: text == '??????'
              ? const Color(0xFFFF3B02).withOpacity(0.08)
              : const Color(0xFF027AFF).withOpacity(0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: text == '??????'
                ? const Color(0xFFFF3B02)
                : const Color(0xFF027AFF)),
      ),
    );
  }

//??????
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

//???????????????
  _bulidPagination() {
    return SwiperPagination(

        //????????????????????????
        alignment: Alignment.bottomCenter, //???????????????
        //????????????
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5), //????????????
        //???????????????
        builder: FractionPaginationBuilder(
            color: Colors.white, activeFontSize: 20.sp, fontSize: 20.sp)
        // builder: DotSwiperPaginationBuilder(
        //   //??????????????????
        //   space: 2,
        //   //?????????????????????
        //   size: 6,
        //   //??????????????????
        //   activeSize: 12,
        //   //?????????????????????
        //   color: Colors.black,
        //   //??????????????????
        //   activeColor: Colors.white,
        // )
        );
  }

//????????????
  _bannerStyle() {
    return Swiper(
      itemCount: 6,
      //??????
      scrollDirection: Axis.horizontal,
      //????????????
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
      //????????????
      autoplay: true,
      //????????????
      pagination: _bulidPagination(),
      //????????????
      onTap: (index) {
       // ('??????$index');
      },
      //????????????
      //???????????????????????????????????????
      autoplayDisableOnInteraction: true,
      //????????????
      loop: true,
    );
  }

//
  _getText(String title, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
