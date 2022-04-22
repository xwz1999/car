import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_car/constants/const_data.dart';
import 'package:cloud_car/model/poster/poster_list_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class PosterEditPage extends StatefulWidget {
  final PosterListModel model;

  const PosterEditPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _PosterEditPageState createState() => _PosterEditPageState();
}

class _PosterEditPageState extends State<PosterEditPage> {
  final ScreenshotController _screenshotController = ScreenshotController();

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const CloudBackButton(
          color: Colors.white,
        ),
        title: const Text(
          '海报编辑',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          _posterWidget(),
          44.hb,
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () async {
                  var u8List = await _screenshotController.capture(
                      delay: const Duration(milliseconds: 10));
                  if (u8List != null) {
                    await fluwx.shareToWeChat(fluwx.WeChatShareImageModel(
                        fluwx.WeChatImage.binary(u8List)));
                  } else {
                    CloudToast.show('海报生成失败');
                  }
                },
                child: Column(
                  children: [
                    Assets.icons.icShareWx.image(width: 96.w, height: 96.w),
                    16.hb,
                    '微信'.text.size(24.sp).color(Colors.white).make(),
                  ],
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () async {
                  var u8List = await _screenshotController.capture(
                      delay: const Duration(milliseconds: 10));
                  if (u8List != null) {
                    await fluwx.shareToWeChat(
                      fluwx.WeChatShareImageModel(
                          fluwx.WeChatImage.binary(u8List),
                          scene: fluwx.WeChatScene.TIMELINE),
                    );
                  } else {
                    CloudToast.show('海报生成失败');
                  }
                },
                child: Column(
                  children: [
                    Assets.icons.icShareWxCircle
                        .image(width: 96.w, height: 96.w),
                    16.hb,
                    '朋友圈'.text.size(24.sp).color(Colors.white).make(),
                  ],
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () async {
                  var permission = await Permission.storage.isGranted;
                  if (!permission) {
                    await Permission.storage.request();
                    var permissionTwice = await Permission.storage.isGranted;
                    if (!permissionTwice) {
                      CloudToast.show('权限未授予');
                      return;
                    }
                  }
                  var u8List = await _screenshotController.capture(
                      delay: const Duration(milliseconds: 10));
                  if (u8List != null) {
                    var re = await ImageGallerySaver.saveImage(
                      u8List,
                      quality: 100,
                    );
                    if (re['isSuccess']) {
                      CloudToast.show('海报已保存到${re['filePath']}',
                          align: Alignment.center);
                    } else {
                      CloudToast.show('保存海报失败');
                    }
                  } else {
                    CloudToast.show('海报生成失败');
                  }
                },
                child: Column(
                  children: [
                    Assets.icons.icShareDowload
                        .image(width: 96.w, height: 96.w),
                    16.hb,
                    '下载'.text.size(24.sp).color(Colors.white).make(),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }

  Widget _posterWidget() {
    return Screenshot(
      controller: _screenshotController,
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 1100.w),
            margin: EdgeInsets.symmetric(
              vertical: 32.w,
              horizontal: 64.w,
            ),
            child: CloudImageNetworkWidget(
              width: double.infinity,
              height: double.infinity,
              urls: [widget.model.path],
            ),
          ),
          Positioned(
              top: double.parse(widget.model.axisY),
              left: double.parse(widget.model.axisX),
              child: Container(
                padding: EdgeInsets.all(4.w),
                color: Colors.white,
                child: BarcodeWidget(
                    width: double.parse(widget.model.size),
                    height: double.parse(widget.model.size),
                    data:
                        '$posterCodePrefix?inviteCode=${UserTool.userProvider.userInfo.inviteCode}',
                    barcode: Barcode.qrCode()),
              ))
        ],
      ),
    );
  }
}
