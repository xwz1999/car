import 'dart:io';

import 'package:cloud_car/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';

///图片点击放大预览
class CloudImagePreview extends StatefulWidget {
  static Future<T?> toFile<T>({required File file, String? tag}) async {
    return await navigator!.push(
      PageRouteBuilder(
        opaque: false,
        fullscreenDialog: true,
        pageBuilder: (context, animation, secondAnimation) {
          return FadeTransition(
            opacity: animation,
            child: CloudImagePreview.file(file: file, tag: tag),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  static toPath({required String? path, String? tag}) {
    navigator!.push(
      PageRouteBuilder(
        opaque: false,
        fullscreenDialog: true,
        pageBuilder: (context, animation, secondAnimation) {
          return CloudImagePreview.path(path: path, tag: tag);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  final File? file;
  final String? path;
  final String? tag;

  const CloudImagePreview.file({super.key, required this.file, this.tag})
      : path = null;

  const CloudImagePreview.path({super.key, required this.path, this.tag})
      : file = null;

  @override
  _CloudImagePreviewState createState() => _CloudImagePreviewState();
}

class _CloudImagePreviewState extends State<CloudImagePreview> {
  Widget get image {
    if (widget.file == null) {
      return Hero(
        tag: widget.tag ?? widget.path!,
        child: FadeInImage.assetNetwork(
          placeholder: Assets.images.placeholder.path,
          image: widget.path.imageWithHost,
          imageErrorBuilder: (context, obj, stackTrace) {
            return Image.asset(
              Assets.images.placeholder.path,
              fit: BoxFit.fill,
            );
          },
        ),
      );
    } else {
      return Hero(
        tag: widget.tag ?? widget.file.hashCode,
        child: Image.file(widget.file!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(48),
          minScale: 0.2,
          maxScale: 10,
          child: Center(child: image),
        ),
      ),
    );
  }
}
