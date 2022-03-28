import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PayResultsPage extends StatefulWidget {
  const PayResultsPage({Key? key}) : super(key: key);

  @override
  _PayResultsPageState createState() => _PayResultsPageState();
}

class _PayResultsPageState extends State<PayResultsPage> {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text(
            '评估次数充值',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
          width: 750.w,
          color: Colors.white,
          child: Column(
            children: [
              _getSuccessful(),
              32.hb,
              _getText(),
              72.hb,
              _getButtom(),
            ],
          ),
        ));
  }

//图片
  _getSuccessful() {
    return Container(
      padding: EdgeInsets.only(
        top: 138.w,
      ),
      child: SizedBox(
        width: 200.w,
        height: 200.w,
        child: Image.asset(
          Assets.icons.successful.path,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

//文字
  _getText() {
    return SizedBox(
      child: Text(
        '评估次数充值成功',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

//按钮
  _getButtom() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 76.w),
      width: 600.w,
      height: 72.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(8.w)),

      child: SizedBox(
          child: GestureDetector(
        onTap: () {
          const Text('data');
        },
        child: Text(
          '返回我的',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: const Color(0xFFFFFFFF)),
        ),
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}

void column() {}
