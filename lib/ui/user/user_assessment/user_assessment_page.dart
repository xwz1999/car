import 'package:cloud_car/constants/const_data.dart';
import 'package:cloud_car/ui/user/user_assessment/pay_num_changes_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/putup_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../splash/agreement_page.dart';
import '../../splash/privacy_page.dart';
import 'assessment_pay_page.dart';

class UserAssessmentPage extends StatefulWidget {
  final int assessmentState;
  final bool carConsignment; //寄卖合同充值返回
  ///1:评估 2：合同
  const UserAssessmentPage(
      {super.key, required this.assessmentState, this.carConsignment = false});

  @override
  _UserAssessmentPageState createState() => _UserAssessmentPageState();
}

class _UserAssessmentPageState extends State<UserAssessmentPage> {
  ChooseItems? _chooseItem;
  final List<ChooseItems> _piceList = [
    ChooseItems(name: '充值10次', pice: '30.00', count: 10),
    ChooseItems(name: '充值50次', pice: '125.00', count: 50),
    ChooseItems(name: '充值100次', pice: '200.00', count: 100),
    ChooseItems(name: '充值200次', pice: '300.00', count: 200),
    ChooseItems(name: '自定义', pice: '充值份数', count: 0),
  ];
  final List<ChooseItems> _piceList2 = [
    ChooseItems(name: '充值10次', pice: '50.00', count: 10),
    ChooseItems(name: '充值50次', pice: '150.00', count: 50),
    ChooseItems(name: '充值100次', pice: '280.00', count: 100),
    ChooseItems(name: '充值500次', pice: '1250.00', count: 500),
    ChooseItems(name: '自定义', pice: '充值份数', count: 0),
  ];
  final TextEditingController _contractPrice = TextEditingController();
  final TextEditingController _assessmentPrice = TextEditingController();
  late String _contract = "";
  late String _assessment = "";
  bool _chooseAgreement = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _assessmentPrice.dispose();
    _contractPrice.dispose();
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
        actions: [
          Column(
            children: [
              SizedBox(
                height: 45.w,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => PayChangesPage(
                        numberState: widget.assessmentState,
                      ));
                },
                child: Text(
                  '次数记录',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: const Color(0xFF027AFF)),
                ),
              ),
            ],
          ),
          30.wb,
        ],
        title: Text(widget.assessmentState == 2 ? '合同份数充值' : '评估次数充值',
            style: Theme.of(context).textTheme.headline6),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(32.w),
            child: _getNum(),
          ),
          _getPrice(),
          200.hb,

        ],
      ),
      bottomNavigationBar: _confirmBtn(),
    );
  }

//评估次数
  _getNum() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 750.w,
          height: 174.w,
          //padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Image.asset(
            Assets.images.assessmentBg.path,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 40.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.assessmentState == 2 ? '剩余合同份数' : "剩余评估次数",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: kForeGroundColor),
                  ),
                  24.wb,
                  Text(
                    widget.assessmentState == 2
                        ? (UserTool
                                .userProvider.userInfo.data.assessContractCount)
                            .toString()
                        : (UserTool.userProvider.userInfo.data.assessCount)
                            .toString(),
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 42.sp,
                        color: const Color(0xFF027AFF),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Text('精准估值',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20.sp,
                          color: const Color.fromRGBO(255, 255, 255, 0.7))),
                  16.wb,
                  Text('守护您的车辆交易',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20.sp,
                          color: const Color.fromRGBO(255, 255, 255, 0.7))),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

