import 'package:cloud_car/model/order/Sale_info.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/progress_bar.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class MakeDealData extends StatefulWidget {
  final int id;
  final int statusNum;

  ///状态进度数值
  const MakeDealData({Key? key, required this.id, required this.statusNum})
      : super(key: key);

  @override
  State<MakeDealData> createState() => _MakeDealDataState();
}

class _MakeDealDataState extends State<MakeDealData> {
  late SaleInfo _consignmentInfoList = const SaleInfo(
      id: 0,
      car: Car(
          licensingDate: 0,
          carId: 0,
          mainPhoto: '',
          mileage: '',
          modelName: '',
          transfer: 0),
      contract: Contract(
        amount: '',
        deposit: '',
        balancePayment: '',
        contract: 0,
        downPayment: '',
        serviceFee: '',
        signAt: 0,
        totalAmount: '',
      ),
      deposit: Deposit(amount: '', createdAt: 0, payType: ''),
      downPayment: DownPayment(
        amount: '',
        createdAt: 0,
        proof: '',
      ),
      balancePayment: BalancePayment(amount: '', createdAt: 0, proof: ''),
      report: Report(path: '', reportId: 0),
      means: Means(
          certificate: '', guaranteeSlip: '', invoice: '', vehicleLicense: ''));
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () async {
      await _refresh();
      setState(() {});
    });
  }

  _refresh() async {
    _consignmentInfoList = (await OrderFunc.getSaleInfo(widget.id))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('售车订单',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: bodyColor,
        body: ListView(
          children: [
            16.hb,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.only(top: 32.w),
              height: 120.w,
              color: Colors.white,
              child: ProgressBar(
                length: 6,
                num: widget.statusNum,
                direction: false,
                HW: 96,
                texts: [
                  text('预定'),
                  text('检测'),
                  text('首付'),
                  text('过户'),
                  text('尾款'),
                  text('完成'),
                ],
              ),
            ),
            16.hb,
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('客户信息'),
                  ),
                  36.hb,
                  _getText('客户姓名', '莉丝'),
                  36.hb,
                  _getText(
                    '手机号',
                    '18912345432',
                  )
                ],
              ),
            ),
            16.hb,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: kForeGroundColor),
              child: GestureDetector(
                onTap: () {
                  //Get.to(() => const Reservation(judge: null,));
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getTitle('车辆信息'),
                      24.hb,
                      Row(
                        children: [
                          SizedBox(
                            width: 196.w,
                            height: 150.w,
                            child: CloudImageNetworkWidget.car(
                              urls: [_consignmentInfoList.car.mainPhoto],
                            ),
                          ),
                          20.wb,
                          SizedBox(
                            width: 406.w,
                            child: Column(
                              children: [
                                Text(_consignmentInfoList.car.modelName,
                                    style: TextStyle(
                                        fontSize: BaseStyle.fontSize28,
                                        color: BaseStyle.color111111)),
                                26.hb,
                                getCaip(
                                  '过户${_consignmentInfoList.car.transfer}次',
                                  DateUtil.formatDateMs(
                                      _consignmentInfoList.car.licensingDate
                                              .toInt() *
                                          1000,
                                      format: 'yyyy年MM月'),
                                  '${_consignmentInfoList.car.mileage}万公里',
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      40.hb,
                      getList(),
                    ]),
              ),
            ),
            16.hb,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('合同信息'),
                  ),
                  36.hb,
                  _getText('合同编号',
                      (_consignmentInfoList.contract.contract).toString()),
                  36.hb,
                  _getText(
                    '签订时间',
                    DateUtil.formatDateMs(
                        _consignmentInfoList.contract.signAt.toInt() * 1000,
                        format: 'yyyy-MM-dd HH:mm:ss'),
                  )
                ],
              ),
            ),
            16.hb,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: getTitle('支付信息'),
                  ),
                  16.hb,
                  _getText('定金支付', '¥${_consignmentInfoList.contract.deposit}'),
                  16.hb,
                  _getText('支付方式', '支付宝'),
                  16.hb,
                  _getText('支付时间', '2022-12-30 15:23:48'),
                  56.hb,
                  _getText(
                      '首付支付', '¥${_consignmentInfoList.contract.downPayment}'),
                  16.hb,
                  _getPicture2(
                    '支付凭证',
                    CloudImageNetworkWidget.car(
                        urls: [_consignmentInfoList.downPayment.proof]),
                  ),
                  16.hb,
                  _getText('支付时间', '2022-12-30 15:23:48'),
                  56.hb,
                  _getText('尾款支付',
                      '¥${_consignmentInfoList.contract.balancePayment}'),
                  16.hb,
                  _getText('支付形式', '按揭支付'),
                  16.hb,
                  _getText('支付时间', '2022-12-30 15:23:48'),
                ],
              ),
            ),
            16.hb,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.w),
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              child: _getPicture('车辆检测报告'),
            ),
            16.hb,
            Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.w),
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTitle("车辆检测报告"),
                    36.hb,
                    getPhoto(
                      '登记证书',
                      CloudImageNetworkWidget.car(
                        urls: [_consignmentInfoList.means.certificate],
                      ),
                    ),
                    36.hb,
                    getPhoto(
                      '行驶证',
                      CloudImageNetworkWidget.car(
                        urls: [_consignmentInfoList.means.vehicleLicense],
                      ),
                    ),
                    36.hb,
                    getPhoto(
                      '发票',
                      CloudImageNetworkWidget.car(
                        urls: [_consignmentInfoList.means.invoice],
                      ),
                    ),
                    36.hb,
                    getPhoto(
                      '保单',
                      CloudImageNetworkWidget.car(
                        urls: [_consignmentInfoList.means.guaranteeSlip],
                      ),
                    ),
                    SizedBox(
                      width: 686.w,
                    )
                  ],
                )),
            36.hb,
          ],
        )

        // body: Column(
        //   children: [
        //     Container(
        //       decoration: BoxDecoration(
        //           color: kForeGroundColor,
        //           borderRadius: BorderRadius.circular(8.w)),
        //       child: Column(children: [

        //       ]),
        //     )
        //   ],
        // ),
        );
  }

  _getPicture(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        24.hb,
        GestureDetector(
          child: Container(
            color: Colors.red,
            width: 200.w,
            height: 150.w,
          ),
        )
      ],
    );
  }

