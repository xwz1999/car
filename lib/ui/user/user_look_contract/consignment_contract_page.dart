import 'package:cloud_car/model/contract/consignment_list_model.dart';
import 'package:cloud_car/ui/user/user_look_contract/comsignment_view.dart';
import 'package:cloud_car/ui/user/user_look_contract/purchase_contract_page.dart';
import 'package:cloud_car/ui/user/user_look_contract/sale_view.dart';
import 'package:cloud_car/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../constants/enums.dart';
import '../../../model/contract/consignment_model.dart';
import '../../../utils/headers.dart';
import '../../../utils/title_drop_widget.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/choose_widget.dart';
import '../../../widget/screen_widget.dart';
import '../../../widget/sort_widget.dart';

enum ConsignmentType {
  consignment(1, '寄卖合同'),
  sellCars(2, '售车合同'),
  collectCar(3, '收车合同'),
  sellExamine(4, '售车审批'),
  collectExamine(5, '收购审批');

  final int typeNum;
  final String typeStr;

  static ConsignmentType getValue(int value) =>
      ConsignmentType.values.firstWhere((element) => element.typeNum == value);

  const ConsignmentType(this.typeNum, this.typeStr);
}

class ConsignmentContractPage extends StatefulWidget {
  const ConsignmentContractPage({super.key});

  @override
  State<ConsignmentContractPage> createState() =>
      _ConsignmentContractPageState();
}

class _ConsignmentContractPageState extends State<ConsignmentContractPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final EasyRefreshController _consignmentRefreshController =
      EasyRefreshController();
  final EasyRefreshController _saleRefreshController = EasyRefreshController();

  final EasyRefreshController _purchaseRefreshController =
      EasyRefreshController();

  final List<ConsignmentModel> _consignmentList = [];

  final List<ConsignmentListModel> _saleList = [];

  final List<ConsignmentListModel> _purchaseList = [
  ];

  ConsignmentType _currentType = ConsignmentType.consignment;
  TitleScreenControl screenControl = TitleScreenControl();
  List<ChooseItem> _sortList = [];

  @override
  void initState() {
    _sortList =
        ConsignmentType.values.map((e) => ChooseItem(name: e.typeStr)).toList();
    super.initState();
  }

  @override
  void dispose() {
    _consignmentRefreshController.dispose();
    _saleRefreshController.dispose();
    _purchaseRefreshController.dispose();
    super.dispose();
  }

  List<Widget> get listWidget => [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
              color: kForeGroundColor),
          clipBehavior: Clip.antiAlias,
          child: ScreenWidget(
            pickString: _currentType.typeStr,
            childAspectRatio: 200 / 56,
            callback: (String item, int value) {
              screenControl.screenHide();
              _currentType = ConsignmentType.values[value];
              // _examinationRefreshController.callRefresh();
              if (mounted) {
                setState(() {});
              }
            },
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 24.w,
            crossAxisCount: 3,
            haveButton: true,
            itemList: _sortList,
          ),
        ),
      ];

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
        //             tabs: [_tab(0, '寄卖合同'), _tab(1, '售车合同')]),
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
        body: Builder(
          builder: (context) {
            return TitleDropDownWidget([_currentType.typeStr], listWidget,
                height: kToolbarHeight + MediaQuery.of(context).padding.top,
                bottomHeight: 30.w,
                screenControl: screenControl,
                headFontSize: 36.sp,
                isSearch: true,
                callback: (text) {
                  // _examinationRefreshController.callRefresh();
                  // switch (text) {
                  //   case '发布车辆':
                  //     _examinationRefreshController.callRefresh();
                  //     break;
                  //   case '修改记录':
                  //     _examinationRefreshController.callRefresh();
                  //     break;
                  //   case '我的审批':
                  //     _examinationRefreshController.callRefresh();
                  //     break;
                  // }
                  if (mounted) {
                    setState(() {});
                  }
                },
                leftWidget: const CloudBackButton(
                  isSpecial: true,
                ),
                // screen: '筛选',
                onTap: () {
                  screenControl.screenHide();
                  Scaffold.of(context).openEndDrawer();
                },
                child: _getCurrentPage());
            // SearchBarWidget(
            //   callback: (String text) {
            //     //sortModel.value.name = text;
            //     // _releaseCarStatus = ContractStatus.all;
            //     // _refreshController.callRefresh();
            //     setState(() {});
            //   },
            //   tips: '请输入客户名称',
            //   title: Container(
            //     alignment: Alignment.center,
            //     child: TabBar(
            //         // indicator:
            //         //     BoxDecoration(borderRadius: BorderRadius.circular(4.w)),
            //         indicatorColor: const Color(0xFF027AFF),
            //         indicatorPadding: EdgeInsets.only(top: 16.w),
            //         //indicatorWeight: 3,
            //         indicatorSize: TabBarIndicatorSize.label,
            //         isScrollable: true,
            //         controller: _tabController,
            //         tabs: [_tab(0, '寄卖合同'), _tab(1, '售车合同'), _tab(1, '收车合同')]),
            //   ),
            // ),
            // ChooseWidget(
            //   carState: true,
            //   callBack: (index) {
            //     if (_tabController.index == 0) {
            //       _consignmentRefreshController.callRefresh();
            //     } else if (_tabController.index == 1) {
            //       _saleRefreshController.callRefresh();
            //     } else {
            //       _purchaseRefreshController.callRefresh();
            //     }
            //     _releaseCarStatus = ContractStatus.values[index];
            //     // _examinationRefreshController.callRefresh();
            //     setState(() {});
            //   },
            //   items: ContractStatus.values.map((e) => e.typeStr).toList(),
            //   item: _releaseCarStatus.typeStr,
            // ),
            // Expanded(
            //     child: TabBarView(
            //   controller: _tabController,
            //   children: [
            //     ConsignmentView(
            //       consignmentList: _consignmentList,
            //       refreshController: _consignmentRefreshController,
            //     ),
            //     SaleView(
            //       saleList: _saleList,
            //       refreshController: _saleRefreshController,
            //     ),
            //     PurchaseContractPage(
            //       saleList: _purchaseList,
            //       refreshController: _purchaseRefreshController,
            //     ),
            //   ],
            // ))
          },
        ));
  }

  _getCurrentPage() {
    switch (_currentType) {
      case ConsignmentType.sellCars:
        return SaleView(
          status: 0,
          saleList: _saleList,
          refreshController: _saleRefreshController,
        );

      case ConsignmentType.consignment:
        return ConsignmentView(
          consignmentList: _consignmentList,
          refreshController: _consignmentRefreshController,
        );
      case ConsignmentType.collectCar:
        return PurchaseContractPage(
          status: 0,
          purchaseList: _purchaseList,
          refreshController: _purchaseRefreshController,
        );
      case ConsignmentType.sellExamine:
        return SaleView(
          status: 1,
          saleList: _saleList,
          refreshController: _saleRefreshController,
        );
      case ConsignmentType.collectExamine:
        return PurchaseContractPage(
          status: 1,
          purchaseList: _purchaseList,
          refreshController: _purchaseRefreshController,
        );
    }
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
  //           _getCard(true, '寄卖合同（${model.contractSn}）',
  //               '大众朗逸启航 2019款 1.5L 自动风…', '都珍', '/'),
  //           _getCard(false, '寄卖合同（89276531625）', '奥迪A6L 2021款 40 TFSI 豪华版',
  //               '贺祥', '2021-10-12')
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
  //                       '交易车辆',
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
  //                       '寄卖人',
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
  //                       '签订日期',
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
