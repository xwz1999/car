
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/toast/cloud_toast.dart';

///调价页面
class ModifyPricePage extends StatefulWidget {
  // final NewCarInfo model;
  final int carId;

  const ModifyPricePage({super.key, required this.carId});

  @override
  _ModifyPricePageState createState() => _ModifyPricePageState();
}

class _ModifyPricePageState extends State<ModifyPricePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _guideController = TextEditingController();
  final TextEditingController _showController = TextEditingController();

  num price = 0;

  @override
  void initState() {
    super.initState();
    // _guideController.text = (num.parse(widget.model.carInfo.newCarGuidePrice)/10000).toString();
    // _showController.text = (num.parse(widget.model.carInfo.price)/10000).toString();
  }

  @override
  void dispose() {
    super.dispose();
    _guideController.dispose();
    _showController.dispose();
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
            '调价',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        backgroundColor: kForeGroundColor,
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(right: 32.w),
          child: Column(
            children: [
              EditItemWidget(
                title: '外部价格',
                controller: _guideController,
                callback: (String content) {
                  if (content != '') {
                    price = (num.parse(content) * 10000);
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                ],
                endText: '万元',
                topIcon: false,
              ),
              EditItemWidget(
                title: '内部价格',
                controller: _showController,
                callback: (String content) {},
                // textColor: const Color(0xFF999999),
                endText: '万元',
                topIcon: false,
                canChange: true,
              ),
              200.hb,
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
                              '是否确认提交调价申请？',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                        items: const ['取消'],
                        deleteItem: '发起',
                        //监听器
                        listener: (index) {
                          Alert.dismiss(context);
                        },
                        deleteListener: () async {
                          Alert.dismiss(context);

                          bool result = await CarFunc.adjustPrice(
                              widget.carId,
                              num.parse(_showController.text) * 10000,
                              (num.parse(_guideController.text) * 10000)
                                  .toString());

                          if (result) {
                            CloudToast.show('调价成功');
                            Get.back();
                            // Get.off(() => SuccessFailurePage(
                            //     conditions: true,
                            //     headline: '调价',
                            //     body: Text(
                            //       '提交成功，等待平台审核',
                            //       style: Theme.of(context).textTheme.subtitle1,
                            //     ),
                            //     bottom: CloudBottomButton(
                            //       onTap: () {
                            //         Get.back();
                            //       },
                            //       text: '返回汽车详情',
                            //     )));
                          }
                        },
                      ));
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: <Color>[
                        Color(0xFF0593FF),
                        Color(0xFF027AFF),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  ),
                  child: Text(
                    '提交',
                    style: TextStyle(
                        color: kForeGroundColor,
                        fontSize: BaseStyle.fontSize28),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