//文字加图片样式
  getPhoto(String title, CloudImageNetworkWidget url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
        ),
        GestureDetector(
          child: SizedBox(
            width: 200.w,
            height: 150.w,
            child: url,
          ),
        )
      ],
    );
  }

  _getPicture2(String title, CloudImageNetworkWidget url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        24.hb,
        GestureDetector(
          child: SizedBox(
            width: 200.w,
            height: 150.w,
            child: url,
          ),
        )
      ],
    );
  }

  _getText(String title, String text) {
    return Row(
      children: [
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
        ),
        32.wb,
        Padding(
          padding: EdgeInsets.only(left: 0.w),
          child: Text(
            text,
            style: TextStyle(
                color: BaseStyle.color333333, fontSize: BaseStyle.fontSize28),
          ),
        )
      ],
    );
  }

  getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  getCaip(String num, String time, String distance) {
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
        // Padding(padding: EdgeInsets.symmetric(horizontal: 24.w)),
        // Chip(
        //   label: Text(num),
        //   labelPadding: EdgeInsets.only(left: 8.w, top: 8.w),
        //   backgroundColor: const Color(0xFF027AFF).withOpacity(0.08),
        //   labelStyle: TextStyle(
        //       fontSize: BaseStyle.fontSize20, color: const Color(0xFF027AFF)),
        //   shape:
        //       BeveledRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        // ),
        // ChipTheme(
        //     data: ChipThemeData(
        //       backgroundColor: const Color(0xFF4F5A74).withOpacity(0.08),
        //       labelStyle: TextStyle(
        //           fontSize: BaseStyle.fontSize20,
        //           color: const Color(0xFF4F5A74)),
        //       shape: BeveledRectangleBorder(
        //           borderRadius: BorderRadius.circular(4.w)),
        //       labelPadding: EdgeInsets.only(left: 8.w, top: 8.w),
        //     ),
        //     child: Wrap(
        //       children: [Chip(label: Text(time)), Chip(label: Text(distance))],
        //     ))
      ],
    );
  }

  //车辆信息下拉
  getList() {
    return ExpansionTile(
      //backgroundColor: const Color(0xFF027AFF).withOpacity(0.1),
      //leading: Icon(Icons.),
      collapsedBackgroundColor: kForeGroundColor,

      title: Row(
        children: [
          getTitle('车辆总价'),
          185.wb,
          SizedBox(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: '¥',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: '300,000.00',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ])),
          ),
        ],
      ),
      children: [
        Container(
            color: kForeGroundColor,
            child: Row(
              children: [
                32.wb,
                _getCar('车辆定金', _consignmentInfoList.contract.deposit),
                46.wb,
                Container(
                  width: 1.w,
                  height: 72.w,
                  color: BaseStyle.coloreeeeee,
                ),
                46.wb,
                _getCar('车辆首付', _consignmentInfoList.contract.downPayment),
                46.wb,
                _getCar('车辆尾款', _consignmentInfoList.contract.balancePayment),
              ],
            ))
      ],
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

  text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: BaseStyle.color111111, fontSize: BaseStyle.fontSize24),
    );
  }
}
