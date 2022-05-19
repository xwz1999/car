import 'dart:io';

import 'package:bot_toast/bot_toast.dart';

import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:flutter/material.dart';

class ChangeNameData extends StatefulWidget {
  final int orderId;

  const ChangeNameData({super.key, required this.orderId});

  @override
  State<ChangeNameData> createState() => _ChangeNameDataState();
}

String certificate = '';

///登记证书
String vehicleLicense = '';

///行驶证
String invoice = '';

///发票
String guaranteeSlip = '';

///保单
late double pice;
  // final picker = ImagePicker();
 // ignore: unnecessary_late
 File imagePath = File('');
class _ChangeNameDataState extends State<ChangeNameData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor, //头部颜色
        title: Text('上传过户资料',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: kForeGroundColor, //内容颜色
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          child: ListView(
            children: [
              getText(
                '登记证书',
                                  GestureDetector(onTap: () async{
 var value =  await CloudImagePicker.pickSingleImage(title: '选择图片');
                           certificate=value!.path;
                          // print(imagePath);
                            setState(() {});
                  },child:
                   Image.asset(certificate==''?Assets.images.addcar.path:certificate,width: 200.w,height: 150.w,),)
              ),
              //48.hb,
              getText(
                '行驶证',
                 GestureDetector(onTap: () async{
 var value =  await CloudImagePicker.pickSingleImage(title: '选择图片');
                           vehicleLicense=value!.path;
                          // print(imagePath);
                            setState(() {});
                  },child:
                   Image.asset(vehicleLicense==""?Assets.images.addcar.path:vehicleLicense,width: 200.w,height: 150.w,),)
      
              ),
              //48.hb,
              getText(
                '发票',
                            GestureDetector(onTap: () async{
 var value =  await CloudImagePicker.pickSingleImage(title: '选择图片');
                           invoice=value!.path;
                          // print(imagePath);
                            setState(() {});
                  },child:
                   Image.asset(invoice==''?Assets.images.addcar.path:invoice,width: 200.w,height: 150.w,),)
      
              ),
             
           
              //48.hb,
              getText(
                '保单',
                             GestureDetector(onTap: () async{
 var value =  await CloudImagePicker.pickSingleImage(title: '选择图片');
                           guaranteeSlip=value!.path;
                          // print(imagePath);
                            setState(() {});
                  },child:
                   Image.asset(guaranteeSlip==''?Assets.images.addcar.path:guaranteeSlip,width: 200.w,height: 150.w,),)
      
              ),
          
           
              //48.hb,
              Row(
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      '商业险金额',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  SizedBox(
                      width: 300.w,
                      height: 35.w,
                      child: TextField(
                          onChanged: (text) {
                            pice = double.parse(text);
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 23.w), //文字与边框的距离
                            border: InputBorder.none, //去掉下划线
                            hintText: '请输入金额',
                            hintStyle: TextStyle(
                              fontSize: BaseStyle.fontSize28,
                              color: BaseStyle.colorcccccc,

                              // onChanged: ,
                            ),
                          ))),
                  Padding(
                    padding: EdgeInsets.only(top: 5.w, left: 191.w),
                    child: Text(
                      '元',
                      style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28),
                    ),
                  )
                ],
              ),
              144.hb,
              GestureDetector(
                onTap: () async {
                  bool zhi = await OrderFunc.getTransfer(
                      widget.orderId,
                      certificate,
                      vehicleLicense,
                      invoice,
                      guaranteeSlip,
                      pice);
                  // print(
                  //     '登记证书+$certificate+行驶证+$vehicleLicense+发票+$invoice+保单+$guaranteeSlip+金额+$pice');
                  if (zhi) {
                    BotToast.showText(text: '提交成功');
                    Get.back();
                  }
                  //BotToast.showText(text: '验证码输入错误');
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
          )),
    );
  }

  getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  getText(String title, dynamic name) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

    
          SizedBox(
            width: 130.w,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: const Color(0xFF999999)),
            ),
          ),
          32.wb,
          name,
          // CarImageItem(
          //   imageBack: (List<File> image) {
          //     picture = image.first.path;
          //   },

          //   //isPadding: false,
          // ),
        ],
      ),
    );
  }
}
