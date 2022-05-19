import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:cloud_car/widget/picker/car_picker_box.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_item_widget.dart';
import 'package:cloud_car/widget/picker/cloud_list_picker_widget.dart';
import 'package:flutter/material.dart';

import 'choose_time_widget.dart';

///车辆按揭
class CarMortgageResultPage extends StatefulWidget {
  const CarMortgageResultPage({super.key});

  @override
  _CarMortgageResultPageState createState() => _CarMortgageResultPageState();
}

class _CarMortgageResultPageState extends State<CarMortgageResultPage> {

  bool onLoad = false;


  List<Loan> list = [
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
    Loan(surplus: 960295.28, amount: 43871.39, interest: 4166.67, date: '2022-02-15', principal: 39704.72),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: Colors.white,
        title: Text(
          '车贷计算器',
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
                style:
                    TextStyle(color: const Color(0xFF333333), fontSize: 32.sp,fontWeight: FontWeight.bold),
              ),
              Text(
                '假定每月15日还款',
                style: TextStyle(
                    color: const Color(0xFF999999), fontSize: 24.sp),
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
          onLoad
              ? const SizedBox()
              : list.isEmpty
              ? const NoDataWidget(
            text: '暂无相关信息',
            paddingTop: 300,
          )
              :bottomWidget(),
        ],
      ),
    );
  }

  bottomWidget() {
    return ListView.builder(
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return getItem(list[index],index);
      },
      itemCount: list.length,
    );
  }


  getItem(Loan loan,int index){
    return        Container(
      width: double.infinity,
      height: 96.w,
      color: index%2==0? Colors.white:const Color(0xFFF9F9F9),
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
              loan.amount.toString(),
              style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              loan.principal.toString(),
              style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              loan.interest.toString(),
              style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              loan.surplus.toString(),
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
                      '1052913.35',
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
                      '52913.35',
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
                        '5.000',
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
                        '0.417',
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
                        '0.014',
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



class  Loan{
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