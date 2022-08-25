import 'dart:typed_data';

import 'package:cloud_car/constants/const_data.dart';
import 'package:cloud_car/constants/environment/environment.dart';
import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ShareUtil {
  ///分享图片
  static Future shareNetWorkImage(String imgUrl,
      {fluwx.WeChatScene scene = fluwx.WeChatScene.SESSION}) async {
    var data = await getNetworkImageData(imgUrl.imageWithHost);
    if (data == null) {
      CloudToast.show('图片不存在');
      return;
    } else {
      var re = await fluwx.shareToWeChat(
        fluwx.WeChatShareImageModel(
          fluwx.WeChatImage.binary(data),
          scene: fluwx.WeChatScene.SESSION,
        ),
      );
      if (!re) {
        CloudToast.show('分享失败');
      }
    }
  }

  ///分享web链接
  static Future shareWebPage(String webUrl,
      {fluwx.WeChatScene scene = fluwx.WeChatScene.SESSION,
      String? image}) async {
    var re = await fluwx.shareToWeChat(
      fluwx.WeChatShareWebPageModel(
        webUrl,
        thumbnail: fluwx.WeChatImage.network(image.imageWithHost),
        compressThumbnail: true,
        scene: fluwx.WeChatScene.SESSION,
      ),
    );
    if (!re) {
      CloudToast.show('分享失败');
    }
  }

  ///分享跳转小程序链接
  static Future shareMiniProgram(String imgUrl, int carId) async {
    var data = await getNetworkImageData(imgUrl.imageWithHost);
    if (data == null) {
      CloudToast.show('图片不存在');
      return;
    }
    if (data.length > 128000) {
      data = await compressImageList(data);
    }
    var re = await fluwx.shareToWeChat(
      fluwx.WeChatShareMiniProgramModel(
        userName: wxOriginId,//小程序 原始id 并非appid
        path: 'pages/index/carBuying/secHandCar/carDetail/index/index?carId=$carId',
        webPageUrl: 'https://h5wenche.oa00.com/register',
        thumbnail: fluwx.WeChatImage.binary(data),
        compressThumbnail: false,
        miniProgramType: AppENV.instance.env == ENVConfig.release
            ? fluwx.WXMiniProgramType.RELEASE
            : fluwx.WXMiniProgramType.PREVIEW,
      ),
    );
    if (!re) {
      CloudToast.show('分享失败');
    }
  }

  static Future saveNetImageToGallery(String url) async {
    var data = await getNetworkImageData(url.imageWithHost);
    if (data == null) {
      CloudToast.show('下载图片失败');
    } else {
      var re = await ImageGallerySaver.saveImage(data);
      if (re['isSuccess']) {
        CloudToast.show('已保存到${re['filePath']}', align: Alignment.center);
      } else {
        CloudToast.show('图片保存失败');
      }
    }
  }

  static copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    CloudToast.show('已复制到粘贴板');
  }

  /// 压缩图片
  static Future<Uint8List> compressImageList(Uint8List data) async {
    var result = await FlutterImageCompress.compressWithList(
      data,
      minHeight: 300,
      minWidth: 500,
      quality: 96,
    );
    if (result.length > 128000) {
      result = await compressImageList(result);
    }
    return result;
  }
}
