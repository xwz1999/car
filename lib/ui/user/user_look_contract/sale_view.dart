import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/contract/consignment_list_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/net_work/inner_model/base_list_model.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../constants/enums.dart';
import '../../../utils/user_tool.dart';
import '../../../widget/choose_widget.dart';
import '../../../widget/no_data_widget.dart';
import '../../notice/examination_details.dart';

class SaleView extends StatefulWidget {
  final EasyRefreshController refreshController;
  final List<ConsignmentListModel> saleList;
  final int status;

  const SaleView({
    super.key,
    required this.refreshController,
    required this.saleList,
    required this.status
  });

  @override
  State<SaleView> createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView>
    with AutomaticKeepAliveClientMixin {
  int _page = 1;
  final int _size = 10;
  late ContractStatus _releaseCarStatus;

  @override
  void initState() {
    _releaseCarStatus = ContractStatus.all;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight + 50.w,
        ),
        ChooseWidget(
          carState: true,
          callBack: (index) {
            _releaseCarStatus = ContractStatus.values[index];
            widget.refreshController.callRefresh();
            setState(() {});
          },
          items: ContractStatus.values.map((e) => e.typeStr).toList(),
          item: _releaseCarStatus.typeStr,
        ),
        Expanded(child:
        widget.status == 1 &&
            UserTool.userProvider.userInfo.business.roleEM !=
                Role.manager &&
                UserTool.userProvider.userInfo.business.roleEM !=
                    Role.settlers
            ?const NoDataWidget(
          text: '权限不足',
          paddingTop: 0,
        )
            :EasyRefresh.custom(
            firstRefresh: true,
            controller: widget.refreshController,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            onRefresh: () async {
              _page = 1;
              // var list = await CarFunc.getSaleDealer(page: _page, size: _size);
              if (widget.status == 0) {
                var list = await CarFunc.getSaleList(page: _page,
                    size: _size,
                    status: _releaseCarStatus.typeNum);
                widget.saleList.clear();
                widget.saleList.addAll(list);
              } else {
                var list = await CarFunc.getSaleDealer(page: _page,
                    size: _size,
                    status:    _releaseCarStatus.typeNum);
                widget.saleList.clear();
                widget.saleList.addAll(list);
              }
              setState(() {});
            },
            onLoad: () async {
              _page++;
              BaseListModel baseList;
              if (widget.status == 0) {
                baseList = await apiClient.requestList(API.contract.soldList,
                    data: {'size': _size, 'page': _page});
              } else {
                baseList = await apiClient.requestList(API.contract.dealerSale,
                    data: {'size': _size, 'page': _page});
              }

              if (baseList.nullSafetyTotal > widget.saleList.length) {
                widget.saleList.addAll(baseList.nullSafetyList
                    .map((e) => ConsignmentListModel.fromJson(e))
                    .toList());
              } else {
                widget.refreshController.finishLoad(noMore: true);
              }
              setState(() {});
            },
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    var model = widget.saleList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() =>
                            ExaminationDetails(
                              auditState:
                              ContractStatus.getValue(model.status).typeNum,
                              modelId: model.id, status: widget.status, url: model.essFileUrl,
                            ));
                        // print("这是数据");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 24.w),
                        child: _getCard(
                          model.status,
                          '出售合同（${model.contractSn}）',
                          model.modelName,
                          model.customerName,
                          model.status != 1
                              ? '/'
                              : DateUtil.formatDateMs(model.createdAt.toInt() *
                              1000,
                              format: 'yyyy-MM-dd'),
                        ),
                      ),
                    );
                  }, childCount: widget.saleList.length))
            ]))
      ],
    )
    ;
  }

  _getCard(int int, String title, String car, String name, String time) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
      child: Stack(children: [
        Align(
          child: SizedBox(
              width: 686.w,
              height: 340.w,
              child: Image.asset(
                Assets.images.comsignmentBg.path,
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
                    )
                  ],
                ),
                30.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        '购车人',
                        style: TextStyle(
                            fontSize: BaseStyle.fontSize28,
                            color: BaseStyle.color666666),
                      ),
                    ),
                    Text(
                      name,
                      overflow: TextOverflow.clip,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
                    )
                  ],
                ),
                32.hb,
              ],
            )),
        Positioned(
            bottom: 32.w,
            right: 40.w,
            child: Image.asset(
              getUrl(int),
              fit: BoxFit.fill,
              width: 134.w,
              height: 134.w,
            ))
      ]),
    );
  }

  getUrl(int status) {
    switch (ContractStatus.getValue(status).typeNum) {
      case 1:
        return Assets.images.signed.path;
      case 2:
        return Assets.images.sign.path;
      case 3:
        return Assets.images.failure.path;
      case 4:
        return Assets.images.failure.path;
      case 5:
        return Assets.images.failure.path;
      case 6:
        return Assets.images.failure.path;
      case 11:
        return Assets.images.wait.path;
      case 12:
        return Assets.images.signed.path;
      case 13:
        return Assets.images.wait.path;
      default:
        return Assets.images.signed.path;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
