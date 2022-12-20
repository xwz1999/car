import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/car/new_car_info.dart';
import '../../model/contract/report_photo_model.dart';
import '../../widget/alert.dart';
import '../../widget/button/cloud_back_button.dart';
import '../../widget/cloud_image_network_widget.dart';
import '../home/car_manager/publish_car/push_car_manage_photo_page.dart';
import '../home/car_manager/publish_car/push_photo_model.dart';
import '../home/func/car_func.dart';
import '../user/user_order/status.dart';

class ExaminationDetails extends StatefulWidget {
  ///审批状态  1出售，2修改 3发布  4 收购
  final int state;

  ///审核状态
  final int auditState;

  ///驳回理由
  final String reasonText;

  const ExaminationDetails({
    Key? key,
    required this.state,
    required this.auditState,
    required this.reasonText,
  }) : super(key: key);

  @override
  _ExaminationDetailsState createState() => _ExaminationDetailsState();
}

class _ExaminationDetailsState extends State<ExaminationDetails> {
  List<CarPhotos> carPhotos = [];
  List<CarPhotos> dataPhotos=[];
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
  void initState(){
    Future.delayed(const Duration(seconds: 0),(){
      _refresh();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text(
          ReminderApprovalType.getValue(widget.state).typeStr,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      body: ListView(
        children: [
          _gexFramework(
              Column(
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
              Expanded(child:  SizedBox(
                // color: Colors.white,
                // width: ,
                child:  GridView.count(
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
          ),750,350),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: const Color(0xFFEEEEEE)),
            color: Colors.white),
        height: widget.reasonText == '' ? 160.w : 200.w, //double.infinity,
        child: getBottomState(),
      ),
    );
  }
  final List<String> _titles = ['车辆照片','报告数据'];
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
            isSelf: true,///widget.carListModel.isSelf == 1,
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
                  height: 180.w,
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

  _gexFramework(Widget? child,int width,int height) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      width: width.w,
      height: height.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: child,
    );
  }

  getBottomState() {
    switch (widget.state) {

      ///出售申请
      case 1:
        return widget.auditState == 1

            ///1待审核 2已审核
            ? Row(
                children: [
                  getContact(),
                  28.wb,
                  Expanded(
                      child: Row(
                    children: [
                      getBox('驳回', Colors.white, 2, const Color(0xFF027AFF),
                          const Color(0xFF027AFF), () {
                        Alert.show(
                            context,
                            NormalContentDialog(
                              type: NormalTextDialogType.delete,
                              title: '驳回理由',
                              content: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.w)),
                                child: const TextField(
                                  maxLines: null,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    hintText: '请输入',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              items: const ['取消'],
                              deleteItem: '确定',
                              //监听器
                              listener: (index) {
                                Alert.dismiss(context);
                              },
                              deleteListener: () {
                                Alert.dismiss(context);
                              },
                            ));
                      }),
                      16.wb,
                      getBox('通过', const Color(0xFF027AFF), 0, Colors.white,
                          Colors.white, () {}),
                    ],
                  )),
                ],
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.reasonText == '' ? 32.hb : 0.hb,
                    Row(
                      children: [
                        getContact(),
                        const Spacer(),
                        Text(
                          widget.reasonText == '' ? "已同意" : '已驳回',
                          style: TextStyle(
                              color: widget.reasonText == ''
                                  ? const Color(0xFF027AFF)
                                  : const Color(0xFFFF3B02),
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    8.hb,
                    widget.reasonText == ''
                        ? const SizedBox()
                        : Flexible(
                            child: Text(
                              '驳回理由:${widget.reasonText}',
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                    // : Row(
                    //     children: [
                    //       Text(
                    //         '驳回理由:',
                    //         style: TextStyle(
                    //             fontSize: 28.sp,
                    //             color: const Color(0xFF333333),
                    //             fontWeight: FontWeight.w600),
                    //       ),
                    //
                    //     ],
                    //   )
                  ],
                ),
              );
    }
  }

  getContact() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: 64.w,
            height: 64.w,
            child: Image.asset(Assets.images.imgPhone.path),
          ),
          18.wb,
          Text(
            '联系TA',
            style: TextStyle(
              fontSize: 24.sp,
            ),
          )
        ],
      ),
    );
  }

  getBox(String text, Color bgColor, int bWidth, Color bColor, Color tColor,
      VoidCallback ontap) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: 240.w,
        height: 72.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: bgColor,
          border: Border.all(width: bWidth.w, color: bColor),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 28.w, color: tColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
