import 'package:common_utils/common_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../constants/enums.dart';
import '../ui/home/car_manager/publish_car/push_photo_model.dart';

part 'purchase_car_info_model.g.dart';

@HiveType(typeId: 2)
class PurchaseCarInfoModel extends Equatable {
  @HiveField(0)

  ///车型
  String? carName;
  @HiveField(1)

  ///车架号
  String? viNum;
  @HiveField(2)

  ///车辆牌照
  String? licensePlate;
  @HiveField(3)

  ///首次上牌时间
  DateTime? licensingDate;
  @HiveField(4)

  ///使用性质
  int? carNatureOfUse;
  @HiveField(5)

  ///发动机号
  String? engineNum;
  @HiveField(6)

  ///出场日期
  DateTime? productionDate;
  @HiveField(7)

  ///交强险到期时间
  DateTime? compulsoryInsuranceDate;
  @HiveField(8)

  ///表显里程
  String? mileage;
  @HiveField(9)

  ///车身颜色
  String? color;

  PurchaseCarInfoModel({
    this.carName,
    this.viNum,
    this.licensePlate,
    this.licensingDate,
    this.carNatureOfUse,
    this.engineNum,
    this.productionDate,
    this.compulsoryInsuranceDate,
    this.mileage,
    this.color,
  });

