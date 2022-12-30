import 'package:cloud_car/utils/headers.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import '../../model/car/new_car_info.dart';
import '../../model/customer/customer_detail_model.dart';
import '../../model/sale_info_model.dart';
import '../../utils/drop_down_body.dart';
import '../../widget/cloud_image_network_widget.dart';
import '../home/func/car_func.dart';

class SellWidget extends StatefulWidget {
  // final SaleInfoModel? saleInfo;
  final int saleId;
final  CustomerDetailModel? customerDetail;
  const SellWidget({Key? key, required this.saleId,required this.customerDetail})
      : super(key: key);

  @override
  _SellWidgetState createState() => _SellWidgetState();
}

class _SellWidgetState extends State<SellWidget> {
  bool middleSide = true;
  SaleInfoModel? saleInfo;
  NewCarInfo? carInfo;
  ///居间方   无
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0),()async{
    saleInfo=  await CarFunc.getSaleInfo(widget.saleId);
    carInfo=await CarFunc.getNewCarInfo(saleInfo!.baseInfo.carId);

    });
    print('执行成');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return

      ListView(
      children: [
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
                          child: const CloudImageNetworkWidget.car(urls: []),
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
                                '过户${carInfo?.carInfo.certificateInfo.transfer ?? 0}次',
                               carInfo?.carInfo.licensingDate != null
                                    ? DateUtil.formatDateMs(
                                       carInfo!.carInfo.licensingDate
                                                .toInt() *
                                            1000,
                                        format: 'yyyy年 ')
                                    : '0',
                                '${carInfo?.carInfo.mileage ?? 0}万公里',
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
          _getTitle('备注', '蓝色，无损坏'),
        ])),
        saleInfo!.thirdPartKind !=1
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
                _getTitle('居间方', saleInfo?.thirdPartKindName ??'' ),
                16.hb,
                _getTitle('卖方服务费',
                    '${saleInfo?.baseInfo.saleServiceFeeRate ?? ''}%'),
                16.hb,
                _getTitle(
                    '服务费金额', saleInfo?.baseInfo.saleServiceFee ?? ''),
                16.hb,
                _getTitle('买方服务费',
                    '${saleInfo?.baseInfo.purchaseServiceFeeRate ?? ''}%'),
                16.hb,
                _getTitle('服务费金额',
                    saleInfo?.baseInfo.purchaseServiceFee ?? ''),
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
                _getTitle('居间方', '无'),
              ])),
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
            text:saleInfo?.baseInfo.amount ?? '',
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
              _getCar('车辆尾款',saleInfo?.baseInfo.balancePayment ?? ''),
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
