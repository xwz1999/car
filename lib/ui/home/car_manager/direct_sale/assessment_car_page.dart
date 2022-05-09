
import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/car/car_evaluation_model.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/cars_detail_page.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';


///评估车辆页面

class AssessmentCarPage extends StatefulWidget {
  final EasyRefreshController refreshController;
  final ValueNotifier<SearchParamModel> pickCar;
  const AssessmentCarPage({Key? key, required this.refreshController, required this.pickCar, }) : super(key: key);

  @override
  _AssessmentCarPageState createState() => _AssessmentCarPageState();
}

class _AssessmentCarPageState extends State<AssessmentCarPage> with AutomaticKeepAliveClientMixin {

   String? get _modelName => widget.pickCar.value.keyWords;


   int _page = 1;
   final int _size = 10;


   bool _onLoad = true;
   late List<CarEvaluationModel> carList = [];


   @override
   void initState() {
     super.initState();

   }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height:  kToolbarHeight +20 ,
        ),
        Expanded(
          child:
          // DropDownWidget(
          //   _dropDownHeaderItemStrings,
          //   listWidget,
          //   height: 76.w,
          //   bottomHeight: 24.w,
          //   screenControl: screenControl,
          //   headFontSize: 28.sp,
          //   child: Container(
          //     margin: EdgeInsets.only(top: 80.w),
          //     child: ListView.separated(
          //       shrinkWrap: true,
          //       padding:
          //       EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
          //       itemBuilder: (context, index) {
          //         return getItem();
          //       },
          //       separatorBuilder: (BuildContext context, int index) {
          //         return Container(
          //           color: const Color(0xFFF6F6F6),
          //           height: 16.w,
          //         );
          //       },
          //       itemCount: 10,
          //     ),
          //   ),
          //   screen: '筛选',
          //   onTap:
          //       () {
          //     screenControl.screenHide();
          //     widget.callBack();
          //   },
          // ),

          EasyRefresh.custom(
            firstRefresh: true,
            controller: widget.refreshController,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            onRefresh: () async {
              _page = 1;

              var list = await CarFunc.getCarEvaluationList(
                  _page,
                  _size,
                  keyWords:_modelName );


              carList.clear();
              carList.addAll(list);
              _onLoad = false;
              setState(() {});
            },
            onLoad: () async {
              _page++;
              var baseList =
              await apiClient.requestList(API.car.getCarEvaluationList, data: {
                'page': _page,
                'size': _size,
                'modelName':_modelName,
              });
              if (baseList.nullSafetyTotal > carList.length) {
                carList.addAll(baseList.nullSafetyList
                    .map((e) => CarEvaluationModel.fromJson(e))
                    .toList());
              } else {
                widget.refreshController.finishLoad(noMore: true);
              }
              setState(() {});
            },
            slivers: [
              SliverToBoxAdapter(
                child: 10.hb,
              ),
              _onLoad
                  ? const  SliverToBoxAdapter(
              )
                  : carList.isEmpty
                  ? const SliverToBoxAdapter(
                child: NoDataWidget(
                  text: '暂无相关车辆信息',
                  paddingTop: 300,
                ),
              )
                  :
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      var model = carList[index];
                      return getItem(model);
                    }, childCount: carList.length)),
              ),
            ],
          ),
        )
      ],
    );
  }
  
  getItem(CarEvaluationModel model){
     return GestureDetector(
       onTap: (){
         // Get.to(()=>  CarsDetailPage(isSelf: null,));
       },
       child: Container(
         margin: EdgeInsets.only(bottom: 16.w),
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
                     model.modelName,
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
             getText('车架号',model.vin),

             16.hb,
             getText('首次上牌',DateUtil.formatDateMs(model.licensingDate.toInt() * 1000,
                 format: 'yyyy-MM')),
             16.hb,
             getText('车牌号',model.licensePlate),
             16.hb,
             getText('发动机号',model.engine),
             16.hb,
             getText('车身颜色',model.color),
             16.hb,
             getText('显表里程',model.mileage + '万公里'),
             16.hb,
             getText('系统估计',model.price+'万元',isRed: true),

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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  
  
  
}
