
import 'package:cloud_car/ui/home/car_manager/direct_sale/cars_detail_page.dart';
import 'package:cloud_car/utils/drop_down_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/screen_widget.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


///评估车辆页面
class AssessmentCarPage extends StatefulWidget {
  final Function callBack;
  const AssessmentCarPage({Key? key, required this.callBack}) : super(key: key);

  @override
  _AssessmentCarPageState createState() => _AssessmentCarPageState();
}

class _AssessmentCarPageState extends State<AssessmentCarPage> {
   final List<String>   _dropDownHeaderItemStrings = [
    '排序',
  ];

   ScreenControl screenControl = ScreenControl();

  List<Widget> listWidget = [];
   List<ChooseItem> _sortList = [];
   @override
   void initState() {
     super.initState();


     _sortList = [
       ChooseItem(name: '最近创建'),
       ChooseItem(name: '标价最高'),
       ChooseItem(name: '标价最低'),
       ChooseItem(name: '车龄最短'),
       ChooseItem(name: '里程最少'),
       ChooseItem(name: '最近更新'),
     ];


     listWidget = [
       Container(
         width: double.infinity,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(16.w)),
             color: kForeGroundColor),
         clipBehavior: Clip.antiAlias,
         child: ScreenWidget(
           childAspectRatio: 144 / 56,
           callback: (String item,int value) {
             if (kDebugMode) {
               print(item);
             }
             ///调研接口 按照item进行排序
             screenControl.screenHide();
             setState(() {

             });
           },
           mainAxisSpacing: 10.w,
           crossAxisSpacing: 24.w,
           crossAxisCount: 4,
           haveButton: true,
           itemList: _sortList, pickString: '',
         ),
       ),
     ];

   }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height:  kToolbarHeight ,
        ),
        Expanded(
          child: DropDownWidget(
            _dropDownHeaderItemStrings,
            listWidget,
            height: 76.w,
            bottomHeight: 24.w,
            screenControl: screenControl,
            headFontSize: 28.sp,
            child: Container(
              margin: EdgeInsets.only(top: 80.w),
              child: ListView.separated(
                shrinkWrap: true,
                padding:
                EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                itemBuilder: (context, index) {
                  return getItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: const Color(0xFFF6F6F6),
                    height: 16.w,
                  );
                },
                itemCount: 10,
              ),
            ),
            screen: '筛选',
            onTap:
                () {
              screenControl.screenHide();
              widget.callBack();
            },
          ),
        )
      ],
    );
  }
  
  getItem(){
     return GestureDetector(
       onTap: (){
         Get.to(()=>const CarsDetailPage());
       },
       child: Container(
         padding: EdgeInsets.symmetric(vertical: 24.w,horizontal: 32.w),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(8.w),


         ),
         height: 500.w,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Expanded(
               child: Row(
                 children: [
                   Text(
                     '奥迪A3 2020款 35 TFSI 进取型 国V',
                     style: TextStyle(
                         color: BaseStyle.color333333,
                         fontSize: BaseStyle.fontSize32,
                         fontWeight: FontWeight.bold
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ],
               ),
             ),
             16.hb,
             getText('车架号','GDL26173890989890'),

             16.hb,
             getText('首次上牌','2020-01'),
             16.hb,
             getText('车牌号','浙B236Y'),
             16.hb,
             getText('发动机号','647382'),
             16.hb,
             getText('车身颜色','白色'),
             16.hb,
             getText('显表里程','3.0万公里'),
             16.hb,
             getText('系统估计','8.80万元',isRed: true),

           ],
         ),
       ),
     );
     
     
  }


  getText(String title,String content,{bool isRed = false,}){
     return           Row(
       children: [
         SizedBox(
           width: 180.w,
           child: Text(
             title,
             style: TextStyle(
                 color: BaseStyle.color666666,
                 fontSize: BaseStyle.fontSize28,

             ),
           ),
         ),

         Text(
           content,
           style: TextStyle(
               color:isRed?const Color(0xFFFF3B02): BaseStyle.color333333,
               fontSize: BaseStyle.fontSize28,

           ),

         ),
       ],
     );
  }
  
  
  
}
