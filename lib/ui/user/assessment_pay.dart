import 'package:cloud_car/ui/notice/notice_fashionable.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../home/car_manager/assessment_page.dart';

class AssessmentPayPage extends StatefulWidget {
  const AssessmentPayPage({Key? key}) : super(key: key);

  @override
  _AssessmentPayPageState createState() => _AssessmentPayPageState();
}

class _AssessmentPayPageState extends State<AssessmentPayPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];
  List payList = [
    {
      'title': '微信支付',
      'checked': 1,
      'src': "assets/icons/wx_pay.png",
    },
    {'title': '支付宝支付', 'checked': 2, 'src': "assets/icons/zfb_pay.png"}
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
    //super.build(context);
    return CloudScaffold(
        bodyColor: bgColor,
        appbar: Container(
          color: Colors.transparent,
          height: kToolbarHeight + MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(children: [
            32.wb,
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset('assets/icons/back.png',
                  height: 48.w, width: 48.w),
            ),
            188.wb,
            Text(
              '评估次数充值',
              style: TextStyle(
                  fontSize: 36.sp, color: const Color.fromRGBO(17, 17, 17, 1)),
            ),
          ]),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Column(
          children: [
            _getPay()
            //Text('data')
            // _getPay(),
            // ElevatedButton(
            //     //style: Colors.blue,
            //     onPressed: () {},
            //     child: const Text("立即支付")),
          ],
        ));
  }

//支付
  _getPay() {
    return Container(
      height: 400.w,
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
          itemCount: 2, //payList.length,
          itemBuilder: (context, index) {
            return _getPayList(payList[index]);
            //  return
          }),
    );
  }

//支付判断
  _getPayList(item) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(item['src']),
          title: Text(item['title']),
          trailing: Radio(
            value: item['checked'],
            groupValue: item['checked'],
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                item['checked'] = value;
                // for (var i = 0; i < payList.length; i++) {
                //   payList[i]['checked'] = false;
                // }
                // item['checked'] = true;
              });
            },
          ),
          // trailing: item['checked'] ? const Icon(Icons.check) : const Text(''),
          // onTap: () {
          //   setState(() {
          //     for (var i = 0; i < payList.length; i++) {
          //       payList[i]['checked'] = false;
          //     }
          //     item['checked'] = true;
          //   });
          // },
        ),
        const Divider()
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class Button {
//   Button(Null Function() param0);
// }

void column() {}
