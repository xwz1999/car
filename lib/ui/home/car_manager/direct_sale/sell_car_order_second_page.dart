
import 'package:cloud_car/ui/home/car_manager/direct_sale/choose_customer_page.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/car_manager/direct_sale/sell_car_order_third_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/colud_check_radio.dart';
import 'package:cloud_car/widget/car_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


typedef TextCallback = Function(String content);

class SellCarOrderSecondPage extends StatefulWidget {
  const SellCarOrderSecondPage({Key? key}) : super(key: key);

  @override
  _SellCarOrderSecondPageState createState() => _SellCarOrderSecondPageState();
}

class _SellCarOrderSecondPageState extends State<SellCarOrderSecondPage> {
  late TextEditingController _editingController;

  late TextEditingController _editingController2;


  @override
  void initState() {
    _editingController  = TextEditingController();
    _editingController2  = TextEditingController();

    super.initState();
  }


  @override
  void dispose() {
    _editingController.dispose();
    _editingController2.dispose();
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
        title: Text('卖车合同',
          style: Theme.of(context)
              .textTheme
              .headline4,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              padding: EdgeInsets.only(right: 32.w),
              child: Text(
                '上一步', style: TextStyle(
                color: kPrimaryColor,
                fontSize: 28.sp,
              ),
              ),
            ),
          )
        ],
      ),

      backgroundColor: bodyColor,
      extendBody: true,

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          8.hb,
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
          ),

          Padding(
            padding:  EdgeInsets.only(left: 24.w,top: 12.w),
            child: Text('上门地址信息',
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

                

                getContentItem('客户','请选择',path: Assets.icons.icGoto.path),



                EditItemWidget(


                  title: '手机号',
                  value: '',
                  callback: (String content) {},

                ),

                EditItemWidget(

                  title: '姓名',

                  value: '',
                  callback: (String content) {},

                ),


                EditItemWidget(

                  title: '身份证号',

                  value: '',
                  callback: (String content) {},

                ),
                EditItemWidget(

                  title: '客户来源',
                  topIcon: false,
                  value: '微信小程序',

                  callback: (String content) {},


                ),

                EditItemWidget(

                  title: '地址',
                  value: '',
                  callback: (String content) {},

                ),

                EditItemWidget(

                  title: '所在地',
                  canChange: false,
                  value: '',
                  callback: (String content) {},

                ),


                EditItemWidget(

                  title: '付款人',
                  value: '',
                  callback: (String content) {},

                ),



                EditItemWidget(

                  title: '开户行',
                  value: '',
                  callback: (String content) {},

                ),



                EditItemWidget(

                  title: '银行账号',
                  value: '',
                  callback: (String content) {},

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 32.w),
                      width: 150.w,
                      child: Text('备注描述',
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

                        },
                        onChanged: (text) {

                        },

                        style: TextStyle(
                          color: BaseStyle.color333333,
                          fontSize: BaseStyle.fontSize28,),
                        controller: _editingController2,
                        decoration: InputDecoration(

                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          isDense: true,
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
                    32.hb,
                  ],
                ),


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

                Get.to(()=>const SellCarOrderThirdPage());

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

  getContentItem(String title,String content,{isSpecial = false, path,topIcon = true}){
    return Padding(
      padding:  EdgeInsets.only(top: 30.w),
      child: GestureDetector(
        onTap: (){
          Get.to(()=> ChooseCustomerPage(callback: (String city) {
            _editingController.text = city;
            setState(() {

            });
          },));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topIcon? Padding(
              padding: EdgeInsets.only(top:10.w),
              child: Text('*  ',style: TextStyle(
                fontSize: 28.sp,color: const Color(0xFFE62222),
              ),),
            ):Padding(
              padding: EdgeInsets.only(top:10.w),
              child: Text('*  ',style: TextStyle(
                fontSize: 28.sp,color:  Colors.transparent,
              ),),
            ),
            SizedBox(
              width: 170.w,
              child: Text(title,style: TextStyle(
                fontSize: 28.sp,color: const Color(0xFF999999),
              ),),
            ),
            Expanded(
              child: TextField(
                enabled: false,
                keyboardType: TextInputType.text,
                onSubmitted: (text) {
                  setState(() {});
                  // _refreshController.callRefresh();
                },
                onChanged: (text) {},
                style: TextStyle(
                  color: BaseStyle.color333333
                    ,
                  fontSize: BaseStyle.fontSize28,
                ),
                maxLines: null,
                controller: _editingController,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.only(top: 15.w,bottom: 15.w),
                  filled: true,
                  isCollapsed: true,
                  fillColor: Colors.white,
                  hintText:'请选择',
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                  border: InputBorder.none,
                ),
              ),
            ),
            path!=null?Image.asset(path,width: 32.w,height: 32.w,):const SizedBox(),


          ],
        ),
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


