import 'dart:io';

import 'package:cloud_car/model/car_valuation/car_distinguish_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_valuation/car_func.dart';
import 'package:cloud_car/ui/home/car_valuation/share_bottom_widget.dart';
import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/car_list_picker.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_car/extensions/string_extension.dart';

import 'car_valuation_page.dart';

class CarValuationResultPage extends StatefulWidget {
  final CarInfo carInfo;

  const CarValuationResultPage({Key? key, required this.carInfo})
      : super(key: key);

  @override
  _CarValuationResultPageState createState() => _CarValuationResultPageState();
}

class _CarValuationResultPageState extends State<CarValuationResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kForeGroundColor,
      extendBody: true,
      bottomNavigationBar: _getBottom(),
      body: Stack(
        children: [
          Image.asset(
            Assets.images.carValuationBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Container(
                  height: kToolbarHeight,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const CloudBackButton(
                        color: Colors.white,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              isDismissible: true,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              builder: (BuildContext context) {
                                return const ShareBottomWidget(

                                );
                              });
                        },
                          child: Image.asset(
                        Assets.icons.icShare.path,
                        width: 48.w,
                        height: 48.w,
                      )),
                      32.wb,
                    ],
                  ),
                ),
              ),
              45.hb,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '云云问车',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 64.w,
                        fontWeight: FontWeight.w500),
                  ),
                  24.wb,
                  Text(
                    '精准估值',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 64.w,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              12.hb,
              Text(
                '守护您的车辆交易',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 36.w,
                ),
              ),
              56.hb,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Container(
                  height: 416.w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.w),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFFFD6A1E),
                            offset: Offset(0, 4.w),
                            blurRadius: 18.w,
                            spreadRadius: 2.w)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      56.hb,
                      Text(
                        '您的${widget.carInfo.name}预估',
                        style: TextStyle(
                          color: const Color(0xFF999999),
                          fontSize: 32.w,
                        ),
                      ),
                      70.hb,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '13.57',
                            style: TextStyle(
                                color: const Color(0xFFFF3B02),
                                fontSize: 112.w,
                                fontWeight: FontWeight.bold),
                          ),
                          10.wb,
                          Text(
                            '万元',
                            style: TextStyle(
                              color: const Color(0xFFFF3B02),
                              fontSize: 64.w,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _getBottom() {
    return Container(
      padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 50.w),
      width: double.infinity,
      height: 400.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '您的爱车',
            style: TextStyle(
                color: const Color(0xFF111111),
                fontSize: 36.w,
                fontWeight: FontWeight.bold),
          ),
          24.hb,
          Text(
            '奥迪A3 2020款 Sportback 35 TFSI 进取运动型',
            style: TextStyle(
              color: const Color(0xFF111111),
              fontSize: 32.w,
            ),
          ),
          34.hb,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.wb,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '宁波',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 28.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.icons.estimateLocation.path,
                        width: 24.w,
                        height: 24.w,
                      ),
                      12.hb,
                      Text(
                        '所在地',
                        style: TextStyle(
                          color: const Color(0xFF999999),
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  )
                ],
              )),
              Container(
                alignment: Alignment.center,
                width: 44.w,
                child: Container(
                  color: const Color(0xFFDDDDDD),
                  width: 1.w,
                  height: 40.w,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2012-01',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 28.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.icons.estimateDate.path,
                        width: 24.w,
                        height: 24.w,
                      ),
                      12.hb,
                      Text(
                        '上牌日期',
                        style: TextStyle(
                          color: const Color(0xFF999999),
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  )
                ],
              )),
              Container(
                alignment: Alignment.center,
                width: 44.w,
                child: Container(
                  color: const Color(0xFFDDDDDD),
                  width: 1.w,
                  height: 40.w,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '10.9万公里',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 28.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.icons.estimateDistance.path,
                        width: 24.w,
                        height: 24.w,
                      ),
                      12.hb,
                      Text(
                        '行驶里程',
                        style: TextStyle(
                          color: const Color(0xFF999999),
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          )
        ],
      ),
    );
  }
}
