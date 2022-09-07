import 'package:cloud_car/model/car/car_info_model.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class CarDetailItem extends StatelessWidget {
  final CarInfoModel carInfoModel;

  const CarDetailItem({super.key, required this.carInfoModel});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: [
          48.hb,
          getItem1('基本信息'),
          48.hb,
          getItem2('参数配置'),
          // 48.hb,
          // getItem3('价格信息'),
          // 48.hb,
          // getItem4('评估采购信息'),
          // 48.hb,
          // getItem5('车主信息'),
          48.hb,
          getItem6('牌证信息'),
          48.hb,
        ],
      ),
    );
  }

  getItem1(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: BaseStyle.color333333),
        ),
        getContentItem('车架号', carInfoModel.carInfo.contractInfo.vin),
        getContentItem('车辆类型', carInfoModel.carInfo.modelInfo.bodyType),
        getContentItem('品牌车型', carInfoModel.carInfo.modelName),
        getContentItem('表显里程', '${carInfoModel.carInfo.mileage}万公里'),
        getContentItem(
            '首次上牌',
            DateUtil.formatDateMs(
                carInfoModel.carInfo.licensingDate.toInt() * 1000,
                format: 'yyyy-MM')),
        getContentItem('车身颜色', carInfoModel.carInfo.color),
        // getContentItem('车牌号',carInfoModel.carInfo.contractInfo.licensePlate),
        getContentItem('所在地区', carInfoModel.carInfo.orderInfo.locationCity),
        getContentItem('车商编号', ''),
        getContentItem('车辆编号', carInfoModel.carInfo.carSn),
        getContentItem('内饰颜色', carInfoModel.carInfo.orderInfo.interiorColor),
        getContentItem('使用性质', carInfoModel.carInfo.orderInfo.useCharacter),
        getContentItem('车辆所在地', carInfoModel.carInfo.orderInfo.locationCity),
        getContentItem('车辆归属地', carInfoModel.carInfo.orderInfo.attributionCity),
        getContentItem('车况(对内)', carInfoModel.carInfo.orderInfo.conditionIn),
        getContentItem('车况(对外)', carInfoModel.carInfo.orderInfo.conditionOut),
      ],
    );
  }

  getItem2(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: BaseStyle.color333333),
        ),
        getContentItem('排量', '${carInfoModel.carInfo.modelInfo.liter}L'),
        getContentItem('变速箱类型', carInfoModel.carInfo.modelInfo.gearType),
        getContentItem('燃料形式', carInfoModel.carInfo.modelInfo.fuelTypeName),
        getContentItem('车身结构', carInfoModel.carInfo.modelInfo.carStruct),
        getContentItem('座位数', carInfoModel.carInfo.modelInfo.seatNumber),
        getContentItem(
            '排放标准', carInfoModel.carInfo.modelInfo.dischargeStandard),
      ],
    );
  }

  getItem3(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: BaseStyle.color333333),
        ),
        getContentItem('展示价格', carInfoModel.carInfo.price),
        getContentItem('系统估价', carInfoModel.carInfo.lastPrice),
      ],
    );
  }

  // getItem4(String title){
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(title,style: TextStyle(
  //           fontSize: 28.sp,fontWeight: FontWeight.bold,color: BaseStyle.color333333
  //       ),),
  //       getContentItem('采购日期','2021-12-09'),
  //       getContentItem('评估师',carInfoModel.carInfo.brokerInfo.brokerNickname),
  //       getContentItem('门店','云云问车'),
  //
  //     ],
  //   );
  // }

  getItem5(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: BaseStyle.color333333),
        ),
        getContentItem('车主姓名', '张小四'),
        getContentItem('手机号码', '18963526372'),
        getContentItem('银行卡号', '9283765412367238212'),
        getContentItem('开户行', '中国银行XXXX支行'),
        getContentItem('身份证号', '337263728392019285'),
      ],
    );
  }

  getItem6(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: BaseStyle.color333333),
        ),
        getContentItem('过户次数', ''),
        getContentItem(
            '钥匙数量', '${carInfoModel.carInfo.contractInfo.keyCount}把'),
        getContentItem(
            '交强险',
            carInfoModel.carInfo.contractInfo.commercialInsurance == 1
                ? '有'
                : '无'),
        getContentItem(
            '交强险到期',
            DateUtil.formatDateMs(
                carInfoModel.carInfo.contractInfo.compulsoryInsuranceDate
                        .toInt() *
                    1000,
                format: 'yyyy-MM')),
        getContentItem(
            '商业险',
            carInfoModel.carInfo.contractInfo.compulsoryInsurance == 1
                ? '有'
                : '无'),
        getContentItem(
          '商业险到期',
          DateUtil.formatDateMs(carInfoModel
                  .carInfo.contractInfo.commercialInsuranceDate
                  .toInt() *
              1000),
        )
      ],
    );
  }

  getContentItem(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(top: 24.w),
      child: Row(
        children: [
          SizedBox(
            width: 150.w,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xFF999999),
              ),
            ),
          ),
          Expanded(
              child: Text(
            content.isEmpty ? '-' : content,
            style: TextStyle(fontSize: 28.sp, color: BaseStyle.color333333),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );
  }
}
