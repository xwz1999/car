import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/split_account/split_account_info_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_avatar_widget.dart';
import 'package:cloud_car/widget/cloud_bordered_text_field_widget.dart';
import 'package:cloud_car/widget/cloud_dialog_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfitStatisticsPage extends StatefulWidget {
  final int accountId;

  const ProfitStatisticsPage(
  {super.key, required this.accountId});

  @override
  _ProfitStatisticsPageState createState() => _ProfitStatisticsPageState();
}

class _ProfitStatisticsPageState extends State<ProfitStatisticsPage> {

  bool _onLoad = true;
  int _currentDateIndex = 0;
  List<DateBillItem> dateBills = [
    DateBillItem(bills: [BillItem(createAt: 1666580408, amount: '50000', brokerName: 'cc', name: '卖车', symbol: false),
      BillItem(createAt: 1666580408, amount: '50000', brokerName: 'cc', name: '卖车', symbol: false)], date: '2022-12')
  ];

  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return CloudScaffold.normal(
      barHeight: 88.w,
      extendBody: true,
      appbar: PreferredSize(
        preferredSize: Size.fromHeight(176.w),
        child:  AppBar(
          backgroundColor:Colors.transparent ,
          leading: const CloudBackButton(color: Colors.white,),
          title: Text(
            '利润统计',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp),
          ),
        ),
      ),
      body: Stack(
        children: [
          Assets.images.splitBarBotttom.image(),
          EasyRefresh(
              firstRefresh: true,
              controller: _easyRefreshController,
              onRefresh: () async {
                var res = await apiClient.request(API.split.info,
                    data: {'accountId': widget.accountId});
                if (res.code == 0) {
                  //_infoModel = SplitAccountInfoModel.fromJson(res.data);
                  _onLoad = false;
                  setState(() {});
                }
              },
              header: MaterialHeader(),
              child: !_onLoad
                  ? const SizedBox.shrink()
                  : ListView(
                children: [
                  214.hb,
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 686.w,
                          color: Colors.white,
                          child: Column(
                            children: [
                              48.hb,
                              '￥'
                                  .richText
                                  .withTextSpanChildren([
                                '10005000'.textSpan.size(48.sp).color(const Color(0xFFFF3b02)).make(),
                              ])
                                  .size(28.sp)
                                  .color(const Color(0xFFFF3b02))
                                  .make(),
                              20.hb,
                              '售车利润总计'
                                  .text
                                  .size(28.sp).bold
                                  .color(const Color(0xFF333333))
                                  .make(),
                              48.hb,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 686.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomCenter,
                              image: AssetImage(
                                  Assets.images.sawtooth.path))),
                    ),
                  ),

                  _billTile(dateBills[_currentDateIndex])
                ],
              )),
          Assets.images.splitBarAbove.image(),
        ],
      ),
    );
  }


  Widget _billTile(DateBillItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            32.wb,
            item.date.text.size(32.sp).color(Colors.black).bold.make(),
            PopupMenuButton(
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                  color: Colors.black12,
                ),
                iconSize: 36.w,
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                  return dateBills
                      .mapIndexed((e, index) => PopupMenuItem(
                      onTap: () {
                        _currentDateIndex = index;
                        setState(() {});
                      },
                      child: e.date.text.isIntrinsic.make()))
                      .toList();
                })
          ],
        ),

        Container(
          width: 686.w,
          color: Colors.white,
          child: Column(children: [
            ...ListTile.divideTiles(
                context: context,
                tiles: item.bills
                    .map((e) => ListTile(
                  title: e.name.text.make(),
                  subtitle:
                  DateUtil.formatDateMs(e.createAt * 1000)
                      .text
                      .make(),
                  trailing: '${'+' }¥ '
                      .richText
                      .withTextSpanChildren([
                    e.amount.textSpan
                        .size(32.sp)
                        .color(e.symbol
                        ? Colors.red
                        : Colors.black87)
                        .make()
                  ])
                      .size(24.sp)
                      .color(e.symbol ? Colors.red : Colors.black87)
                      .make(),
                ))
                    .toList())
                .toList(),
            // (260.w + MediaQuery.of(context).padding.bottom).hb
          ]),
        ),
      ],
    );
  }



}