  @override
  List<Object?> get props => [
        carName,
        viNum,
        licensePlate,
        licensingDate,
        carNatureOfUse,
        engineNum,
        productionDate,
        compulsoryInsuranceDate,
        mileage,
        color
      ];
}
// class PurchaseCarInfoModel extends HiveObject {
//   @HiveField(0)
//
//   ///渠道1=入驻商 2=车商
//   int? channel;
//   @HiveField(1)
//
//   ///车型
//   String? carName;
//   @HiveField(2)
//   int? carModelId;
//   @HiveField(3)
//
//   ///车架号
//   String? viNum;
//   @HiveField(4)
//
//   ///首次上牌时间
//   DateTime? licensingDate;
//
//   String get licensingDateStr =>
//       DateUtil.formatDate(licensingDate, format: 'yyyy-MM-dd');
//   @HiveField(5)
//
//   ///出场日期
//   DateTime? productionDate;
//
//   String get productionDateStr =>
//       DateUtil.formatDate(productionDate, format: 'yyyy-MM-dd');
//   @HiveField(6)
//
//   ///车辆牌照
//   String? licensePlate;
//   @HiveField(7)
//
//   ///使用性质
//   int? carNatureOfUse;
//
//   CarNatureOfUse get carNatureOfUseEM =>
//       CarNatureOfUse.getValue(carNatureOfUse ?? 0);
//   @HiveField(8)
//
//   ///发动机号
//   String? engineNum;
//
//   ///交强险到期时间
//   DateTime? compulsoryInsuranceDate;
//
//   String get compulsoryInsuranceDateStr {
//     if (compulsoryInsuranceDate == null) {
//       return '';
//     } else {
//       return DateUtil.formatDate(compulsoryInsuranceDate, format: 'yyyy-MM-dd');
//     }
//   }
//
//   @HiveField(9)
//
//   ///表显里程
//   String? mileage;
//   @HiveField(10)
//
//   ///车身颜色
//   String? color;
//
//   // ///环保等级
//   // String? environmentalLevel;
//   @HiveField(11)
//   String? customer;
//   @HiveField(12)
//   int? customerId;
//   @HiveField(13)
//   String? ownerName;
//   @HiveField(14)
//   String? ownerId;
//   @HiveField(15)
//   String? phoneNum;
//   @HiveField(16)
//   String? bankNum;
//   @HiveField(17)
//   String? bank;
//   @HiveField(18)
//   int? kind;
//
//   // ///签订时间
//   // DateTime? signingDate;
//   // String get signingDateStr =>
//   //     DateUtil.formatDate(signingDate, format: 'yyyy-MM-dd');
//   @HiveField(19)
//   String? signingAddress;
//   @HiveField(20)
//
//   ///成交金额
//   String? transactionAmount;
//   @HiveField(21)
//   // String? depositAmount;
//   ///首付金额
//   String? downPaymentAmount;
//   @HiveField(22)
//
//   ///首付比例
//   String? downPaymentNum;
//   @HiveField(23)
//
//   ///尾款金额
//   String? balanceAmountBackup;
//   @HiveField(24)
//
//   ///尾款比例
//   String? balanceAmountBackupNum;
//   @HiveField(25)
//   DateTime? deliveryDate;
//
//   String get deliveryDateStr =>
//       DateUtil.formatDate(deliveryDate, format: 'yyyy-MM-dd');
//   @HiveField(26)
//   String? deliveryPlace;
//   @HiveField(27)
//
//   ///手续证件
//   String? formalities;
//
//   // String? transferTax;
//   // String? handlingFee;
//   // String? serviceCharge;
//   @HiveField(28)
//   String? remark;
//   @HiveField(29)
//   List<CarPhotos>? carPhotos;
//   @HiveField(30)
//   List<CarPhotos>? interiorPhotos;
//   @HiveField(31)
//   List<CarPhotos>? defectPhotos;
//
//   // List<CarPhotos>? repairPhotos;
//   @HiveField(32)
//   List<CarPhotos>? dataPhotos;
//
//   // factory PurchaseCarInfoModel.fromJson(Map<String, dynamic> json) =>_$PurchaseCarInfoModelFromJson(json);
//   // Map<String,dynamic> toJson()=> _$PurchaseCarInfoModelToJson(this);
//   static PurchaseCarInfoModel get empty => PurchaseCarInfoModel(
//       channel: 0,
//       color: '',
//       viNum: '',
//       carName: '',
//       carModelId: 0,
//       licensingDate: DateTime.now(),
//       engineNum: '',
//       customer: '',
//       customerId: 0,
//       mileage: '',
//       carNatureOfUse: 0,
//       //environmentalLevel:'',
//       compulsoryInsuranceDate: DateTime.now(),
//       ownerName: '',
//       ownerId: '',
//       phoneNum: '',
//       bankNum: '',
//       kind: 0,
//       // signingDate:null,
//       signingAddress: '',
//       transactionAmount: '',
//       //depositAmount:'',
//       downPaymentAmount: '',
//       balanceAmountBackup: '',
//       deliveryDate: DateTime.now(),
//       deliveryPlace: '',
//       // transferTax:'',
//       // handlingFee:'',
//       // serviceCharge:'',
//       remark: '',
//       carPhotos: const [],
//       dataPhotos: const [],
//       defectPhotos: const [],
//       interiorPhotos: const [],
//   bank: '',
//     balanceAmountBackupNum: '',
//     downPaymentNum: '',
//     productionDate: DateTime.now(),
//     licensePlate: '',
//
//   );
//
//   PurchaseCarInfoModel({
//     this.channel,
//     this.carName,
//     this.carModelId,
//     this.viNum,
//     this.licensingDate,
//     this.productionDate,
//     this.licensePlate,
//     this.carNatureOfUse,
//     this.engineNum,
//     this.compulsoryInsuranceDate,
//     this.mileage,
//     this.color,
//     this.customer,
//     this.customerId,
//     this.ownerName,
//     this.ownerId,
//     this.phoneNum,
//     this.bankNum,
//     this.bank,
//     this.kind,
//     this.signingAddress,
//     this.transactionAmount,
//     this.downPaymentAmount,
//     this.downPaymentNum,
//     this.balanceAmountBackup,
//     this.balanceAmountBackupNum,
//     this.deliveryDate,
//     this.deliveryPlace,
//     this.formalities,
//     this.remark,
//     this.carPhotos,
//     this.interiorPhotos,
//     this.defectPhotos,
//     this.dataPhotos,
//   });
//
//   @override
//   List<Object?> get props => [
//         channel,
//         carName,
//         carModelId,
//         viNum,
//         licensingDate,
//         productionDate,
//         licensePlate,
//         carNatureOfUse,
//         engineNum,
//         compulsoryInsuranceDate,
//         mileage,
//         color,
//         customer,
//         customerId,
//         ownerName,
//         ownerId,
//         phoneNum,
//         bankNum,
//         bank,
//         kind,
//         signingAddress,
//         transactionAmount,
//         downPaymentAmount,
//         downPaymentNum,
//         balanceAmountBackup,
//         balanceAmountBackupNum,
//         deliveryDate,
//         deliveryPlace,
//         formalities,
//         remark,
//         carPhotos,
//         interiorPhotos,
//         defectPhotos,
//         dataPhotos
//       ];
// }
