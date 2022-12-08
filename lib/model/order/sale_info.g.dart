// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info.dart';

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
      customer: SaleCustomer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SaleInfoToJson(SaleInfo instance) => <String, dynamic>{
      'id': instance.id,
      'car': instance.car,
      'contract': instance.contract,
      'deposit': instance.deposit,
      'downPayment': instance.downPayment,
      'balancePayment': instance.balancePayment,
      'report': instance.report,
      'means': instance.means,
      'customer': instance.customer,
    };

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      carId: json['carId'] as int,
      mainPhoto: json['mainPhoto'] as String,
      modelName: json['modelName'] as String,
      licensingDate: json['licensingDate'] as int,
      mileage: json['mileage'] as String,
      transfer: json['transfer'] as int,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'carId': instance.carId,
      'mainPhoto': instance.mainPhoto,
      'modelName': instance.modelName,
      'licensingDate': instance.licensingDate,
      'mileage': instance.mileage,
      'transfer': instance.transfer,
    };

Contract _$ContractFromJson(Map<String, dynamic> json) => Contract(
      contract: json['contract'] as int,
      contractSn: json['contractSn'] as String,
      amount: json['amount'] as String,
      deposit: json['deposit'] as String,
      downPayment: json['downPayment'] as String,
      balancePayment: json['balancePayment'] as String,
      payTypeName: json['payTypeName'] as String,
      transferTypeName: json['transferTypeName'] as String,
      thirdPartKind: json['thirdPartKind'] as String,
      thirdPartId: json['thirdPartId'] as int,
      thirdPartName: json['thirdPartName'] as String,
      saleServiceFee: json['saleServiceFee'] as String,
      purchaseSaleServiceFee: json['purchaseSaleServiceFee'] as String,
      totalAmount: json['totalAmount'] as String,
      signAt: json['signAt'] as num,
    );

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'contract': instance.contract,
      'contractSn': instance.contractSn,
      'amount': instance.amount,
      'deposit': instance.deposit,
      'downPayment': instance.downPayment,
      'balancePayment': instance.balancePayment,
      'payTypeName': instance.payTypeName,
      'transferTypeName': instance.transferTypeName,
      'thirdPartKind': instance.thirdPartKind,
      'thirdPartId': instance.thirdPartId,
      'thirdPartName': instance.thirdPartName,
      'saleServiceFee': instance.saleServiceFee,
      'purchaseSaleServiceFee': instance.purchaseSaleServiceFee,
      'totalAmount': instance.totalAmount,
      'signAt': instance.signAt,
    };

Deposit _$DepositFromJson(Map<String, dynamic> json) => Deposit(
      amount: json['amount'] as String,
      payType: json['payType'] as String,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$DepositToJson(Deposit instance) => <String, dynamic>{
      'amount': instance.amount,
      'payType': instance.payType,
      'createdAt': instance.createdAt,
    };

DownPayment _$DownPaymentFromJson(Map<String, dynamic> json) => DownPayment(
      amount: json['amount'] as String,
      proof: json['proof'] as String,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$DownPaymentToJson(DownPayment instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'proof': instance.proof,
      'createdAt': instance.createdAt,
    };

BalancePayment _$BalancePaymentFromJson(Map<String, dynamic> json) =>
    BalancePayment(
      amount: json['amount'] as String,
      proof: json['proof'] as String,
      createdAt: json['createdAt'] as num,
    );

Map<String, dynamic> _$BalancePaymentToJson(BalancePayment instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'proof': instance.proof,
      'createdAt': instance.createdAt,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      reportId: json['reportId'] as int,
      path: json['path'] as String,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'reportId': instance.reportId,
      'path': instance.path,
    };

Means _$MeansFromJson(Map<String, dynamic> json) => Means(
      certificate: json['certificate'] as String,
      vehicleLicense: json['vehicleLicense'] as String,
      invoice: json['invoice'] as String,
      guaranteeSlip: json['guaranteeSlip'] as String,
    );

Map<String, dynamic> _$MeansToJson(Means instance) => <String, dynamic>{
      'certificate': instance.certificate,
      'vehicleLicense': instance.vehicleLicense,
      'invoice': instance.invoice,
      'guaranteeSlip': instance.guaranteeSlip,
    };

SaleCustomer _$SaleCustomerFromJson(Map<String, dynamic> json) => SaleCustomer(
      name: json['name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$SaleCustomerToJson(SaleCustomer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };
