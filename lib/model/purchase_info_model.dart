import 'package:common_utils/common_utils.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'purchase_info_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class PurchaseInfoModel extends Equatable {
  @HiveField(0)
  String? ownerName;
  @HiveField(1)
  String? ownerId;
  @HiveField(2)
  String? phoneNum;
  @HiveField(3)
  String? bankNum;
  @HiveField(4)
  String? bank;
  @HiveField(5)
  int? kind;

  // ///签订时间
  // DateTime? signingDate;
  // String get signingDateStr =>
  //     DateUtil.formatDate(signingDate, format: 'yyyy-MM-dd');
  @HiveField(6)
  String? signingAddress;

  ///成交金额
  @HiveField(7)
  String? transactionAmount;

  // String? depositAmount;
  @HiveField(8)

  ///首付金额
  String? downPaymentAmount;
  @HiveField(9)

  ///首付比例
  String? downPaymentNum;
  @HiveField(10)

  ///尾款金额
  String? balanceAmountBackup;
  @HiveField(11)

  ///尾款比例
  String? balanceAmountBackupNum;
  @HiveField(12)
  DateTime? deliveryDate;

  String get deliveryDateStr =>
      DateUtil.formatDate(deliveryDate, format: 'yyyy-MM-dd');
  @HiveField(13)
  String? deliveryPlace;
  @HiveField(14)

  ///手续证件
  String? formalities;

  // String? transferTax;
  // String? handlingFee;
  // String? serviceCharge;
  @HiveField(15)
  String? remark;
  @HiveField(16)
  String? legalPerson;
  @HiveField(17)
  int? channel;

  static PurchaseInfoModel get empty => PurchaseInfoModel(
        ownerName: '',
        ownerId: '',
        phoneNum: '',
        bankNum: '',
        kind: null,
        // signingDate:null,
        signingAddress: '',
        transactionAmount: '',
        //depositAmount:'',
        downPaymentAmount: '',
        balanceAmountBackup: '',
        deliveryDate: null,
        deliveryPlace: '',
        // transferTax:'',
        // handlingFee:'',
        // serviceCharge:'',
        remark: '',
        legalPerson: '',
        channel: 0,
      );

  factory PurchaseInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseInfoModelToJson(this);

  PurchaseInfoModel({
    this.ownerName,
    this.ownerId,
    this.phoneNum,
    this.bankNum,
    this.bank,
    this.kind,
    this.signingAddress,
    this.transactionAmount,
    this.downPaymentAmount,
    this.downPaymentNum,
    this.balanceAmountBackup,
    this.balanceAmountBackupNum,
    this.deliveryDate,
    this.deliveryPlace,
    this.formalities,
    this.remark,
    this.legalPerson,
    this.channel,
  });

  @override
  List<Object?> get props => [
        ownerName,
        ownerId,
        phoneNum,
        bankNum,
        bank,
        kind,
        signingAddress,
        transactionAmount,
        downPaymentAmount,
        downPaymentNum,
        balanceAmountBackup,
        balanceAmountBackupNum,
        deliveryDate,
        deliveryPlace,
        formalities,
        remark,
        legalPerson,
        channel
      ];
}
