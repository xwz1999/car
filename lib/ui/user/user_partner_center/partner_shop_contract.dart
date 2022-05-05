import 'package:cloud_car/ui/user/user_partner_center/successful.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:signature/signature.dart';

class PartnerShopContractPage extends StatefulWidget {
  const PartnerShopContractPage({Key? key}) : super(key: key);

  @override
  _PartnerShopContractPageState createState() =>
      _PartnerShopContractPageState();
}

class _PartnerShopContractPageState extends State<PartnerShopContractPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];

  late EasyRefreshController _refreshController;

  //手写版控制器
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 10.w, //线条宽度
    penColor: Colors.black, //线条颜色
  );
  @override
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
          width: 750.w,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 186.w),
                child: _getTitle(),
              ),
              56.hb,
              _getText(),
              846.hb,
              _getButton()
            ],
          ),
        ));
  }

//标题
  _getTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '合伙人合同',
          style:
              Theme.of(context).textTheme.headline6?.copyWith(fontSize: 40.sp),
        ),
        24.hb,
        Text(
          '合同编号：89276531625',
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }

//文本
  _getText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '甲方：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '身份证：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '乙方：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '身份证号：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        40.hb,
        Text(
          '第一条合伙人概况',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        24.hb,
        Text(
          'xxxxxxxxxxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

//底部按钮
  _getButton() {
    return Container(
      width: double.infinity,
      height: 98.w,
      padding: EdgeInsets.symmetric(horizontal: 285.w, vertical: 22.w),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              stops: [0.0, 1.0],
              colors: [Color(0xFF027AFF), Color(0xFF0593FF)]),
          borderRadius: BorderRadius.circular(8.w)),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            isScrollControlled: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.w),
                    topRight: Radius.circular(16.w))), //弹框矩形圆角
            builder: (BuildContext context) {
              return SizedBox(
                height: 566.w,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 32.w)),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 312.w)),
                            Text(
                              '合同签名',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                      color: const Color(0xFF111111),
                                      fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.clear,
                                color: Color(0xFFCCCCCC),
                                size: 20,
                              ),
                            ),
                            32.wb,
                          ],
                        ),
                        40.hb,
                        Stack(children: [
                          Signature(
                            controller: _signatureController,
                            width: 654.w,
                            height: 324.w,
                            backgroundColor: const Color(0xFFF6F6F6),
                          ),
                          Offstage(
                            offstage: false,
                            child: Container(
                                padding:
                                    EdgeInsets.only(left: 240.w, top: 140.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 19.8.w,
                                      height: 19.8.w,
                                      child: Image.asset(
                                        Assets.icons.pan.path,
                                        fit: BoxFit.fill,
                                        color: const Color(0xFF979797),
                                      ),
                                    ),
                                    Text(
                                      '在此处手写您的姓名',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                              color: const Color(0xFF999999)),
                                    ),
                                  ],
                                )),
                          ),
                        ]),
                        27.hb,
                        Container(
                          width: double.infinity,
                          height: 72.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 285.w, vertical: 11.w),
                          margin: EdgeInsets.symmetric(horizontal: 32.w),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  stops: [
                                    0.0,
                                    1.0
                                  ],
                                  colors: [
                                    Color(0xFF027AFF),
                                    Color(0xFF0593FF)
                                  ]),
                              borderRadius: BorderRadius.circular(8.w)),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const SuccessfulPage());
                            },
                            child: Text(
                              '立即签订',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(color: kForeGroundColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Text(
          '立即签订',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: kForeGroundColor),
        ),
      ),
    );
  }

//测试

  // _aa() {
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: const EdgeInsets.all(100),
  //     decoration: const BoxDecoration(color: Colors.red),
  //     child: Text(
  //       'data',
  //       style: TextStyle(fontSize: 100.sp),
  //     ),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}

void column() {}
