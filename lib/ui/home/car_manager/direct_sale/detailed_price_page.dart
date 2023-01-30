import 'package:cloud_car/utils/headers.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import '../../../../model/car/car_price_history_model.dart';
import '../../../../widget/button/cloud_back_button.dart';

class DetailedPricePage extends StatefulWidget {
  final List<CarPriceHistoryModel> carPriceList;
  final String shelfTime;
  final String exteriorPrice;

  const DetailedPricePage(
      {super.key,
      required this.carPriceList,
      required this.shelfTime,
      required this.exteriorPrice});

  @override
  _DetailedPricePageState createState() => _DetailedPricePageState();
}

class _DetailedPricePageState extends State<DetailedPricePage> {
  @override
  void initState() {
    widget.carPriceList.add(const CarPriceHistoryModel(
        interiorPrice: '',
        exteriorPrice: '',
        preInteriorPrice: '',
        preExteriorPrice: '',
        description: '',
        createdAt: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text("调价记录",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34.sp,
                color: const Color(0xFF333333),
              )),
        ),
        backgroundColor: kForeGroundColor,
        body: ListView.builder(
          padding: EdgeInsets.only(left: 64.w),
          itemBuilder: (context, index) {
            return _getBox(
              index,
              widget.carPriceList[index],
            );
          },
          itemCount: widget.carPriceList.length,
        ));
  }

  _getBox(
    int index,
    CarPriceHistoryModel model,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.w),
      child: Row(
        children: [
          index == 0 ? _getSox() : _getNSox(),
          16.wb,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index == widget.carPriceList.length - 1
                    ? '车辆标价${widget.exteriorPrice}'
                    : '${model.description}, 售价${model.exteriorPrice}元',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.circular(4.w)),
                      child: Text(
                        index == widget.carPriceList.length - 1 ? '上架' : '改价',
                        style: TextStyle(
                            fontSize: 18.sp, color: const Color(0xFF999999)),
                      ),
                    ),
                    8.wb,
                    Text(
                        DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
                            format: 'yyyy年MM月dd HH:mm:ss'),
                        style: TextStyle(
                            fontSize: 24.sp, color: const Color(0xFF999999)))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _getSox() {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(width: 2.w, color: const Color(0xFF027AFF))),
        ),
        Container(
          width: 32.w,
          height: 4.w,
          color: const Color(0xFF027AFF),
        )
      ],
    );
  }

  _getNSox() {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(width: 2.w, color: const Color(0xFFE8E8E8))),
        ),
        Container(
          width: 32.w,
          height: 4.w,
          color: const Color(0xfffe8e8e8),
        )
      ],
    );
  }
}
