import 'package:cloud_car/ui/notice/view_file_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:common_utils/common_utils.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/api/api.dart';
import '../../constants/enums.dart';
import '../../model/acquisition_info_model.dart';
import '../../model/contract/report_photo_model.dart';
import '../../model/publish_info_model.dart';
import '../../utils/net_work/api_client.dart';
import '../../utils/toast/cloud_toast.dart';
import '../../utils/user_tool.dart';
import '../../widget/alert.dart';
import '../../widget/button/cloud_back_button.dart';
import '../../widget/cloud_image_network_widget.dart';
import '../home/car_manager/publish_car/publish_finish_page.dart';
import '../home/car_manager/publish_car/push_car_manage_photo_page.dart';
import '../home/car_manager/publish_car/push_photo_model.dart';
import '../home/func/car_func.dart';

///收购
class AcquisitionWidget extends StatefulWidget {
  // final int state;///1出售，2修改 3发布  4 收购
  final int modelId;
  final int status;
  final String url;

  const AcquisitionWidget(
      {Key? key,
      required this.modelId,
      required this.status,
      required this.url})
      : super(key: key);

  @override
  _AcquisitionWidgetState createState() => _AcquisitionWidgetState();
}

class _AcquisitionWidgetState extends State<AcquisitionWidget> {
  List<CarPhotos> carPhotos = [];
  List<CarPhotos> dataPhotos = [];
  late PushPhotoModel pushPhotoModel;
  late ReportPhotoModel reportPhotoModel;
  int collect = 0;
  AcquisitionInfoModel? acquisitionInfo;
  TextEditingController rejectController = TextEditingController();

