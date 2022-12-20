// import 'package:common_utils/common_utils.dart';
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:equatable/equatable.dart';
//
// import '../constants/enums.dart';
//
// part 'vehicle_local_model.g.dart';
//
// @JsonSerializable()
// @HiveType(typeId: 2)
// class VehicleLocalModel extends Equatable {
//   ///渠道1=入驻商 2=车商
//   int? channel;
//
//   ///车型
//   String? carName;
//   int? carModelId;
//
//   ///车架号
//   String? viNum;
//
//   ///首次上牌时间
//   DateTime? licensingDate;
//
//   String get licensingDateStr =>
//       DateUtil.formatDate(licensingDate, format: 'yyyy-MM-dd');
//
//   ///出场日期
//   DateTime? productionDate;
//
//   String get productionDateStr =>
//       DateUtil.formatDate(productionDate, format: 'yyyy-MM-dd');
//
//   ///车辆牌照
//   String? licensePlate;
//
//   ///使用性质
//   int? carNatureOfUse;
//
//   CarNatureOfUse get carNatureOfUseEM =>
//       CarNatureOfUse.getValue(carNatureOfUse ?? 0);
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
//   ///表显里程
//   String? mileage;
//
//   ///车身颜色
//   String? color;
//
//   // ///环保等级
//   // String? environmentalLevel;
//   String? customer;
//   int? customerId;
//
//   factory VehicleLocalModel.fromJson(Map<String, dynamic> json) =>
//       _$VehicleLocalModelFromJson(json);
//
//
//
//   VehicleLocalModel({
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
//     color,
//     customer,
//     customerId,
//       ];
// }
