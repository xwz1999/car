
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/user/real_name_model.dart';
import '../../../utils/net_work/api_client.dart';
import '../../../utils/pay_util.dart';
import '../../../utils/toast/cloud_toast.dart';
import '../../../widget/button/cloud_back_button.dart';
import '../../../widget/picker/cloud_image_picker.dart';

import '../../home/car_manager/direct_sale/edit_item_widget.dart';

import '../interface/user_func.dart';

class RealNamePage extends StatefulWidget {
  const RealNamePage({super.key});

  @override
  _RealNamePageState createState() => _RealNamePageState();
}

class _RealNamePageState extends State<RealNamePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();

  List<dynamic>? data;
  bool _getSure = false;
  final picker = ImagePicker();
  File? _file;
  File? _file2;
  String urls = '';
  String urls2 = '';
  late RealNameModel rName;
  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
      } else {}
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
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
                onTap: () async {
                  if (_getSure) {
                    var res = await User.getAil(
                      nameController.text,
                      idController.text,
                      urls,
                      urls2,
                    );
                    // if(res!=null){
                    //   var re = await PayUtil().callAliPay(res!.url);
                    //   if (re) {
                    //     CloudToast.show('成功');
                    //     // _paySuccess();
                    //   } else {
                    //     BotToast.closeAllLoading();
                    //   }
                    //   // launchUrl(Uri.parse(res.url));
                    // }

                    // apiClient.request(API.user.ail.certifyAil,data: {
                    //   'name':nameController.text,
                    //   'idCard':idController.text,
                    //   'idCardFront':urls,
                    //   'idCardBack':urls2,
                    // });
                    // if (res.code != 0) {
                    //   CloudToast.show(res.msg);
                    // } else {
                    //   // launchUrl();
                    //   // var model=await apiClient.request(API.user.ail.ailResult,);
                    //   // CloudToast.show(model.msg);
                    //   return true;
                    // }
                  } else {
                    BotToast.showText(text: '请同意实名认证协议');
                  }
                  //Get.to(() => const NoWithddrawalPage());
                }),
            36.hb,
            getBottom()
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
          EditItemWidget(
            title: '姓名',
            controller: nameController,
            tips: '请填写您的真实姓名',
            // value: content ?? '',
            topIcon: false,
            // paddingStart: 0.5,
            canChange: true,
            callback: (String content) {},
          ),
          EditItemWidget(
            paddingState: true,
            errText: '身份证号格式错误',
            length: 18,
            title: '身份证号',
            controller: idController,
            tips: '请填写身份证号',
            inputFormatters: [LengthLimitingTextInputFormatter(18)],
            // value: content ?? '',
            topIcon: false,
            // paddingStart: 0.5,
            canChange: true,
            callback: (String content) {},
            // endIcon: Image.asset(
            //   Assets.icons.icGoto.path,
            //   width: 32.w,
            //   height: 32.w,
            // ),
          ),
          // // getText('姓名', '请填写您的真实姓名'),
          // getText('身份证号', '请填写身份证号'),
          64.hb,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.wb,
              SizedBox(
                child: Text(
                  '身份证照',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: const Color(0xFF333333),
                      ),
                ),
              ),
              40.wb,
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      _file =
                          await CloudImagePicker.pickSingleImage(title: '选择图片');
                      if (_file != null) {
                        setState(() {});
                        var cancel = CloudToast.loading;
                        urls = await apiClient.uploadImage(_file!);
                        print(urls);
                        // var carInfoModel = await CarFunc.carDistinguish(urls);
                        // if (carInfoModel != null) {
                        //   // widget.onLoadComplete(carInfoModel);
                        // }
                        cancel();
                      }
                    },
                    child: SizedBox(
                      width: 200.w,
                      height: 150.w,
                      child: _file == null
                          ? Assets.images.carPersonHead.image()
                          : Image.file(_file!),
                    ),
                  ),
                  // SizedBox(
                  //   width: 200.w,
                  //   height: 150.w,
                  //   child: GestureDetector(
                  //       onTap: () async {
                  //         _file = await CloudImagePicker.pickSingleImage(
                  //             title: '选择图片');
                  //         if (_file != null) {
                  //           setState(() {});
                  //           var cancel = CloudToast.loading;
                  //           urls = await apiClient.uploadImage(_file!);
                  //           // var carInfoModel = await CarFunc.carDistinguish(urls);
                  //           // if (carInfoModel != null) {
                  //           //   // widget.onLoadComplete(carInfoModel);
                  //           // }
                  //           cancel();
                  //         }
                  //       },
                  //       child: Image.asset(
                  //         Assets.images.carPersonBack.path,
                  //         fit: BoxFit.fill,
                  //       )),
                  //   // GestureDetector(
                  //   //     onTap: () {
                  //   //       Get.to(() => const FaceRecognitionPage());
                  //   //     },
                  //   //     child:
                  //
                  //   //     ),
                  // ),
                  24.wb,

                  GestureDetector(
                    onTap: () async {
                      _file2 =
                          await CloudImagePicker.pickSingleImage(title: '选择图片');
                      if (_file2 != null) {
                        setState(() {});
                        var cancel = CloudToast.loading;
                        urls2 = await apiClient.uploadImage(_file2!);
                        print(urls2);
                        // var carInfoModel = await CarFunc.carDistinguish(urls);
                        // if (carInfoModel != null) {
                        //   // widget.onLoadComplete(carInfoModel);
                        // }
                        cancel();
                      }
                    },
                    child: SizedBox(
                      width: 200.w,
                      height: 150.w,
                      child: _file2 == null
                          ? Assets.images.carPersonBack.image()
                          : Image.file(_file2!),
                    ),
                  ),

                  // SizedBox(
                  //   width: 200.w,
                  //   height: 150.w,
                  //   child: GestureDetector(
                  //       onTap: () {
                  //         ScanLicenseWidget(onLoadComplete: (CarDistinguishModel ) {  },);
                  //       },
                  //       child: Image.asset(
                  //         Assets.images.carPersonBack.path,
                  //         fit: BoxFit.fill,
                  //       )),
                  // )
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
  getBottom() {
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

  getText(String title, String text) {
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
              // controller: ,
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
