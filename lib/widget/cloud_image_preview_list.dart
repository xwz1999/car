import 'dart:io';

import 'package:cloud_car/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../gen/assets.gen.dart';

///图片点击放大预览
class CloudImagePreviewList extends StatefulWidget {
  static Future<T?> toFile<T>({required List<File> file,required int index,}) async {
    return await navigator!.push(
      PageRouteBuilder(
        opaque: false,
        fullscreenDialog: true,
        pageBuilder: (context, animation, secondAnimation) {
          return FadeTransition(
            opacity: animation,
            child: CloudImagePreviewList.file(
              file: file, index: index,
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  static toPath({
    required List<String>? path,required int index,
  }) {
    navigator!.push(
      PageRouteBuilder(
        opaque: false,
        fullscreenDialog: true,
        pageBuilder: (context, animation, secondAnimation) {
          return CloudImagePreviewList.path(path: path, index: index,);
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

  final List<File>? file;
  final List<String>? path;
  final int index;


  const CloudImagePreviewList.file({
    super.key,
    required this.file,
    required this.index,
  }) : path = null;

  const CloudImagePreviewList.path({
    super.key,
    required this.path,
    required this.index,
  }) : file = null;

  @override
  _CloudImagePreviewListState createState() => _CloudImagePreviewListState();
}

class _CloudImagePreviewListState extends State<CloudImagePreviewList> {

  late PageController stringPageController;
  late PageController filePageController;

  @override
  void initState() {
    super.initState();
    stringPageController = PageController(initialPage: widget.index);

    filePageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    super.dispose();
    stringPageController.dispose();
    filePageController.dispose();
  }

  Widget get  image {
    if (widget.file == null) {
      return PageView(
        scrollDirection: Axis.horizontal,
        controller: stringPageController,
        children: widget.path!
            .mapIndexed((currentValue, index) => Hero(
                  tag: widget.path![index],
                  child: FadeInImage.assetNetwork(
                    placeholder: Assets.images.placeholder.path,
                    image: widget.path![index].imageWithHost,
                    imageErrorBuilder: (context, obj, stackTrace) {
                      return Image.asset(
                        Assets.images.placeholder.path,
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ))
            .toList(),
      );
    } else {
      return PageView(
        scrollDirection: Axis.horizontal,
        controller: filePageController,
        children: widget.file!
            .mapIndexed((currentValue, index) => Hero(
              tag: widget.file.hashCode,
              child: Image.file(widget.file![index]),
        ))
            .toList(),
      );
    }

    //   if (widget.file == null) {
    //     Hero(
    //     tag:  widget.path!,
    //     child: FadeInImage.assetNetwork(
    //       placeholder: Assets.images.placeholder.path,
    //       image: widget.path.imageWithHost,
    //       imageErrorBuilder: (context, obj, stackTrace) {
    //         return Image.asset(
    //           Assets.images.placeholder.path,
    //           fit: BoxFit.fill,
    //         );
    //       },
    //     ),
    //   );
    // } else {
    //   return Hero(
    //     tag: widget.file.hashCode,
    //     child: Image.file(widget.file!),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: InteractiveViewer(
          //boundaryMargin: const EdgeInsets.all(48),
          minScale: 0.2,
          maxScale: 10,
          child: Center(child: image),
        ),
      ),
    );
  }
}
