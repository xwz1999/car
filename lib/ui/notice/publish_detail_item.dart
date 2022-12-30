import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/text_utils.dart';
import 'package:flutter/material.dart';

import '../../../../model/publish_info_model.dart';

class PublishDetailItem extends StatelessWidget {
  // final NewCarInfo carInfoModel;
  final PublishInfoModel publishInfoModel;

  const PublishDetailItem(
      {super.key,
      // required this.carInfoModel,
      required this.publishInfoModel});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF8F8F8),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: [
          32.hb,
          // getItem1('车辆信息'),
          // 48.hb,
          // getItem2('参数配置'),
          carArchives(context),
          16.hb,
          // getItem3('价格信息'),
          _carCondition(),
          16.hb,
          //getItem4('评估采购信息'),
          // _carConfiguration(),
          // 16.hb,
          //getItem6('牌证信息'),
          _purchasingInformation(),
          16.hb,
          _certificateMaterials(),
          200.hb,
          // carInfoModel.carInfo.source=='个人直卖'?
          // getItem5('车主信息'):const SizedBox(),
        ],
      ),
    );
  }

  carArchives(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '车辆档案',
                style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                    color: BaseStyle.color333333),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      builder: (BuildContext context) {
                        return getItem1('车辆档案');
                      });
                },
                child: Text(
                  '查看全部',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: BaseStyle.color999999),
                ),
              ),
            ],
          ),
          32.hb,
          publishInfoModel.vin == ''
              // carInfoModel.carInfo.vin == "/"
              ? const SizedBox()
              : Row(
                  children: [
                    Text(
                      '车架号',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                          color: BaseStyle.color999999),
                    ),
                    10.wb,
                    Text(
                      publishInfoModel.vin,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: BaseStyle.color333333),
                    ),
                  ],
                ),
          32.hb,
          _information(),
          32.hb,
          _content(
            '库存状态',
            '在厅',
            '使用性质',
            publishInfoModel.useCharacter,
          ),
          16.hb,
          _content(
            '所在地',
            publishInfoModel.location,
            '归属地',
            publishInfoModel.attribution,
          ),
        ],
      ),
    );
  }

  _carCondition() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '车况描述',
            style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: BaseStyle.color333333),
          ),
          32.hb,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Text(
              publishInfoModel.condition,
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: BaseStyle.color333333),
            ),
          )
        ],
      ),
    );
  }

  _carConfiguration() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '车辆配置',
            style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: BaseStyle.color333333),
          ),
          24.hb,
          _content(
            '排量',
            publishInfoModel.modelInfo.liter,
            '变速箱类型',
            publishInfoModel.modelInfo.gearType,
          ),
          16.hb,
          _content(
            '燃料类型',
            publishInfoModel.modelInfo.fuelTypeName,
            '车身结构',
            publishInfoModel.modelInfo.driveName,
          ),
          16.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 145.w,
                child: Text(
                  '座位数',
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: BaseStyle.color999999),
                ),
              ),
              Text(
                '${publishInfoModel.modelInfo.seatNumber}座',
                style: TextStyle(
                    height: 1.5,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    color: BaseStyle.color333333),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _purchasingInformation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '采购信息',
            style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: BaseStyle.color333333),
          ),
          24.hb,
          _content(
            '采购类型',
            '/',
            '采购人',
            publishInfoModel.purchaseInfo.liaison == ''
                ? '/'
                : publishInfoModel.purchaseInfo.liaison,
          ),
          16.hb,
          _content(
            '采购价格',
            publishInfoModel.purchaseInfo.price == ''
                ? '/'
                : publishInfoModel.purchaseInfo.price,
            '采购日期',
            TextUtils.getTimeByInt(
                (publishInfoModel.purchaseInfo.date).toInt()),
          ),
          // 16.hb,
          // _content('外部价格', TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(num.parse(carInfoModel.carInfo.priceInfo.purchasePrice))),
          //   '门店', carInfoModel.carInfo.storeName,),
          16.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 145.w,
                child: Text(
                  '门店',
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: BaseStyle.color999999),
                ),
              ),
              Text(
                publishInfoModel.storeName == ''
                    ? '/'
                    : publishInfoModel.storeName,
                style: TextStyle(
                    height: 1.5,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    color: BaseStyle.color333333),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _certificateMaterials() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '牌证信息',
            style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: BaseStyle.color333333),
          ),
          24.hb,
          _content(
            '过户次数',
            '${publishInfoModel.certificateInfo.transfer}次',
            '钥匙数量',
            '${publishInfoModel.certificateInfo.keyCount}把',
          ),
          16.hb,
          _content(
            '交强险',
            publishInfoModel.certificateInfo.commercialInsurance == 1
                ? '有'
                : '无',
            '交强险到期',
            TextUtils.getTimeByInt(
                (publishInfoModel.certificateInfo.compulsoryInsuranceDate)
                    .toInt()),
          ),
          16.hb,
          _content(
              '商业险',
              publishInfoModel.certificateInfo.compulsoryInsurance == 1
                  ? '有'
                  : '无',
              '商业险到期',
              TextUtils.getTimeByInt(
                  (publishInfoModel.certificateInfo.commercialInsuranceDate)
                      .toInt())),
          16.hb,
        ],
      ),
    );
  }

  _content(String title1, String content1, String title2, String content2) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 145.w,
                child: Text(
                  title1,
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: BaseStyle.color999999),
                ),
              ),
              Text(
                content1,
                style: TextStyle(
                    height: 1.5,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    color: BaseStyle.color333333),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 145.w,
                child: Text(
                  title2,
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: BaseStyle.color999999),
                ),
              ),
              10.wb,
              Flexible(
                child: Text(
                  content2,
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: BaseStyle.color333333),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _information() {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 4.0),
                blurRadius: 14.0,
                spreadRadius: 0.0,
                color: Color.fromRGBO(2, 122, 255, 0.11)),
          ]),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${publishInfoModel.mileage}万公里',
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.sp),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: Image.asset(Assets.icons.systemEstimate.path),
                      ),
                      10.wb,
                      Text(
                        '表显里程',
                        style: TextStyle(
                            color: BaseStyle.color999999,
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 1.w,
            height: 40.w,
            child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey)),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        TextUtils.getTimeByIntYM(
                            (publishInfoModel.licensingDate).toInt()),
                        style: TextStyle(
                            color: BaseStyle.color333333,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.sp),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: Image.asset(Assets.icons.icScan.path),
                      ),
                      10.wb,
                      Text(
                        '首次上牌',
                        style: TextStyle(
                            color: BaseStyle.color999999,
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 1.w,
            height: 40.w,
            child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey)),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 68.w)),
                  Text(
                    publishInfoModel.modelInfo.dischargeStandard,
                    style: TextStyle(
                        color: BaseStyle.color333333,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.sp),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.w,
                        child: Image.asset(Assets.icons.carNumber.path),
                      ),
                      10.wb,
                      Text(
                        '排放标准',
                        style: TextStyle(
                            color: BaseStyle.color999999,
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  getItem1(String title) {
    return SizedBox(
      height: 1300.w,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.hb,
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      '返回',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.transparent),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: BaseStyle.color333333),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      '返回',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: BaseStyle.color999999),
                    ),
                  ),
                ],
              ),
              getContentItem('车辆类型', publishInfoModel.type),
              getContentItem('车辆来源', publishInfoModel.source),
              getContentItem('品牌车型', publishInfoModel.modelName),
              getContentItem('车架号', publishInfoModel.vin),
              getContentItem('发动机号', publishInfoModel.engineNo),
              getContentItem(
                  '首次上牌',
                  TextUtils.getTimeByIntYM(
                      (publishInfoModel.licensingDate).toInt())),

              getContentItem('车身颜色', publishInfoModel.color),
              getContentItem('内饰颜色',
                  TextUtils.carInfoIsEmpty(publishInfoModel.interiorColor)),
              getContentItem(
                  '临时车牌',
                  TextUtils.carInfoIsEmpty(
                      publishInfoModel.temporaryLicensePlate)),
              getContentItem('车位编号',
                  TextUtils.carInfoIsEmpty(publishInfoModel.parkingNo) ?? ''),
              getContentItem('库存状态', '在厅'),

              getContentItem('使用性质', publishInfoModel.useCharacter),
              getContentItem('表显里程', '${publishInfoModel.mileage}万公里'),

              getContentItem('出厂日期', publishInfoModel.modelInfo.marketDate),
              // getContentItem('新车指导价', TextUtils.carInfoIsEmpty( TextUtils.getPriceStr(num.parse(carInfoModel.carInfo.newCarGuidePrice)) )),
              getContentItem(
                  '购置税',
                  TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(
                      num.parse(publishInfoModel.purchaseTax)))),
              getContentItem(
                  '加装费用',
                  TextUtils.carInfoIsEmpty(
                      '${publishInfoModel.installationCost}元')),
              getContentItem(
                  '车辆所在地', TextUtils.carInfoIsEmpty(publishInfoModel.location)),

              getContentItem(
                  '环保等级', publishInfoModel.modelInfo.dischargeStandard),
              50.hb,
            ],
          ),
        ),
      ),
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
        getContentItem('排量', '${publishInfoModel.modelInfo.liter}L'),
        getContentItem('变速箱类型', publishInfoModel.modelInfo.gearType),
        getContentItem('燃料形式', publishInfoModel.modelInfo.fuelTypeName),
        getContentItem('车身结构', publishInfoModel.modelInfo.carStruct),
        getContentItem('座位数', publishInfoModel.modelInfo.seatNumber),
        getContentItem('排放标准', publishInfoModel.modelInfo.dischargeStandard),
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
        getContentItem(
            '批发价格',
            TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(
                num.parse(publishInfoModel.priceInfo.interiorPrice)))),
        getContentItem(
            '销售价格',
            TextUtils.carInfoIsEmpty(TextUtils.getPriceStr(
                num.parse(publishInfoModel.priceInfo.exteriorPrice)))),
        getContentItem('系统估价', '/'),
      ],
    );
  }

  getItem4(String title) {
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
        getContentItem('采购类型', '/'),
        getContentItem('采购价格', '/'),
        getContentItem('采购日期', '/'),
        getContentItem('采购人', '/'),
        getContentItem('门店', '云云问车'),
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
        getContentItem('车主姓名',
            TextUtils.carInfoIsEmpty(publishInfoModel.contractMasterInfo.name)),
        getContentItem(
            '手机号码',
            TextUtils.carInfoIsEmpty(
                publishInfoModel.contractMasterInfo.phone)),
        getContentItem(
            '银行卡号',
            TextUtils.carInfoIsEmpty(
                publishInfoModel.contractMasterInfo.bankCard)),
        getContentItem('开户行',
            TextUtils.carInfoIsEmpty(publishInfoModel.contractMasterInfo.bank)),
        getContentItem(
            '身份证号',
            TextUtils.carInfoIsEmpty(
                publishInfoModel.contractMasterInfo.idCard)),
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
        getContentItem('过户次数', '${publishInfoModel.certificateInfo.transfer}次'),
        getContentItem('钥匙数量', '${publishInfoModel.certificateInfo.keyCount}把'),
        getContentItem(
            '交强险',
            publishInfoModel.certificateInfo.commercialInsurance == 1
                ? '有'
                : '无'),
        getContentItem(
            '交强险到期',
            TextUtils.getTimeByInt(
                (publishInfoModel.certificateInfo.compulsoryInsuranceDate)
                    .toInt())),
        getContentItem(
            '商业险',
            publishInfoModel.certificateInfo.compulsoryInsurance == 1
                ? '有'
                : '无'),
        getContentItem(
            '商业险到期',
            TextUtils.getTimeByInt(
                (publishInfoModel.certificateInfo.commercialInsuranceDate)
                    .toInt()))
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
