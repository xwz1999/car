import 'package:cloud_car/ui/notice/publish_info_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../constants/api/api.dart';
import '../../constants/enums.dart';
import '../../model/car/car_list_model.dart';
import '../../model/car/economic_release_model.dart';
import '../../widget/choose_widget.dart';
import '../../widget/cloud_image_network_widget.dart';

import '../../widget/no_data_widget.dart';
import '../home/func/car_func.dart';

class ExaminationListPage extends StatefulWidget {
  final EasyRefreshController refreshController;
  final int index;
  final int type;

  // final List<EconomicReleaseModel> releaseList;

  // final int id;
  const ExaminationListPage({
    super.key,
    required this.index,
    this.type = 0,
    required this.refreshController,
    // required this.releaseList,
    //required this.id
  });

  @override
  State<ExaminationListPage> createState() => _ExaminationListPageState();
}

class _ExaminationListPageState extends State<ExaminationListPage>
    with AutomaticKeepAliveClientMixin {
  // final ScreenshotController _screenshotController = ScreenshotController();

  List<EconomicReleaseModel> releaseList = [];
  late List<CarListModel> carInfoModel;
  late Audit _releaseCarStatus;
int index=0;
  //bool _onload = true;
  int _page = 1;
  final int _size = 10;

  @override
  void initState() {
    _releaseCarStatus = Audit.values[widget.type];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight + 50.w,
        ),
        ChooseWidget(
          carState: true,
          callBack: (index) {
            _releaseCarStatus = Audit.values[index];
            widget.refreshController.callRefresh();
            setState(() {});
          },
          items: Audit.values.map((e) => e.typeStr).toList(),
          item: _releaseCarStatus.typeStr,
        ),
        Expanded(
            child: widget.index == 2 &&
                    (UserTool.userProvider.userInfo.business.roleEM ==
                            Role.carService ||
                        UserTool.userProvider.userInfo.business.roleEM ==
                            Role.salesTraffic)
                ? const NoDataWidget(
                    text: '权限不足',
                    paddingTop: 0,
                  )
                : EasyRefresh.custom(
                    firstRefresh: true,
                    controller: widget.refreshController,
                    header: MaterialHeader(),
                    footer: MaterialFooter(),
                    onRefresh: () async {

                      if(index!=widget.index){
                        _releaseCarStatus=Audit.values[0];
                      }
                      index=widget.index;
                      _page = 1;
                      // print(widget.index);
                      if (widget.index == 0) {
                        releaseList = await CarFunc.getPubLists(
                            page: _page, status: _releaseCarStatus.typeNum);
                        // var list = await CarFunc.getPubLists(page: _page);
                        // widget.releaseList.clear();
                        // widget.releaseList.addAll(list);
                      } else if (widget.index == 2) {
                        releaseList = await CarFunc.getEconomicPubLists(
                            page: _page, status: _releaseCarStatus.typeNum);
                        // var list = await CarFunc.getEconomicPubLists(page: _page);
                        // widget.releaseList.clear();
                        // widget.releaseList.addAll(list);
                      } else {
                        releaseList = await CarFunc.getPubLists(page: _page);
                      }
                      // widget.releaseList.clear();
                      // widget.releaseList=list;
                      //_onload = false;
                      setState(() {});
                    },
                    onLoad: () async {
                      _page++;
                      BaseListModel baseList;
                      if (UserTool.userProvider.userInfo.business.roleEM ==
                              Role.salesTraffic ||
                          UserTool.userProvider.userInfo.business.roleEM ==
                              Role.carService) {
                        baseList = await apiClient.requestList(
                            API.order.pubLists,
                            data: {'size': _size, 'page': _page});
                      } else {
                        baseList = await apiClient.requestList(
                            API.order.dealerPubLists,
                            data: {'size': _size, 'page': _page});
                      }
                      if (baseList.nullSafetyTotal > releaseList.length) {
                        releaseList.addAll(baseList.nullSafetyList
                            .map((e) => EconomicReleaseModel.fromJson(e))
                            .toList());
                      } else {
                        widget.refreshController.finishLoad(noMore: true);
                      }
                      setState(() {});
                    },
                    slivers: [
                        // SliverToBoxAdapter(
                        //   child: 10.hb,
                        // ),
                        // releaseList.isEmpty
                        //     ? const NoDataWidget(
                        //         text: '暂无发布信息',
                        //         paddingTop: 0,
                        //       )
                        //     :
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          var model = releaseList[index];
                          return GestureDetector(
                            onTap: () async {
                              // core.download(url, options);
                              // var docPath=await getApplicationDocumentsDirectory();
                              // String _localPath='${docPath.path}${Platform.pathSeparator}download';
                              // final savedDir=Directory(_localPath);
                              // var response=await Dio().download('contract/20221215/云云问车车辆寄卖服务协议yDRTvUUgyg308s36UyFlheyREaFYxjbJ.PDF', '');///下载pdf
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 4.w),
                              child: _getCard(
                                  model.status,
                                  model.mainPhoto,
                                  model.modelName,
                                  model.createdAt,
                                  model.mileage,
                                  model.id
                                  //model.
                                  ),
                            ),
                          );
                        }, childCount: releaseList.length))
                      ]))
      ],
    );
  }

  _getCard(int status, String carUrl, String carName, num carTime,
      String carMileage, int carId) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          child: GestureDetector(
            onTap: () async {
              carInfoModel = await CarFunc.getCarList(1, 10);
              Get.to(() => PublishInfoPage(
                    index: widget.index,
                    carId: carId,
                  ));
              // Get.to(() => DealerConsignmentSigned(
              //       status: model.statusEnum,
              //       price: model.price,
              //       id: model.id,
              //
              //       auditStatus: model.auditStatus,
              //       //stat: '审核中',
              //     ));

              //   case 0:
              //     Get.to(() => const DealerConsignmentRejected());
              //     break;
              // }
            },
            child: Container(
                padding: EdgeInsets.only(left: 32.w, top: 24.w),
                decoration: BoxDecoration(
                    color: kForeGroundColor,
                    borderRadius: BorderRadius.circular(16.w)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.w),
                      child: _getText(status),
                    ),
                    // 24.hb,
                    Row(
                      children: [
                        SizedBox(
                          width: 196.w,
                          height: 150.w,
                          child: CloudImageNetworkWidget.car(
                            urls: [carUrl],
                          ),
                        ),
                        20.wb,
                        SizedBox(
                          width: 400.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(carName,
                                  style: TextStyle(
                                      fontSize: BaseStyle.fontSize28,
                                      color: BaseStyle.color111111)),
                              32.hb,
                              Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: getText(
                                    DateUtil.formatDateMs(
                                        carTime.toInt() * 1000,
                                        format: 'yyyy年MM月'),
                                    '$carMileage万公里'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    32.hb,
                  ],
                )),
          ),
        ));
  }

  getText(String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            time,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            distance,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        )
        // Padding(padding: EdgeInsets.symmetric(horizontal: 24.w)),
        // Chip(
        //   label: Text(num),
        //   labelPadding: EdgeInsets.only(left: 8.w, top: 8.w),
        //   backgroundColor: const Color(0xFF027AFF).withOpacity(0.08),
        //   labelStyle: TextStyle(
        //       fontSize: BaseStyle.fontSize20, color: const Color(0xFF027AFF)),
        //   shape:
        //       BeveledRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        // ),
        // ChipTheme(
        //     data: ChipThemeData(
        //       backgroundColor: const Color(0xFF4F5A74).withOpacity(0.08),
        //       labelStyle: TextStyle(
        //           fontSize: BaseStyle.fontSize20,
        //           color: const Color(0xFF4F5A74)),
        //       shape: BeveledRectangleBorder(
        //           borderRadius: BorderRadius.circular(4.w)),
        //       labelPadding: EdgeInsets.only(left: 8.w, top: 8.w),
        //     ),
        //     child: Wrap(
        //       children: [Chip(label: Text(time)), Chip(label: Text(distance))],
        //     ))
      ],
    );
  }

  _getText(int status) {
    return Text(
      Audit.getValueAuditId(status).typeStr,
      style: TextStyle(
        fontSize: 28.sp,
        color: getColor(Audit.getValueAuditId(status).typeNum),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Color getColor(int status) {
    switch (status) {
      case 1:
        return const Color(0xFFFE8029);
      case 2:
        return const Color(0xFF027AFF);
      case 3:
        return const Color(0xFFFF3B02);
      default:
        return const Color(0xFFFE8029);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
