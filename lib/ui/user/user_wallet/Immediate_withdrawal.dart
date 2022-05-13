// ignore_for_file: file_names

import 'package:cloud_car/model/configuration_model.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef BankCard = Function(String name, String icon);

class ImmediateWithdrawal extends StatefulWidget {
  const ImmediateWithdrawal({Key? key}) : super(key: key);

  @override
  State<ImmediateWithdrawal> createState() => _ImmediateWithdrawalState();
}

//late final BankCard bankCard;
ConfigurationModel bankCard =
    [ConfigurationModel(subtitle: '', title: '')] as ConfigurationModel;
final List<int> _selectIndex = [];
final List<ConfigurationModel> _chooseModels = [];
// List moddels = [
//   {
//     'icon': Assets.icons.agricultural.path,
//     'title': '中国农业银行(1278)',
//   },
//   {
//     'icon': Assets.icons.bank1.path,
//     'title': '中国建设银行（1278）',
//   },
//   {
//     'icon': Assets.icons.bank2.path,
//     'title': '中国建设银行（1278）',
//   },
// ];
List<ConfigurationModel> moddels = [
  ConfigurationModel(
      subtitle: Assets.icons.agricultural.path, title: '中国农业银行(1278)'),
  ConfigurationModel(subtitle: Assets.icons.bank1.path, title: '中国建设银行（1278）'),
  ConfigurationModel(subtitle: Assets.icons.bank2.path, title: '中国建设银行（1278）'),
];

class _ImmediateWithdrawalState extends State<ImmediateWithdrawal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kForeGroundColor,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          title: Text('立即提现', style: Theme.of(context).textTheme.headline6),
        ),
        extendBody: true,
        backgroundColor: bodyColor,
        body: Column(
          children: [
            16.hb,
            Container(
              color: kForeGroundColor,
              height: 450.w,
              padding: EdgeInsets.all(32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '到账银行卡',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  17.hb,
                  GestureDetector(
                    onTap: () {
                      List<ConfigurationModel> moddels = [
                        ConfigurationModel(
                            subtitle: Assets.icons.agricultural.path,
                            title: '中国农业银行(1278)'),
                        ConfigurationModel(
                            subtitle: Assets.icons.bank1.path,
                            title: '中国建设银行（1278）'),
                        ConfigurationModel(
                            subtitle: Assets.icons.bank2.path,
                            title: '中国建设银行（1278）'),
                      ];
                      showModalBottomSheet(
                          context: context,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (context, dialogSetState) {
                              return Container(
                                  width: double.infinity,
                                  height: 600.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.w))),
                                  child: Column(children: [
                                    32.hb,
                                    Row(
                                      children: [
                                        30.wb,
                                        SizedBox(
                                          child: GestureDetector(
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
                                          '选择银行卡',
                                          style: TextStyle(
                                              color: const Color(0xFF111111),
                                              fontSize: 32.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            bankCard.subtitle =
                                                _chooseModels.first.subtitle;
                                            bankCard.title =
                                                _chooseModels.first.title;
                                            Get.back();
                                          },
                                          child: SizedBox(
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
                                        30.wb,
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 32.w),
                                              color: Colors.white,
                                              height: 108.w,
                                              child: Row(
                                                children: [
                                                  // EditItemWidget(
                                                  //   title: '车身颜色',
                                                  //   callback:
                                                  //       (String content) {},
                                                  //   value: '',
                                                  //   //_carInfo.color ??
                                                  //   tips: '请选择车身颜色',
                                                  //   topIcon: false,
                                                  //   paddingStart: 32,
                                                  //   canChange: false,
                                                  //   endIcon: Image.asset(
                                                  //     Assets.icons.icGoto.path,
                                                  //     width: 32.w,
                                                  //     height: 32.w,
                                                  //   ),
                                                  // ),
                                                  Expanded(
                                                      child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 64.w,
                                                        height: 64.w,
                                                        child: Image.asset(
                                                            (moddels[index]
                                                                    .subtitle)
                                                                .toString()),
                                                      ),
                                                      16.wb,
                                                      Text(
                                                        (moddels[index].title)
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: BaseStyle
                                                                .color333333,
                                                            fontSize: 32.w),
                                                      )
                                                    ],
                                                  )),
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (_selectIndex
                                                          .contains(index)) {
                                                        _selectIndex
                                                            .remove(index);
                                                        _chooseModels.remove(
                                                            moddels[index]);
                                                      } else {
                                                        _selectIndex.clear();
                                                        _selectIndex.add(index);
                                                        _chooseModels.add(
                                                            moddels[index]);
                                                      }
                                                      // bankCard.subtitle =
                                                      //     moddels[index]
                                                      //         .subtitle;
                                                      // bankCard.title =
                                                      //     moddels[index].title;
                                                      dialogSetState(() {});
                                                    },
                                                    child: SizedBox(
                                                        child: BeeCheckRadio(
                                                      border: false,
                                                      value: index,
                                                      groupValue: _selectIndex,
                                                    )),
                                                  )

                                                  //点击获取点击选项的下标
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return Container(
                                                //   color: const Color(0xFFF6F6F6),
                                                //   height: 16.w,
                                                ); //背景色高度
                                          },
                                          itemCount: moddels.length),
                                    ),
                                  ]));
                            });
                          });
                    },
                    child: Row(children: [
                      SizedBox(
                        width: 64.w,
                        height: 64.w,
                        child: Image.asset(Assets.icons.bank2.path),
                      ),
                      SizedBox(
                          width: 380.w,
                          height: 35.w,
                          child: Text(
                            '中国建设银行（1278）',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(fontSize: 32.w),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 5.w, left: 191.w),
                        child: Icon(
                          CupertinoIcons.chevron_forward,
                          size: 40.w,
                          color: BaseStyle.color666666,
                        ),
                      )
                    ]),
                  ),
                  const Divider(),
                  17.hb,
                  Text(
                    '提现金额',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  9.hb,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '¥',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 36.w),
                      ),
                      32.wb,
                      SizedBox(
                          width: 300.w,
                          child: TextField(
                              //controller: _permissions1,
                              decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 0.w), //文字与边框的距离
                            border: InputBorder.none, //去掉下划线
                            hintText: '0.0',
                            hintStyle: TextStyle(
                              fontSize: BaseStyle.fontSize48,
                              color: BaseStyle.color999999,
                              // onChanged: ,
                            ),
                          ))),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        '我的余额: ¥${UserTool.userProvider.userInfo.data.balance}',
                        style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize24),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          '全部提现',
                          style: TextStyle(
                              color: const Color(0xFF027AFF),
                              fontSize: BaseStyle.fontSize24),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            CloudBottomButton(
              onTap: () {},
              text: '提交',
            ),
            96.hb,
          ],
        ));
  }

  // _getItem(
  //   int index,
  //   ConfigurationModel model,
  // ) {
  //   return StatefulBuilder(
  //     builder: (BuildContext context, setState) {
  //       return
  //     },
  //   );
  // }
}