//
  _getPrice() {
    return Container(
        width: 750.w,
        height: 1350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 42.w, right: 576.w),
              child: Text(
                '展示价格',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            24.hb,
            Container(
              width: double.infinity,
              height: 300.w,
              decoration: const BoxDecoration(),
              clipBehavior: Clip.antiAlias,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 32.w,
                      right: 32.w,
                    ),
                    child: SortWidget(
                      crossAxisSpacing: 24.w,
                      itemList:
                          widget.assessmentState == 2 ? _piceList2 : _piceList,
                      childAspectRatio: 216 / 156,
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.w,
                      callback: (item, index) {
                        _chooseItem = item;
                        if (item.name == "自定义") {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 0),
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                    builder: (context, dialogSetState) {
                                  return Container(
                                    width: double.infinity,
                                    height: 1000.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.w))),
                                    child: Column(
                                      children: [
                                        32.hb,
                                        Row(
                                          children: [
                                            30.wb,
                                            SizedBox(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  '取消',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2
                                                      ?.copyWith(
                                                          color: BaseStyle
                                                              .color999999),
                                                ),
                                              ),
                                            ),
                                            200.wb,
                                            Text(
                                              '自定义充值',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFF111111),
                                                  fontSize: 32.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              child: SizedBox(
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    ///_chooseItem?.pice=widget.assessmentState==2?_contractPrice.text:_assessmentPrice.text;
                                                    if (widget
                                                            .assessmentState ==
                                                        2) {
                                                      _chooseItem?.pice =
                                                          _contractPrice.text;
                                                      _chooseItem?.count =
                                                          int.parse(_contract);
                                                      // CloudToast.show(_contract);
                                                      // CloudToast.show(_contractPrice.text);
                                                    } else {
                                                      _chooseItem?.count =
                                                          int.parse(
                                                              _assessment);
                                                      _chooseItem?.pice =
                                                          _assessmentPrice.text;
                                                      // print(_assessment);
                                                      // print(_assessmentPrice.text);
                                                    }
                                                    Get.back();
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    '确认',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2
                                                        ?.copyWith(
                                                            color: const Color(
                                                                0xFF027AFF)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            30.wb,
                                          ],
                                        ),
                                        40.hb,
                                        Container(
                                          width: 722.w,
                                          height: 600.w,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 32.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: TextField(
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(),
                                                      // controller:
                                                      // widget.assessmentState ==
                                                      //     2
                                                      //     ? _contract
                                                      //     : _assessment,
                                                      onChanged: (text) {
                                                        if (widget
                                                                .assessmentState ==
                                                            2) {
                                                          if (text != "") {
                                                            _contract = text;
                                                            if (int.parse(
                                                                    text) <=
                                                                10) {
                                                              _contractPrice
                                                                      .text =
                                                                  (int.parse(text) *
                                                                          5)
                                                                      .toString();
                                                            } else if (10 <
                                                                    int.parse(
                                                                        text) &&
                                                                int.parse(
                                                                        text) <=
                                                                    50) {
                                                              _contractPrice
                                                                      .text =
                                                                  (int.parse(text) *
                                                                          3)
                                                                      .toString();
                                                            } else if (50 <
                                                                    int.parse(
                                                                        text) &&
                                                                int.parse(
                                                                        text) <=
                                                                    100) {
                                                              _contractPrice
                                                                      .text =
                                                                  (int.parse(text) *
                                                                          2.8)
                                                                      .toString();
                                                            } else {
                                                              _contractPrice
                                                                      .text =
                                                                  (int.parse(text) *
                                                                          2.5)
                                                                      .toString();
                                                            }
                                                          } else {
                                                            _contractPrice
                                                                .text = "";
                                                          }
                                                        } else {
                                                          if (text != "") {
                                                            _assessment = text;
                                                            if (1 <=
                                                                    int.parse(
                                                                        text) &&
                                                                int.parse(
                                                                        text) <
                                                                    50) {
                                                              _assessmentPrice
                                                                      .text =
                                                                  (int.parse(text) *
                                                                          3)
                                                                      .toString();
                                                            } else if (50 <=
                                                                    int.parse(
                                                                        text) &&
                                                                int.parse(
                                                                        text) <
                                                                    100) {
                                                              _assessmentPrice
                                                                      .text =
                                                                  (int.parse(text) *
                                                                          2.5)
                                                                      .toString();
                                                            } else if (100 <=
                                                                    int.parse(
                                                                        text) &&
                                                                int.parse(
                                                                        text) <
                                                                    200) {
                                                              _assessmentPrice
                                                                      .text =
                                                                  (int.parse(text) *
                                                                          2)
                                                                      .toString();
                                                            } else {
                                                              _assessmentPrice
                                                                      .text =
                                                                  (int.parse(text) *
                                                                          1.5)
                                                                      .toString();
                                                            }
                                                          } else {
                                                            _assessmentPrice
                                                                .text = "";
                                                          }
                                                        }
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  '请输入充值次数',
                                                              hintStyle: TextStyle(
                                                                  color: Color(
                                                                      0x33333333)),
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                    )),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0.w),
                                                      child: const Text('次'),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  color: Colors.grey,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: TextField(
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(),
                                                      controller:
                                                          widget.assessmentState ==
                                                                  2
                                                              ? _contractPrice
                                                              : _assessmentPrice,
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText: '金额',
                                                              hintStyle: TextStyle(
                                                                  color: Color(
                                                                      0x33333333)),
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                    )),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0.w),
                                                      child: const Text('元'),
                                                    )
                                                  ],
                                                ),
                                                const Divider(
                                                  color: Colors.grey,
                                                ),
                                                widget.assessmentState == 2
                                                    ? const Text(
                                                        '自定义充值合同次数规则',
                                                      )
                                                    : const Text(
                                                        '自定义充值评估次数规则',
                                                      ),
                                                10.hb,
                                                widget.assessmentState == 2
                                                    ? const Text(
                                                        '充值份数≤10为5元一份',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0x33333333)),
                                                      )
                                                    : const Text(
                                                        '1≤充值份数＜50为3元一次',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0x33333333)),
                                                      ),
                                                widget.assessmentState == 2
                                                    ? const Text(
                                                        '10＜充值份数≤50为3元一份',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0x33333333)),
                                                      )
                                                    : const Text(
                                                        '50≤充值份数＜100为2.5元一份',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0x33333333)),
                                                      ),
                                                widget.assessmentState == 2
                                                    ? const Text(
                                                        '50≤充值份数 ≤100为2.8元一份',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0x33333333)),
                                                      )
                                                    : const Text(
                                                        '100≤充值份数＜200为2元一次',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0x33333333)),
                                                      ),
                                                widget.assessmentState == 2
                                                    ? const Text(
                                                        '100＜充值份数为2.5元一份',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0x33333333)),
                                                      )
                                                    : const Text(
                                                        '200＜充值份数为15元一次',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0x33333333)),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                              });
                        }
                        print(item);
                        setState(() {});
                      },
                      pickItem: _chooseItem,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(Uri(scheme: 'tel', path: servicePhone));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 150.w,
                          height: 100.w,
                          child:
                              '联系客服'.richText.color(Colors.blueAccent).make()),
                    ),
                  ),
                  762.hb,
                  //40.hb,
                ],
              ),
            ),
            630.hb,
            GestureDetector(
              onTap: () {
                _chooseAgreement = !_chooseAgreement;

                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 50.w,
                      height: 50.w,
                      padding: EdgeInsets.only(top: 6.w, right: 5.w),
                      child: !_chooseAgreement
                          ? const Icon(CupertinoIcons.circle,
                          size: 18, color: Color(0xFFdddddd))
                          : const Icon(CupertinoIcons.checkmark_circle,
                          size: 18, color: Colors.red)),
                  RichText(
                      text: TextSpan(
                          text: "我已阅读并同意",
                          style: TextStyle(
                              color: BaseStyle.colorcccccc, fontSize: 12 * 2.sp),
                          children: [
                            TextSpan(
                                text: '《用户服务协议》',
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12 * 2.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(() => const AgreementPage());
                                  }),
                            TextSpan(
                              text: "和",
                              style: TextStyle(
                                  color: BaseStyle.colorcccccc, fontSize: 12 * 2.sp),
                            ),
                            TextSpan(
                                text: '《隐私协议》',
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12 * 2.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(() => const PrivacyPage());
                                  }),
                          ])),
                ],
              ),
            ),

          ],
        ));
  }

  _confirmBtn() {
    return GestureDetector(
      onTap: () {
        if (_chooseItem != null) {
          Get.to(() => AssessmentPayPage(
                carConsignment: widget.carConsignment,
                price: _chooseItem!.pice,
                count: _chooseItem!.count,
                title: widget.assessmentState == 2 ? "合同份数充值" : '评估次数充值',
                state: widget.assessmentState,
              ));
        } else {
          CloudToast.show('请先选择一个充值类型');
          return;
        }
      },
      child: Material(
        child: Container(
          width: double.infinity,
          height: 72.w,
          padding: EdgeInsets.symmetric(vertical: 16.w),
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              left: 32.w,
              right: 32.w,
              bottom: 32.w + MediaQuery.of(context).padding.bottom),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0xFF0593FF),
                Color(0xFF027AFF),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
          child: Text(
            '充值',
            style: TextStyle(
                color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
          ),
        ),
      ),
    );
  }
}
