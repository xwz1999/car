
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_car_detail_item.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constants/enums.dart';
import '../../../../model/car/new_car_info.dart';
import '../../../../model/contract/report_photo_model.dart';
import '../../../../model/edit_add_model.dart';
import '../../../../widget/cloud_image_network_widget.dart';
import '../publish_car/push_photo_model.dart';
import 'car_photo_item.dart';

class EditCarPage extends StatefulWidget {
  final NewCarInfo carListModel;

  const EditCarPage({super.key, required this.carListModel});

  @override
  _EditCarPageState createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = [];
  TextEditingController vehicleCondition = TextEditingController();
  List<CarPhotos> carPhotos = [];
  List<CarPhotos> interiorPhotos = [];
  List<CarPhotos> defectPhotos = [];
  List<CarPhotos> dataPhotos = [];
  late PushPhotoModel pushPhotoModel;
  late ReportPhotoModel reportPhotoModel;

  @override
  void initState() {
    ///自己发布的 tab2个 否则1个
    // tabs = ['车辆图片', '基本信息', '车辆报告', '来源信息', '车主信息', '牌证信息', '价格信息'];
    tabs = [
      '车辆档案',
      '车况描述',
      '车辆图片',
    ];

    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    vehicleCondition.dispose();
    super.dispose();
  }

