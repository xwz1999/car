
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class EditCarDetailItem extends StatefulWidget {
  const EditCarDetailItem({super.key});

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

    return ColoredBox(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: [
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

        EditItemWidget(title: '车架号', value: 'LGJ83476524683243',canChange: false, callback: (String content) {  },),

        EditItemWidget(title: '品牌车型', value: '奥迪A3 2020款 Sportback 35 TFSI 进取运动型',canChange: false, callback: (String content) {  },),

        EditItemWidget(title: '首次上牌', value: '2020-03',canChange: false, callback: (String content) {  },),

        EditItemWidget(title: '车牌号', value: '浙B562T8',canChange: false, callback: (String content) {  },),

        EditItemWidget(title: '发动机号', value: '647382',canChange: false, callback: (String content) {  },),

        EditItemWidget(title: '车身颜色', value: '白色',canChange: false, callback: (String content) {  },),

        EditItemWidget(title: '表显里程', value: '3.0',canChange: false, callback: (String content) {  },endText: '万公里',),



        getContentItem('车辆类型','二手车(中规)',path: Assets.icons.icGoto.path),

        getContentItem('内饰颜色','黑色',path: Assets.icons.icGoto.path,topIcon: false),


        EditItemWidget(title: '排量', value: '1.40',canChange: false, callback: (String content) {  },endText: 'L',),

        EditItemWidget(title: '变速箱', value: '7挡杆式双离合', callback: (String content) {  },),

        getContentItem('排放标准','国V',path: Assets.icons.icGoto.path),

        EditItemWidget(title: '车商编号', value: '/',canChange: true, callback: (String content) {  },topIcon: false,),

        EditItemWidget(title: '车辆编号', value: '893627',canChange: true, callback: (String content) {  }),

        EditItemWidget(title: '使用性质', value: '非运营',canChange: true, callback: (String content) {  }),

        EditItemWidget(title: '车辆所在地', value: '浙江 宁波',canChange: true, callback: (String content) {  },topIcon: false,),

        EditItemWidget(title: '车辆归属地', value: '浙江 宁波',canChange: true, callback: (String content) {  },topIcon: false,),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40.w),
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


  getContentItem(String title,String content,{isSpecial = false, path,topIcon = true}){
    return Padding(
      padding:  EdgeInsets.only(top: 40.w),
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
          Expanded(child: Padding(
            padding:  EdgeInsets.only(top: isSpecial?0.w:0.w),
            child: Text(content.isEmpty?'/':content,style: TextStyle(
                fontSize: 28.sp,color: BaseStyle.color333333),maxLines: 2,overflow: TextOverflow.ellipsis,),
          )),
          path!=null?Image.asset(path,width: 32.w,height: 32.w,):const SizedBox(),


        ],
      ),
    );
  }



}
