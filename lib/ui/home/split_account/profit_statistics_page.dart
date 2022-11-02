import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/split_account/profit_statistics_model.dart';
import 'package:cloud_car/model/split_account/split_account_info_model.dart';
import 'package:cloud_car/model/split_account/split_account_list_model.dart';
import 'package:cloud_car/ui/home/split_account/split_func.dart';
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
  // List<DateBillItem> dateBills = [
  //   DateBillItem(bills: [BillItem(createAt: 1666580408, amount: '50000', brokerName: 'cc', name: '卖车', symbol: false),
  //     BillItem(createAt: 1666580408, amount: '50000', brokerName: 'cc', name: '卖车', symbol: false)], date: '2022-12')
  // ];

  int _page = 1;

  final int _limit = 10;

  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  ProfitStatisticsModel profitStatisticsModel = ProfitStatisticsModel.init;

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
                _page = 1;
                profitStatisticsModel =
                  await  SplitFunc.getProfit()??ProfitStatisticsModel.init;

                setState(() {});
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
                              30.hb,
                              '￥'
                                  .richText
                                  .withTextSpanChildren([
                               (num.parse(profitStatisticsModel.total).toStringAsFixed(2) ).textSpan.size(48.sp).color(const Color(0xFFFF3b02)).make(),
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
                              28.hb,
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
                  20.hb,
                  Container(
                    width: 686.w,
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: Colors.white,
                    ),

                    child: Column(children: [
                      ...profitStatisticsModel.profits.map((e) => ListTile(
                        title: e.name.text.make(),
                        subtitle:
                        DateUtil.formatDateMs(e.finishAt * 1000)
                            .text
                            .make(),
                        trailing: '${'+' }¥ '
                            .richText
                            .withTextSpanChildren([
                          num.parse( e.profit).toStringAsFixed(2).textSpan

                              .size(32.sp)
                              .color( Colors.black87)
                              .make()
                        ])
                            .size(24.sp)
                            .color(Colors.black87)
                            .make(),
                      )).toList()

                    ]),
                  ),
                  //_billTile(dateBills[_currentDateIndex])
                ],
              )),
          Assets.images.splitBarAbove.image(),
        ],
      ),
    );
  }


}
