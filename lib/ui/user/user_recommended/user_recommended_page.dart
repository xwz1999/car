import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/customer/customer_list_model.dart';
import 'package:cloud_car/ui/home/func/customer_func.dart';
import 'package:cloud_car/ui/user/user_recommended/share_detail_customer_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../utils/user_tool.dart';

class RecommendedPage extends StatefulWidget {
  const RecommendedPage({super.key});

  @override
  _RecommendedPageState createState() => _RecommendedPageState();
}

class _RecommendedPageState extends State<RecommendedPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;

  //头部背景布局，true滚动一定的高度 false滚动高度为0
  late bool headerWhite = false;

  late TabController _tabController;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  List<CustomerListModel> recommendedList = [];

  ///滚动监听设置
  final ScrollController _scrollController = ScrollController();

  // final ScrollController _controller = ScrollController();

  int _page = 1;
  final int _size = 10;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset > 500.w && headerWhite != true) {
        headerWhite = true;
        setState(() {});
      } else if (_scrollController.offset < 500.w && headerWhite != false) {
        headerWhite = false;
        setState(() {});
      }

      // setState(() {
      //   //print(_scrollController.offset);
      // });
    });

    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      body: EasyRefresh.custom(
        firstRefresh: true,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        scrollController: _scrollController,
        controller: _easyRefreshController,
        onRefresh: () async {
          Future.delayed(const Duration(milliseconds: 0), () async {});
          _page = 1;
          recommendedList =
              await CustomerFunc.getCustomerList(page: _page, size: _size);
          setState(() {});
        },
        onLoad: () async {
          _page++;
          var baseList = await apiClient.requestList(API.customer.customerLists,
              data: {'page': _page, 'size': _size});
          if (baseList.nullSafetyTotal < recommendedList.length) {
            recommendedList.addAll(baseList.nullSafetyList
                .map((e) => CustomerListModel.fromJson(e))
                .toList());
          } else {
            _easyRefreshController.finishLoad(noMore: true);
          }
          setState(() {});
        },
       slivers: [
         SliverAppBar(
           primary: false,
           floating: false,
           //固定顶部
           pinned: true,
           snap: false,
           elevation: 0,
           expandedHeight: 700.w,
           leadingWidth: 0,
           titleSpacing: 0,
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
                       color: Colors.black,
                     ),
                   ),
                   200.wb,
                   Text(
                     '我的推荐码',
                     style:
                     TextStyle(fontSize: 36.sp, color: Colors.black),
                   ),
                 ],
               )),
           //左侧标题
           leading: const SizedBox(),
           //collapsedHeight: kToolbarHeight,
           backgroundColor:
           headerWhite ? Colors.white : const Color(0xFFF6F6F6),
           flexibleSpace: FlexibleSpaceBar(
             titlePadding: EdgeInsets.zero,
             background: Container(
               alignment: Alignment.center,
               child: _flexibleSpace(),
             ),
           ),
           bottom: PreferredSize(
             preferredSize: Size.fromHeight(
                 kToolbarHeight + MediaQuery.of(context).padding.top),
             child: Container(
                 width: double.infinity,
                 height: 140.w,
                 color: bgColor,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       height: 70.w,
                       width: double.infinity,
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
                     16.hb,
                     // 24.hb,
                     Padding(
                       padding: EdgeInsets.only(left: 32.w),
                       child: Text(
                         '共找到${recommendedList.length}条信息',
                         style: Theme.of(context)
                             .textTheme
                             .subtitle2
                             ?.copyWith(color: const Color(0xFF999999)),
                       ),
                     ),
                   ],
                 )),
           ),
         ),
         SliverList(
           delegate: SliverChildBuilderDelegate(
                 (BuildContext context, int index) {
               return _getRecommended(recommendedList[index]);
             },
             childCount: recommendedList.length,
           ),
         ),
       ],
      ),
      bottomSheet: Container(
        height: 120.w,
        padding: EdgeInsets.only(bottom: 50.w),
        child: CloudBottomButton(
          onTap: () {
            Get.to(() => const ShareDetailCustomerWidget());
          },
          text: '我的邀请码',
        ),
      ),
    );
  }

  ///客户信息
  _getRecommended(CustomerListModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      margin: EdgeInsets.only(bottom: 20.w),
      child: GestureDetector(
        onTap: () async {
          if (model.isImportant != 1) {
            bool success = await CustomerFunc.setImportant(model.id);
            if (success) {
              CloudToast.show('设置成功');
              _easyRefreshController.callRefresh();
              setState(() {});
            }
          }
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              color: kForeGroundColor),
          child: Stack(
            children: [
              Positioned(
                right: model.isImportant == 1 ? 0 : 32.w,
                top: model.isImportant == 1 ? 0 : 28.w,
                child: model.isImportant == 1
                    ? Image.asset(
                        Assets.images.importantUser.path,
                        width: 130.w,
                        fit: BoxFit.fitWidth,
                      )
                    : Text(
                        '设为重要',
                        style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize24),
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
                        model.gender == 0
                            ? Assets.icons.icUserWoman.path
                            : Assets.icons.icUser.path,
                        width: 32.w,
                        height: 32.w,
                      ),
                      5.wb,
                      Text(
                        model.nickname,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.hb,
                          _getText('最近跟进', model.trailContent),
                          16.hb,
                          _getText(
                            '跟进时间',
                            DateUtil.formatDateMs(
                                model.trailCreatedAt.toInt() * 1000,
                                format: 'yyyy-MM-dd HH:mm:ss'),
                          ),
                          16.hb,
                          _getText('联系方式', model.mobile),
                          16.hb,
                          _getText(
                              '销售', UserTool.userProvider.userInfo.nickname),
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
    );
  }

//图片叠加
  _flexibleSpace() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 150.w),
      height: 700.w,
      child: Image.asset(Assets.images.shareFirstFigure.path, fit: BoxFit.fill),
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

  @override
  bool get wantKeepAlive => true;
}
