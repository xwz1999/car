// Dart imports:


// Package imports:
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_image_preview.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class MultiImagePickWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final Function(List<dynamic> files) onChanged;
  final String description;
  final int? maxCount;
  final double? spacing;
  final List<dynamic> photos;

  const MultiImagePickWidget(
      {super.key,
      this.width,
      this.height,
      required this.onChanged,
      this.description = '上传照片',
      this.maxCount,
      this.spacing,
      this.photos = const []});

  @override
  _MultiImagePickWidgetState createState() => _MultiImagePickWidgetState();
}

class _MultiImagePickWidgetState extends State<MultiImagePickWidget> {
  List<dynamic> _files = [];

  @override
  void initState() {
    if (widget.photos.isNotEmpty) {
      _files = widget.photos;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      spacing: widget.spacing ?? 10.w,
      runSpacing: widget.spacing ?? 10.w,
      children: [
        ..._files.mapIndexed((e, index) => showImage(e, index)).toList(),
        Offstage(
          offstage:
              widget.maxCount != null && _files.length >= widget.maxCount!,
          child: GestureDetector(
            onTap: () async {
              var value =
                  await CloudImagePicker.pickMultiAndSingleImage(title: '选择图片');
              for (var item in value) {
                _files.add(item);
              }
              widget.onChanged(_files);
              setState(() {});
            },
            child: DottedBorder(
              color: Colors.black.withOpacity(0.25),
              borderType: BorderType.RRect,
              strokeWidth: 2.w,
              dashPattern: const [6, 3],
              radius: Radius.circular(8.w),
              child: SizedBox(
                width: widget.width != null ? widget.width! - 10.w : 160.w,
                height: widget.height != null ? widget.height! - 10.w : 160.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.icons.camera.path,
                      width: 60.w,
                      height: 60.w,
                      color: const Color(0xFF999999),
                    ),
                    4.w.heightBox,
                    widget.description.text
                        .color(Colors.black.withOpacity(0.45))
                        .size(22.sp)
                        .make(),
                  ],
                ),
              ),
            ).material(color: Colors.transparent),
          ),
        )
      ],
    );
  }

  Widget showImage(dynamic file, int index) {
    return Draggable(
      data: index,
      childWhenDragging: Container(
        width: widget.width ?? 160.w,
        height: widget.height ?? 160.w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: Colors.black.withOpacity(0.03)),
      ),
      feedback: Container(
        width: (widget.width ?? 160.w) * 0.8,
        height: (widget.height ?? 160.w) * 0.8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: Colors.black.withOpacity(0.03)),
        child: image(file),
      ),
      child: DragTarget(
        onWillAccept: (acceptIndex) => true,
        onAccept: (int acceptIndex) {
          var place = _files[index];
          _files[index] = _files[acceptIndex];
          _files[acceptIndex] = place;
          widget.onChanged(_files);
          setState(() {});
        },
        builder: (context, cdata, rdata) {
          return Stack(children: [
            GestureDetector(
              onLongPress: () async {
                await Get.bottomSheet(CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () async {
                        var value =
                           await CloudImagePicker.pickSingleImage(title: '选择图片');
                        _files.removeAt(index);
                        _files.insert(index, value);
                        Get.back();
                        setState(() {});
                      },
                      child: Text(
                        '替换',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.sp),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        _files.removeAt(index);
                        Get.back();
                        setState(() {});
                      },
                      child: Text(
                        '删除',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.sp),
                      ),
                    )
                  ],
                ));
              },
              onTap: () async {
                if (file.runtimeType == String) {
                  await CloudImagePreview.toPath(path: file);
                } else {
                  await CloudImagePreview.toFile(file: file);
                }
              },
              child: Container(
                width: widget.width ?? 160.w,
                height: widget.height ?? 160.w,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                    color: Colors.black.withOpacity(0.03)),
                child: image(file),
              ),
            ),
            // Positioned(
            //   top: 0.w,
            //   right: 0.w,
            //   child: Container(
            //     width: 40.w,
            //     height: 40.w,
            //     child: Icon(
            //       CupertinoIcons.xmark,
            //       size: 20.w,
            //       color: Colors.white,
            //     ),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20.w),
            //       color: const Color(0xFF000000),
            //     ),
            //   ).onTap(() {
            //     _files.remove(file);
            //     widget.onChanged(_files);
            //     setState(() {});
            //   }),
            // )
          ]);
        },
      ),
    );
  }

  Widget image(dynamic file) {
    return file.runtimeType == String
        ? CloudImageNetworkWidget(
            width: widget.width ?? 100.w,
            height: widget.height ?? 100.w,
            urls: [file],
          )
        : Image.file(
            file,
            fit: BoxFit.fill,
            width: widget.width ?? 100.w,
            height: widget.height ?? 100.w,
          );
  }
}
