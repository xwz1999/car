import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../model/car/car_evaluation_model.dart';
import '../../model/car/consignment_contact_model.dart';
import '../../widget/button/cloud_back_button.dart';
import '../../widget/cloud_image_network_widget.dart';
import '../home/car_manager/publish_car/push_car_page.dart';
import '../home/car_manager/publish_contract/contract_begin_page.dart';

class EvaluationRecordPage extends StatefulWidget {
  const EvaluationRecordPage({super.key});

  @override
  _EvaluationRecordPageState createState() => _EvaluationRecordPageState();
}

class _EvaluationRecordPageState extends State<EvaluationRecordPage> {
  int _page = 1;
  final int _size = 10;
  List<CarEvaluationModel> lists = [];
  bool _onLoad = true;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  ///寄卖合同model
  final ValueNotifier<ConsignmentContractModel> consignmentContractModel =
      ValueNotifier(ConsignmentContractModel(masterInfo: MasterInfo()));

  @override
  void dispose() {
    _easyRefreshController.dispose();
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
          title: Text('评估记录',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color(0xFFF6F6F6),
        extendBody: true,
        body: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          footer: MaterialFooter(),
          controller: _easyRefreshController,
          onRefresh: () async {
            _page = 1;
            lists =
            await CarFunc.getCarEvaluationList(page: _page, size: _size);
            _onLoad = false;
            setState(() {});
          },
          onLoad: () async {
            _page++;
            await CarFunc.getCarEvaluationList(
              page: _page,
              size: _size,
            ).then((value) {
              if (value.isEmpty) {
                _easyRefreshController.finishLoad(noMore: true);
              } else {
                lists.addAll(value);
                setState(() {});
              }
            });
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return getBox(lists[index]);
            },
            itemCount: lists.length,
          ),
        ),);
  }

  getBox(CarEvaluationModel model) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w), color: Colors.white),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 196.w,
                  height: 150.w,
                  child: const CloudImageNetworkWidget.car(
                    according: true,
                    urls: [],
                  ),
                ),
                20.wb,
                SizedBox(
                  width: 406.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(model.modelName,
                          style: TextStyle(
                              fontSize: BaseStyle.fontSize28,
                              color: BaseStyle.color111111)),
                      32.hb,
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: getText(
                            DateUtil.formatDateMs(
                                model.licensingDate.toInt() * 1000,
                                format: 'yyyy年MM月'),
                            '${num.parse(model.mileage)/10000}万公里'),
                      )
                    ],
                  ),
                ),
              ],
            ),
            16.hb,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '估价结果',
                  style: TextStyle(
                      color: const Color(0x99999999), fontSize: 28.sp),
                ),
                16.wb,
                Text(
                  '${num.parse(model.price) / 10000}万',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 28.sp),
                ),
                48.wb,
                GestureDetector(
                  onTap: () async {
                    var res = await CarFunc.getPriceInfo(model.id);

                    if (res != null) {
                      consignmentContractModel.value.publishCarInfo =
                          PublishCarInfo(
                        viNum: res.vin,
                        carModelId: res.modelId,
                        carName: res.modelName,
                              locationCity:res.cityName,
                        licensingDate: DateTime.fromMillisecondsSinceEpoch(
                            (res.licensingDate).toInt()),
                        engineNum: res.engineNo,
                        carColor: res.color,
                        mileage: res.mileage,

                      );
                      // print(res.vin);
                      // consignmentContractModel.value.publishCarInfo!.viNum =res.vin;
                      // print(consignmentContractModel.value.publishCarInfo!.viNum);
                      // //车架号
                      // consignmentContractModel.value.publishCarInfo!.viNum =
                      //     res.vin;
                      // //车型号
                      // consignmentContractModel
                      //     .value.publishCarInfo!.carModelId = res.modelId;
                      // //首次上牌时间
                      // consignmentContractModel
                      //         .value.publishCarInfo!.licensingDate =
                      //     DateTime.fromMillisecondsSinceEpoch(
                      //         (res.licensingDate).toInt());
                      // //车牌号
                      // // consignmentContractModel.value.publishCarInfo!.carNum=res.cityId
                      // //发动机号
                      // consignmentContractModel.value.publishCarInfo!.engineNum =
                      //     res.engineNo;
                      // //使用性质
                      // //车身颜色
                      // consignmentContractModel.value.publishCarInfo!.carColor =
                      //     res.color;
                      // //表显里程
                      // consignmentContractModel.value.publishCarInfo!.mileage =
                      //     res.mileage;
                      //估算价格
                      consignmentContractModel.value.evaluationPrice =
                          model.price;
                      consignmentContractModel.value.priceId =model.id;

                      Get.to(()=> ContractBeginPage(consignmentContractModel:consignmentContractModel ,));
                    }
                    // Get.to(()=> ContractBeginPage(consignmentContractModel:ConsignmentContractModel() ,));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        border: Border.all(color: const Color(0xFF027AFF))),
                    child: Text(
                      '发起合同',
                      style: TextStyle(
                          fontSize: 28.sp, color: const Color(0xFF027AFF)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  getText(String time, String distance) {
    return Row(
      children: [
        //Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
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
}
