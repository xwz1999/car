import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_mortgage/car_mortgage_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import 'dart:math';

///车辆按揭
class CarMortgageResultPage extends StatefulWidget {
  ///本金
  final num loanAmount;

  ///期数
  final int loanTerm;

  ///利率
  final num interestRate;

  ///贷款类型
  final LoanType loanType;

  ///利率类型 1年 2日
  final int rateType;

  const CarMortgageResultPage(
      {super.key,
      required this.loanAmount,
      required this.loanTerm,
      required this.interestRate,
      required this.loanType,
      required this.rateType});

  @override
  _CarMortgageResultPageState createState() => _CarMortgageResultPageState();
}

class _CarMortgageResultPageState extends State<CarMortgageResultPage> {
  ///年利率
  late double yearRate;

  ///日利率
  late double dayRate;

  ///月利率
  late double monthRate;

  ///总还款金额
  double get totalRepayment {
    switch (widget.loanType) {
      case LoanType.equalPrincipalInterest:
        return widget.loanTerm * monthPayment();
      case LoanType.equalPrincipal:
        double total = 0.0;
        for (var item in loanList) {
          total += item.amount;
        }
        return total;
      // case LoanType.equalInterest:
      //   return 0;
      case LoanType.interestFirstPrincipalNext:
        return widget.loanAmount + totalInterest;
      case LoanType.duePrincipalInterest:
        return widget.loanAmount + totalInterest;
    }
  }

  ///总利息
  double get totalInterest {
    switch (widget.loanType) {
      case LoanType.equalPrincipalInterest:
        return totalRepayment - widget.loanAmount;
      case LoanType.equalPrincipal:
        double total = 0.0;
        for (var item in loanList) {
          total += item.interest;
        }
        return total;
      case LoanType.interestFirstPrincipalNext:
        return widget.loanAmount * monthRate * widget.loanTerm;
      case LoanType.duePrincipalInterest:
        return widget.loanAmount * monthRate * widget.loanTerm;
    }
  }

  ///每月还款额
  double monthPayment({int? term}) {
    switch (widget.loanType) {
      case LoanType.equalPrincipalInterest:
        var rate = pow((1 + monthRate), widget.loanTerm);
        return (widget.loanAmount * monthRate * rate) / (rate - 1);
      case LoanType.equalPrincipal:
        return (widget.loanAmount / widget.loanTerm) + getMonthInterest(term!);
      // case LoanType.equalInterest:
      //   return 0;
      case LoanType.interestFirstPrincipalNext:
        if (term == widget.loanTerm) {
          return widget.loanAmount * monthRate + widget.loanAmount;
        } else {
          return widget.loanAmount * monthRate;
        }
      case LoanType.duePrincipalInterest:
        if (term == widget.loanTerm) {
          return totalRepayment;
        } else {
          return 0;
        }
    }
  }

  ///每月还款本金
  double getMonthPrincipal(int term) {
    switch (widget.loanType) {
      case LoanType.equalPrincipalInterest:
        return monthPayment() - getMonthInterest(term);
      case LoanType.equalPrincipal:
        return widget.loanAmount / widget.loanTerm;
      case LoanType.interestFirstPrincipalNext:
        if (term == widget.loanTerm) {
          return widget.loanAmount.toDouble();
        } else {
          return 0;
        }
      case LoanType.duePrincipalInterest:
        if (term == widget.loanTerm) {
          return widget.loanAmount.toDouble();
        } else {
          return 0;
        }
    }
  }

  ///计算剩余本金
  double getRemainingPrincipal(int term) {
    switch (widget.loanType) {
      case LoanType.equalPrincipalInterest:
        if (term == 1) {
          return widget.loanAmount - getMonthPrincipal(1);
        }
        return (loanList[term - 2].surplus - loanList[term - 1].principal)
            .toDouble()
            .abs();
      case LoanType.equalPrincipal:
        return (widget.loanAmount -
                term * (widget.loanAmount / widget.loanTerm))
            .abs();
      case LoanType.interestFirstPrincipalNext:
        if (term == widget.loanTerm) {
          return 0;
        } else {
          return widget.loanAmount.toDouble();
        }
      case LoanType.duePrincipalInterest:
        if (term == widget.loanTerm) {
          return 0;
        } else {
          return widget.loanAmount.toDouble();
        }
    }
  }

