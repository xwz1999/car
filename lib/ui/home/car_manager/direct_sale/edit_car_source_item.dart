
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

import '../../../../utils/user_tool.dart';

class EditCarSourceItem extends StatefulWidget {
  const EditCarSourceItem({super.key});

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
        EditItemWidget(title: '车辆来源', value: '个人直卖',callback: (String content) {  },),

        EditItemWidget(title: '上架人', value: UserTool.userProvider.userInfo.nickname,callback: (String content) {  },),

        EditItemWidget(title: '门店', value: '云云问车', callback: (String content) {  },),


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
            width: 170.w,
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
