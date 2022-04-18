
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class EditCarSourceItem extends StatefulWidget {
  const EditCarSourceItem({Key? key}) : super(key: key);

  @override
  _EditCarSourceItemState createState() => _EditCarSourceItemState();
}

class _EditCarSourceItemState extends State<EditCarSourceItem> {



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

        getContentItem('车辆来源','个人直卖'),
        getContentItem('上架人','张三'),
        getContentItem('门店','云云问车'),

      ],
    );
  }


  getContentItem(String title,String content,{isSpecial = false}){
    return Padding(
      padding:  EdgeInsets.only(top: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top:15.w),
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

        ],
      ),
    );
  }
}
