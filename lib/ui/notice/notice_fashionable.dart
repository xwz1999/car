import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../constants/api/api.dart';
import '../../model/split_account/split_account_list_model.dart';
import '../../utils/net_work/api_client.dart';
import '../home/split_account/split_account_page.dart';


class FashionablePage extends StatefulWidget {
  const FashionablePage({super.key});

  @override
  _FashionablePageState createState() => _FashionablePageState();
}

class _FashionablePageState extends State<FashionablePage> {


  final EasyRefreshController _refreshController = EasyRefreshController();

  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  final fashionablelist = [
    {
      'title': '奥迪A3分账群',
      'content': '买车',
      'name': '1',
      'money': '50000元/1000000元',
      'time': '2020—12-30 12:20',
      'conditions': 0,
    },
    {
      'title': '宝马CLS级分账群',
      'content': '洗车',
      'name':'2',
      'money': '10元/50元',
      'time': '2020—12-30 12:20',
      'conditions': 1,
    },
  ];
  List<SplitAccountListModel> _models = [];
  int _page = 1;

  final int _limit = 10;
  final SplitAccountStatus _currentStatus = SplitAccountStatus.inProgress;
  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('分账确认', style: Theme.of(context).textTheme.headline6),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body:   EasyRefresh(
        firstRefresh: true,
        controller: _refreshController,
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
          // print("这是数据${baseList.data}");
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
            // 'status': _currentStatus.typeNum,
            'page': _page,
            'limit': _limit,
          });
          if (baseList.nullSafetyTotal > _models.length) {
            _models.addAll(baseList.nullSafetyList
                .map((e) => SplitAccountListModel.fromJson(e))
                .toList());
          } else {
            _refreshController.finishLoad(noMore: true);
          }
          setState(() {});
        },
        child: _models.isEmpty
            ? const SizedBox()
            : ListView(
            children: _fashionablecard(fashionablelist)
        ),
      ),
    );
  }

//已读 未读
  _read(int state) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: state == 1
                ? const Color.fromRGBO(153, 153, 153, 0.1)
                : const Color.fromRGBO(2, 122, 255, 0.1),
          ),
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
         
          child: Text(
            state == 1 ? "已读" : '未读',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: state == 1
                    ? const Color(0xFF999999)
                    : const Color(0xFF027AFF)),
          ),
        )
      ],
    );
  }

  _fashionablecard(item) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 16.w, right: 32.w, left: 32.w),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
        decoration: BoxDecoration(
            color: kForeGroundColor, borderRadius: BorderRadius.circular(8.w)),
        child: Column(children: [
          Row(
            children: [
              Text(
                item['title'],
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Spacer(),
              _read(item['conditions'])
            ],
          ),
          24.hb,
          Row(
            children: [
              Text(
                '分账内容',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: const Color(0xFF666666)),
              ),
              48.wb,
              Text(
                item['content'],
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '操作人',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: const Color(0xFF666666)),
              ),
              48.wb,
              Text(
                item['name'],
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '出资金额/分账金额',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: const Color(0xFF666666)),
              ),
              48.wb,
              Text(
                item['money'],
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '操作时间',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: const Color(0xFF666666)),
              ),
              48.wb,
              Text(
                item['time'],
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
        ]),
      ),
    );
  }

}



