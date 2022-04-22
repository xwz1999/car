import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/home/sort/choose_car_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/picker/car_date_picker.dart';
import 'package:cloud_car/widget/picker/car_list_picker.dart';
import 'package:cloud_car/widget/picker/car_picker_box.dart';
import 'package:cloud_car/widget/sort_widget.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CarValuationPage extends StatefulWidget {
  const CarValuationPage({Key? key}) : super(key: key);

  @override
  _CarValuationPageState createState() => _CarValuationPageState();
}

class _CarValuationPageState extends State<CarValuationPage> {
  late CarInfo _carInfo = CarInfo(color: '', distance: '', address: '', name: '', time: '');
  DateTime? _firstDate;

  List<ChooseItem> colorList = [
    ChooseItem(name: '蓝色'),
    ChooseItem(name: '紫色'),
    ChooseItem(name: '灰色'),
    ChooseItem(name: '银色'),
    ChooseItem(name: '米色'),
    ChooseItem(name: '棕色'),
    ChooseItem(name: '青色'),
    ChooseItem(name: '黑色'),
    ChooseItem(name: '金色'),
    ChooseItem(name: '橙色'),
    ChooseItem(name: '红色'),
    ChooseItem(name: '白色'),
    ChooseItem(name: '绿色'),
    ChooseItem(name: '黄色'),
    ChooseItem(name: '其他'),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('车辆估值',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  _topImage(),
                  _bottomEdit(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


  _topImage(){
    return   Column(
      children: [
        24.hb,
        Container(
          width: double.infinity,
          height: 200.w,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 24.w, right: 24.w),
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image:
              AssetImage('assets/images/assessment_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        '剩余评估次数',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      20.wb,
                      const Text(
                        '49',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '精准估值',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0x99eeeeee)),
                      ),
                      20.wb,
                      const Text(
                        '守护您的车辆交易',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0x99eeeeee)),
                      ),
                    ],
                  ),
                  30.hb,
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 120.w,
                  height: 58.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6.w)),
                  child: Text(
                    '去充值',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _bottomEdit(){
    return Padding(
      padding: EdgeInsets.only(top: 200.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, -20.0), //阴影xy轴偏移量
                  blurRadius: 15.0, //阴影模糊程度
                  spreadRadius: 1.0 //阴影扩散程度
              )
            ]),
        child: Column(
          children: [
            GestureDetector(
              child: Stack(
                children: [
                  Image.asset(
                      'assets/images/driving_license2.png'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async{
                await  Get.to(()=> ChooseCarPage(callback: (String name, int id) {
                  Get.back();
                  Get.back();
                  Get.back();
                  _carInfo.name = name;
                },));
                setState(() {

                });
              },
              child: EditItemWidget(
                title: '具体车型',
                callback: (String content) {},
                value: _carInfo.name,

                tips: '请选择具体车型',
                topIcon: false,
                paddingStart: 32,
                canChange: false,
                endIcon: Image.asset(
                  Assets.icons.icGoto.path,
                  width: 32.w,
                  height: 32.w,
                ),
              ),
            ),

            GestureDetector(
              onTap: () async{
                await  Get.to(()=> ChooseCarPage(callback: (String name, int id) {
                  _carInfo.address = name;
                },isCity: true,));
                setState(() {

                });
              },
              child: EditItemWidget(
                title: '车牌所在地',
                callback: (String content) {},
                value: _carInfo.address,
                tips: '请选择车牌所在地',
                topIcon: false,
                paddingStart: 32,

                canChange: false,
                endIcon: Image.asset(
                  Assets.icons.icGoto.path,
                  width: 32.w,
                  height: 32.w,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async{
                _firstDate = await CarDatePicker.monthPicker(DateTime.now());
                _carInfo.time = DateUtil.formatDate(_firstDate,
                    format: 'yyyy-MM');
                setState(() {});
              },
              child: EditItemWidget(
                title: '首次上牌',
                callback: (String content) {},
                value:  _carInfo.time,
                tips: '请选择首次上牌时间',
                topIcon: false,
                paddingStart: 32,
                canChange: false,
                endIcon: Image.asset(
                  Assets.icons.icGoto.path,
                  width: 32.w,
                  height: 32.w,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async{
                await showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
                  builder: (context) {
                    return CarListPicker(items: colorList, callback: (String content) {
                      Get.back();
                      _carInfo.color = content;
                      setState(() {

                      });
                    },title: '车身颜色',


                    );
                  },
                );
              },
              child: EditItemWidget(
                title: '车身颜色',
                callback: (String content) {},
                value: _carInfo.color,
                tips: '请选择车身颜色',
                topIcon: false,
                paddingStart: 32,
                canChange: false,
                endIcon: Image.asset(
                  Assets.icons.icGoto.path,
                  width: 32.w,
                  height: 32.w,
                ),
              ),
            ),
            EditItemWidget(
              title: '行驶里程',
              callback: (String content) {},
              value: _carInfo.distance,
              tips: '请输入行驶里程',
              topIcon: false,
              paddingStart: 32,
              canChange: false,
              endText: '万公里',
            ),
            100 .hb,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.blue),
                ),
                child: '开始估值'
                    .text
                    .size(30.sp)
                    .color(Colors.white)
                    .make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CarInfo{
  String name;
  String address;
  String time;
  String color;
  String distance;

  CarInfo({
    required this.name,
    required this.address,
    required this.time,
    required this.color,
    required this.distance,
  });
}
