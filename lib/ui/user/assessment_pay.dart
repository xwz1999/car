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
<<<<<<< HEAD
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text('评估次数充值', style: Theme.of(context).textTheme.headline6),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: Color.fromRGBO(246, 246, 246, 1),
          child: Column(
            children: [
              //Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),
              // Text('data')
              _getPice(),
              56.hb,
              _getPay(),
              868.hb,
              Container(
                width: double.infinity,
                height: 72.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.w)),
                child: SizedBox(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => const PayResultsPage());
                  },
                  child: Text(
                    '确认支付',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: Color(0xffffffff)),
                  ),
                )),
              )
            ],
          ),
        ));
  }

//充值金额
  _getPice() {
    return Container(
      padding: EdgeInsets.only(top: 74.w, left: 248.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            child: Text(
              '¥',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 40.sp),
            ),
          ),
          14.wb,
          SizedBox(
            child: Text(
              '20.00',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 64.sp),
            ),
          ),
        ],
      ),
    );
  }

=======
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

>>>>>>> 912f287d61642e8b5bfe0348165527b7eb9eef82
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
        // ListTile(
        //   leading: Image.asset(item['src']),
        //   title: Text(item['title']),
        //   trailing: Radio(
        //     value: item['checked'],
        //     groupValue: item['checked'],
        //     activeColor: Colors.blue,
        //     onChanged: (value) {
        //       setState(() {
        //         item['checked'] = value;
        //         // for (var i = 0; i < payList.length; i++) {
        //         //   payList[i]['checked'] = false;
        //         // }
        //         // item['checked'] = true;
        //       });
        //     },
        //   ),
        //   // trailing: item['checked'] ? const Icon(Icons.check) : const Text(''),
        //   // onTap: () {
        //   //   setState(() {
        //   //     for (var i = 0; i < payList.length; i++) {
        //   //       payList[i]['checked'] = false;
        //   //     }
        //   //     item['checked'] = true;
        //   //   });
        //   // },
        // ),
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
