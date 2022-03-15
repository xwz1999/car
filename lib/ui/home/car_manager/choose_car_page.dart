import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/CarItemModel.dart';
import 'package:cloud_car/ui/home/share/share_car_detail_page.dart';
import 'package:cloud_car/utils/headers.dart';

import 'package:flutter/material.dart';

import '../../../widget/button/colud_check_radio.dart';
import '../../../widget/car_item_widget.dart';
import '../../../widget/button/cloud_back_button.dart';

typedef CarCallback = Function(String city);


///单选
class ChooseCarPage extends StatefulWidget {
  final CarCallback callback;
  const ChooseCarPage({
    Key? key, required this.callback,
  }) : super(key: key);

  @override
  _ChooseCarPageState createState() => _ChooseCarPageState();
}

class _ChooseCarPageState extends State<ChooseCarPage> {
  //选中的item
   final List<int> _selectIndex = [];
   final List<CarItemModel> _chooseModels = [];

   List<CarItemModel> models = [
     CarItemModel(
       name: '奔驰CLE 插电混动 纯电动续航103km',
       time: '2019年5月',
       distance: '20.43万公里',
       standard: '国六',
       url: Assets.images.homeBg.path,
       price: '27.43万',
     ),
     CarItemModel(
       name: '奔驰CLE 插电混动 纯电动续航103km',
       time: '2019年5月',
       distance: '20.43万公里',
       standard: '国六',
       url: Assets.images.homeBg.path,
       price: '27.43万',
     ),
     CarItemModel(
       name: '奔驰CLE 插电混动 纯电动续航103km',
       time: '2019年5月',
       distance: '20.43万公里',
       standard: '国六',
       url: Assets.images.homeBg.path,
       price: '27.43万',
     ),
     CarItemModel(
       name: '奔驰CLE 插电混动 纯电动续航103km',
       time: '2019年5月',
       distance: '20.43万公里',
       standard: '国六',
       url: Assets.images.homeBg.path,
       price: '27.43万',
     ),
     CarItemModel(
       name: '奔驰CLE 插电混动 纯电动续航103km',
       time: '2019年5月',
       distance: '20.43万公里',
       standard: '国六',
       url: Assets.images.homeBg.path,
       price: '27.43万',
     ),
     CarItemModel(
       name: '奔驰CLE 插电混动 纯电动续航103km',
       time: '2019年5月',
       distance: '20.43万公里',
       standard: '国六',
       url: Assets.images.homeBg.path,
       price: '27.43万',
     ),
     CarItemModel(
       name: '奔驰CLE 插电混动 纯电动续航103km',
       time: '2019年5月',
       distance: '20.43万公里',
       standard: '国六',
       url: Assets.images.homeBg.path,
       price: '27.43万',
     ),
   ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('选择预定车辆',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
        //leading:  Container(width: 10.w, child: const CloudBackButton()),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.only(left: 24.w,right: 24.w,top: 20.w),
          itemBuilder: (context, index) {
            return _getItem(index,models[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: const Color(0xFFF6F6F6),
              height: 16.w,
            );
          },
          itemCount: models.length,
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30.w),
        height: 150.w,
        color: kForeGroundColor,
        child:
            GestureDetector(
              onTap: (){
                if(_selectIndex.isEmpty){
                  BotToast.showText(text: '请先选择车辆');
                }else{
                  widget.callback(models[_selectIndex.first].name??'');
                  Get.back();
                }

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
                  '确定选择',
                  style: TextStyle(
                      color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
                ),
              ),
            ),
      ),
    );
  }

  _getItem(int index,CarItemModel model) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w)
      ),
      // width: double.infinity,
      height: 250.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){

              if (_selectIndex.contains(index)) {
                _selectIndex.remove(index);
                _chooseModels.remove(model);
              } else {
                _selectIndex.clear();
                _selectIndex.add(index);
                _chooseModels.add(model);
              }

              setState(() {});
            },
            child: Container(
              color: Colors.transparent,

              height: 230.w,
              child: Container(

                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: double.infinity,
                alignment: Alignment.center,
                child: BeeCheckRadio(
                  value: index,
                  groupValue: _selectIndex,
                  //backColor: Colors.blue,
                  // indent: Container(
                  //   width: 24.w,
                  //   height: 24.w,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(22.w),
                  //       border: Border.all(color: Color(0xFFCCCCCC),width: 2.w)),
                  // ),
                ),
              ),
            ),
          ),
          Expanded(
            child: CarItemWidget(
              widgetPadding: EdgeInsets.zero,
              name: '奔驰CLE 插电混动 纯电动续航103km',
              time: '2019年5月',
              distance: '20.43万公里',
              standard: '国六',
              url: Assets.images.homeBg.path,
              price: '27.43万',
            ),
          ),
        ],
      ),
    );
  }
}
