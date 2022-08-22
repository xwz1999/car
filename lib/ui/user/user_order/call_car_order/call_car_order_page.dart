import 'package:cloud_car/model/order/callcarlist_model.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_order/status.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/widget/car_widget.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../../constants/api/api.dart';

class CallCarOrderPage extends StatefulWidget {
  final VoidCallback callBack;

  const CallCarOrderPage({
    super.key,
    required this.callBack,
  });

  @override
  State<CallCarOrderPage> createState() => _CallCarOrderPageState();
}

class _CallCarOrderPageState extends State<CallCarOrderPage> {
  List<Widget> listWidget = []; //创建方法列表
  List<CallcarlistModel> callCarList = [];
  int _page = 1;
  final int _size = 10;
  bool _onLoad = true;
  final List<ChooseItem> _sortList = [];

  CallCarSearchStatus _currentStatus = CallCarSearchStatus.all;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  Map<String, dynamic> get _params => {
        'page': _page,
        'size': _size,
        'status': _currentStatus.typeNum,
      };

  @override
  void initState() {
    super.initState();
    listWidget = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
            color: kForeGroundColor),
        clipBehavior: Clip.antiAlias,
        child: ScreenWidget(
          pickString: '',
          childAspectRatio: 200 / 56,
          callback: (String item, int value) {
            setState(() {});
          },
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 24.w,
          crossAxisCount: 3,
          itemList: _sortList,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.callBack,
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight + 50.w,
            ),
            SizedBox(
              height: 88.w,
              child: CarWidget(
                items: CallCarStatus.values.map((e) => e.typeStr).toList(),
                callBack: (index) {
                  _currentStatus = CallCarSearchStatus.values[index];
                  setState(() {});
                },
              ),
            ),
            16.hb,
            Expanded(
                child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              controller: _easyRefreshController,
              onLoad: () async {
                _page++;
                var baseList = await apiClient.requestList(API.order.callCar,
                    data: _params);
                if (baseList.nullSafetyTotal > callCarList.length) {
                  callCarList.addAll(baseList.nullSafetyList
                      .map((e) => CallcarlistModel.fromJson(e))
                      .toList());
                } else {
                  _easyRefreshController.finishLoad(noMore: true);
                }
                setState(() {});
              },
              onRefresh: () async {
                _page = 1;
                callCarList = await OrderFunc.getCallCar(data: _params);

                _onLoad = false;
                setState(() {});
              },
              child: _onLoad
                  ? const SizedBox()
                  : callCarList.isEmpty
                      ? const NoDataWidget(
                          text: '暂无相关订单信息',
                          paddingTop: 300,
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return _getCar(callCarList[index]);
                          },
                          itemCount: callCarList.length),
            )),
          ],
        ));
  }

  _getCar(CallcarlistModel model) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            margin: EdgeInsets.only(left: 32.w, right: 32.w, top: 16.w),
            decoration: BoxDecoration(
                color: kForeGroundColor,
                borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.statusEnum.typeStr,
                  style: TextStyle(
                      color: model.statusEnum.typeNum != 4
                          ? const Color(0xFF027AFF)
                          : const Color(0xFF666666),
                      fontSize: BaseStyle.fontSize28),
                ),
                // 24.hb,
                Row(
                  children: [
                    SizedBox(
                      width: 196.w,
                      height: 150.w,
                      child:
                          CloudImageNetworkWidget.car(urls: [model.mainPhoto]),
                    ),
                    20.wb,
                    SizedBox(
                      width: 406.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(model.modelName,
                              style: TextStyle(
                                  fontSize: BaseStyle.fontSize28,
                                  color: BaseStyle.color111111)),
                          32.hb,
                          Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: _getText(
                                '过户${model.transfer}次',
                                DateUtil.formatDateMs(
                                    model.licensingDate.toInt() * 1000,
                                    format: 'yyyy年MM月'),
                                '${model.mileage}万公里',
                                model.statusEnum.typeStr),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                40.hb,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '叫车总价',
                      style: TextStyle(
                          fontSize: BaseStyle.fontSize28,
                          color: BaseStyle.color999999),
                    ),
                    16.wb,
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '¥',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: model.amount,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ])),
                    56.wb,
                    Text(
                      model.statusEnum.typeNum == 4 ? '退款金额' : '已付金额',
                      style: TextStyle(
                          fontSize: BaseStyle.fontSize28,
                          color: BaseStyle.color999999),
                    ),
                    16.wb,
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '¥',
                          style: TextStyle(
                              color: model.statusEnum.typeNum == 4
                                  ? const Color(0xFF333333)
                                  : const Color(0xFFFF3B02),
                              fontSize: BaseStyle.fontSize24,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: model.statusEnum.typeNum == 1
                              ? '0.00'
                              : model.amount,
                          style: TextStyle(
                              color: model.statusEnum.typeNum == 4
                                  ? const Color(0xFF333333)
                                  : const Color(0xFFFF3B02),
                              fontSize: BaseStyle.fontSize28,
                              fontWeight: FontWeight.bold)),
                    ])),
                  ],
                ),
              ],
            )));
  }

  _getText(String num, String time, String distance, String conditions) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: conditions != '已退款'
                  ? const Color(0xFF027AFF).withOpacity(0.08)
                  : const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20,
                color: conditions != '已退款'
                    ? const Color(0xFF027AFF)
                    : const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
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
      ],
    );
  }
}
