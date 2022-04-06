import 'package:cloud_car/ui/login/login_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class CancellationAccountPage extends StatefulWidget {
  const CancellationAccountPage({Key? key}) : super(key: key);

  @override
  _CancellationAccountPageState createState() =>
      _CancellationAccountPageState();
}

class _CancellationAccountPageState extends State<CancellationAccountPage> {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];

  @override
  @override
  void dispose() {
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
            '注销账号',
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
              698.hb,
              _getButtom(),
              24.hb,
              Padding(
                padding: EdgeInsets.only(right: 50.w),
                child: Text(
                  '若您仍选择注销，则视为放弃上述内容',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: const Color(0xFFAAAAAA)),
                ),
              )
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
          Assets.icons.cancellationAccount.path,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

//文字
  _getText() {
    return Padding(
      padding: EdgeInsets.only(left: 0.w),
      child: Column(
        children: [
          Text(
            '是否确定注销该账号',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: 40.sp),
          ),
          32.hb,
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: '当前账号:',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: BaseStyle.color333333)),
              TextSpan(
                  text: '张三',
                  style: TextStyle(
                      fontSize: BaseStyle.fontSize28,
                      color: BaseStyle.color333333))
            ]),
          )
        ],
      ),
    );
  }

//按钮
  _getButtom() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 76.w),

      width: 686.w,
      height: 72.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(8.w)),

      child: SizedBox(
          child: GestureDetector(
        onTap: () {
          Get.to(() => const LoginPage());
        },
        child: Text(
          '注销',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: kForeGroundColor),
        ),
      )),
    );
  }

}

class Button {
  Button(Null Function() param0);
}

void column() {}
