import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/pay/wx_pay_model.dart';
import 'package:cloud_car/ui/tab_navigator.dart';
import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/pay_util.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/button/colud_check_radio.dart';

class AssessmentPayPage extends StatefulWidget {
  final String price;
  final int count;

  const AssessmentPayPage(
      {super.key, required this.price, required this.count});

  @override
  _AssessmentPayPageState createState() => _AssessmentPayPageState();
}

class _AssessmentPayPageState extends State<AssessmentPayPage> {
  List<dynamic>? data;

  int _selectIndex = 0;

  Map payWay = {
    '微信支付': Assets.icons.wxPay.path,
    '支付宝支付': Assets.icons.zfbPay.path
  };

  @override
  void initState() {
    PayUtil().wxPayAddListener(
        paySuccess: _paySuccess,
        payError: (event) {
          BotToast.closeAllLoading();
        });
    super.initState();
  }

  @override
  void dispose() {
    BotToast.closeAllLoading();
    PayUtil().removeWxPayListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        title: Text('评估次数充值', style: Theme.of(context).textTheme.headline6),
      ),
      extendBody: true,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        color: const Color.fromRGBO(246, 246, 246, 1),
        child: Column(
          children: [
            _getPrice(),
            56.hb,
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.w)),
              child: Column(
                children: payWay.keys
                    .toList()
                    .mapIndexed((currentValue, index) => GestureDetector(
                          onTap: () {
                            _selectIndex = index;
                            setState(() {});
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 40.w),
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      payWay[currentValue],
                                      width: 40.w,
                                      height: 40.h,
                                    ),
                                  ),
                                  20.wb,
                                  SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      currentValue,
                                      style: TextStyle(
                                          color: BaseStyle.color333333,
                                          fontSize: BaseStyle.fontSize28),
                                    ),
                                  ),
                                  const Spacer(),
                                  BeeCheckRadio(
                                    value: index,
                                    groupValue: [_selectIndex],
                                  ),
                                ],
                              )),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          CloudToast.loading;
          switch (_selectIndex) {
            case 0:
              await _wxPayFunc();
              break;
            case 1:
              await _aliPayFunc();
          }
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(
                left: 32.w,
                right: 32.w,
                bottom: 32.w + MediaQuery.of(context).padding.bottom),
            width: double.infinity,
            height: 72.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8.w)),
            child: Text(
              '确认支付',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: kForeGroundColor),
            ),
          ),
        ),
      ),
    );
  }

//充值金额
  _getPrice() {
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
              widget.price,
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

  Future _wxPayFunc() async {
    var base = await apiClient.request(API.user.wallet.assessRecharge, data: {
      'count': widget.count,
      'payType': 2,
    });
    if (base.code == 0) {
      var wxPayModel = WxPayModel.fromJson(base.data['content']);
      await PayUtil().callWxPay(
        payModel: wxPayModel,
      );
    } else {
      CloudToast.show(base.msg);
    }
  }

  Future _aliPayFunc() async {
    var base = await apiClient.request(API.user.wallet.assessRecharge, data: {
      'count': widget.count,
      'payType': 1,
    });
    if (base.code == 0) {
      var re = await PayUtil().callAliPay(base.data['content']);
      if (re) {
        _paySuccess();
      } else {
        BotToast.closeAllLoading();
      }
    } else {
      CloudToast.show(base.msg);
    }
  }

  void _paySuccess() async {
    Get.off(
      () => SuccessFailurePage(
        conditions: true,
        headline: '评估次数',
        body: Text(
          '评估次数充值成功',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        bottom: CloudBottomButton(
          onTap: () async {
            await UserTool.userProvider.updateUserInfo();
            Get.offAll(const TabNavigator());
          },
          text: '返回首页',
        ),
      ),
    );
  }
}
