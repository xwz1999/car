
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class EditCarReportPage extends StatefulWidget {
  const EditCarReportPage({super.key});

  @override
  _EditCarReportPageState createState() => _EditCarReportPageState();
}

class _EditCarReportPageState extends State<EditCarReportPage> {

  List tabs = [];

  @override
  void initState() {


    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
      Column(
        children: [
          20.hb,
          Row(
            children: [
              32.wb,
              Padding(
                padding: EdgeInsets.only(top:15.w),
                child: Text('*  ',style: TextStyle(
                  fontSize: 28.sp,color: const Color(0xFFE62222),
                ),),
              ),
              Text('漆面数据',style: TextStyle(
                fontSize: 28.sp,color: const Color(0xFF999999),
              ),),
              Text(' (请上传JPG或PDF格式)',style: TextStyle(
                fontSize: 24.sp,color: const Color(0xFF999999),
              ),),
            ],
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 24.w),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                  crossAxisCount: 3,
                  //纵轴间距
                  mainAxisSpacing: 10,
                  //横轴间距
                  crossAxisSpacing: 10,
                  //子组件宽高长度比例
                  childAspectRatio: 2/1.5),
              itemBuilder: (BuildContext context, int index) {
                return getItem(Assets.images.carBanner.path,);
              }),
        ],
      ),

    );
  }

  getItem(String path,) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        clipBehavior: Clip.antiAlias,


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
        ),
        child:
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              path,
              fit: BoxFit.fill
              ,

              height: double.infinity,
              width: double.infinity,
            ),
          ],
        ),


      ),
    );
  }
}
