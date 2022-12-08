import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/constants/enums.dart';
import 'package:cloud_car/extensions/string_extension.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/model/car/new_car_info.dart';
import 'package:cloud_car/model/contract/report_photo_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/call_order_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/new_car_detail_item.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/off_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/sell_car_order_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_car_manage_photo_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_car/push_photo_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/share/share_car_dialog.dart';
import 'package:cloud_car/utils/custom_floating_action_button_location.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/swiper_pagination_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/text_utils.dart';
import '../../share/edit_item_widget.dart';
import 'detailed_price_page.dart';
import 'edit_car_page.dart';

class NewCarsDetailPage extends StatefulWidget {
  // final bool isSelf;
  final CarListModel carListModel;

  const NewCarsDetailPage({
    super.key,
    required this.carListModel,
    // required this.isSelf,
  });

  @override
  _NewCarsDetailPageState createState() => _NewCarsDetailPageState();
}

class _NewCarsDetailPageState extends State<NewCarsDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<CarListModel> _chooseModels = [];

  ///滚动监听设置
  late ScrollController _scrollController;

  ///头部背景布局 true滚动一定的高度 false 滚动高度为0
  bool headerWhite = false;
  List tabs = [];
  NewCarInfo? carInfoModel;
  int collect = 0;
  List<CarPhotos> carPhotos = [];
  List<CarPhotos> interiorPhotos = [];
  List<CarPhotos> defectPhotos = [];
  List<CarPhotos> dataPhotos=[];
  // List<CarPhotos> repairPhotos = [];
  //
  // List<CarPhotos> _reportPhotos = [];

  List<ImagePhoto> bannerList = [];

  late PushPhotoModel pushPhotoModel;

  late ReportPhotoModel reportPhotoModel;

  //下拉显示
  bool downState = true;

  @override
  void initState() {
    ///自己发布的 tab2个 否则1个
    tabs = ['车辆详情', '车辆照片']; //'车辆轨迹'
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);

    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      ///监听滚动位置设置导航栏颜色
      if (_scrollController.offset > 900.w && headerWhite != true) {
        headerWhite = true;
        setState(() {});
      } else if (_scrollController.offset < 900.w && headerWhite != false) {
        headerWhite = false;
        setState(() {});
      }
    });
    Future.delayed(const Duration(milliseconds: 0), () async {
      await _refresh();
    });

    _chooseModels.add(widget.carListModel);

    if (widget.carListModel.isSelf == 1) {
      dataPhotos = [
        CarPhotos(
          text: '漆面数据',
        ),
        CarPhotos(text: '行驶证照片'),
        CarPhotos(
          text: '检测报告',
        ),
        CarPhotos(
          text: '登记证书',
        ),
        CarPhotos(
          text: '交强险',
        ),
        CarPhotos(
          text: '商业险',
        ),
        CarPhotos(
          text: '维保记录',
        ),
      ];
    } else {
      dataPhotos = [
        CarPhotos(
          text: '漆面数据',
        ),
        CarPhotos(
          text: '检测报告',
        ),
      ];
    }
  }

  _refresh() async {
    carInfoModel = await CarFunc.getNewCarInfo(widget.carListModel.id);
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

    for (var item in carInfoModel!.carInfo.interiorPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        interiorPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }

    for (var item in carInfoModel!.carInfo.defectPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        defectPhotos.add(CarPhotos(photo: item.photo, text: item.text));
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  getPhone(String phone) {
    return Alert.show(
        context,
        NormalContentDialog(
          type: NormalTextDialogType.delete,
          title: '',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 238.w,
                height: 174.w,
                child: Image.asset(
                  Assets.images.immediately.path,
                  fit: BoxFit.fill,
                ),
              ),
              48.hb,
              Text(
                phone,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontSize: BaseStyle.fontSize40),
              ),
              16.hb,
              Text(
                '使用虚拟号联系车主',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          items: const ['取消'],
          deleteItem: '立即联系',
          //监听器
          listener: (index) {
            Alert.dismiss(context);
            //Value = false;
            //(Value);
          },
          deleteListener: () {
            Alert.dismiss(context);
            launchUrl(Uri(scheme: 'tel', path: phone));
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return CloudScaffold(
      path: Assets.images.noticeBg.path,
      extendBody: true,
      body: Expanded(
        child: carInfoModel == null
            ? const SizedBox()
            : NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        pinned: true,
                        stretch: true,
                        expandedHeight: downState ? 945.w : 1170.w,
                        elevation: 0,
                        backgroundColor:
                            headerWhite ? Colors.white : Colors.transparent,
                        systemOverlayStyle: SystemUiOverlayStyle.light,
                        snap: false,
                        centerTitle: false,
                        title: headerWhite
                            ? Text(
                                carInfoModel?.carInfo.modelName ?? '',
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 36.sp,
                                ),
                              )
                            : const Text(''),
                        leading: const CloudBackButton(),
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => CallOrderPage(
                                    carListModel: widget.carListModel,
                                  ));
                            },
                            child: Image.asset(Assets.icons.carDetail.path,
                                height: 48.w, width: 48.w),
                          ),
                          24.wb,

                          ///收藏按钮 自己发布的车辆没有该按钮
                          !(widget.carListModel.isSelf == 1)
                              ? GestureDetector(
                                  onTap: () async {
                                    var re = await apiClient.request(
                                        collect == 0
                                            ? API.car.collect.add
                                            : API.car.collect.cancel,
                                        data: {
                                          'carId': carInfoModel?.carInfo.id
                                        },
                                        showMessage: true);
                                    if (re.code == 0) {
                                      collect == 0 ? collect = 1 : collect = 0;
                                      setState(() {});
                                    }
                                  },
                                  child: SizedBox(
                                    width: 48.w,
                                    height: 48.w,
                                    child: Image.asset(
                                        collect == 1
                                            ? Assets.icons.alreadyCollected.path
                                            : Assets.icons.collection.path,
                                        height: 48.w,
                                        width: 48.w),
                                  ))
                              : const SizedBox(),
                          24.wb,
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  builder: (BuildContext context) {
                                    return ShareCarDialog(
                                      model: _chooseModels,
                                      isMore: false,
                                    );
                                  });
                            },
                            child: Image.asset(Assets.icons.icShare.path,
                                color: Colors.black, height: 40.w, width: 40.w),
                          ),
                          16.wb,
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          //centerTitle: true,
                          background: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            color: Colors.transparent,
                            //height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                135.hb,
                                Container(
                                  decoration: BoxDecoration(
                                    color: headerWhite
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 32.w, vertical: 24.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _title(),
                                      32.hb,
                                      _label(),
                                      18.hb,
                                      _information(),
                                      getDown(),
                                      30.hb,
                                      _shuffling(),
                                      32.hb,
                                      // _informations(),
                                    ],
                                  ),
                                ),
                                // 50.hb,
                              ],
                            ),
                          ),
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(kToolbarHeight - 10.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.w),
                            child: Container(
                              height: kToolbarHeight - 10.w,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      top: BorderSide(
                                          color: const Color(0xFFF6F6F6),
                                          width: 2.w))),
                              child: TabBar(
                                  onTap: (index) {
                                    setState(() {});
                                  },
                                  isScrollable: true,
                                  labelPadding: EdgeInsets.symmetric(
                                      vertical: 10.w, horizontal: 80.w),
                                  controller: _tabController,
                                  indicatorWeight: 3,
                                  labelColor: kPrimaryColor,
                                  unselectedLabelColor: BaseStyle.color333333,
                                  unselectedLabelStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: BaseStyle.color333333,
                                  ),
                                  indicatorPadding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 0.w),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                  ),
                                  indicator: const BoxDecoration(),
                                  indicatorColor: kPrimaryColor,
                                  tabs: [
                                    _tab(0, tabs[0]),
                                    _tab(1, tabs[1]),
                                  ]),
                            ),
                          ),
                        )),
                  ];
                },
                body: Padding(
                  padding: EdgeInsets.only(bottom: 120.w),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      NewCarDetailItem(
                        carInfoModel: carInfoModel!,
                      ),
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
                      )
                    ],
                  ),
                ),
              ),
      ),
      bottomNavi: _bottom(),
      fab: FloatingActionButton(
        onPressed: () {
          if (carInfoModel != null) {
            if (carInfoModel!.carInfo.brokerInfo.brokerPhone != '') {
              getPhone(carInfoModel!.carInfo.brokerInfo.brokerPhone);
            }
          } else {
            CloudToast.show('没有找到联系方式！');
          }
        },
        child: SizedBox(
          width: 120.w,
          height: 120.w,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(60.w)),
              child: Image.asset(
                Assets.images.imgPhone.path,
                width: 120.w,
                height: 120.w,
              ),
            ),
          ),
        ),
      ),
      fbLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.endDocked, 2.w, -130.w),
    );
  }

  // Widget _getView(
  //   List<PushImgModel> list,
  // ) {
  //   return GridView.builder(
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       padding: EdgeInsets.symmetric(horizontal: 20.w),
  //       itemCount: list.length,
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           //横轴元素个数
  //           crossAxisCount: 3,
  //           //纵轴间距
  //           mainAxisSpacing: 10,
  //           //横轴间距
  //           crossAxisSpacing: 15,
  //           //子组件宽高长度比例
  //           childAspectRatio: 100 / 100),
  //       itemBuilder: (BuildContext context, int iIndex) {
  //         return _buildGrid(list[iIndex], iIndex, list);
  //       });
  // }

  // Widget _buildGrid(PushImgModel model, int index, List<PushImgModel> list) {
  //   List<File> fileLists = [];
  //   List<String> stringLists = [];
  //   for (var item in list) {
  //     if (item.url.runtimeType == String) {
  //       stringLists.add(item.url);
  //     } else {
  //       if (item.url != null) {
  //         fileLists.add(item.url);
  //       }
  //     }
  //   }
  //
  //   return GestureDetector(
  //     onTap: () async {
  //       if (model.url != null) {
  //         if (model.url.runtimeType == String) {
  //           //await CloudImagePreview.toPath(path: model.url);
  //           await CloudImagePreviewList.toPath(path: stringLists, index: index);
  //         } else {
  //           //await CloudImagePreview.toFile(file: model.url);
  //           await CloudImagePreviewList.toFile(file: fileLists, index: index);
  //         }
  //       }
  //     },
  //     child: Material(
  //       color: Colors.transparent,
  //       child: Column(
  //         children: [
  //           model.url == null || model.url == ''
  //               ? Container(
  //                   width: 210.w,
  //                   height: 158.w,
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                       fit: BoxFit.fill,
  //                       image: AssetImage(Assets.images.addcar.path),
  //                     ),
  //                   ),
  //                 )
  //               : Stack(
  //                   clipBehavior: Clip.antiAliasWithSaveLayer,
  //                   children: [
  //                     Container(
  //                         // width: 210.w,
  //                         // height: 158.w,
  //                         clipBehavior: Clip.antiAliasWithSaveLayer,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(16.w),
  //                         ),
  //                         child: image(model.url)),
  //                   ],
  //                 ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Container(
  //                 margin: EdgeInsets.only(top: 5.w),
  //                 child: model.isMust != null && model.isMust!
  //                     ? '* '
  //                         .text
  //                         .size(28.sp)
  //                         .color(Colors.red)
  //                         .make()
  //                         .paddingOnly(top: 5)
  //                     : const SizedBox(),
  //               ),
  //               (model.name ?? '').text.size(28.sp).black.make(),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget image(dynamic file) {
    return file.runtimeType == String
        ? CloudImageNetworkWidget(
            width: 210.w,
            height: 158.w,
            urls: [file],
          )
        : Image.file(
            file,
            fit: BoxFit.fill,
            width: 210.w,
            height: 158.w,
          );
  }

  // final List<String> _titles = ['车辆照片', '内饰照片', '缺陷照片', '报告数据', '维保数据'];
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
          PushCarManagePhotoPage(
            isSelf: widget.carListModel.isSelf == 1,
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

  _getBottom(String url, String text, Function callBack) {
    return GestureDetector(
      onTap: () {
        callBack();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            url,
            width: 56.w,
            height: 56.w,
          ),
          Text(
            text,
            style: TextStyle(color: BaseStyle.color333333, fontSize: 24.sp),
          )
        ],
      ),
    );
  }

  _tab(int index, String text) {
    return SizedBox(width: 150.w, child: Text(text));
  }

  //标题
  _title() {
    return Row(
      children: [
        Flexible(
            child: Text(
          carInfoModel?.carInfo.modelName ?? '',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: const Color(0xFF111111), fontSize: 40.sp),
        )),
      ],
    );
  }

  //标签
  _label() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              _noRelease('在售'),
              16.wb,
              _noRelease('在厅'),
              16.wb,
              _textview(DateUtil.formatDateMs(
                  (carInfoModel?.carInfo.licensingDate.toInt() ?? 0) * 1000,
                  format: 'yyyy年MM月')),
              16.wb,
              _textview('${carInfoModel?.carInfo.mileage}万公里'),
              16.wb,
              _textview(carInfoModel?.carInfo.modelInfo.fuelTypeName ?? ""),
            ],
          ),
        ),
      ],
    );
  }

  //提示信息
  _information() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: carInfoModel!.carInfo.price.priceFormat,
                  style: TextStyle(
                      color: const Color(0xFFFF3B02),
                      fontSize: BaseStyle.fontSize40)),
              TextSpan(
                  text: '万',
                  style: TextStyle(
                      color: const Color(0xFFFF3B02),
                      fontSize: BaseStyle.fontSize32))
            ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   width: 110.w,
                //   child: Text(
                //     '新车指导价',
                //     style: TextStyle(
                //         fontSize: 20.sp,
                //         fontWeight: FontWeight.w400,
                //         color: BaseStyle.color999999),
                //   ),
                // ),
                // Text(
                //   TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(
                //       num.parse(carInfoModel!.carInfo.newCarGuidePrice))),
                //   style: TextStyle(
                //       fontSize: 20.sp,
                //       fontWeight: FontWeight.w400,
                //       color: BaseStyle.color999999),
                // ),
              ],
            ),
          ],
        ),
        const Spacer(),

        ///详细价格

        GestureDetector(
          onTap: () {
            downState = !downState;
            print(downState);
            setState(() {});
          },
          child: Container(
            width: 150.w,
            height: 65.w,
            padding: EdgeInsets.only(left: 20.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35.w)),
                border: Border.all(width: 2.w, color: const Color(0xFF027AFF))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "详情价格",
                  style: TextStyle(
                      color: const Color(0xFF027AFF), fontSize: 20.sp),
                ),
                SizedBox(
                  child: Icon(
                    size: 40.w,
                    downState ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    color: const Color(0xFF027AFF),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  //下拉显示
  getDown() {
    return Offstage(
      offstage: downState,
      child: Container(
        // height: 174.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
        decoration: BoxDecoration(
            color: Color(0xFFBBBBBB).withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(8.w))),
        child: Column(
          children: [
            ///ceshizhong
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 145.w,
                        child: Text(
                          '外部价格',
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w400,
                              color: BaseStyle.color999999),
                        ),
                      ),
                      Text(
                        TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(
                            num.parse(carInfoModel!
                                .carInfo.priceInfo.exteriorPrice))),
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                            color: BaseStyle.color333333),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 145.w,
                        child: Text(
                          "内部价格",
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w400,
                              color: BaseStyle.color999999),
                        ),
                      ),
                      10.wb,
                      Text(
                        TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(
                            num.parse(
                                carInfoModel!.carInfo.priceInfo.interiorPrice))),
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                            color: BaseStyle.color333333),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Get.to(()=>const DetailedPricePage());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.w, color: const Color(0xFFBBBBBB)),
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 144.w,
                      child: Text(
                        '降价记录：',
                        style: TextStyle(
                            color: const Color(0xFF999999), fontSize: 24.sp),
                      ),
                    ),
                    Text(
                      '最近降价2000元',
                      style: TextStyle(
                          color: const Color(0xFF999999), fontSize: 24.sp),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 28.w,
                      height: 28.w,
                      child: Image.asset(Assets.icons.icGoto.path),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //轮播
  _shuffling() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 456.w,
          child: _bannerStyle(),
        )
      ],
    );
  }

  ///自己发布的车辆可以编辑、调价、出售、下架。其他销售看见我发布的车辆详情时，只有出售操作。no去掉

  _bottom() {
    return Container(
      color: Colors.white,
      height: 120.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: _getBottom(
                  UserTool.userProvider.userInfo.business.roleEM !=
                          Role.salesTraffic
                      ? Assets.icons.editor.path
                      : Assets.icons.noEditor.path,
                  '编辑', () {
            // if (widget.carListModel.isSelf == 1) {
            //   Get.to(() => const EditCarPage());
            // }
          })),
          Expanded(
              child: _getBottom(Assets.icons.transmission.path, '调价', () {
            if (carInfoModel != null) {
              if (carInfoModel!.carInfo.brokerInfo.brokerPhone != '') {
                getPhone(carInfoModel!.carInfo.brokerInfo.brokerPhone);
              }
            } else {
              CloudToast.show('没有找到联系方式！');
            }
            // if (widget.carListModel.isSelf == 1) {
            //   Get.to(() => const ModifyPricePage());
            // }
            // if(carInfoModel!.IsSelfBusiness==1&&carInfoModel!.isSelfStore==1){
            //   Get.to(() => ModifyPricePage(model: carInfoModel!,));
            // }
          })),
          Expanded(
              child: _getBottom(Assets.icons.upload.path, '出售', () {
            Get.to(() => SellCarOrderPage(
                  carModel: widget.carListModel,
                ));
          })),
          Expanded(
              child: _getBottom(Assets.icons.download.path, '帮他下架', () {
            Get.to(() => OffCarPage(
                  carId: widget.carListModel.id,
                ));
          })),
        ],
      ),
    );
  }

  _noRelease(String text) {
    return Container(
      decoration: BoxDecoration(
          color: text == '在售'
              ? const Color(0xFFFF3B02).withOpacity(0.08)
              : const Color(0xFF027AFF).withOpacity(0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: text == '在售'
                ? const Color(0xFFFF3B02)
                : const Color(0xFF027AFF)),
      ),
    );
  }

