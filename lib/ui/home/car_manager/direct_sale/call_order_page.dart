import 'package:cloud_car/base/base_style.dart';
import 'package:cloud_car/ui/home/car_manager/choose_car_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/choose_customer_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallOrderPage extends StatefulWidget {
  const CallOrderPage({Key? key}) : super(key: key);

  @override
  _CallOrderPageState createState() => _CallOrderPageState();
}

class _CallOrderPageState extends State<CallOrderPage> {

  late TextEditingController _editingController1;
  late TextEditingController _editingController2;
  late TextEditingController _editingController3;
  late TextEditingController _editingController4;
  late TextEditingController _editingController5;

  @override
  void initState() {
    _editingController1 = TextEditingController(text: '李四 18912345432');
    _editingController2 = TextEditingController();
    _editingController3 = TextEditingController();
    _editingController4 = TextEditingController();
    _editingController5 = TextEditingController();

    super.initState();
  }


  @override
  void dispose() {
    _editingController1.dispose();
    _editingController2.dispose();
    _editingController3.dispose();
    _editingController4.dispose();
    _editingController5.dispose();
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
        title: Text('叫车订单',
          style: Theme.of(context)
              .textTheme
              .headline4,
        ),
      ),
      backgroundColor: bodyColor,
      extendBody: true,
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30.w),
        height: 150.w,
        color: kForeGroundColor,
        child:
        GestureDetector(
          onTap: (){
            Get.back();

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
              '发起订单',
              style: TextStyle(
                  color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          8.hb,
          Container(
            width: double.infinity,

            color: kForeGroundColor,
            padding: EdgeInsets.only(left: 24.w,right: 24.w,top: 32.w,bottom: 48.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('车辆订单',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1?.copyWith(
                    color: BaseStyle.color111111,fontWeight: FontWeight.bold
                  ),
                ),
                24.hb,
                CarItemWidget(
                  widgetPadding: EdgeInsets.zero,
                  name: '奔驰CLE 插电混动 纯电动续航103km',
                  time: '2019年5月',
                  distance: '20.43万公里',
                  standard: '国六',
                  url:Assets.images.carBanner.path,
                  price: '27.43万',
                ),

              ],
            ),
          ),

          Container(
            width: double.infinity,

            color: kForeGroundColor,
            padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 32.w,bottom: 48.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('车辆订单',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1?.copyWith(
                      color: BaseStyle.color111111,fontWeight: FontWeight.bold
                  ),
                ),
                24.hb,
                GestureDetector(
                  onTap: (){
                    Get.to(()=> ChooseCustomerPage(callback: (String city) {
                      _editingController2.text = city;
                      setState(() {

                      });
                    },));
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32.w),
                        width: 120.w,
                        child: Text('客户',
                            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: const Color(0xFF999999),
                            )),
                      ),
                      50.wb,
                      Expanded(
                        child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () {
                            setState(() {});
                            // _refreshController.callRefresh();
                          },
                          onChanged: (text) {

                            setState(() {});
                          },
                          style: TextStyle(
                            color: BaseStyle.color333333,
                            fontSize: BaseStyle.fontSize28,),
                          controller: _editingController2,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0.w),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "请选择",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 5.w),
                        child: Icon(CupertinoIcons.chevron_forward,size: 40.w,color: BaseStyle.color666666,),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 120.w,
                      child: Text('联系方式',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,)),
                    ),
                    50.wb,
                    Expanded(
                      child: TextField(

                        keyboardType: TextInputType.text,
                        onEditingComplete: () {
                          setState(() {});
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {

                          setState(() {});
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,),
                        controller: _editingController4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 0.w),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "请输入",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32.w),
                        width: 120.w,
                        child: Text('上门时间',
                            style: TextStyle(
                              color: BaseStyle.color999999,
                              fontSize: BaseStyle.fontSize28,)),
                      ),
                      50.wb,
                      Expanded(
                        child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () {
                            setState(() {});
                            // _refreshController.callRefresh();
                          },
                          onChanged: (text) {

                            setState(() {});
                          },
                          style: TextStyle(
                            color: BaseStyle.color333333,
                            fontSize: BaseStyle.fontSize28,),
                          controller: _editingController3,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0.w),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "请选择",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 5.w),
                        child: Icon(CupertinoIcons.chevron_forward,size: 40.w,color: BaseStyle.color666666,),
                      )
                    ],
                  ),
                ),


                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.w),
                      width: 120.w,
                      child: Text('上门地址',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,)),
                    ),
                    50.wb,
                    Expanded(
                      child: TextField(

                        keyboardType: TextInputType.text,
                        onEditingComplete: () {
                          setState(() {});
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {

                          setState(() {});
                        },
                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,),
                        controller: _editingController4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 0.w),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "请输入",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 32.w),
                      width: 120.w,
                      child: Text('备注',
                          style: TextStyle(
                            color: BaseStyle.color999999,
                            fontSize: BaseStyle.fontSize28,)),
                    ),
                    24.hb,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(color: BaseStyle.colordddddd,width: 2.w)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.w,horizontal: 20.w),
                      height: 200.w,
                      child: TextField(
                        maxLines: 50,
                        keyboardType: TextInputType.text,
                        onEditingComplete: () {
                          setState(() {});
                          // _refreshController.callRefresh();
                        },
                        onChanged: (text) {

                          setState(() {});
                        },

                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,),
                        controller: _editingController5,
                        decoration: InputDecoration(

                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          isDense: true,
                          fillColor: Colors.white,
                          hintText: "请选择",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    32.hb,
                  ],
                ),

              ],
            ),
          ),



        ],
      ),
    );
  }

  _textview(String text) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(79, 90, 116, 0.08),
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: const Color(0xFF4F5A74))),
    );
  }
}


