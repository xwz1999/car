import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RealNamePage extends StatefulWidget {
  const RealNamePage({Key? key}) : super(key: key);

  @override
  _RealNamePageState createState() => _RealNamePageState();
}

class _RealNamePageState extends State<RealNamePage> {
  List<dynamic>? data;
  bool _getSure = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor, //头部颜色
          title: Text('个人实名认证',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: bodyColor, //内容颜色
        extendBody: true,
        body: Column(
          children: [16.hb, _real(), 72.hb, _getSubmit(), 36.hb, _getBottom()],
        ));
  }

//相机

//实名认证
  _real() {
    return Container(
      width: 750.w,
      height: 450.w,
      color: Colors.white,
      padding: EdgeInsets.only(top: 16.w),
      child: Row(children: [
        36.wb,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getText('姓名', '请填写您的真实姓名'),
            64.hb,
            _getText('身份证号', '请填写身份证号'),
            64.hb,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    '身份证照',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: const Color(0xFF999999),
                        ),
                  ),
                ),
                32.wb,
                Row(
                  children: [
                    SizedBox(
                      width: 200.w,
                      height: 150.w,
                      child: GestureDetector(
                          onTap: () {
                            //Get.to(() => ImagePickerWidget());
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  Assets.images.realNameHead.path,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                left: 52.w,
                                top: 40.w,
                                child: Container(
                                  padding: EdgeInsets.all(20.w),
                                  width: 72.w,
                                  height: 72.w,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                                      borderRadius:
                                          BorderRadius.circular(36.w)),
                                  child: Image.asset(
                                    Assets.images.camera.path,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            ],
                          )),
                      // GestureDetector(
                      //     onTap: () {
                      //       Get.to(() => const FaceRecognitionPage());
                      //     },
                      //     child:

                      //     ),
                    ),
                    24.wb,
                    SizedBox(
                      width: 200.w,
                      height: 150.w,
                      child: GestureDetector(
                          onTap: () {
                            //Get.to(() => ImagePickerWidget());
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  Assets.images.realNameBadge.path,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                left: 52.w,
                                top: 40.w,
                                child: Container(
                                  padding: EdgeInsets.all(20.w),
                                  width: 72.w,
                                  height: 72.w,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                                      borderRadius:
                                          BorderRadius.circular(36.w)),
                                  child: Image.asset(
                                    Assets.images.camera.path,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ]),
    );
  }

//提交按钮
  _getSubmit() {
    return GestureDetector(
      child: Container(
        width: 686.w,
        height: 72.w,
        padding: EdgeInsets.symmetric(horizontal: 312.w, vertical: 11.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF0593FF), Color(0xFF027AFF)])),
        child: Text(
          '提交',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: kForeGroundColor),
        ),
      ),
    );
  }

//底部
  _getBottom() {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 218.w)),
        GestureDetector(
          onTap: () {
            _getSure = !_getSure;
            setState(() {});
          },
          child: SizedBox(
              width: 32.w,
              height: 32.w,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 2.w, color: Color(0xFFCCCCCC)),
              //     borderRadius: BorderRadius.circular(16.w)),
              child: !_getSure
                  ? const Icon(CupertinoIcons.circle,
                      size: 18, color: Color(0xFFCCCCCC))
                  : const Icon(CupertinoIcons.checkmark_circle,
                      size: 18, color: Colors.blue)),
        ),
        18.wb,
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '我同意',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: const Color(0xFFAAAAAA))),
          TextSpan(
              text: '《实名认证协议》',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: const Color(0xFF027AFF)))
        ]))
      ],
    );
  }

  _getText(String title, String text) {
    return Row(
      children: [
        SizedBox(
          width: 150.w,
          child: Text(
            '身份证号',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: const Color(0xFF999999)),
          ),
        ),
        SizedBox(
          width: 300.w,
          height: 35.w,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                border: InputBorder.none, //去掉下划线
                hintText: '请填写身份证号',
                hintStyle: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: const Color(0xFFCCCCCC))),
            // onChanged: ,
          ),
        )
      ],
    );
  }
}
