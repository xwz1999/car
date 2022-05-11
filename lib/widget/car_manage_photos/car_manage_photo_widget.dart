import 'package:cloud_car/model/car/inner_model/car_manage_photo_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/car_manage_photos/car_manage_photo_page.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CarManagePhotoWidget extends StatelessWidget {
  final CarManagePhotoModel model;

  CarManagePhotoWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: [
        _buildChild(_titles[0], 0, model.carPhotos),
        _buildChild(_titles[1], 1, model.interiorPhotos),
        _buildChild(_titles[2], 2, model.defectPhotos),
        _buildChild(_titles[3], 3, model.dataPhotos),
      ],
    );
  }

  final List<String> _titles = ['车辆照片', '内饰照片', '缺陷照片', '资料照片'];

  Widget _buildChild(String bottom, int index, List<String> photos) {
    return GestureDetector(
      onTap: () {
        Get.to(
          CarManagePhotoPage(
            tabs: _titles,
            model: model,
            initIndex: index,
          ),
        );
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            photos.isEmpty
                ? Container(
                    width: 210.w,
                    height: 158.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Assets.images.addcar,
                      ),
                    ),
                  )
                : Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      Container(
                        width: 210.w,
                        height: 158.w,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.w),
                        ),
                        child: CloudImageNetworkWidget(
                          urls: [photos.first],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 66.w,
                          height: 36.w,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.w),
                              bottomRight: Radius.circular(16.w),
                            ),
                          ),
                          child: Text(
                            photos.length.toString() + '张',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            10.hb,
            bottom.text.size(28.sp).black.bold.make(),
          ],
        ),
      ),
    );
  }
}
