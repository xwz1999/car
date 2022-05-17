
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_car/model/car/dealer_list_model.dart';
import 'package:cloud_car/ui/home/func/car_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:cloud_car/widget/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';


typedef CarCallback = Function(DealerListModel model);


///单选
class ChooseDealerPage extends StatefulWidget {
  final CarCallback callback;

  const ChooseDealerPage({
    super.key,
    required this.callback,
  });

  @override
  _ChooseDealerPageState createState() => _ChooseDealerPageState();
}

class _ChooseDealerPageState extends State<ChooseDealerPage> {
  //选中的item
   final List<int> _selectIndex = [];
   final List<DealerListModel> _chooseModels = [];


   List<DealerListModel> _list = [];


   bool _onLoad = true;

   final EasyRefreshController _easyRefreshController = EasyRefreshController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      appBar: AppBar(
        leading: const CloudBackButton(),
        title: const Text('选择车商'),
        backgroundColor: Colors.white,
      ),
      body: Column(

        children: [
          // _getAppbar() ?? const SizedBox(),
          Expanded(
            child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              controller: _easyRefreshController,
              onRefresh: () async {
                _list = await CarFunc.getDealerList();
                _onLoad = false;
                setState(() {});
              },
              // onLoad: () async {
              //   _page++;
              //   BaseListModel baseList = await apiClient.requestList(
              //       API.car.dealerList,
              //       data: {'page': _page, 'size': 10,});
              //
              //   if (baseList.nullSafetyTotal > _list.length) {
              //     _list.addAll(baseList.nullSafetyList
              //         .map((e) => DealerListModel.fromJson(e))
              //         .toList());
              //   } else {
              //     _easyRefreshController.finishLoad(noMore: true);
              //   }
              //   setState(() {});
              // },
              child: _onLoad
                  ? const SizedBox()
                  : _list.isEmpty
                  ? const NoDataWidget(
                text: '未找到相关车商',
                paddingTop: 300,
              )
                  :    ListView.separated(
                padding: EdgeInsets.only(left: 24.w,right: 24.w,top: 20.w),
                itemBuilder: (context, index) {
                  return _getCustom(index,_list[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: const Color(0xFFF6F6F6),
                    height: 16.w,
                  );
                },
                itemCount: _list.length,
              ),
            ),
          ),


        ],
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
                  BotToast.showText(text: '请先选择客户');
                }else{
                  widget.callback(_list[_selectIndex.first]);
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



  _getCustom(int index,DealerListModel model){
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
               Text(model.name,style: TextStyle(
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
           // getContentItem('最近跟进',model.trailContent),
           // getContentItem('跟进时间',                          DateUtil.formatDateMs(
           //     model.trailCreatedAt.toInt() * 1000,
           //     format: 'yyyy-MM-dd HH-mm-ss'),),
           // getContentItem('客户来源','微信小程序'),
           // getContentItem('注册时间',   DateUtil.formatDateMs(model.createdAt.toInt() * 1000,
           //     format: 'yyyy-MM-dd HH-mm-ss'),),
           // getContentItem('销售',model.brokerName),
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
