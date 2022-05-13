import 'dart:io';

import 'package:cloud_car/ui/user/user_partner_center/successful.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';
import 'dart:ui' as ui;

class PartnerShopContractPage extends StatefulWidget {
  const PartnerShopContractPage({Key? key}) : super(key: key);

  @override
  _PartnerShopContractPageState createState() =>
      _PartnerShopContractPageState();
}

class _PartnerShopContractPageState extends State<PartnerShopContractPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<dynamic>? data;
  final GlobalKey _globalKey = GlobalKey();
  // ignore: non_constant_identifier_names
  // List listWidget = [];

  //late EasyRefreshController _refreshController;
  bool isMove = false;
  //手写版控制器
  final SignatureController _signatureController = SignatureController(
      penStrokeWidth: 10.w, //线条宽度
      penColor: Colors.black, //线条颜色
      onDrawStart: () {
        //isMove = true;
      });
  @override
  @override
  void dispose() {
    // _refreshController.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const CloudBackButton(
          isSpecial: true,
        ),
      ),
      extendBody: true,
      //extendBodyBehindAppBar: true,
      backgroundColor: kForeGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: _getTitle(),
          ),
          56.hb,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: _getText(),
          ),
          846.hb,
          _getButton()
        ],
      ),
    );
  }

//标题
  _getTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '合伙人合同',
          style:
              Theme.of(context).textTheme.headline6?.copyWith(fontSize: 40.sp),
        ),
        24.hb,
        Text(
          '合同编号：89276531625',
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }

//文本
  _getText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '甲方：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '身份证：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '乙方：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '身份证号：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        40.hb,
        Text(
          '第一条合伙人概况',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        24.hb,
        Text(
          'xxxxxxxxxxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

//底部按钮
  _getButton() {
    return CloudBottomButton(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          isScrollControlled: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.w),
                  topRight: Radius.circular(16.w))), //弹框矩形圆角
          builder: (BuildContext context) {
            return SizedBox(
              height: 566.w,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 32.w)),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 312.w)),
                          Text(
                            '合同签名',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    color: const Color(0xFF111111),
                                    fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _signatureController.clear();
                              });
                              Get.back();
                            },
                            child: const Icon(
                              Icons.clear,
                              color: Color(0xFFCCCCCC),
                              size: 20,
                            ),
                          ),
                          32.wb,
                        ],
                      ),
                      40.hb,
                      Stack(children: [
                        RepaintBoundary(
                          key: _globalKey,
                          child: Signature(
                            controller: _signatureController,
                            width: 654.w,
                            height: 324.w,
                            backgroundColor: const Color(0xFFF6F6F6),
                          ),
                        ),
                        Offstage(
                            offstage: isMove,
                            child: GestureDetector(
                              onTap: () async {
                                isMove = true;
                                setState(() {});
                              },
                              child: Container(
                                  padding:
                                      EdgeInsets.only(left: 240.w, top: 140.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 19.8.w,
                                        height: 19.8.w,
                                        child: Image.asset(
                                          Assets.icons.pan.path,
                                          fit: BoxFit.fill,
                                          color: const Color(0xFF979797),
                                        ),
                                      ),
                                      Text(
                                        '在此处手写您的姓名',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                                color: const Color(0xFF999999)),
                                      ),
                                    ],
                                  )),
                            )),
                      ]),
                      27.hb,
                      Container(
                        width: double.infinity,
                        height: 72.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 285.w, vertical: 11.w),
                        margin: EdgeInsets.symmetric(horizontal: 32.w),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [0.0, 1.0],
                                colors: [Color(0xFF027AFF), Color(0xFF0593FF)]),
                            borderRadius: BorderRadius.circular(8.w)),
                        child: GestureDetector(
                          onTap: () {
                            checkPermission(saveAssetsImage());
                            Get.to(() => const SuccessfulPage());
                          },
                          child: Text(
                            '立即签订',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(color: kForeGroundColor),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
      text: '立即签订',
    );
  }

  ///动态申请权限，iOS 要在info.plist 上面添加
  Future<bool> requestPermission() async {
    if (Platform.isIOS) {
      var status = await Permission.photos.status;
      if (status.isDenied) {
        await [Permission.photos].request();
      }
      return status.isGranted;
    } else {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        await [Permission.photos].request();
      }
      return status.isGranted;
    }
  }

  ///保存图片到的权限校验
  checkPermission(Future<dynamic> fun) {
    requestPermission().then((value) => {
          if (value)
            {
              //执行操作
              fun
            }
          else
            {
              //去授权  储存权限
              openAppSettings()
            }
        });
  }

  ///保存APP里的图片
  saveAssetsImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result = await ImageGallerySaver.saveImage(
          byteData.buffer.asUint8List(),
          quality: 100);
      if (result['isSuccess']) {
        CloudToast.show('邀请码已保存到${result['filePath']}',
            align: Alignment.center);
      }
    }
  }

//测试
  // _aa() {
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: const EdgeInsets.all(100),
  //     decoration: const BoxDecoration(color: Colors.red),
  //     child: Text(
  //       'data',
  //       style: TextStyle(fontSize: 100.sp),
  //     ),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}

class Button {
  Button(Null Function() param0);
}

void column() {}