  _refresh() async {
    acquisitionInfo = await CarFunc.getPurchaseInfo(widget.modelId);
    // print(carInfoModel!.carInfo);
    // collect = acquisitionInfo?.carInfo.collect ?? 0;
    // for (var item in acquisitionInfo!.photos.carPhotos) {
    //   if (item.photo.isNotEmpty && item.text.isNotEmpty) {
    //     carPhotos.add(CarPhotos(photo: item.photo, text: item.text));
    //   }
    //   // if (item.photo.isNotEmpty && item.text.isNotEmpty) {
    //   //   bannerList.add(item);
    //   // }
    // }
    // for (var item in carInfoModel!.carInfo.dataPhotos) {
    //   if (item.photo.isNotEmpty && item.text.isNotEmpty) {
    //     repairPhotos.add(CarPhotos(photo: item.photo, text: item.text));
    //   }
    // }
    for (var item in acquisitionInfo!.photos.carPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        carPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }
    for (var item in acquisitionInfo!.photos.dataPhotos) {
      if (item.photo.isNotEmpty && item.text.isNotEmpty) {
        dataPhotos.add(CarPhotos(photo: item.photo, text: item.text));
      }
    }
    // for (int i = 0; i < acquisitionInfo!.photos.dataPhotos.length; i++) {
    //   for (int j = 0; j < dataPhotos.length; j++) {
    //     if (dataPhotos[j].text ==
    //         acquisitionInfo!.photos.dataPhotos[i].text) {
    //       if (acquisitionInfo!.photos.dataPhotos[i].photo != '') {
    //         dataPhotos[j].photo =
    //             acquisitionInfo!.photos.dataPhotos[i].photo;
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
   // print(pushPhotoModel);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      _refresh();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    rejectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return acquisitionInfo == null
        ? const Scaffold()
        : Scaffold(
            appBar: AppBar(
              leading: const CloudBackButton(
                isSpecial: true,
              ),
              backgroundColor: kForeGroundColor,
              title: Text(
                "收购申请",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            backgroundColor: bodyColor,
            extendBody: true,
            body: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
                  margin:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
                  width: 750.w,
                  height: 300.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.w)),
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
                    _getTitle(
                        '成交金额', acquisitionInfo?.priceInfo.dealPrice ?? ''),
                    16.hb,
                    _getTitle(
                        '定金金额', acquisitionInfo?.priceInfo.downPayment ?? ''),
                    16.hb,
                    _getTitle('尾款金额',
                        acquisitionInfo?.priceInfo.balancePayment ?? ''),
                    16.hb,
                    _getTitle(
                        '交付日期',
                        acquisitionInfo?.priceInfo.deliverDate != null
                            ? DateUtil.formatDateMs(
                                acquisitionInfo!.priceInfo.deliverDate.toInt() *
                                    1000,
                                format: 'yyyy年MM月dd日 ')
                            : ''),
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
                    _getTitle('名称', acquisitionInfo?.dealerInfo.name ?? ''),
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
                    _getTitle(
                        '车主身份', acquisitionInfo?.masterInfo.kindName ?? ''),
                    16.hb,
                    _getTitle('公司名称', acquisitionInfo?.masterInfo.name ?? ''),
                    16.hb,
                    _getTitle('联系电话', acquisitionInfo?.masterInfo.phone ?? ''),
                    16.hb,
                    _getTitle(
                        '机构代码', acquisitionInfo?.masterInfo.legalPerson ?? ''),
                    16.hb,
                    _getTitle('开户行', acquisitionInfo?.masterInfo.bank ?? ''),
                    16.hb,
                    _getTitle(
                        '银行卡号', acquisitionInfo?.masterInfo.bankCard ?? ''),
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
                    acquisitionInfo!.dealerAuditInfo.dealerRejectReason == ''
                        ? 0.hb
                        : 32.hb,
                    acquisitionInfo!.dealerAuditInfo.dealerRejectReason == ''
                        ? const SizedBox()
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.w),
                                color: const Color(0xFFF8F8F8)),
                            child: Text(
                              acquisitionInfo!
                                  .dealerAuditInfo.dealerRejectReason,
                              style: TextStyle(
                                  fontSize: 28.sp, fontWeight: FontWeight.w700),
                            ),
                          )
                  ],
                )),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ViewFilePage(
                      url: widget.url != ''
                          ? '${API.imageHost}/${widget.url}'
                          : '',
                      title: '收购合同',
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: 32.w, vertical: 16.w),
                    padding: EdgeInsets.symmetric(
                        horizontal: 228.w, vertical: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0593FF),
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Text(
                      '查看附件',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                )
                // ContractStatus.getValue(acquisitionInfo!.status).typeNum==12
                //     ?
                //
                // GestureDetector(
                //         onTap: () {
                //           Get.to(() => ViewFilePage(
                //                 url: widget.url != ''
                //                     ? '${API.imageHost}/${widget.url}'
                //                     : '',
                //                 title: '收购合同',
                //               ));
                //         },
                //         child: Container(
                //           margin: EdgeInsets.symmetric(
                //               horizontal: 32.w, vertical: 16.w),
                //           padding: EdgeInsets.symmetric(
                //               horizontal: 228.w, vertical: 16.w),
                //           decoration: BoxDecoration(
                //             color: const Color(0xFF0593FF),
                //             borderRadius: BorderRadius.circular(8.w),
                //           ),
                //           child: Text(
                //             '查看附件',
                //             style: TextStyle(
                //                 fontSize: 28.sp,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.white),
                //           ),
                //         ),
                //       )
                //     : const SizedBox()
              ],
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.w, color: const Color(0xFFEEEEEE)),
                  color: Colors.white),
              height: ContractStatus.getValue(acquisitionInfo!.status).typeNum!=2
                  ? 160.w
                  : 200.w, //double.infinity,
              child: getBottomState(),
            ),
          );
  }

  getBottomState() {
    return widget.status == 1
        ? ContractStatus.getValue(acquisitionInfo!.status).typeNum == 11
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
                                child: TextField(
                                  controller: rejectController,
                                  maxLines: null,
                                  minLines: 1,
                                  decoration: const InputDecoration(
                                    hintText: '请输入',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              items: const ['取消'],
                              deleteItem: '确定',
                              //监听器
                              listener: (index) {
                                Get.back();
                                Alert.dismiss(context);
                              },
                              deleteListener: () async {
                                var res = await apiClient.request(
                                    API.contract.purchaseReject,
                                    data: {
                                      'contractId': acquisitionInfo!.id,
                                      'reason': rejectController.text
                                    });
                                if (res.code == 0) {
                                  CloudToast.show('驳回成功');
                                  Get.back();
                                } else {
                                  CloudToast.show(res.msg);
                                }
                                Alert.dismiss(context);
                              },
                            ));
                      }),
                      16.wb,
                      getBox('通过', const Color(0xFF027AFF), 0, Colors.white,
                          Colors.white, () async {
                        var res = await apiClient
                            .request(API.contract.purchaseAdopt, data: {
                          'contractId': acquisitionInfo!.id,
                        });
                        if (res.code == 0) {
                          Get.to(() => const PublishFinishPage(
                                title: '成功',
                                // ReminderApprovalType.getValue(widget.state)
                                //     .typeStr,
                                remindText: '已同意',
                              ));
                        } else {
                          CloudToast.show(res.msg);
                        }
                      }),
                    ],
                  )),
                ],
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContractStatus.getValue(acquisitionInfo!.status).typeNum ==
                            12
                        ? 32.hb
                        : 0.hb,
                    Row(
                      children: [
                        getContact(),
                        const Spacer(),
                        Text(
                          ContractStatus.getValue(acquisitionInfo!.status).typeNum ==
                                  12
                              ? "已同意"
                              : '已驳回',
                          style: TextStyle(
                              color: ContractStatus.getValue(acquisitionInfo!.status).typeNum ==
                                      12
                                  ? const Color(0xFF027AFF)
                                  : const Color(0xFFFF3B02),
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    8.hb,
                    ContractStatus.getValue(acquisitionInfo!.status).typeNum ==
                            12
                        ? const SizedBox()
                        : Flexible(
                            child: Text(
                              '驳回理由:${acquisitionInfo!.dealerAuditInfo.dealerRejectReason}',
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
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
              )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContractStatus.getValue(acquisitionInfo!.status).typeNum ==
                        12
                    ? 32.hb
                    : 0.hb,
                Row(
                  children: [
                    getContact(),
                    const Spacer(),
                    Text(
                      ContractStatus.getValue(acquisitionInfo!.status).typeStr,
                      style: TextStyle(
                          color: getColor(acquisitionInfo!.status),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                // const Spacer(),
                8.hb,
                ContractStatus.getValue(acquisitionInfo!.status).typeNum ==
                            3 ||
                    ContractStatus.getValue(acquisitionInfo!.status).typeNum ==
                            4 ||
                    ContractStatus.getValue(acquisitionInfo!.status).typeNum == 5
                 || ContractStatus.getValue(acquisitionInfo!.status).typeNum == 6||
                    ContractStatus.getValue(acquisitionInfo!.status).typeNum == 13

                    ? const SizedBox()
                    : Flexible(
                        child: Text(
                          ContractStatus.getValue(acquisitionInfo!.status).typeNum ==
                                  13
                              ? '驳回理由:${acquisitionInfo!.dealerAuditInfo.dealerRejectReason}'
                              : '失败理由:${acquisitionInfo!.dealerAuditInfo.dealerRejectReason}',
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
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
        // CloudToast.show(pushPhotoModel.carPhotos?[2].text ?? '没有数据');
        await Get.to(
          PushCarManagePhotoPage(
            isSelf: true,
            consignmentPhoto: true,
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

  // getText(int status) {
  //   if (UserTool.userProvider.userInfo.business.roleEM == Role.manager) {
  //     switch (ContractStatus.getValueAuditId(status).typeNum) {
  //       case 2:
  //         return '待签订';
  //       case 3:
  //         return '客户已签订';
  //       case 4:
  //         return '已驳回';
  //       case 5:
  //         return '签订失败';
  //     }
  //   } else {
  //     switch (ContractStatus.getValueAuditId(status).typeNum) {
  //       case 1:
  //         return '待审批';
  //       case 2:
  //         return '待签订';
  //       case 3:
  //         return '客户已签订';
  //       case 4:
  //         return '已驳回';
  //       case 5:
  //         return '签订失败';
  //     }
  //   }
  // }

  getColor(int status) {
    if (UserTool.userProvider.userInfo.business.roleEM == Role.manager) {
      switch (ContractStatus.getValue(acquisitionInfo!.status).typeNum) {
        case 2:
          return const Color(0xFFFE8029);
        case 3:
          return const Color(0xFF027AFF);
        case 4:
          return const Color(0xFFFF3B02);
        case 5:
          return const Color(0xFFFF3B02);
        default:
          return  const Color(0xFFFE8029);
      }
    } else {
      switch (ContractStatus.getValue(acquisitionInfo!.status).typeNum) {
        case 1:
          return const Color(0xFFFE8029);
        case 2:
          return const Color(0xFFFE8029);
        case 3:
          return const Color(0xFF027AFF);
        case 4:
          return const Color(0xFFFF3B02);
        case 5:
          return const Color(0xFFFF3B02);
        default:
          return  const Color(0xFFFE8029);
      }
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
