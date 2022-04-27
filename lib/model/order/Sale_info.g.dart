// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sale_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleInfo _$SaleInfoFromJson(Map<String, dynamic> json) => SaleInfo(
      id: json['id'] as int,
      car: Car.fromJson(json['car'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      deposit: Deposit.fromJson(json['deposit'] as Map<String, dynamic>),
      downPayment:
          DownPayment.fromJson(json['downPayment'] as Map<String, dynamic>),
      balancePayment: BalancePayment.fromJson(
          json['balancePayment'] as Map<String, dynamic>),
      report: Report.fromJson(json['report'] as Map<String, dynamic>),
      means: Means.fromJson(json['means'] as Map<String, dynamic>),
    );

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      carId: json['carId'] as int,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      transfer: json['transfer'] as int,
    );

Contract _$ContractFromJson(Map<String, dynamic> json) => Contract(
      contract: json['contract'] as int,
      amount: json['amount'] as String,
      deposit: json['deposit'] as String,
      downPayment: json['downPayment'] as String,
      balancePayment: json['balancePayment'] as String,
      serviceFee: json['serviceFee'] as String,
      totalAmount: json['totalAmount'] as String,
      signAt: json['signAt'] as num,
    );

Deposit _$DepositFromJson(Map<String, dynamic> json) => Deposit(
      amount: json['amount'] as String,
      payType: json['payType'] as String,
      createdAt: json['createdAt'] as num,
    );

DownPayment _$DownPaymentFromJson(Map<String, dynamic> json) => DownPayment(
      amount: json['amount'] as String,
      proof: json['proof'] as String,
      createdAt: json['createdAt'] as num,
    );

BalancePayment _$BalancePaymentFromJson(Map<String, dynamic> json) =>
    BalancePayment(
      amount: json['amount'] as String,
      proof: json['proof'] as String,
      createdAt: json['createdAt'] as num,
    );

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      reportId: json['reportId'] as int,
      path: json['path'] as String,
    );

Means _$MeansFromJson(Map<String, dynamic> json) => Means(
      certificate: json['certificate'] as String,
      vehicleLicense: json['vehicleLicense'] as String,
      invoice: json['invoice'] as String,
      guaranteeSlip: json['guaranteeSlip'] as String,
    );
