
import 'package:cloud_car/model/car/car_amount_model.dart';
import 'package:cloud_car/model/car/car_list_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/sell_car_order_second_page.dart';
import 'package:cloud_car/ui/home/car_manager/publish_contract/initiate_contract_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SellCarOrderPage extends StatefulWidget {
  final  CarListModel carModel;

  const SellCarOrderPage({super.key, required this.carModel});

  @override
  _SellCarOrderPageState createState() => _SellCarOrderPageState();
}

class _SellCarOrderPageState extends State<SellCarOrderPage> {


  final ValueNotifier<InitiateContractModel> _contractModel = ValueNotifier(
      InitiateContractModel());

  CarAmountModel? carAmountModel;




  @override
  void initState() {


    super.initState();

    Future.delayed(const Duration(milliseconds: 0), () async {
      carAmountModel = await CarFunc.getCarAmount(num.parse(widget.carModel.price));

      _contractModel.value.carAmountModel = carAmountModel;

      _contractModel.value.origin = '微信小程序';

      _contractModel.value.carModel = widget.carModel;

      setState(() {

      });

    });
  }


  @override
  void dispose() {

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
        title: Text('发起合同',
          style: Theme.of(context)
              .textTheme
              .headline4,
        ),
      ),
      backgroundColor: bodyColor,
      extendBody: true,

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          16.hb,
          Padding(
            padding:  EdgeInsets.all(24.w),
            child: Container(
              width: double.infinity,

              color: kForeGroundColor,
              padding: EdgeInsets.only(left: 24.w,right: 24.w,top: 24.w,bottom: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CarItemWidget(
                    widgetPadding: EdgeInsets.zero,
                    name: widget.carModel.modelName,
                    time:  DateUtil.formatDateMs(widget.carModel.licensingDate.toInt() * 1000,
                        format: 'yyyy年MM月'),
                    distance:  '${widget.carModel.mileage}万公里',
                    //standard: '国六',
                    url:widget.carModel.mainPhoto,
                    price:  NumUtil.divide(num.parse(widget.carModel.price), 10000).toString(),
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(left: 24.w,top: 12.w),
            child: Text('销售信息',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1?.copyWith(
                  color: BaseStyle.color111111,fontWeight: FontWeight.bold
              ),
            ),
          ),
          20.hb,
          Container(
            width: double.infinity,

            color: kForeGroundColor,
            padding: EdgeInsets.only(left: 32.w,right: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditItemWidget(
                  paddingTop: 30.w,

                  title: '成交价',
                  value: widget.carModel.price,
                  callback: (String content) {},
                  endText: '元',
                  canChange: false,
                  tips: '',

                ),

                EditItemWidget(

                  title: '定金',
                  topIcon: false,
                  value: carAmountModel==null? '':carAmountModel!.deposit,
                  callback: (String content) {},
                  endText: '元',
                  canChange: false,
                  tips: '',

                ),
                EditItemWidget(

                  title: '首付',
                  topIcon: false,
                  value: carAmountModel==null? '':carAmountModel!.downPayment,
                  callback: (String content) {},
                  endText: '元',
                  canChange: false,
                  tips: '',

                ),

                EditItemWidget(

                  title: '尾款',
                  topIcon: false,
                  value: carAmountModel==null? '':carAmountModel!.balancePayment,
                  tips: '',
                  callback: (String content) {},
                  endText: '元',
                  canChange: false,

                ),

                EditItemWidget(

                  title: '服务费比列',
                  canChange: false,
                  value: carAmountModel==null? '':'${double.parse(carAmountModel!.serviceFeeRate)  * 100}%' ,
                  callback: (String content) {},
                  endText: '元',


                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 40.w),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 10.w),
                //         child: Text(
                //           '*  ',
                //           style: TextStyle(
                //             fontSize: 28.sp,
                //             color: const Color(0xFFE62222),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 170.w,
                //         child: Text(
                //           '付款方式',
                //           style: TextStyle(
                //             fontSize: 28.sp,
                //             color: const Color(0xFF999999),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 50.w,
                //         child: getChooseList(
                //                 (String choice) {}, _models1, _selectIndex1),
                //       ),
                //     ],
                //   ),
                // ),
                //
                // Padding(
                //   padding: EdgeInsets.only(top: 40.w),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 10.w),
                //         child: Text(
                //           '*  ',
                //           style: TextStyle(
                //             fontSize: 28.sp,
                //             color: const Color(0xFFE62222),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 170.w,
                //         child: Text(
                //           '过户方式',
                //           style: TextStyle(
                //             fontSize: 28.sp,
                //             color: const Color(0xFF999999),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 50.w,
                //         child: getChooseList(
                //                 (String choice) {}, _models2, _selectIndex2),
                //       ),
                //     ],
                //   ),
                // ),
                30.hb,

              ],
            ),
          ),

          30.hb,

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30.w),
            height: 150.w,

            child:
            GestureDetector(
              onTap: (){

                  Get.to(()=> SellCarOrderSecondPage(contractModel: _contractModel,));


              },
              child:Container(
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
                  '下一步',
                  style: TextStyle(
                      color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
                ),
              ),
            ),
          ),
          30.hb,


        ],
      ),
    );
  }

  getChooseList(Function(String) callBack, List models, List<int> choices) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        ...models
            .mapIndexed((currentValue, index) => GestureDetector(
          onTap: () {
            if (choices.contains(index)) {
              choices.remove(index);
            } else {
              choices.clear();
              choices.add(index);
            }
            setState(() {});
          },
          child: Container(
            width: 160.w,
            color: Colors.white,
            child: Row(
              children: [
                BeeCheckRadio(
                  value: index,
                  groupValue: choices,
                ),
                16.wb,
                Text(
                  currentValue,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ))
            .toList(),
      ],
    );
  }
}


