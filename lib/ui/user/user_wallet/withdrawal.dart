import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:cloud_car/widget/progress_bar.dart';

import 'package:flutter/material.dart';

class Withdrawal extends StatefulWidget {
  final String pice;
  final String bankName;
  final String time;
  const Withdrawal(
      {Key? key,
      required this.pice,
      required this.bankName,
      required this.time})
      : super(key: key);

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForeGroundColor,
      appBar: AppBar(
        title: Text(
          '提现记录',
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: const CloudBackButton(isSpecial: true),
        backgroundColor: kForeGroundColor,
      ),
      body: Column(
        children: [
          const Divider(),
          20.hb,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '提现到银行卡',
                      style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28),
                    ),
                    const Spacer(),
                    Text(
                      widget.pice,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                16.hb,
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '提现至银行卡:',
                    style: TextStyle(
                        color: BaseStyle.color999999,
                        fontSize: BaseStyle.fontSize24),
                  ),
                  TextSpan(
                    text: widget.bankName,
                    style: TextStyle(
                        color: BaseStyle.color999999,
                        fontSize: BaseStyle.fontSize24),
                  ),
                ])),
                16.hb,
                Text(
                  widget.time,
                  style: TextStyle(
                      color: BaseStyle.color999999,
                      fontSize: BaseStyle.fontSize24),
                ),
                const ProgressBar(
                  index: 2,
                  length: 2,
                  num: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
