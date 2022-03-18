import 'dart:ui';

import 'package:cloud_car/ui/home/search_page.dart';
import 'package:cloud_car/ui/home/task_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class RecommendedPage extends StatefulWidget {
  const RecommendedPage({Key? key}) : super(key: key);

  @override
  _RecommendedPageState createState() => _RecommendedPageState();
}

class _RecommendedPageState extends State<RecommendedPage>
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
        path: Assets.images.shareFirstFigure.path,
        appbar: Container(
            //color: Colors.red,
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
                      ?.copyWith(color: Color(0xffffffff)),
                ),
              ],
            )),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Row(
          children: [_getcustomer(), 30.wb, _getpartner()],
        ));
  }

  //邀请客户
  _getcustomer() {
    return Stack(
      children: [
        SizedBox(
            width: 328.w,
            height: 158.w,
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
                      ?.copyWith(color: Color(0xFFFF8129)),
                ),
                16.hb,
                GestureDetector(
                  child: Text(
                    "立即邀请>>>",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Color.fromRGBO(255, 129, 41, 0.8)),
                  ),
                )
              ],
            ))
      ],
    );
  }

  //邀请合伙人
  _getpartner() {
    return Stack(
      children: [
        SizedBox(
            width: 328.w,
            height: 158.w,
            child: Image.asset(Assets.images.invitePartners.path)),
        Positioned(
            left: 32.w,
            top: 40.w,
            child: Column(
              children: [
                Text(
                  '邀请合伙人',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Color(0xFF3C95F6)),
                ),
                16.hb,
                GestureDetector(
                  child: Text(
                    "立即邀请>>>",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Color.fromRGBO(60, 149, 246, 0.8)),
                  ),
                )
              ],
            ))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
