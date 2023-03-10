import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../utils/user_tool.dart';
import '../../widget/button/cloud_back_button.dart';

class FashionablePage extends StatefulWidget {
  const FashionablePage({super.key});

  @override
  _FashionablePageState createState() => _FashionablePageState();
}

class _FashionablePageState extends State<FashionablePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  final fashionablelist = [
    {
      'title': '奥迪A3分账群',
      'content': '买车',
      'name': UserTool.userProvider.userInfo.nickname,
      'money': '50000元/1000000元',
      'time': '2020—12-30 12:20',
      'conditions': 0,
    },
    {
      'title': '宝马CLS级分账群',
      'content': '洗车',
      'name': UserTool.userProvider.userInfo.nickname,
      'money': '10元/50元',
      'time': '2020—12-30 12:20',
      'conditions': 1,
    },
  ];

  @override
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      body: ListView.builder(
        //padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
        itemCount: fashionablelist.length,
        itemBuilder: (context, index) {
          return _fashionablecard(fashionablelist[index]);
        },
      ),
    );
  }

//已读 未读
  _read(int state) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
          color: state == 1
              ? const Color.fromRGBO(153, 153, 153, 0.1)
              : const Color.fromRGBO(2, 122, 255, 0.1),
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

//

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}

void column() {}
