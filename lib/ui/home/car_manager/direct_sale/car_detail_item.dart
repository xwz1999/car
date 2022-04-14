
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';

class CarDetailItem extends StatelessWidget {
  const CarDetailItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 32.w,right: 32.w),
        children: [
          48.hb,
          getItem1('基本信息'),
          48.hb,
          getItem2('参数配置'),
          48.hb,
          getItem3('价格信息'),
          48.hb,
          getItem4('评估采购信息'),
          48.hb,
          getItem5('车主信息'),
          48.hb,
          getItem6('牌证信息'),
          48.hb,
        ],
      ),
    );
  }

  getItem1(String title){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
          fontSize: 28.sp,fontWeight: FontWeight.bold,color: BaseStyle.color333333
        ),),
        getContentItem('车架号','LGJ83476524683243'),
        getContentItem('车辆类型','二手车(中规)'),
        getContentItem('品牌车型','奥迪A3 2020款 Sportback 35 TFSI 进取运动型'),
        getContentItem('表显里程','3.0万公里'),
        getContentItem('首次上牌','2020-03'),
        getContentItem('车身颜色','白色'),
        getContentItem('车牌号','浙B562T8'),
        getContentItem('车商编号',''),
        getContentItem('车辆编号','893627'),
        getContentItem('内饰颜色','黑色'),
        getContentItem('使用性质','非运营'),
        getContentItem('车辆所在地','浙江 宁波'),
        getContentItem('车辆归属地',''),
        getContentItem('车况(对内)','见检测报告'),
        getContentItem('车况(对外)','一手车车况极品，真实公里数'),

      ],
    );
  }

  getItem2(String title){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
            fontSize: 28.sp,fontWeight: FontWeight.bold,color: BaseStyle.color333333
        ),),
        getContentItem('排量','1.40L'),
        getContentItem('变速箱类型','干式双离合变速箱(DCT)'),
        getContentItem('燃料形式','汽油'),
        getContentItem('车身结构','两厢车'),
        getContentItem('座位数','5个'),
        getContentItem('排放标准','国六'),

      ],
    );
  }


  getItem3(String title){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
            fontSize: 28.sp,fontWeight: FontWeight.bold,color: BaseStyle.color333333
        ),),
        getContentItem('展示价格','27.43万元'),
        getContentItem('系统估价','26.12万元'),

      ],
    );
  }

  getItem4(String title){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
            fontSize: 28.sp,fontWeight: FontWeight.bold,color: BaseStyle.color333333
        ),),
        getContentItem('采购日期','2021-12-09'),
        getContentItem('评估师','张斯斯'),
        getContentItem('门店','云云问车'),

      ],
    );
  }


  getItem5(String title){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
            fontSize: 28.sp,fontWeight: FontWeight.bold,color: BaseStyle.color333333
        ),),
        getContentItem('车主姓名','张小四'),
        getContentItem('手机号码','18963526372'),
        getContentItem('银行卡号','9283765412367238212'),
        getContentItem('开户行','中国银行XXXX支行'),
        getContentItem('身份证号','337263728392019285'),
      ],
    );
  }




  getItem6(String title){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
            fontSize: 28.sp,fontWeight: FontWeight.bold,color: BaseStyle.color333333
        ),),
        getContentItem('过户次数','1次'),
        getContentItem('钥匙数量','2把'),
        getContentItem('交强险','无'),
        getContentItem('交强险到期',''),
        getContentItem('商业险','无'),
        getContentItem('商业险到期',''),
      ],
    );
  }





  getContentItem(String title,String content){
    return Padding(
      padding:  EdgeInsets.only(top: 24.w),
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
