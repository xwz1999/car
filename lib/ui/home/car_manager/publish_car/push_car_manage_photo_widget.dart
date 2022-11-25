import 'package:cloud_car/model/contract/report_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/new_push_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_manage_photo_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PushCarManagePhotoWidget extends StatefulWidget {
  final PushPhotoModel model;
  final ReportPhotoModel reportPhotoModel;
  final NewPublishCarInfo newPublishCarInfo;
  const PushCarManagePhotoWidget({super.key, required this.model, required this.reportPhotoModel, required this.newPublishCarInfo});

  @override
  _PushCarManagePhotoWidgetState createState() => _PushCarManagePhotoWidgetState();
}

class _PushCarManagePhotoWidgetState extends State<PushCarManagePhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: [
        _buildChild(
          _titles[0],
          0,
        ),
        _buildChild(
          _titles[1],
          1,
        ),
        _buildChild(
          _titles[2],
          2,
        ),
        _buildChild(
          _titles[3],
          3,
        ),
        _buildChild(
          _titles[4],
          4,
        ),
      ],
    );
  }

  final List<String> _titles = ['车辆照片', '内饰照片', '缺陷照片','报告数据','维保数据'];

  Widget _buildChild(
    String bottom,
    int index,
  ) {
    List<CarPhotos> photos = [];
    int length = 0;
    String firstPhoto = '';
    switch (index) {
      case 0:
        photos = widget.model.carPhotos??[];
        break;
      case 1:
        photos = widget.model.interiorPhotos??[];
        break;
      case 2:
        photos = widget.model.defectPhotos??[];
        break;
      case 3:
        photos = widget.reportPhotoModel.paints??[];
        break;
      case 4:
        photos = widget.model.repairPhotos??[];
        break;

    }

    for(int i=0;i<photos.length;i++){
      if(photos[i].photo!=null){
        firstPhoto = photos[i].photo!;
        length++;
      }
    }

    return GestureDetector(
      onTap: () async {
        await Get.to(
          PushCarManagePhotoPage(
            tabs: _titles,
            model: widget.model,
            initIndex: index,
            reportPhotoModel: widget.reportPhotoModel, newPublishCarInfo: widget.newPublishCarInfo,
          ),
        );
        setState(() {});
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            length==0
                ? Container(
                    width: 210.w,
                    height: 158.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.addcar.path) ,
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
                          urls: [firstPhoto],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 66.w,
                          height: 36.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.w),
                              bottomRight: Radius.circular(16.w),
                            ),
                          ),
                          child: Text(
                            '$length张',
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
            bottom.text.size(32.sp).color(const Color(0xFF110000)).make(),
          ],
        ),
      ),
    );
  }

}
