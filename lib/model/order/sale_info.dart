import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale_info.g.dart';

@JsonSerializable()
class SaleInfo extends Equatable {
  final int id;
  final int customerChannel;
  final String customerChannelName;
  final int status;
  final String statusName;
  final num createdAt;
  final Car car;
  final Contract contract;
  final Deposit deposit;
  final DownPayment downPayment;
  final BalancePayment balancePayment;
  final Report report;
  final Means means;
  final SaleCustomer customer;

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);

  static SaleInfo get init => const SaleInfo(
      id: 0,
      customerChannel: 0,
      customerChannelName: '',
      status: 0,
      statusName: '',
      createdAt: 0,
      car: Car(
          licensingDate: 0,
          carId: 0,
          mainPhoto: '',
          mileage: '',
          modelName: '',
          transfer: 0),
      contract: Contract(
        contract: 0,
        contractSn: '',
        downPayment: '',
        thirdPartName: '',
        thirdPartId: 0,
        payTypeName: '',
        deposit: '',
        balancePayment: '',
        signAt: 0,
        totalAmount: '',
        amount: '',
        saleServiceFee: '',
        purchaseSaleServiceFee: '',
        transferTypeName: '',
        thirdPartKind: '',
      ),
      deposit: Deposit(amount: '', createdAt: 0, payType: '', id: 0),
      downPayment: DownPayment(
        amount: '',
        createdAt: 0,
        proof: '',
        id: 0,
      ),
      balancePayment:
          BalancePayment(amount: '', createdAt: 0, proof: '', id: 0),
      report: Report(
        path: '',
        id: 0,
      ),
      customer: SaleCustomer(name: '', phone: '', id: 0),
      means: Means(
          certificate: '',
          guaranteeSlip: '',
          invoice: '',
          vehicleLicense: '',
          id: 0));

  @override
  List<Object?> get props => [
        id,
        customerChannel,
        customerChannelName,
        status,
        statusName,
        createdAt,
        car,
        contract,
        deposit,
        downPayment,
        balancePayment,
        report,
        means,
        customer
      ];

  const SaleInfo({
    required this.id,
    required this.car,
    required this.contract,
    required this.deposit,
    required this.downPayment,
    required this.balancePayment,
    required this.report,
    required this.means,
    required this.customer,
    required this.customerChannel,
    required this.customerChannelName,
    required this.status,
    required this.statusName,
    required this.createdAt,
  });
}

@JsonSerializable()
class Car extends Equatable {
  final int carId;
  final String mainPhoto;
  final String modelName;
  final int licensingDate;
  final String mileage;
  final int transfer;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);

  const Car({
    required this.carId,
    required this.mainPhoto,
    required this.modelName,
    required this.licensingDate,
    required this.mileage,
    required this.transfer,
  });

  @override
  List<Object?> get props =>
      [carId, mainPhoto, modelName, licensingDate, mileage, transfer];
}

@JsonSerializable()
class Contract extends Equatable {
  final int contract;
  final String contractSn;
  final String amount;
  final String deposit;
  final String downPayment;
  final String balancePayment;
  final String payTypeName;
  final String transferTypeName;
  final String thirdPartKind;
  final int thirdPartId;
  final String thirdPartName;
  final String saleServiceFee;
  final String purchaseSaleServiceFee;
  final String totalAmount;
  final num signAt;

  // final int contract;
  // final String amount;
  // final String deposit;
  // final String downPayment;
  // final String balancePayment;
  // final String serviceFee;
  // final String totalAmount;
  // final num signAt;

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);

  Map<String, dynamic> toJson() => _$ContractToJson(this);

  const Contract({
    required this.contract,
    required this.contractSn,
    required this.amount,
    required this.deposit,
    required this.downPayment,
    required this.balancePayment,
    required this.payTypeName,
    required this.transferTypeName,
    required this.thirdPartKind,
    required this.thirdPartId,
    required this.thirdPartName,
    required this.saleServiceFee,
    required this.purchaseSaleServiceFee,
    required this.totalAmount,
    required this.signAt,
  });

  @override
  List<Object?> get props => [
        contract,
        contractSn,
        amount,
        deposit,
        downPayment,
        // balancePayment,
        payTypeName,
        transferTypeName,
        thirdPartKind,
        thirdPartId,
        thirdPartName,
        saleServiceFee,
        purchaseSaleServiceFee,
        totalAmount,
        signAt,
      ];
// const Contract({
//   required this.contract,
//   required this.amount,
//   required this.deposit,
//   required this.downPayment,
//   required this.balancePayment,
//   required this.serviceFee,
//   required this.totalAmount,
//   required this.signAt,
// });
//
// @override
// List<Object?> get props => [
//       contract,
//       amount,
//       deposit,
//       downPayment,
//       balancePayment,
//       serviceFee,
//       totalAmount,
//       signAt
//     ];
}

@JsonSerializable()
class Deposit extends Equatable {
  final int id;
  final String amount;
  final String payType;
  final num createdAt;

  factory Deposit.fromJson(Map<String, dynamic> json) =>
      _$DepositFromJson(json);

  Map<String, dynamic> toJson() => _$DepositToJson(this);

  const Deposit({
    required this.id,
    required this.amount,
    required this.payType,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, amount, payType, createdAt];
}

@JsonSerializable()
class DownPayment extends Equatable {
  final int id;
  final String amount;
  final String proof;
  final num createdAt;

  factory DownPayment.fromJson(Map<String, dynamic> json) =>
      _$DownPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$DownPaymentToJson(this);

  const DownPayment({
    required this.id,
    required this.amount,
    required this.proof,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, amount, proof, createdAt];
}

@JsonSerializable()
class BalancePayment extends Equatable {
  final int id;
  final String amount;
  final String proof;
  final num createdAt;

  factory BalancePayment.fromJson(Map<String, dynamic> json) =>
      _$BalancePaymentFromJson(json);

  Map<String, dynamic> toJson() => _$BalancePaymentToJson(this);

  const BalancePayment({
    required this.id,
    required this.amount,
    required this.proof,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, amount, proof, createdAt];
}

@JsonSerializable()
class Report extends Equatable {
  final int id;
  final String path;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);

  const Report({
    required this.id,
    required this.path,
  });

  @override
  List<Object?> get props => [id, path];
}

@JsonSerializable()
class Means extends Equatable {
  final int id;
  final String certificate;
  final String vehicleLicense;
  final String invoice;
  final String guaranteeSlip;

  factory Means.fromJson(Map<String, dynamic> json) => _$MeansFromJson(json);

  Map<String, dynamic> toJson() => _$MeansToJson(this);

  const Means({
    required this.id,
    required this.certificate,
    required this.vehicleLicense,
    required this.invoice,
    required this.guaranteeSlip,
  });

  @override
  List<Object?> get props =>
      [id, certificate, vehicleLicense, invoice, guaranteeSlip];
}

@JsonSerializable()
class SaleCustomer extends Equatable {
  final int id;
  final String name;
  final String phone;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
      ];

  factory SaleCustomer.fromJson(Map<String, dynamic> json) =>
      _$SaleCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$SaleCustomerToJson(this);

  const SaleCustomer({
    required this.id,
    required this.name,
    required this.phone,
  });
}
