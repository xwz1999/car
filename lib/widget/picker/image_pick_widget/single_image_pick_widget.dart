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

class SingleImagePickWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final Function(List<File> files) onChanged;
  final Widget imageView;
  final List<File>? files;
  const SingleImagePickWidget(
      {super.key,
      this.width,
      this.height,
        required this.files,
      required this.onChanged,
        required this.imageView,});

  @override
  _SingleImagePickWidgetState createState() => _SingleImagePickWidgetState();
}

class _SingleImagePickWidgetState extends State<SingleImagePickWidget> {
  late List<File> _files;


  @override
  void initState() {
    super.initState();
    widget.files==null?_files=[]:_files=widget.files!;
  }

  // List<File> get _files{
  //   if(widget.files!=null){
  //     return widget.files!;
  //   }else{
  //     return _files;
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var value = await CloudImagePicker.pickSingleImage(title: '选择图片');
        //print(value);
        _files.add(value!);
        //print(_files.length);
        widget.onChanged(_files);
        setState(() {});
      },
      child: _files.isEmpty? DottedBorder(
        color: Colors.black.withOpacity(0.25),
        borderType: BorderType.RRect,
        strokeWidth: 2.w,
        dashPattern: const [6, 3],
        radius: Radius.circular(8.w),
        child: SizedBox(
          width: widget.width!=null?widget.width!-10.w:160.w,
          height: widget.height!=null?widget.height!-10.w:160.w,
          child: widget.imageView,
        ),
      ).material(color: Colors.transparent):showImage(_files.first),
    );
  }




  Widget showImage(File file) {
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
            fit: BoxFit.fill,
            width: widget.width ?? 100.w,
            height: widget.height ?? 100.w,
          ),
        ),
      ),
      Positioned(
        top: 0.w,
        right: 0.w,
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            color: const Color(0xFF000000),
          ),
          child: Icon(
            CupertinoIcons.xmark,
            size: 20.w,
            color: Colors.white,
          ),
        ).onTap(() {
          _files.clear();
          // widget.onChanged(_files.first);
          setState(() {});
        }),
      )
    ]);
  }
}