//文本
  _textview(String text) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(79, 90, 116, 0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: const Color(0xFF4F5A74))),
    );
  }

//分页指示器
  _bulidPagination() {
    return SwiperPagination(
        //指示器显示的位置
        alignment: Alignment.bottomCenter, //位置在底部
        //距离调整
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10), //坐上右下
        //指示器构建
        builder: SwiperPaginationWidget(
            color: Colors.white,
            activeFontSize: 20.sp,
            fontSize: 20.sp,
            activeColor: Colors.white)
        // builder: DotSwiperPaginationBuilder(
        //   //点之间的间距
        //   space: 2,
        //   //没选中时的大小
        //   size: 6,
        //   //选中时的大小
        //   activeSize: 12,
        //   //没选中时的颜色
        //   color: Colors.black,
        //   //选中时的颜色
        //   activeColor: Colors.white,
        // )
        );
  }

//图片样式
  _bannerStyle() {
    return Swiper(
      itemCount: bannerList.length,
      //横向
      scrollDirection: Axis.horizontal,
      //布局构建
      itemBuilder: (context, index) {
        return CloudImageNetworkWidget.car(
          borderRadius: BorderRadius.circular(10.w),
          urls: [bannerList[index].photo],
        );
      },
      //自动翻页
      autoplay: true,
      //分页指示
      pagination: _bulidPagination(),
      //点击事件
      onTap: (index) {
        //('点击$index');
      },
      //布局方法
      //用户进行操作时停止自动翻页
      autoplayDisableOnInteraction: true,
      //无限轮播
      loop: true,
    );
  }
}
