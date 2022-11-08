import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/split_account/split_account_list_model.dart';
import 'package:cloud_car/ui/home/split_account/add_split_account_page.dart';
import 'package:cloud_car/ui/home/split_account/profit_statistics_page.dart';
import 'package:cloud_car/ui/home/split_account/split_info_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/widget/choose_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

enum SplitAccountStatus {
  inProgress(1,'进行中'),
  finish(2,'已完成');

final int typeNum;
final String typeStr;

static SplitAccountStatus getValue
(

int value
)
=>
SplitAccountStatus.values
    .firstWhere((
element) =>
element.typeNum == value);

const SplitAccountStatus(this
.
typeNum, this
.
typeStr);
}

class SplitAccountPage extends StatefulWidget {
  const SplitAccountPage

  ({super.key});

  @override
  _SplitAccountPageState createState() => _SplitAccountPageState();
}

class _SplitAccountPageState extends State<SplitAccountPage> {
  List<SplitAccountListModel> _models = [];
  int _page = 1;

  final int _limit = 10;

  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  SplitAccountStatus _currentStatus = SplitAccountStatus.inProgress;

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
      title: '收车合作',
      actions: [
        PopupMenuButton(
          itemBuilder: (ctx) {
            return [
              PopupMenuItem(
                value: ['1'],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset(
                    Assets.icons.icProfit.path, width: 48.w, height: 48.w,),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 10.w,left: 5.w),
                    child: Text("创建分账",
                      style: TextStyle(color: Colors.white, fontSize: 28.sp),),
                  )
                ],),
              ),
              PopupMenuItem(
                value: ['2'],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset(
                    Assets.icons.icLedger.path, width: 48.w, height: 48.w,),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 10.w,left: 5.w),
                    child: Text("利润统计",
                      style: TextStyle(color: Colors.white, fontSize: 28.sp),),
                  )
                ],),
              ),
            ];
          },
          color: const Color(0xFF404040),
          offset: const Offset(0, 40),
          enabled: true,
          child: Center(
              child:
              Padding(
                padding: EdgeInsets.only(right: 32.w),
                child: Icon(
                  CupertinoIcons.add,
                  size: 48.w,
                ),
              )
          ),
          onSelected: (List<String> value)async{
            print(value[0]);
            if(value[0]=='1'){
              await Get.to(() => const AddSplitAccountPage());
              _easyRefreshController.callRefresh();
            }else{
              Get.to(() => const ProfitStatisticsPage(accountId: 0,));
            }
          },// 内边距
        ),
      ],
      barHeight: 88.w,
      body: Column(
        children: [
          ChooseWidget(
              items: SplitAccountStatus.values.map((e) => e.typeStr).toList(),
              callBack: (index) {
                _currentStatus = SplitAccountStatus.getValue(index + 1);
                _easyRefreshController.callRefresh();
              },
              item: _currentStatus.typeStr),
          Container(
            color: Colors.black12,
            height: 2.w,
            width: double.infinity,
          ),
          Expanded(
            child: EasyRefresh(
              firstRefresh: true,
              controller: _easyRefreshController,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              onRefresh: () async {
                _page = 1;
                var baseList =
                await apiClient.requestList(API.split.list, data: {
                  'status': _currentStatus.typeNum,
                  'page': _page,
                  'limit': _limit,
                });
                if (baseList.code == 0) {
                  _models = baseList.nullSafetyList
                      .map((e) => SplitAccountListModel.fromJson(e))
                      .toList();
                }
                setState(() {});
              },
              onLoad: () async {
                _page++;
                var baseList =
                await apiClient.requestList(API.split.list, data: {
                  'status': _currentStatus.typeNum,
                  'page': _page,
                  'limit': _limit,
                });
                if (baseList.nullSafetyTotal > _models.length) {
                  _models.addAll(baseList.nullSafetyList
                      .map((e) => SplitAccountListModel.fromJson(e))
                      .toList());
                } else {
                  _easyRefreshController.finishLoad(noMore: true);
                }
                setState(() {});
              },
              child: _models.isEmpty
                  ? const SizedBox()
                  : ListView(
                children: ListTile.divideTiles(
                    context: context,
                    tiles: _models
                        .mapIndexed((currentValue, index) =>
                        _listCard(currentValue, index))
                        .toList())
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final _iconPaths = [
    Assets.icons.accountOrange,
    Assets.icons.accountRed,
    Assets.icons.accountBlue,
    Assets.icons.accountGreen,
    Assets.icons.accountPurple,
  ];

  Widget _listCard(SplitAccountListModel model, index) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Get.to(() =>
              SplitInfoPage(
                title: model.name,
                accountId: model.id,
              ));
        },
        child: ListTile(
          leading: _iconPaths[index % 5].image(width: 88.w, height: 88.w),
          title:
          model.name.text.size(28.sp).color(const Color(0xFF111111)).make(),
          subtitle: model.lastBill.text
              .size(28.sp)
              .color(const Color(0xFFAAAAAA))
              .make(),
          trailing: DateUtil
              .formatDateMs(model.createAt * 1000,
              format: DateFormats.mo_d_h_m)
              .text
              .size(20.sp)
              .color(const Color(0xFFAAAAAA))
              .make(),
        ),
      ),
    );
  }
}
