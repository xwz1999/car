import 'package:cloud_car/constants/enums.dart';
import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'split_account_info_model.g.dart';

@JsonSerializable()
class SplitAccountInfoModel extends Equatable {
  final String amount;
  final String billAmount;
  final String saleAmount;
  final String name;
  final List<BrokerItem> brokers;
  final List<DateBillItem> dateBills;
  final bool finish;
  final String ownBillAmount;
  final String ownProfit;
  final String totalProfit;
  final String modelName;
  final String location;
  final int licensingDate;
  final String color;
  final String mileage;

  Decimal get amountDec => Decimal.parse(amount);

  Decimal get billAmountDec => Decimal.parse(billAmount);

  Decimal get saleAmountDec => Decimal.parse(saleAmount);

  Decimal get ownBillAmountDec => Decimal.parse(ownBillAmount);

  Decimal get ownProfitDec => Decimal.parse(ownProfit);

  Decimal get totalProfitDec => Decimal.parse(totalProfit);

  factory SplitAccountInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SplitAccountInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SplitAccountInfoModelToJson(this);

  @override
  List<Object?> get props => [amount,billAmount,saleAmount,name,brokers,dateBills,finish,ownBillAmount,ownProfit,totalProfit,modelName,location,licensingDate,color,mileage,];

  const SplitAccountInfoModel({
    required this.amount,
    required this.billAmount,
    required this.saleAmount,
    required this.name,
    required this.brokers,
    required this.dateBills,
    required this.finish,
    required this.ownBillAmount,
    required this.ownProfit,
    required this.totalProfit,
    required this.mileage,
  required this.color,
  required this.location,
  required this.modelName,
  required this.licensingDate
  });

  SplitAccountInfoModel copyWith({
    String? amount,
    String? billAmount,
    String? saleAmount,
    String? name,
    List<BrokerItem>? brokers,
    List<DateBillItem>? dateBills,
    bool? finish,
    String? ownBillAmount,
    String? ownProfit,
    String? totalProfit,

    String? mileage,
    String? color,
    String? location,
    String? modelName,
    int? licensingDate,

  }) {
    return SplitAccountInfoModel(
      amount: amount ?? this.amount,
      billAmount: billAmount ?? this.billAmount,
      saleAmount: saleAmount ?? this.saleAmount,
      name: name ?? this.name,
      brokers: brokers ?? this.brokers,
      dateBills: dateBills ?? this.dateBills,
      finish: finish ?? this.finish,
      ownBillAmount: ownBillAmount ?? this.ownBillAmount,
      ownProfit: ownProfit ?? this.ownProfit,
      totalProfit: totalProfit ?? this.totalProfit,
      mileage: mileage??this.mileage,
      modelName: modelName??this.modelName,
      location: location??this.location,
      color: color??this.color,
      licensingDate: licensingDate??this.licensingDate,
    );
  }
}

@JsonSerializable()
class BrokerItem extends Equatable {
  final int brokerId;
  final String name;
  final int roleId;
  final String avatar;
  final String proportion;
  final String amount;
  final String billAmount;
  final String profit;

  factory BrokerItem.fromJson(Map<String, dynamic> json) =>
      _$BrokerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BrokerItemToJson(this);

  Role get roleEM => Role.getValueN(roleId);

  Decimal get amountDec => Decimal.parse(amount);

  Decimal get billAmountDec => Decimal.parse(billAmount);

  Decimal get profitDec => Decimal.parse(profit);

  @override
  List<Object?> get props =>
      [brokerId, name, roleId, avatar, proportion, amount, billAmount, profit];

  const BrokerItem({
    required this.brokerId,
    required this.name,
    required this.roleId,
    required this.avatar,
    required this.proportion,
    required this.amount,
    required this.billAmount,
    required this.profit,
  });

  BrokerItem copyWith({
    int? brokerId,
    String? name,
    int? roleId,
    String? avatar,
    String? proportion,
    String? amount,
    String? billAmount,
    String? profit,
  }) {
    return BrokerItem(
      brokerId: brokerId ?? this.brokerId,
      name: name ?? this.name,
      roleId: roleId ?? this.roleId,
      avatar: avatar ?? this.avatar,
      proportion: proportion ?? this.proportion,
      amount: amount ?? this.amount,
      billAmount: billAmount ?? this.billAmount,
      profit: profit ?? this.profit,
    );
  }
}

@JsonSerializable()
class DateBillItem extends Equatable {
  final String date;
  final List<BillItem> bills;

  factory DateBillItem.fromJson(Map<String, dynamic> json) =>
      _$DateBillItemFromJson(json);

  Map<String, dynamic> toJson() => _$DateBillItemToJson(this);

  @override
  List<Object?> get props => [
        date,
        bills,
      ];

  const DateBillItem({
    required this.date,
    required this.bills,
  });

  DateBillItem copyWith({
    String? date,
    List<BillItem>? bills,
  }) {
    return DateBillItem(
      date: date ?? this.date,
      bills: bills ?? this.bills,
    );
  }
}

@JsonSerializable()
class BillItem extends Equatable {
  final String name;
  final String brokerName;
  final String amount;
  final bool symbol;
  final int createAt;

  factory BillItem.fromJson(Map<String, dynamic> json) =>
      _$BillItemFromJson(json);

  Map<String, dynamic> toJson() => _$BillItemToJson(this);

  @override
  List<Object?> get props => [
        name,
        brokerName,
        amount,
        symbol,
        createAt,
      ];

  const BillItem({
    required this.name,
    required this.brokerName,
    required this.amount,
    required this.symbol,
    required this.createAt,
  });

  BillItem copyWith({
    String? name,
    String? brokerName,
    String? amount,
    bool? symbol,
    int? createAt,
  }) {
    return BillItem(
      name: name ?? this.name,
      brokerName: brokerName ?? this.brokerName,
      amount: amount ?? this.amount,
      symbol: symbol ?? this.symbol,
      createAt: createAt ?? this.createAt,
    );
  }
}
