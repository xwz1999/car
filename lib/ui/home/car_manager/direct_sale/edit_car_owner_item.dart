
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:flutter/material.dart';

class EditCarOwnerItem extends StatefulWidget {
  const EditCarOwnerItem({super.key});

  @override
  _EditCarOwnerItemState createState() => _EditCarOwnerItemState();
}

class _EditCarOwnerItemState extends State<EditCarOwnerItem> {



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
          getItem1(1),
          30.hb,
          getImageItem('身份证照'),
          30.hb,
          getImageItem('全身照'),
        ],
      ),
    );
  }

  getImageItem(String title){
    return Column(
      children: [
        Row(
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
          ],
        ),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 24.w),
            itemCount: 2,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
                crossAxisCount: 3,
                //纵轴间距
                mainAxisSpacing: 10,
                //横轴间距
                crossAxisSpacing: 20,
                //子组件宽高长度比例
                childAspectRatio: 2/1.5),
            itemBuilder: (BuildContext context, int index) {
              return getItem(Assets.images.carBanner.path);
            }),
      ],
    );
  }

  getItem(String path) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        clipBehavior: Clip.antiAlias,


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
        ),
        child:
        Image.asset(
          path,
          fit: BoxFit.fitHeight,
          height: 150.w,
          width: 200.w,
        ),


      ),
    );
  }

  getItem1(int type){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [




        getContentItem('车主类别','个人寄卖'),
        getContentItem(type==1?'公司名称':'车主姓名',UserTool.userProvider.userInfo.nickname),
        getContentItem(type==1?'信用代码':'身份证号','39209239891212131',isSpecial: true, path: Assets.icons.scan.path),
        getContentItem(type==1?'联系方式':'手机号码','18963625362',isSpecial: true,),
        getContentItem('开户行','中国银行XX支行'),
        getContentItem('银行卡号','1234 5635 5463',isSpecial: true, path: Assets.icons.scan.path),

      ],
    );
  }


  getContentItem(String title,String content,{isSpecial = false, path}){
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(top:15.w),
            //   child: Text('*  ',style: TextStyle(
            //     fontSize: 28.sp,color: const Color(0xFFE62222),
            //   ),),
            // ),
            // SizedBox(
            //   width: 150.w,
            //   child: Text(title,style: TextStyle(
            //     fontSize: 28.sp,color: const Color(0xFF999999),
            //   ),),
            // ),
            Expanded(child: Padding(
              padding:  EdgeInsets.only(top: isSpecial?0.w:0.w),
              child: EditItemWidget(title: title, value: content, callback: (String content) {  },)
            )),
            path!=null?Padding(
              padding:  EdgeInsets.only(bottom: 5.w),
              child: Image.asset(path,width: 32.w,height: 32.w,),
            ):const SizedBox(),


          ],
        ),
      ),
    );
  }


}
