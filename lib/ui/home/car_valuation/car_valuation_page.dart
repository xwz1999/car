import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class CarValuationPage extends StatefulWidget {
  const CarValuationPage({Key? key}) : super(key: key);

  @override
  _CarValuationPageState createState() => _CarValuationPageState();
}

class _CarValuationPageState extends State<CarValuationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('车辆估值',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      24.hb,
                      Container(
                        width: double.infinity,
                        height: 200.w,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 24.w, right: 24.w),
                        padding: EdgeInsets.symmetric(horizontal: 48.w),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image:
                            AssetImage('assets/images/assessment_bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      '剩余评估次数',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    20.wb,
                                    const Text(
                                      '49',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),

                                Row(
                                  children: [
                                    const Text(
                                      '精准估值',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0x99eeeeee)),
                                    ),
                                    20.wb,
                                    const Text(
                                      '守护您的车辆交易',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0x99eeeeee)),
                                    ),
                                  ],
                                ),
                                30.hb,
                              ],
                            ),
                           const Spacer(),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                width: 120.w,
                                height: 58.w,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 5.w),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(6.w)),
                                child:  Text(
                                  '去充值',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200.w),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, -20.0), //阴影xy轴偏移量
                                blurRadius: 15.0, //阴影模糊程度
                                spreadRadius: 1.0 //阴影扩散程度
                            )
                          ]),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Image.asset(
                                    'assets/images/driving_license2.png'),
                                // Center(
                                //     child: Column(
                                //   children: [
                                //     Container(
                                //       width: 80.w,
                                //       height: 80.w,
                                //       color: Colors.white30,
                                //       child: ClipOval(
                                //         child: Image.asset(
                                //           'assets/images/shooting.png',
                                //           height: 100,
                                //           width: 100,
                                //           fit: BoxFit.cover,
                                //           color: Colors.white54,
                                //           colorBlendMode: BlendMode.difference,
                                //         ),
                                //       ),
                                //     ),
                                //     10.hb,
                                //     const Text(
                                //       '扫描驾驶证',
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 13,
                                //         color: Colors.black45,
                                //       ),
                                //     ),
                                //   ],
                                // )).paddingOnly(top: 150.h),
                              ],
                            ),
                          ),

                          100.hb,

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }





}
