import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../../home/search_page.dart';

class ConsignmentContract extends StatefulWidget {
  const ConsignmentContract({Key? key}) : super(key: key);

  @override
  State<ConsignmentContract> createState() => _ConsignmentContractState();
}

class _ConsignmentContractState extends State<ConsignmentContract>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 88.w,
          backgroundColor: kForeGroundColor,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: PreferredSize(
              preferredSize: Size.fromHeight(1.w),
              child: SizedBox(
                child: TabBar(
                    // indicator:
                    //     BoxDecoration(borderRadius: BorderRadius.circular(4.w)),
                    indicatorColor: const Color(0xFF027AFF),
                    indicatorPadding: EdgeInsets.only(top: 16.w),
                    //indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    controller: _tabController,
                    tabs: [_tab(0, '寄卖合同'), _tab(1, '售车合同')]),
              )),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const SearchPage());
              },
              child: Image.asset(Assets.icons.mainSearch.path,
                  height: 48.w, width: 48.w),
            ),
          ],
        ),
        backgroundColor: BodyColor,
        //extendBody: true,
        extendBodyBehindAppBar: true,
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 96.w),
              child: Column(children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 32.w)),
                _getCard(true, '寄卖合同（89276531625）', '大众朗逸启航 2019款 1.5L 自动风…',
                    '都珍', '/'),
                _getCard(false, '寄卖合同（89276531625）', '奥迪A6L 2021款 40 TFSI 豪华版',
                    '贺祥', '2021-10-12')
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 96.w),
              child: Column(children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 32.w)),
                _getCard(true, '售车合同（89276531625）', '大众朗逸启航 2019款 1.5L 自动风…',
                    '莉丝', '/'),
                _getCard(false, '售车合同（89276531625）', '大众朗逸启航 2019款 1.5L 自动',
                    '龚会彩', '2021-12-22')
              ]),
            ),
          ],
        ));
  }

  _tab(int int, String string) {
    return Text(
      string,
      style: TextStyle(
          fontSize: BaseStyle.fontSize28, color: BaseStyle.color111111),
    );
  }

  _getCard(bool int, String title, String car, String name, String time) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
      child: Stack(children: [
        Align(
          child: SizedBox(
              width: 686.w,
              height: 340.w,
              child: Image.asset(
                int
                    ? Assets.images.nosignedBg.path
                    : Assets.images.signedBg.path,
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
            top: 40.w,
            left: 32.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.hb,
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                30.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        '交易车辆',
                        style: TextStyle(
                            fontSize: BaseStyle.fontSize28,
                            color: BaseStyle.color666666),
                      ),
                    ),
                    Text(
                      car,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                30.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        '寄卖人',
                        style: TextStyle(
                            fontSize: BaseStyle.fontSize28,
                            color: BaseStyle.color666666),
                      ),
                    ),
                    Text(
                      name,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                30.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        '签订日期',
                        style: TextStyle(
                            fontSize: BaseStyle.fontSize28,
                            color: BaseStyle.color666666),
                      ),
                    ),
                    Text(
                      time,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                32.hb,
              ],
            ))
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
