// Dart imports:
import 'dart:io';

// Package imports:
import 'package:cloud_car/widget/cloud_image_preview.dart';
import 'package:cloud_car/widget/picker/cloud_image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../gen/assets.gen.dart';

class MultiImagePickWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final Function(List<File> files) onChanged;
  final String description;
  final int? maxCount;
  final double? spacing;

  const MultiImagePickWidget(
      {Key? key,
      this.width,
      this.height,
      required this.onChanged,
      this.description = '上传照片',
      this.maxCount,
      this.spacing})
      : super(key: key);

  @override
  _MultiImagePickWidgetState createState() => _MultiImagePickWidgetState();
}

class _MultiImagePickWidgetState extends State<MultiImagePickWidget> {
  final List<File> _files = [];

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
              await CloudImagePicker.pickMultiImage(title: '选择图片').then(
                (value) {
                  _files.addAll(value);
                },
              );
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
                width: widget.width ?? 160.w,
                height: widget.height ?? 160.w,
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

  Widget showImage(File file, int index) {
    return Draggable(
      data: index,
      childWhenDragging: Container(
        width: widget.width ?? 100.w,
        height: widget.height ?? 100.w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: Colors.black.withOpacity(0.03)),
      ),
      feedback: Container(
        width: widget.width ?? 100.w,
        height: widget.height ?? 100.w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: Colors.black.withOpacity(0.03)),
        child: Image.file(
          file,
          fit: BoxFit.cover,
        ),
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
              onTap: () async {
                await CloudImagePreview.toFile(file: file);
              },
              child: Container(
                width: widget.width ?? 160.w,
                height: widget.height ?? 160.w,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                    color: Colors.black.withOpacity(0.03)),
                child: Image.file(
                  file,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0.w,
              right: 0.w,
              child: Container(
                width: 40.w,
                height: 40.w,
                child: Icon(
                  CupertinoIcons.xmark,
                  size: 20.w,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: const Color(0xFF000000),
                ),
              ).onTap(() {
                _files.remove(file);
                widget.onChanged(_files);
                setState(() {});
              }),
            )
          ]);
        },
      ),
    );
  }
}
