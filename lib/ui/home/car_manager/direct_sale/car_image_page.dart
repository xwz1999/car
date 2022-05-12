// ignore_for_file: unused_field

import 'dart:io';

// import 'package:cloud_car/model/order/Sale_info.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/picker/image_pick_widget/multi_image_pick_widget.dart';
import 'package:flutter/material.dart';

typedef ImageBack = Function(List<File> image);

class CarImageItem extends StatefulWidget {
  final ImageBack imageBack;
  const CarImageItem({
    Key? key,
    required this.imageBack,
  }) : super(key: key);

  @override
  _CarImageItemState createState() => _CarImageItemState();
}

class _CarImageItemState extends State<CarImageItem> {
  List<File> _files = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(32.w),
      child: MultiImagePickWidget(
          width: 216.w,
          height: 160.w,
          spacing: 15.w,
          onChanged: (files) {
            _files = files;
            print("aaaa+$_files");
            widget.imageBack(_files);
          }),
      // GridView.builder(
      //     physics: const NeverScrollableScrollPhysics(),
      //     shrinkWrap: true,
      //     padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 24.w),
      //     itemCount: 4,
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       //横轴元素个数
      //         crossAxisCount: 3,
      //         //纵轴间距
      //         mainAxisSpacing: 10,
      //         //横轴间距
      //         crossAxisSpacing: 20,
      //         //子组件宽高长度比例
      //         childAspectRatio: 2/2),
      //     itemBuilder: (BuildContext context, int index) {
      //       return getItem(Assets.images.carBanner.path,15,'车辆照片');
      //     }),
    );
  }

  getItem(String path, int number, String name) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  path,
                  fit: BoxFit.fitHeight,
                  // height: double.infinity,
                  // width: double.infinity,
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
                      child: Text(
                        '$number张',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ))
              ],
            ),
          ),
          16.hb,
          Text(
            name,
            style: TextStyle(color: const Color(0xFF110000), fontSize: 28.sp),
          ),
        ],
      ),
    );
  }
}
