import 'package:cloud_car/utils/headers.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/car/new_car_info.dart';
import '../../model/contract/report_photo_model.dart';
import '../../utils/drop_down_body.dart';
import '../../widget/cloud_image_network_widget.dart';
import '../home/car_manager/publish_car/push_car_manage_photo_page.dart';
import '../home/car_manager/publish_car/push_photo_model.dart';
import '../home/func/car_func.dart';

///收购
class AcquisitionWidget extends StatefulWidget {
  // final int state;///1出售，2修改 3发布  4 收购
  const AcquisitionWidget({Key? key}) : super(key: key);

  @override
  _AcquisitionWidgetState createState() => _AcquisitionWidgetState();
}

class _AcquisitionWidgetState extends State<AcquisitionWidget> {
  List<CarPhotos> carPhotos = [];
  List<CarPhotos> dataPhotos = [];
  List<ImagePhoto> bannerList = [];
  late PushPhotoModel pushPhotoModel;
  late ReportPhotoModel reportPhotoModel;
  int collect = 0;
  NewCarInfo? carInfoModel;

  _refresh() async {
    carInfoModel = await CarFunc.getNewCarInfo(76);
    // print(carInfoModel!.carInfo);
    collect = carInfoModel?.carInfo.collect ?? 0;
    for (var item in carInfoModel!.carInfo.carPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        carPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        bannerList.add(item);
      }
    }

    // for (var item in carInfoModel!.carInfo.dataPhotos) {
    //   if (item.photo.isNotEmpty && item.text.isNotEmpty) {
    //     repairPhotos.add(CarPhotos(photo: item.photo, text: item.text));
    //   }
    // }
    for (var item in carInfoModel!.carInfo.dataPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        dataPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }
    // for (int i = 0; i < carInfoModel!.carInfo.dataPhotos.length; i++) {
    //   for (int j = 0; j < dataPhotos.length; j++) {
    //     if (dataPhotos[j].text ==
    //         carInfoModel!.carInfo.dataPhotos[i].text) {
    //       if (carInfoModel!.carInfo.dataPhotos[i].photo != '') {
    //         dataPhotos[j].photo =
    //             carInfoModel!.carInfo.dataPhotos[i].photo;
    //       } else {
    //         dataPhotos.removeAt(j);
    //       }
    //     }
    //   }
    // }
    // for (int i = 0; i < carInfoModel!.carInfo.reportPhotos.length; i++) {
    //   for (int j = 0; j < _reportPhotos.length; j++) {
    //     if (_reportPhotos[j].text ==
    //         carInfoModel!.carInfo.reportPhotos[i].text) {
    //       if (carInfoModel!.carInfo.reportPhotos[i].photo != '') {
    //         _reportPhotos[j].photo =
    //             carInfoModel!.carInfo.reportPhotos[i].photo;
    //       } else {
    //         _reportPhotos.removeAt(j);
    //       }
    //     }
    //   }
    // }
    pushPhotoModel = PushPhotoModel(
      carPhotos: carPhotos,
      interiorPhotos: [],
      defectPhotos: [],
      dataPhotos: dataPhotos,
      // repairPhotos: repairPhotos,
    );

    reportPhotoModel = ReportPhotoModel(paints: dataPhotos);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      _refresh();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
          margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
          width: 750.w,
          height: 300.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '照片信息',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800),
              ),
              32.hb,
              Expanded(
                  child: SizedBox(
                // color: Colors.white,
                // width: ,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  children: [
                    _buildChild(
                      _titles[0],
                      0,
                    ),
                    _buildChild(
                      _titles[1],
                      1,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '价格信息',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            _getTitle('成交金额', '100000'),
            16.hb,
            _getTitle('定金金额', '10000'),
            16.hb,
            _getTitle('尾款金额', '90000'),
            16.hb,
            _getTitle('交付日期', '2022年12月15日'),
          ],
        )),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '收购方选择',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            _getTitle('收购方', '公司'),
            16.hb,
            _getTitle('名称', '云云问车一号店'),
          ],
        )),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '车主信息',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            _getTitle('车主身份', '公司'),
            16.hb,
            _getTitle('公司名称', '里斯'),
            16.hb,
            _getTitle('联系电话', '1333xxxxxxx'),
            16.hb,
            _getTitle('机构代码', '00114683'),
            16.hb,
            _getTitle('开户行', '中国银行'),
            16.hb,
            _getTitle('银行卡号', '99999999999999'),
          ],
        )),
        _gexFramework(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '备注',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w800),
            ),
            32.hb,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: const Color(0xFFF8F8F8)),
              child: Text('还不错',style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w700),),

            )
          ],
        )),
      ],
    );
  }

  _getTitle(String title, String text) {
    return Row(
      children: [
        SizedBox(
          width: 160.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
          ),
        ),
        Flexible(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 28.sp,
          ),
        ))
      ],
    );
  }

  _gexFramework(Widget? child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: child,
    );
  }

  final List<String> _titles = ['车辆照片', '报告数据'];

  Widget _buildChild(
    String bottom,
    int index,
  ) {
    List<CarPhotos> photos = [];
    int length = 0;
    String firstPhoto = '';
    switch (index) {
      case 0:
        photos = carPhotos;
        break;
      case 1:
        photos = dataPhotos;
        break;
      // case 4:
      //   photos = repairPhotos;
      //   break;
    }

    for (int i = 0; i < photos.length; i++) {
      if (photos[i].photo != null && photos[i].photo != '') {
        firstPhoto = photos[i].photo!;
        length++;
      }
    }
    return GestureDetector(
      onTap: () async {
        await Get.to(
          PushCarManagePhotoPage(
            isSelf: true,

            ///widget.carListModel.isSelf == 1,
            tabs: _titles,
            model: pushPhotoModel,
            initIndex: index,
            imgCanTap: false,
            // reportPhotoModel: reportPhotoModel,
            newPublishCarInfo: null,
          ),
        );
        setState(() {});
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            length == 0
                ? Container(
                    width: 210.w,
                    height: 158.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.addcar.path),
                      ),
                    ),
                  )
                : Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      Container(
                        width: 280.w,
                        height: 170.w,
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
            bottom.text.size(28.sp).black.bold.make(),
          ],
        ),
      ),
    );
  }
}
