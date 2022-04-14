import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/car_item_model.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:flutter/material.dart';


typedef CarCallback = Function(String city);


///单选
class ChooseCustomerPage extends StatefulWidget {
  final CarCallback callback;
  const ChooseCustomerPage({
    Key? key, required this.callback,
  }) : super(key: key);

  @override
  _ChooseCustomerPageState createState() => _ChooseCustomerPageState();
}

class _ChooseCustomerPageState extends State<ChooseCustomerPage> {
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
        title: Text('选择客户',
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
            return _getCustom(index,models[index]);
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
                  widget.callback('张三');
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


  _getCustom(int index,CarItemModel model){
    return GestureDetector(
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
          padding: EdgeInsets.symmetric(vertical: 22.w,horizontal: 32.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w)
        ),
       child: Column(
         children: [
           Row(
             children: [
               Image.asset(Assets.icons.icUser.path,width: 40.w,height: 40.w,),
               8.wb,
               Text('李四',style: TextStyle(
                 fontSize: 32.sp,color: const Color(0xFF333333),fontWeight: FontWeight.bold
               ),),
               const Spacer(),
               Container(
                 color: Colors.transparent,

                 height: 42.w,
                 child: Container(

                   padding: EdgeInsets.symmetric(horizontal: 16.w),
                   height: double.infinity,
                   alignment: Alignment.center,
                   child: BeeCheckRadio(
                     value: index,
                     groupValue: _selectIndex,
                   ),
                 ),
               ),
             ],
           ),
           getContentItem('最近跟进','客户浏览车辆信息'),
           getContentItem('跟进时间','2021-12-01 12:22:12'),
           getContentItem('客户来源','微信小程序'),
           getContentItem('注册时间','2021-10-12 14:23:56'),
           getContentItem('销售','张三'),
         ],
       ),
      ),
    );
  }


   getContentItem(String title,String content){
     return Padding(
       padding:  EdgeInsets.only(top: 16.w),
       child: Row(
         children: [
           SizedBox(
             width: 150.w,
             child: Text(title,style: TextStyle(
               fontSize: 28.sp,color: const Color(0xFF999999),
             ),),
           ),
           Expanded(child: Text(content.isEmpty?'-':content,style: TextStyle(
               fontSize: 28.sp,color: BaseStyle.color333333),maxLines: 2,overflow: TextOverflow.ellipsis,)),

         ],
       ),
     );
   }

}
