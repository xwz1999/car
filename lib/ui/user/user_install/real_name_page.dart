

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widget/button/cloud_back_button.dart';

class RealNamePage extends StatefulWidget {
  const RealNamePage({super.key});

  @override
  _RealNamePageState createState() => _RealNamePageState();
}

class _RealNamePageState extends State<RealNamePage> {
  List<dynamic>? data;
  bool _getSure = false;
  final picker = ImagePicker();
  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
      } else {

      }
    });
  }

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
          children: [
            16.hb,
            _real(),
            72.hb,
            CloudBottomButton(
                text: '提交',
                onTap: () {
                  if (_getSure) {
                  } else {
                    BotToast.showText(text: '请同意实名认证协议');
                  }
                  //Get.to(() => const NoWithddrawalPage());
                }),
            36.hb,
            _getBottom()
          ],
        ));
  }

//相机

//实名认证
  _real() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.hb,
          _getText('姓名', '请填写您的真实姓名'),
          64.hb,
          _getText('身份证号', '请填写身份证号'),
          64.hb,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.wb,
              SizedBox(
                child: Text(
                  '身份证照',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: const Color(0xFF999999),
                      ),
                ),
              ),
              40.wb,
              Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 150.h,
                    child: GestureDetector(
                        onTap: () {
                          getImage();
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
                              left: 65.w,
                              top: 40.w,
                              child: Container(
                                padding: EdgeInsets.all(20.w),
                                width: 72.w,
                                height: 72.h,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                                    borderRadius: BorderRadius.circular(36.w)),
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
                          getImage();
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
                              left: 65.w,
                              top: 40.w,
                              child: Container(
                                padding: EdgeInsets.all(20.w),
                                width: 72.w,
                                height: 72.w,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                                    borderRadius: BorderRadius.circular(36.w)),
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
              ),
              32.wb,
            ],
          ),
          32.hb,
        ],
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      color: Colors.white,
      height: 50.w,
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 150.w,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: const Color(0xFF999999)),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 21.w), //文字与边框的距离
                  border: InputBorder.none, //去掉下划线
                  hintText: text,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: const Color(0xFFCCCCCC))),
              // onChanged: ,
            ),
          )
        ],
      ),
    );
  }
}
