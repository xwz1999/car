import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/contract/consignment_list_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SaleView extends StatefulWidget {
  final EasyRefreshController refreshController;
  final List<ConsignmentListModel> saleList;

  const SaleView({
    super.key,
    required this.refreshController,
    required this.saleList,
  });

  @override
  State<SaleView> createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView>
    with AutomaticKeepAliveClientMixin {
  int _page = 1;
  final int _size = 10;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh.custom(
        firstRefresh: true,
        controller: widget.refreshController,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          _page = 1;
          var list = await CarFunc.getSaleList(page: _page, size: _size);
          widget.saleList.clear();
          widget.saleList.addAll(list);
          setState(() {});
        },
        onLoad: () async {
          _page++;
          var baseList = await apiClient.requestList(
              API.contract.consignmentList,
              data: {'size': _size, 'page': _page});
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
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
                  child: _getCard(
                    model.status,
                    '???????????????${model.contractSn}???',
                    model.modelName,
                    model.customerName,
                    model.status != 1
                        ? '/'
                        : DateUtil.formatDateMs(model.signAt.toInt() * 1000,
                        format: 'yyyy-MM-dd'),
                  ),
                );
              }, childCount: widget.saleList.length))
        ]);
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
                int == 1
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
                        '????????????',
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
                        '?????????',
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
                        '????????????',
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
