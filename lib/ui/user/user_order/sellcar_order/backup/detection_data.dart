import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetectionData extends StatefulWidget {
  final int orderId;

  const DetectionData({super.key, required this.orderId});

  @override
  State<DetectionData> createState() => _DetectionDataState();
}

late String img;
   final picker = ImagePicker();
 // ignore: unnecessary_late
 late File imagePath = File(Assets.images.addcar.path);

class _DetectionDataState extends State<DetectionData> {
  

 
  // Future getImage() async {
  //   // ignore: deprecated_member_use
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);
  //   final File file = File(pickedFile!.path);
  //   setState(() {
  //     if (pickedFile != null) {
  //       imagePath = file;
  //     } else {
  //       print('no image selected');
  //     }
  //   });
  // }



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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  GestureDetector(onTap: () async{
 var value =  await CloudImagePicker.pickSingleImage(title: '选择图片');
                           imagePath=value!;
                          // print(imagePath);
                            setState(() {});
                  },child:
                   Image.asset(imagePath==null?Assets.images.addcar.path:imagePath.path,width: 200.w,height: 150.w,),)
                ],
              ),
            ),
            144.hb,
            GestureDetector(
              onTap: () async {
                bool res = await OrderFunc.getTestrepord(widget.orderId, imagePath.path);
                //BotToast.showText(text: '验证码输入错误');
                //print("检测报告+$img");
                if (res) {
                  BotToast.showText(text: '提交成功');
                  Get.back();
                }
                //BotToast.showText(text: '提交成功');
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
