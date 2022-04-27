import 'package:cloud_car/ui/home/car_manager/publish_car/pcar_source_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../widget/button/cloud_back_button.dart';

class CarReportPage extends StatefulWidget {
  const CarReportPage({Key? key}) : super(key: key);

  @override
  State<CarReportPage> createState() => _CarReportPageState();
}

class _CarReportPageState extends State<CarReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('车辆发布',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0x99eeeeee),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30.w),
              child: '车辆报告'.text.size(32.sp).bold.color(Colors.black).make(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      '*'
                          .text
                          .size(30.sp)
                          .color(Colors.red)
                          .make()
                          .paddingOnly(top: 5),
                      10.wb,
                      '漆面数据'
                          .text
                          .size(30.sp)
                          .color(Colors.black.withOpacity(0.45))
                          .make(),
                      '(请上传JPG或PDF格式)'
                          .text
                          .size(24.sp)
                          .color(Colors.black.withOpacity(0.45))
                          .make(),
                    ],
                  ),
                  20.hb,
                  GestureDetector(
                    onTap: () {},
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                            width: 210.w,
                            height: 158.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Assets.images.addcar,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const CarSourcePage());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: '下一步'.text.size(30.sp).color(Colors.white).make(),
              ),
            ).paddingAll(30.h),
          ],
        ),
      ),
    );
  }
}
