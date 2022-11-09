import 'package:cloud_car/model/car/car_info_model.dart';
import 'package:cloud_car/model/car/new_car_info.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class NewCarDetailItem extends StatelessWidget {
  final NewCarInfo carInfoModel;

  const NewCarDetailItem({super.key, required this.carInfoModel});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: [
          48.hb,
          getItem1('车辆信息'),
          // 48.hb,
          // getItem2('参数配置'),
          48.hb,
          getItem3('价格信息'),
          48.hb,
          getItem4('评估采购信息'),

          48.hb,
          getItem6('牌证信息'),
          48.hb,
          carInfoModel.carInfo.source=='个人直卖'?
          getItem5('车主信息'):const SizedBox(),
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
        getContentItem('车辆类型', carInfoModel.carInfo.type),
        getContentItem('车辆来源', carInfoModel.carInfo.source),
        getContentItem('品牌车型', carInfoModel.carInfo.modelName),
        getContentItem('车架号', carInfoModel.carInfo.vin),
        getContentItem('发动机号', carInfoModel.carInfo.carSn),
        getContentItem('首次上牌', TextUtils.getTimeByInt(carInfoModel.carInfo.licensingDate)),

        getContentItem('车身颜色', carInfoModel.carInfo.color),
        getContentItem('内饰颜色', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.interiorColor)),
        getContentItem('临时车牌', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.temporaryLicensePlate)),
        getContentItem('车位编号', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.parkingNo.toString())),
        getContentItem('库存状态', '/'),

        getContentItem('使用性质', carInfoModel.carInfo.useCharacter),
        getContentItem('表显里程', '${carInfoModel.carInfo.Mileage}万公里'),

        getContentItem('出厂日期', carInfoModel.carInfo.modelInfo.marketDate),
        getContentItem('新车指导价', TextUtils.carInfoIsEmpty( TextUtils.getPriceStr(num.parse(carInfoModel.carInfo.newCarGuidePrice)) )),
        getContentItem('购置税', TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(num.parse(carInfoModel.carInfo.purchaseTax)))),
        getContentItem('加装费用', TextUtils.carInfoIsEmpty('${carInfoModel.carInfo.installationCost}元')),
        getContentItem('车辆所在地', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.location)),

        getContentItem('环保等级', carInfoModel.carInfo.modelInfo.dischargeStandard),
        getContentItem('车况描述', carInfoModel.carInfo.condition),

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
        getContentItem('批发价格', TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(num.parse(carInfoModel.carInfo.priceInfo.purchasePrice)))),
        getContentItem('销售价格', TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(num.parse(carInfoModel.carInfo.priceInfo.salePrice)))) ,
        getContentItem('系统估价', '/'),
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
        getContentItem('采购类型','/'),
        getContentItem('采购价格','/'),
        getContentItem('采购日期','/'),
        getContentItem('采购人','/'),
        getContentItem('门店','云云问车'),

      ],
    );
  }

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
        getContentItem('车主姓名', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.contractMasterInfo.name)),
        getContentItem('手机号码', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.contractMasterInfo.phone)),
        getContentItem('银行卡号', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.contractMasterInfo.bankCard)),
        getContentItem('开户行', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.contractMasterInfo.bank)),
        getContentItem('身份证号', TextUtils.carInfoIsEmpty(carInfoModel.carInfo.contractMasterInfo.idCard)),
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
        getContentItem('过户次数', '${carInfoModel.carInfo.certificateInfo.transfer}次'),
        getContentItem(
            '钥匙数量', '${carInfoModel.carInfo.certificateInfo.keyCount}把'),
        getContentItem(
            '交强险',
            carInfoModel.carInfo.certificateInfo.commercialInsurance == 1
                ? '有'
                : '无'),
        getContentItem(
            '交强险到期',  TextUtils.getTimeByInt(  carInfoModel.carInfo.certificateInfo.compulsoryInsuranceDate)
            ),
        getContentItem(
            '商业险',
            carInfoModel.carInfo.certificateInfo.compulsoryInsurance == 1
                ? '有'
                : '无'),
        getContentItem(
          '商业险到期',TextUtils.getTimeByInt(  carInfoModel.carInfo.certificateInfo.commercialInsuranceDate)
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
