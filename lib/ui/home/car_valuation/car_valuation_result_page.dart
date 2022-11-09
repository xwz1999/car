

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:screenshot/screenshot.dart';

import 'car_valuation_page.dart';

class CarValuationResultPage extends StatefulWidget {
  final CarInfo carInfo;

  const CarValuationResultPage({super.key, required this.carInfo});

  @override
  _CarValuationResultPageState createState() => _CarValuationResultPageState();
}

class _CarValuationResultPageState extends State<CarValuationResultPage> {

  final ScreenshotController _screenshotController = ScreenshotController();


  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: Scaffold(
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
                                  return _getShare();
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
                          '您的 ${widget.carInfo.name} 预估',
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
                        widget.carInfo.price==null?'':NumUtil.divide(num.parse(widget.carInfo.price!), 10000).toString(),
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
      ),
    );
  }


  _getShare(){
    return Container(
      width: double.infinity,
      height: 468.w,
      decoration: BoxDecoration(
          color: BaseStyle.colorf6f6f6,
          borderRadius: BorderRadius.all(Radius.circular(16.w))),
      child: Column(
        children: [

          Row(
            children: [
              IconButton(onPressed: (){

              }, icon: Icon(
                CupertinoIcons.clear,
                size: 30.w,
                color: Colors.transparent,
              ),),
              const Spacer(),
              Text(
                '分享报告',
                style: TextStyle(
                    color: const Color(0xFF111111),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(
                CupertinoIcons.clear,
                size: 30.w,
              ),),

              30.wb,
            ],
          ),
          40.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.icShareLink.path,
                      width: 96.w,
                      height: 96.w,
                    ),
                    5.hb,
                    Text(
                      '复制链接',
                      style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: BaseStyle.fontSize24),
                    )
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    var u8List = await _screenshotController.capture(
                        delay: const Duration(milliseconds: 10));
                    if (u8List != null) {
                      await fluwx.shareToWeChat(fluwx.WeChatShareImageModel(
                          fluwx.WeChatImage.binary(u8List)));
                    } else {
                      CloudToast.show('图片保存失败');
                    }
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.icons.icShareWx.path,
                        width: 96.w,
                        height: 96.w,
                      ),
                      5.hb,
                      Text(
                        '微信',
                        style: TextStyle(
                            color: const Color(0xFF666666),
                            fontSize: BaseStyle.fontSize24),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    var u8List = await _screenshotController.capture(
                        delay: const Duration(milliseconds: 10));
                    if (u8List != null) {
                      await fluwx.shareToWeChat(
                        fluwx.WeChatShareImageModel(
                            fluwx.WeChatImage.binary(u8List),
                            scene: fluwx.WeChatScene.TIMELINE,
                            title: ''),
                      );
                    } else {
                      CloudToast.show('海报生成失败');
                    }
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.icons.icShareWxCircle.path,
                        width: 96.w,
                        height: 96.w,
                      ),
                      5.hb,
                      Text(
                        '朋友圈',
                        style: TextStyle(
                            color: const Color(0xFF666666),
                            fontSize: BaseStyle.fontSize24),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          40.hb,
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              height: 72.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
              ),
              child: Text(
                '取  消',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize28,
                    fontWeight: FontWeight.bold,
                    color: BaseStyle.color333333),
              ),
            ),
          ),
          50.hb,
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
           widget.carInfo.name??'',
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
              // Expanded(
              //     child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       widget.carInfo.licensePlate??'',
              //       style: TextStyle(
              //         color: const Color(0xFF333333),
              //         fontSize: 28.w,
              //       ),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Image.asset(
              //           Assets.icons.estimateLocation.path,
              //           width: 24.w,
              //           height: 24.w,
              //         ),
              //         12.wb,
              //         Text(
              //           '牌照',
              //           style: TextStyle(
              //             color: const Color(0xFF999999),
              //             fontSize: 24.w,
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // )),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.carInfo.locationCity??'',
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
                          12.wb,
                          Text(
                            '所在地区',
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
                    widget.carInfo.licensingDateStr,
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
                      12.wb,
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
                    '${widget.carInfo.mileage??0}万公里',
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
                      12.wb,
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
