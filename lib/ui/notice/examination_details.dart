import 'package:cloud_car/ui/notice/view_file_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../../constants/api/api.dart';
import '../../constants/enums.dart';
import '../../model/customer/customer_detail_model.dart';
import '../../model/sale_info_model.dart';
import '../../utils/drop_down_body.dart';
import '../../utils/net_work/api_client.dart';
import '../../widget/alert.dart';
import '../../widget/button/cloud_back_button.dart';
import '../../widget/cloud_image_network_widget.dart';
import '../home/car_manager/publish_car/publish_finish_page.dart';

import '../home/func/car_func.dart';

class ExaminationDetails extends StatefulWidget {
  // ///审批状态  1出售，2修改 3发布  4 收购
  // final int state;

  ///审核状态
  final int auditState;
  final int modelId;
  final int status;
  final String url;

  ///判断入口
  const ExaminationDetails({
    super.key,
    // required this.state,
    required this.auditState,
    required this.modelId,
    required this.status,
    required this.url,
  });

  @override
  _ExaminationDetailsState createState() => _ExaminationDetailsState();
}

class _ExaminationDetailsState extends State<ExaminationDetails> {
  SaleInfoModel? saleInfo;
  CustomerDetailModel? customerDetail;
  TextEditingController rejectController = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      saleInfo = await CarFunc.getSaleInfo(widget.modelId);
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
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text(
          "出售申请",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      body: ListView(children: [
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
            GestureDetector(
              onTap: () {
                //Get.to(() => const Reservation(judge: null,));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.hb,
                    Row(
                      children: [
                        SizedBox(
                          width: 196.w,
                          height: 150.w,
                          child: CloudImageNetworkWidget.car(
                              urls: [saleInfo?.baseInfo.mainPhoto ?? '']),
                        ),
                        20.wb,
                        SizedBox(
                          width: 406.w,
                          child: Column(
                            children: [
                              Text(saleInfo?.baseInfo.modelName ?? '',
                                  style: TextStyle(
                                      fontSize: BaseStyle.fontSize28,
                                      color: BaseStyle.color111111)),
                              26.hb,
                              _getChip(
                                '过户${saleInfo?.baseInfo.transfer ?? 0}次',
                                saleInfo?.baseInfo.licensingData != null
                                    ? DateUtil.formatDateMs(
                                        saleInfo!.baseInfo.licensingData
                                                .toInt() *
                                            1000,
                                        format: 'yyyy年 ')
                                    : '0年',
                                '${saleInfo?.baseInfo.mileage}万公里',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    40.hb,
                    _getList(),
                    32.hb,
                    Row(
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: Text(
                            '付款方式',
                            style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color(0xFF999999)),
                          ),
                        ),
                        Text(
                          '全款',
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w700),
                        ),
                        92.wb,
                        SizedBox(
                          width: 160.w,
                          child: Text(
                            '过户方式',
                            style: TextStyle(
                                fontSize: 28.sp,
                                color: const Color(0xFF999999)),
                          ),
                        ),
                        Text(
                          '本地',
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ]),
            ),
          ],
        )),
        _gexFramework(
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '买方信息',
            style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.w800),
          ),
          32.hb,
          _getTitle('客户姓名', saleInfo?.buyerMasterInfo.name ?? ''),
          16.hb,
          _getTitle('手机号', saleInfo?.buyerMasterInfo.phone ?? ''),
          16.hb,
          _getTitle('身份证号', saleInfo?.buyerMasterInfo.idCard ?? ''),
          16.hb,
          _getTitle('地址', saleInfo?.buyerMasterInfo.address ?? ''),
          16.hb,
          _getTitle('付款人', saleInfo?.buyerMasterInfo.bank ?? ''),
          16.hb,
          _getTitle('开户行', saleInfo?.buyerMasterInfo.bankAccount ?? ''),
          16.hb,
          _getTitle('银行卡号', saleInfo?.buyerMasterInfo.bankCard ?? ''),
          16.hb,
          _getTitle('备注', saleInfo?.baseInfo.remark ?? ''),
        ])),
        saleInfo?.thirdPartKind == 1
            ? _gexFramework(
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '居间方信息',
                  style: TextStyle(
                      fontSize: 28.sp,
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w800),
                ),
                32.hb,
                _getTitle('居间方', '无'),
              ]))
            : _gexFramework(
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '居间方信息',
                  style: TextStyle(
                      fontSize: 28.sp,
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w800),
                ),
                32.hb,
                _getTitle('居间方', saleInfo?.thirdPartKindName ?? ''),
                16.hb,
                _getTitle(
                    '卖方服务费', '${saleInfo?.baseInfo.saleServiceFeeRate ?? ''}%'),
                16.hb,
                _getTitle('服务费金额', saleInfo?.baseInfo.saleServiceFee ?? ''),
                16.hb,
                _getTitle('买方服务费',
                    '${saleInfo?.baseInfo.purchaseServiceFeeRate ?? ''}%'),
                16.hb,
                _getTitle('服务费金额', saleInfo?.baseInfo.purchaseServiceFee ?? ''),
              ])),
        GestureDetector(
          onTap: () {
            Get.to(() => ViewFilePage(
                  url: widget.url != '' ? '${API.imageHost}/${widget.url}' : '',
                  title: '收购合同',
                ));
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 228.w, vertical: 16.w),
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
      ]),
      // SellWidget(
      //   customerDetail: customerDetail, saleId:widget.modelId ,
      // )
      bottomNavigationBar: saleInfo == null
          ? const SizedBox()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.w, color: const Color(0xFFEEEEEE)),
                  color: Colors.white),
              height: ContractStatus.getValue(widget.auditState).typeNum != 2
                  ? 160.w
                  : 200.w, //double.infinity,
              child: getBottomState(),
            ),
    );
  }

  // _getWidget(int aState) {
  //   switch (aState) {
  //     case 1:
  //       return const SellWidget();
  //
  //     case 2:
  //       return ModifiedReleaseModel(
  //         state: aState == 2,
  //       );
  //     case 3:
  //       return ModifiedReleaseModel(
  //         state: aState == 2,
  //       );
  //     case 4:
  //       return const AcquisitionWidget();
  //   }
  // }

  getBottomState() {
    return widget.status == 1
            ? ContractStatus.getValue(widget.auditState).typeNum == 11
                ? Row(
                    children: [
                      getContact(),
                      28.wb,
                      Expanded(
                          child: Row(
                        children: [
                          getBox('取消', Colors.white, 2, const Color(0xFF027AFF),
                              const Color(0xFF027AFF), () {
                                Alert.show(
                                    context,
                                    NormalContentDialog(
                                      type: NormalTextDialogType.delete,
                                      title: '取消理由',
                                      content: Container(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                            borderRadius:
                                            BorderRadius.circular(4.w)),
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
                                            API.contract.saleCancel,
                                            data: {
                                              'contractId': saleInfo!.id,
                                              'reason': rejectController.text
                                            });
                                        if (res.code == 0) {
                                          CloudToast.show('取消成功');
                                          Get.back();
                                        } else {
                                          CloudToast.show(res.msg);
                                        }
                                        // Alert.dismiss(context);
                                      },
                                    ));
                              }),
                          16.wb,
                          getBox('驳回', Colors.white, 2, const Color(0xFF027AFF),
                              const Color(0xFF027AFF), () {
                            Alert.show(
                                context,
                                NormalContentDialog(
                                  type: NormalTextDialogType.delete,
                                  title: '驳回理由',
                                  content: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(4.w)),
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
                                        API.contract.saleReject,
                                        data: {
                                          'contractId': saleInfo!.id,
                                          'reason': rejectController.text
                                        });
                                    if (res.code == 0) {
                                      CloudToast.show('驳回成功');
                                      Get.back();
                                    } else {
                                      CloudToast.show(res.msg);
                                    }
                                    // Alert.dismiss(context);
                                  },
                                ));
                          }),
                          16.wb,
                          getBox('通过', const Color(0xFF027AFF), 0, Colors.white,
                              Colors.white, () async {
                            var res = await apiClient
                                .request(API.contract.saleAdopt, data: {
                              'contractId': saleInfo!.id,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContractStatus.getValue(widget.auditState).typeNum ==
                                    3 ||
                                ContractStatus.getValue(widget.auditState)
                                        .typeNum ==
                                    6 ||
                                ContractStatus.getValue(widget.auditState)
                                        .typeNum ==
                                    13
                            ? 32.hb
                            : 0.hb,
                        Row(
                          children: [
                            getContact(),
                            const Spacer(),
                            Text(
                              ContractStatus.getValue(widget.auditState)
                                  .typeStr,
                              // ContractStatus.getValue(widget.auditState).typeNum ==
                              //         12
                              //     ? "已同意"
                              //     : '已驳回',
                              style: TextStyle(
                                  color: getColor(widget.auditState),
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        // const Spacer(),
                        8.hb,
                        ContractStatus.getValue(widget.auditState).typeNum !=
                                    3 ||
                                ContractStatus.getValue(widget.auditState)
                                        .typeNum !=
                                    6 ||
                                ContractStatus.getValue(widget.auditState)
                                        .typeNum !=
                                    13
                            ? const SizedBox()
                            : Flexible(
                                child: Text(
                                  '${getFailure(widget.auditState)}:${saleInfo?.dealerAuditInfo.deaerRejectReason}',
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
                    ContractStatus.getValue(widget.auditState).typeNum == 3 ||
                            ContractStatus.getValue(widget.auditState)
                                    .typeNum ==
                                6 ||
                            ContractStatus.getValue(widget.auditState)
                                    .typeNum ==
                                13
                        ? 32.hb
                        : 0.hb,
                    Row(
                      children: [
                        getContact(),
                        const Spacer(),
                        Text(
                          ContractStatus.getValue(widget.auditState).typeStr,
                          // ContractStatus.getValue(widget.auditState).typeNum ==
                          //         12
                          //     ? "已同意"
                          //     : '已驳回',
                          style: TextStyle(
                              color: getColor(widget.auditState),
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    8.hb,
                    ContractStatus.getValue(widget.auditState).typeNum != 3 ||
                            ContractStatus.getValue(widget.auditState)
                                    .typeNum !=
                                6 ||
                            ContractStatus.getValue(widget.auditState)
                                    .typeNum !=
                                13
                        ? const SizedBox()
                        : Flexible(
                            child: Text(
                              '${getFailure(widget.auditState)}:${saleInfo?.dealerAuditInfo.deaerRejectReason}',
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
        ;
  }

  //
  // getText(int status) {
  //   if (widget.status == 1) {
  //     switch (ContractStatus.getValueAuditId(status).typeNum) {
  //       case 2:
  //         return '已通过';
  //       case 4:
  //         return '已驳回';
  //       default:
  //         return "";
  //     }
  //   } else {
  //     switch (ContractStatus.getValueAuditId(status).typeNum) {
  //       case 1:
  //         return '待审批';
  //       case 2:
  //         return '已通过';
  //       case 4:
  //         return '已驳回';
  //       default:
  //         return "";
  //     }
  //   }
  // }

  getColor(int status) {
    if (widget.status == 1) {
      switch (ContractStatus.getValue(widget.auditState).typeNum) {
        case 2:
          return const Color(0xFF027AFF);
        case 4:
          return const Color(0xFFFE8029);
        default:
          return const Color(0xFF027AFF);
      }
    } else {
      switch (ContractStatus.getValue(widget.auditState).typeNum) {
        case 1:
          return const Color(0xFFFE8029);
        case 2:
          return const Color(0xFF027AFF);
        case 4:
          return const Color(0xFFFF3B02);
        default:
          return const Color(0xFFFF3B02);
      }
    }
  }

  getFailure(int status) {
    switch (status) {
      case 3:
        return '拒签理由';
      case 6:
        return '失败理由';
      case 13:
        return '驳回理由';
    }
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

  //标签样式
  _getChip(String num, String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF027AFF).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            num,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF027AFF)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            time,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        ),
        16.wb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
              color: const Color(0xFF4F5A74).withOpacity(0.08),
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            distance,
            style: TextStyle(
                fontSize: BaseStyle.fontSize20, color: const Color(0xFF4F5A74)),
          ),
        )
      ],
    );
  }

  //车辆信息下拉
  _getList() {
    return DropDown(
      border: true,
      title: Text(
        '车辆总价',
        style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w800),
      ),
      text: SizedBox(
          child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '¥',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold)),
        TextSpan(
            text: saleInfo?.baseInfo.amount ?? '',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(fontWeight: FontWeight.bold)),
      ]))),
      widget: Container(
          padding: EdgeInsets.only(top: 16.w),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getCar(
                  '车辆定金',
                  //(_consignmentInfoList.contractSignAt).toString()),
                  saleInfo?.baseInfo.deposit ?? ''),
              46.wb,
              Container(
                width: 1.w,
                height: 72.w,
                color: BaseStyle.coloreeeeee,
              ),
              46.wb,
              _getCar('车辆首付', saleInfo?.baseInfo.downPayment ?? ''),
              46.wb,
              Container(
                width: 1.w,
                height: 72.w,
                color: BaseStyle.coloreeeeee,
              ),
              46.wb,
              _getCar('车辆尾款', saleInfo?.baseInfo.balancePayment ?? ''),
            ],
          )),
    );
  }

  //车辆信息底部文字样式
  _getCar(String title, String text) {
    return SizedBox(
      width: 144.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: BaseStyle.fontSize24, color: BaseStyle.color999999),
          ),
          24.hb,
          Text.rich(TextSpan(children: [
            TextSpan(
                text: '¥',
                style: TextStyle(
                    fontSize: BaseStyle.fontSize20,
                    color: BaseStyle.color333333,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: text,
                style: TextStyle(
                    fontSize: BaseStyle.fontSize24,
                    color: BaseStyle.color333333,
                    fontWeight: FontWeight.bold))
          ]))
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
      width: 150.w,
      height: 72.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
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
