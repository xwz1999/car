import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';

class DetectionData extends StatefulWidget {
  const DetectionData({Key? key}) : super(key: key);

  @override
  State<DetectionData> createState() => _DetectionDataState();
}

class _DetectionDataState extends State<DetectionData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor, //头部颜色
          title: Text('上传检测报告',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: kForeGroundColor, //内容颜色
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      '检测报告',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: const Color(0xFF999999)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child:
                        SizedBox(child: Image.asset(Assets.images.addcar.path)),
                  )
                ],
              ),
            ),
            144.hb,
            GestureDetector(
              onTap: () {
                //BotToast.showText(text: '验证码输入错误');
                BotToast.showText(text: '提交成功');
              },
              child: Container(
                width: 686.w,
                height: 72.w,
                padding: EdgeInsets.only(left: 318.w, top: 22.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF0593FF), Color(0xFF027AFF)])),
                child: SizedBox(
                  width: 252.w,
                  height: 28.w,
                  child: Text(
                    '提交',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: kForeGroundColor),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
