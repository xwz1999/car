import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../widget/button/cloud_back_button.dart';
import 'car_rejected_detail.dart';

class ExaminationPage extends StatefulWidget {
  const ExaminationPage({Key? key}) : super(key: key);

  @override
  _ExaminationPageState createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  final auditlist = [
    {
      'name': '奥迪A3',
      'time': '2021-12-01 12:00:22',
      'text': '车辆信息未填写完整',
      'conditions': 1,
    },
    {
      'name': '奥迪A3',
      'time': '2021-12-01 12:00:22',
      'text': '',
      'conditions': 2,
    },
  ];
  late EasyRefreshController _refreshController;

  @override
  @override
  void dispose() {
    _refreshController.dispose();
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
        title: Text('审批提醒', style: Theme.of(context).textTheme.headline6),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ListView(children: [
        //引用列表数据

        ...auditlist.map(
          (e) => _release(e),
        ),

        //_release(auditlist[0]),
        //_modify(noauditlist[0])
      ]
          // children: [
          // ],
          ),
    );
  }

//驳回 通过
  _isPass(int state) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
          margin: EdgeInsets.only(left: 150.w),
          color: state == 2
              ? const Color.fromRGBO(6, 180, 77, 0.1)
              : const Color.fromRGBO(230, 34, 34, 0.1),
          child: Text(
            state == 2 ? "通过" : '驳回',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: state == 2
                    ? const Color(0xFF06B44D)
                    : const Color(0xFFE62222)),
          ),
        )
      ],
    );
  }

//发布审核
  _release(item) {
    return InkWell(
      onTap: () {
        switch (item['conditions']) {
          case '1':
            Get.to(() => const CardetailPage());
            break;
          case '2':
            Get.to(() => const CardetailPage());
            break;
        }
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(top: 10.w, left: 32.w, right: 32.w),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
        child: Column(children: [
          Row(
            children: [
              Text(
                item['conditions'] == 2 ? "修改审核" : "发布审核",
                style: TextStyle(
                    fontSize: 32.sp,
                    color: const Color.fromRGBO(51, 51, 51, 1)),
              ),
              const Spacer(),
              _isPass(item['conditions'])
            ],
          ),
          24.hb,
          Row(
            children: [
              Text(
                '车辆名称',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                item['name'],
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          28.hb,
          Row(
            children: [
              Text(
                '审核时间',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromRGBO(102, 102, 102, 1)),
              ),
              48.wb,
              Text(
                item['time'],
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromRGBO(51, 51, 51, 1)),
              )
            ],
          ),
          item['conditions'] == 1 ? 28.hb : 0.hb,
          item['conditions'] == 1
              ? Row(
                  children: [
                    Text(
                      '驳回原因',
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: const Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    48.wb,
                    Text(
                      item['text'],
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: const Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                )
              : const SizedBox(),
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}
