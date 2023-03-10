import 'package:cloud_car/model/contract/consignment_list_model.dart';
import 'package:cloud_car/ui/user/user_look_contract/comsignment_view.dart';
import 'package:cloud_car/ui/user/user_look_contract/sale_view.dart';
import 'package:cloud_car/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../utils/headers.dart';

class ConsignmentContractPage extends StatefulWidget {
  const ConsignmentContractPage({super.key});

  @override
  State<ConsignmentContractPage> createState() =>
      _ConsignmentContractPageState();
}

class _ConsignmentContractPageState extends State<ConsignmentContractPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;
  late EasyRefreshController _refreshController;
  final EasyRefreshController _consignmentRefreshController =
      EasyRefreshController();
  final EasyRefreshController _saleRefreshController = EasyRefreshController();
  final List<ConsignmentListModel> _consignmentList = [];

  final List<ConsignmentListModel> _saleList = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _consignmentRefreshController.dispose();
    _saleRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        // appBar: AppBar(
        // )
        // AppBar(
        //   toolbarHeight: 88.w,
        //   backgroundColor: kForeGroundColor,
        //   leading: const CloudBackButton(
        //     isSpecial: true,
        //   ),
        //   title: PreferredSize(
        //       preferredSize: Size.fromHeight(1.w),
        //       child: SizedBox(
        //         child:
        // TabBar(
        //             // indicator:
        //             //     BoxDecoration(borderRadius: BorderRadius.circular(4.w)),
        //             indicatorColor: const Color(0xFF027AFF),
        //             indicatorPadding: EdgeInsets.only(top: 16.w),
        //             //indicatorWeight: 3,
        //             indicatorSize: TabBarIndicatorSize.label,
        //             isScrollable: true,
        //             controller: _tabController,
        //             tabs: [_tab(0, '????????????'), _tab(1, '????????????')]),
        //       )),
        //   actions: [
        //     GestureDetector(
        //       onTap: () {
        //         Get.to(() => const SearchPage());
        //       },
        //       child: Image.asset(Assets.icons.mainSearch.path,
        //           height: 48.w, width: 48.w),
        //     ),
        //   ],
        // ),
        backgroundColor: bodyColor,
        //extendBody: true,
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            SearchBarWidget(
              callback: (String text) {
                //sortModel.value.name = text;
                _refreshController.callRefresh();
                setState(() {});
              },
              tips: '?????????????????????',
              title: Container(
                alignment: Alignment.center,
                child: TabBar(
                    // indicator:
                    //     BoxDecoration(borderRadius: BorderRadius.circular(4.w)),
                    indicatorColor: const Color(0xFF027AFF),
                    indicatorPadding: EdgeInsets.only(top: 16.w),
                    //indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    controller: _tabController,
                    tabs: [_tab(0, '????????????'), _tab(1, '????????????')]),
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                ConsignmentView(
                  consignmentList: _consignmentList,
                  refreshController: _consignmentRefreshController,
                ),
                SaleView(
                  saleList: _saleList,
                  refreshController: _saleRefreshController,
                ),
              ],
            ))
          ],
        ));
  }

  // _getList(
  //     EasyRefreshController easyRefreshController, ConsignmentListModel model) {
  //   return Expanded(
  //       child: EasyRefresh(
  //     header: MaterialHeader(),
  //     footer: MaterialFooter(),
  //     firstRefresh: true,
  //     controller: easyRefreshController,
  //     child: ListView.builder(itemBuilder: (context, index) {
  //       return Container(
  //         padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 96.w),
  //         child: Column(children: [
  //           Padding(padding: EdgeInsets.symmetric(vertical: 32.w)),
  //           _getCard(true, '???????????????${model.contractSn}???',
  //               '?????????????????? 2019??? 1.5L ????????????', '??????', '/'),
  //           _getCard(false, '???????????????89276531625???', '??????A6L 2021??? 40 TFSI ?????????',
  //               '??????', '2021-10-12')
  //         ]),
  //       );
  //     }),
  //   ));
  // }

  _tab(int int, String string) {
    return Text(
      string,
      style: TextStyle(
          fontSize: BaseStyle.fontSize28, color: BaseStyle.color111111),
    );
  }

  // _getCard(bool int, String title, String car, String name, String time) {
  //   return Card(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
  //     child: Stack(children: [
  //       Align(
  //         child: SizedBox(
  //             width: 686.w,
  //             height: 340.w,
  //             child: Image.asset(
  //               int
  //                   ? Assets.images.nosignedBg.path
  //                   : Assets.images.signedBg.path,
  //               fit: BoxFit.fill,
  //             )),
  //       ),
  //       Positioned(
  //           top: 40.w,
  //           left: 32.w,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               12.hb,
  //               Padding(
  //                 padding: EdgeInsets.only(left: 0.w),
  //                 child: Text(
  //                   title,
  //                   style: Theme.of(context).textTheme.subtitle1,
  //                 ),
  //               ),
  //               30.hb,
  //               Row(
  //                 children: [
  //                   SizedBox(
  //                     width: 160.w,
  //                     child: Text(
  //                       '????????????',
  //                       style: TextStyle(
  //                           fontSize: BaseStyle.fontSize28,
  //                           color: BaseStyle.color666666),
  //                     ),
  //                   ),
  //                   Text(
  //                     car,
  //                     overflow: TextOverflow.clip,
  //                     maxLines: 2,
  //                     style: Theme.of(context).textTheme.subtitle2,
  //                   )
  //                 ],
  //               ),
  //               30.hb,
  //               Row(
  //                 children: [
  //                   SizedBox(
  //                     width: 160.w,
  //                     child: Text(
  //                       '?????????',
  //                       style: TextStyle(
  //                           fontSize: BaseStyle.fontSize28,
  //                           color: BaseStyle.color666666),
  //                     ),
  //                   ),
  //                   Text(
  //                     name,
  //                     overflow: TextOverflow.clip,
  //                     style: Theme.of(context).textTheme.subtitle2,
  //                   )
  //                 ],
  //               ),
  //               30.hb,
  //               Row(
  //                 children: [
  //                   SizedBox(
  //                     width: 160.w,
  //                     child: Text(
  //                       '????????????',
  //                       style: TextStyle(
  //                           fontSize: BaseStyle.fontSize28,
  //                           color: BaseStyle.color666666),
  //                     ),
  //                   ),
  //                   Text(
  //                     time,
  //                     overflow: TextOverflow.clip,
  //                     style: Theme.of(context).textTheme.subtitle2,
  //                   )
  //                 ],
  //               ),
  //               32.hb,
  //             ],
  //           ))
  //     ]),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}