  _refresh() async {
    for (var item in widget.carListModel.carInfo.carPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        carPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }

    for (var item in widget.carListModel.carInfo.interiorPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        interiorPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }

    for (var item in widget.carListModel.carInfo.defectPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        defectPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }
    // for (var item in carInfoModel!.carInfo.dataPhotos) {
    //   if (item.photo.isNotEmpty && item.text.isNotEmpty) {
    //     repairPhotos.add(CarPhotos(photo: item.photo, text: item.text));
    //   }
    // }
    for (var item in widget.carListModel.carInfo.dataPhotos) {
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
      interiorPhotos: interiorPhotos,
      defectPhotos: defectPhotos,
      dataPhotos: dataPhotos,
      // repairPhotos: repairPhotos,
    );

    reportPhotoModel = ReportPhotoModel(paints: dataPhotos);

    if (mounted) {
      setState(() {});
    }
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
            '编辑车辆',
            style: Theme.of(context).textTheme.headline4,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Alert.show(
                    context,
                    NormalContentDialog(
                      type: NormalTextDialogType.delete,
                      title: '提交确认',
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          16.hb,
                          Text(
                            '所有信息是否确认无误并提交',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      items: const ['取消'],
                      deleteItem: '提交',
                      //监听器
                      listener: (index) {
                        Alert.dismiss(context);
                      },

                      deleteListener: () async {
                        Alert.dismiss(context);

                        var res = await CarFunc.getEditAdd(
                          EditAddModel(
                              cardId: widget.carListModel.carInfo.id,
                              baseInfo: BaseInfo(
                                  color: widget.carListModel.carInfo.color,
                                  interiorColor:
                                      widget.carListModel.carInfo.interiorColor,
                                  // temporaryLicensePlate: widget.carListModel
                                  //     .carInfo.temporaryLicensePlate,
                                  parkingNo:
                                      widget.carListModel.carInfo.parkingNo,
                                  stockStatus:
                                      widget.carListModel.carInfo.stockStatus,
                                  useCharacter: CarNatureOfUse.getValues(widget
                                          .carListModel.carInfo.useCharacter)
                                      .typeNum,
                                  shamMileage: num.parse(
                                      widget.carListModel.carInfo.mileage),
                                  // purchaseTax: num.parse(
                                  //     widget.carListModel.carInfo.purchaseTax),
                                  installationCost: int.parse(
                                      widget.carListModel.carInfo.installationCost),
                                  location: widget.carListModel.carInfo.locationCityId,
                                  condition: vehicleCondition.text)),
                          widget.carListModel.carInfo.carPhotos,
                          widget.carListModel.carInfo.interiorPhotos,
                          widget.carListModel.carInfo.defectPhotos,
                          widget.carListModel.carInfo.dataPhotos,
                        );
                        if (res) {
                          Get.off(() => SuccessFailurePage(
                              conditions: true,
                              headline: '编辑车辆',
                              body: Text(
                                '提交成功，等待平台审核',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              bottom: CloudBottomButton(
                                onTap: () {
                                  Get.back();
                                  Get.back();
                                },
                                text: '返回汽车详情',
                              )));
                        }
                      },
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                padding: EdgeInsets.only(right: 32.w),
                child: Text(
                  '提交',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28.sp,
                  ),
                ),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight - 10.w),
            child: Container(
              height: kToolbarHeight - 10.w,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 40.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          color: BaseStyle.colordddddd, width: 2.w))),
              child: TabBar(
                  onTap: (index) {
                    setState(() {});
                  },
                  isScrollable: true,
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
                  controller: _tabController,
                  indicatorWeight: 3,
                  labelColor: kPrimaryColor,
                  unselectedLabelColor: BaseStyle.color333333,
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.w),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                  ),
                  indicator: const BoxDecoration(),
                  indicatorColor: kPrimaryColor,
                  tabs: [
                    _tab(0, tabs[0]),
                    _tab(1, tabs[1]),
                    _tab(2, tabs[2]),
                    // _tab(3, tabs[3]),
                    // _tab(4, tabs[4]),
                    // _tab(5, tabs[5]),
                    // _tab(6, tabs[6]),
                  ]),
            ),
          )),
      backgroundColor: bodyColor,
      extendBody: true,
      body: TabBarView(
        controller: _tabController,
        children: [
          EditCarDetailItem(
            carListModel: widget.carListModel,
          ),
          ColoredBox(
            color: const Color(0xFFF9F9F9),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 32.w, right: 32.w),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.w),
                  child: Text(
                    '车辆状况备注',
                    style:
                        TextStyle(fontSize: 32.w, fontWeight: FontWeight.w600),
                  ),
                ),
                20.hb,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: Colors.white),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
                  height: 200.w,
                  child: TextField(
                    maxLines: 50,
                    keyboardType: TextInputType.text,
                    onEditingComplete: () {},
                    onChanged: (text) {},
                    style: TextStyle(
                      color: BaseStyle.color333333,
                      fontSize: BaseStyle.fontSize28,
                    ),
                    controller: vehicleCondition,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      isDense: true,
                      fillColor: Colors.white,
                      hintText: "请选择",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                48.hb,
              ],
            ),
          ),
          // EditCarReportPage(
          //   carListModel: widget.carListModel,
          // ),
          // EditCarSourceItem(
          //   carListModel: widget.carListModel,
          // ),
          // EditCarOwnerItem(
          //   carListModel: widget.carListModel,
          // ),
          // EditCardInfoItem(
          //   carListModel: widget.carListModel,
          // ),
          ColoredBox(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.only(top: 20.w),
              children: [
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
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
                    // _buildChild(
                    //   _titles[4],
                    //   4,
                    // ),
                  ],
                ),
                // Padding(
                //   padding:  EdgeInsets.only(left: 20.w,bottom: 20.w),
                //   child: Text('报告数据',style: TextStyle(color: const Color(0xFF333333),fontSize: 28.sp,fontWeight: FontWeight.bold),),
                // ),
                // _getView(_reportPhotos)
              ],
            ),
          ),
          // EditCarPriceInfoItem(
          //   carListModel: widget.carListModel,
          // ),
          // CarImageItem(
          //   imageBack: (List<File> image) {},
          // ),
        ],
      ),
    );
  }

  final List<String> _titles = ['车辆照片', '内饰照片', '缺陷照片', '报告数据'];

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
        photos = interiorPhotos;
        break;
      case 2:
        photos = defectPhotos;
        break;
      case 3:
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
          CarPhotoItem(
            isSelf: widget.carListModel.isSelf == 1,
            tabs: _titles,
            model: pushPhotoModel,
            initIndex: index,
            imgCanTap: true,
            imgCanTaps: false,
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
            bottom.text.size(28.sp).black.bold.make(),
          ],
        ),
      ),
    );
  }

  _tab(int index, String text) {
    return SizedBox(width: 140.w, child: Text(text));
  }
}