  ///计算每月还款利息
  double getMonthInterest(int term) {
    switch (widget.loanType) {
      case LoanType.equalPrincipalInterest:
        return (widget.loanAmount * monthRate - monthPayment()) *
                pow((1 + monthRate), term - 1) +
            monthPayment();
      case LoanType.equalPrincipal:
        return (widget.loanAmount -
                (widget.loanAmount / widget.loanTerm) * (term - 1)) *
            monthRate;
      // case LoanType.equalInterest:
      //   return 0;
      case LoanType.interestFirstPrincipalNext:
        return widget.loanAmount * monthRate;
      case LoanType.duePrincipalInterest:
        if (term == widget.loanTerm) {
          return totalInterest;
        } else {
          return 0;
        }
    }
  }

  List<Loan> loanList = [];

  @override
  void initState() {
    super.initState();
    yearRate = widget.rateType == 1
        ? widget.interestRate.toDouble()
        : widget.interestRate * 365.0;
    dayRate = widget.rateType == 2
        ? widget.interestRate.toDouble()
        : widget.interestRate / 365.0;
    monthRate = yearRate / 12.0;
    loanList = List.generate(
      widget.loanTerm,
      (index) => Loan(
          date: DateUtil.formatDate(
              DateTime(
                  DateTime.now().year + ((DateTime.now().month + index) ~/ 12),
                  (DateTime.now().month + index) % 12,
                  15),
              format: DateFormats.y_mo_d),
          amount: monthPayment(term: index + 1),
          principal: getMonthPrincipal(index + 1),
          interest: getMonthInterest(index + 1),
          surplus: 0.0),
    );

    for (var i = 0; i < loanList.length; i++) {
      loanList[i].surplus = getRemainingPrincipal(i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: Colors.white,
        title: Text(
          '车贷计算',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: topWidget(),
          ),
          64.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              32.wb,
              Text(
                '还款计划（单位：元）',
                style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '假定每月15日还款',
                style:
                    TextStyle(color: const Color(0xFF999999), fontSize: 24.sp),
              ),
            ],
          ),
          32.hb,
          Container(
            width: double.infinity,
            height: 96.w,
            color: const Color(0xFFF9F9F9),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      32.wb,
                      Text(
                        '期数',
                        style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '月供金额',
                    style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '月供本金',
                    style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '月供利息',
                    style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '剩余本金',
                    style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          loanList.isEmpty
              ? const NoDataWidget(
                  text: '暂无相关信息',
                  paddingTop: 300,
                )
              : bottomWidget(),
        ],
      ),
    );
  }

  bottomWidget() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return getItem(loanList[index], index);
      },
      itemCount: loanList.length,
    );
  }

  getItem(Loan loan, int index) {
    return Container(
      width: double.infinity,
      height: 96.w,
      color: index % 2 == 0 ? Colors.white : const Color(0xFFF9F9F9),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                32.wb,
                Text(
                  loan.date,
                  style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              loan.amount.toStringAsFixed(2),
              style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              loan.principal.toStringAsFixed(2),
              style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              loan.interest.toStringAsFixed(2),
              style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              loan.surplus.toStringAsFixed(2),
              style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  topWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 36.w, horizontal: 48.w),
      width: double.infinity,
      height: 350.w,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.images.loanImg.path), fit: BoxFit.fill),
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '总还款金额(元)',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 24.sp),
                    ),
                    16.hb,
                    Text(
                      totalRepayment.toStringAsFixed(2),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '总利息(元)',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 24.sp),
                    ),
                    16.hb,
                    Text(
                      totalInterest.toStringAsFixed(2),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          70.hb,
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '年利率(%)',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 24.sp),
                      ),
                      16.hb,
                      Text(
                        (yearRate * 100.0).toStringAsFixed(3),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 2.w,
                height: 80.w,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x00FFFFFF),
                        Color(0x99FFFFFF),
                        Color(0x00FFFFFF),
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '月利率(%)',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 24.sp),
                      ),
                      16.hb,
                      Text(
                        (monthRate * 100.0).toStringAsFixed(3),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 2.w,
                height: 80.w,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x00FFFFFF),
                        Color(0x99FFFFFF),
                        Color(0x00FFFFFF),
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '日利率(%)',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 24.sp),
                      ),
                      16.hb,
                      Text(
                        (dayRate * 100.0).toStringAsFixed(3),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Loan {
  String date;
  num amount;
  num principal;
  num interest;
  num surplus;

  Loan({
    required this.date,
    required this.amount,
    required this.principal,
    required this.interest,
    required this.surplus,
  });
}
