
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale_info.g.dart';

@JsonSerializable()
class SaleInfo extends Equatable {
  final int id;
  final Car car;
  final Contract contract;
  final Deposit deposit;
  final DownPayment downPayment;
  final BalancePayment balancePayment;
  final Report report;
  final Means means;

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);

 static SaleInfo get init => const SaleInfo(
      id: 0,
      car: Car(
          licensingDate: 0,
          carId: 0,
          mainPhoto: '',
          mileage: '',
          modelName: '',
          transfer: 0),
      contract: Contract(
        amount: '',
        deposit: '',
        balancePayment: '',
        contract: 0,
        downPayment: '',
        serviceFee: '',
        signAt: 0,
        totalAmount: '',
      ),
      deposit: Deposit(amount: '', createdAt: 0, payType: ''),
      downPayment: DownPayment(
        amount: '',
        createdAt: 0,
        proof: '',
      ),
      balancePayment: BalancePayment(amount: '', createdAt: 0, proof: ''),
      report: Report(path: '', reportId: 0),
      means: Means(
          certificate: '', guaranteeSlip: '', invoice: '', vehicleLicense: ''));

  const SaleInfo({
    required this.id,
    required this.car,
    required this.contract,
    required this.deposit,
    required this.downPayment,
    required this.balancePayment,
    required this.report,
    required this.means,
  });

  @override
  List<Object?> get props =>
      [id, car, contract, deposit, downPayment, balancePayment, report, means];
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
  final String amount;
  final String deposit;
  final String downPayment;
  final String balancePayment;
  final String serviceFee;
  final String totalAmount;
  final num signAt;

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);

  const Contract({
    required this.contract,
    required this.amount,
    required this.deposit,
    required this.downPayment,
    required this.balancePayment,
    required this.serviceFee,
    required this.totalAmount,
    required this.signAt,
  });

  @override
  List<Object?> get props => [
        contract,
        amount,
        deposit,
        downPayment,
        balancePayment,
        serviceFee,
        totalAmount,
        signAt
      ];
}

@JsonSerializable()
class Deposit extends Equatable {
  final String amount;
  final String payType;
  final num createdAt;

  factory Deposit.fromJson(Map<String, dynamic> json) =>
      _$DepositFromJson(json);

  const Deposit({
    required this.amount,
    required this.payType,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [amount, payType, createdAt];
}

@JsonSerializable()
class DownPayment extends Equatable {
  final String amount;
  final String proof;
  final num createdAt;

  factory DownPayment.fromJson(Map<String, dynamic> json) =>
      _$DownPaymentFromJson(json);

  const DownPayment({
    required this.amount,
    required this.proof,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [amount, proof, createdAt];
}

@JsonSerializable()
class BalancePayment extends Equatable {
  final String amount;
  final String proof;
  final num createdAt;

  factory BalancePayment.fromJson(Map<String, dynamic> json) =>
      _$BalancePaymentFromJson(json);

  const BalancePayment({
    required this.amount,
    required this.proof,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [amount, proof, createdAt];
}

@JsonSerializable()
class Report extends Equatable {
  final int reportId;
  final String path;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  const Report({
    required this.reportId,
    required this.path,
  });

  @override
  List<Object?> get props => [reportId, path];
}

@JsonSerializable()
class Means extends Equatable {
  final String certificate;
  final String vehicleLicense;
  final String invoice;
  final String guaranteeSlip;

  factory Means.fromJson(Map<String, dynamic> json) => _$MeansFromJson(json);

  const Means({
    required this.certificate,
    required this.vehicleLicense,
    required this.invoice,
    required this.guaranteeSlip,
  });

  @override
  List<Object?> get props =>
      [certificate, vehicleLicense, invoice, guaranteeSlip];
}
