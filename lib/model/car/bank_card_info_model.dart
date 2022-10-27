import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'bank_card_info_model.g.dart';

@JsonSerializable()
class BankCardInfoModel extends Equatable {
  final String bankCardNo;
  final String bankCardType;
  final String bankName;
  
  @override
  List<Object?> get props => [bankCardNo,bankCardType,bankName,];

  factory BankCardInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BankCardInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankCardInfoModelToJson(this);

  const BankCardInfoModel({
    required this.bankCardNo,
    required this.bankCardType,
    required this.bankName,
  });
}
