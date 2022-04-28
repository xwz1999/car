import 'dart:io';
import 'package:cloud_car/extensions/num_ext.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class CloudImagePicker {
  static Future<List<File>> pickMultiImage(
      {required String title,
      double maxWidth = 1000,
      double maxHeight = 1000}) async {
    List<XFile>? _files = [];
    _files = await ImagePicker().pickMultiImage();
    if (_files == null) {
      return <File>[];
    } else {
      return _files.map((e) => File(e.path)).toList();
    }
  }

  static Future<List<File>> pickMultiAndSingleImage(
      {required String title,
      double maxWidth = 1000,
      double maxHeight = 1000}) async {
    List<XFile>? _files = [];
    // _files = await ImagePicker().pickMultiImage();

    _files = await Get.bottomSheet(CupertinoActionSheet(
      title: title.text.isIntrinsic.make(),
      actions: [
        CupertinoDialogAction(
          onPressed: () async {
            await ImagePicker().pickMultiImage().then((value) {
              if (value != null) {
                Get.back(
                  result: value,
                );
              }
            });
          },
          child: Row(
            children: [
              const Icon(CupertinoIcons.photo),
              30.wb,
              '相册(长按图片多选)'.text.isIntrinsic.make(),
            ],
          ),
        ),
        CupertinoDialogAction(
          onPressed: () async {
            await ImagePicker()
                .pickImage(
              source: ImageSource.camera,
              maxHeight: maxHeight,
              maxWidth: maxWidth,
            )
                .then((value) {
              if (value != null) {
                XFile _pickFile = value;
                List<XFile> _files = [];
                _files.add(_pickFile);
                Get.back(
                  result: _files,
                );
              }
            });
          },
          child: Row(
            children: [
              const Icon(CupertinoIcons.camera),
              30.wb,
              '相机'.text.isIntrinsic.make(),
            ],
          ),
        ),
      ],
      cancelButton: CupertinoDialogAction(
        onPressed: Get.back,
        child: '取消'.text.isIntrinsic.make(),
      ),
    ));
    if (_files == null) {
      return <File>[];
    } else {
      return _files.map((e) => File(e.path)).toList();
    }
  }

  static Future<File?> pickSingleImage(
      {required String title,
      double maxWidth = 1000,
      double maxHeight = 1000}) async {
    XFile? xFile = await Get.bottomSheet(CupertinoActionSheet(
      title: title.text.isIntrinsic.make(),
      actions: [
        CupertinoDialogAction(
            onPressed: () async {
              await ImagePicker()
                  .pickImage(
                source: ImageSource.gallery,
                maxHeight: maxHeight,
                maxWidth: maxWidth,
              )
                  .then((value) {
                Get.back(
                  result: value,
                );
              });
            },
            child: Row(
              children: [
                const Icon(CupertinoIcons.photo),
                30.wb,
                '相册'.text.isIntrinsic.make(),
              ],
            )),
        CupertinoDialogAction(
            onPressed: () async {
              await ImagePicker()
                  .pickImage(
                source: ImageSource.camera,
                maxHeight: maxHeight,
                maxWidth: maxWidth,
              )
                  .then((value) {
                Get.back(
                  result: value,
                );
              });
            },
            child: Row(
              children: [
                const Icon(CupertinoIcons.camera),
                30.wb,
                '相机'.text.isIntrinsic.make(),
              ],
            )),
      ],
      cancelButton: CupertinoDialogAction(
        onPressed: Get.back,
        child: '取消'.text.isIntrinsic.make(),
      ),
    ));
    if (xFile != null) {
      return File(xFile.path);
    } else {
      return null;
    }
  }
}
