
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class EditCarDetailItem extends StatefulWidget {
  const EditCarDetailItem({Key? key}) : super(key: key);

  @override
  _EditCarDetailItemState createState() => _EditCarDetailItemState();
}

class _EditCarDetailItemState extends State<EditCarDetailItem> {
  late TextEditingController _editingController1;
  late TextEditingController _editingController2;


  @override
  void initState() {
    _editingController1 = TextEditingController(text: '见检测报告');
    _editingController2 = TextEditingController();


    super.initState();
  }


  @override
  void dispose() {
    _editingController1.dispose();
    _editingController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,

        padding: EdgeInsets.only(left: 32.w,right: 32.w),
        children: [
          48.hb,
          getItem1(),
          48.hb,
        ],
      ),
    );
  }

  getItem1(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        getContentItem('车架号','LGJ83476524683243',isSpecial: true),
        getContentItem('车辆类型','二手车(中规)',path: Assets.icons.icGoto.path),
        getContentItem('品牌车型','奥迪A3 2020款 Sportback 35 TFSI 进取运动型'),
        getContentItem('表显里程','3.0万公里'),
        getContentItem('首次上牌','2020-03',isSpecial: true),
        getContentItem('车身颜色','白色',path: Assets.icons.icGoto.path),
        getContentItem('车牌号','浙B562T8'),
        getContentItem('发动机号','647382',isSpecial: true),

        getContentItem('车辆编号','893627',isSpecial: true),
        getContentItem('内饰颜色','黑色'),
        getContentItem('排量','1.40',isSpecial: true),
        getContentItem('变速箱','7挡杆式双离合',isSpecial: true),
        getContentItem('排放标准','国V',isSpecial: true,path: Assets.icons.icGoto.path),
        getContentItem('车商编号',''),
        getContentItem('使用性质','非运营'),
        getContentItem('车辆所在地','浙江 宁波'),
        getContentItem('车辆归属地',''),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 32.w),
              width: 150.w,
              child: Text('车况(对内)',
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

                  // _refreshController.callRefresh();
                },
                onChanged: (text) {


                },

                style: TextStyle(
                  color: BaseStyle.color333333,
                  fontSize: BaseStyle.fontSize28,),
                controller: _editingController1,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 32.w),
              width: 150.w,
              child: Text('车况(对外)',
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
    );
  }


  getContentItem(String title,String content,{isSpecial = false, path}){
    return Padding(
      padding:  EdgeInsets.only(top: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top:10.w),
            child: Text('*  ',style: TextStyle(
              fontSize: 28.sp,color: const Color(0xFFE62222),
            ),),
          ),
          SizedBox(
            width: 150.w,
            child: Text(title,style: TextStyle(
              fontSize: 28.sp,color: const Color(0xFF999999),
            ),),
          ),
          Expanded(child: Padding(
            padding:  EdgeInsets.only(top: isSpecial?0.w:0.w),
            child: Text(content.isEmpty?'-':content,style: TextStyle(
                fontSize: 28.sp,color: BaseStyle.color333333),maxLines: 2,overflow: TextOverflow.ellipsis,),
          )),
          path!=null?Image.asset(path,width: 32.w,height: 32.w,):const SizedBox(),


        ],
      ),
    );
  }
}
