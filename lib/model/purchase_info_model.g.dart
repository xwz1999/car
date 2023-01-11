// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseInfoModelAdapter extends TypeAdapter<PurchaseInfoModel> {
  @override
  final int typeId = 4;

  @override
  PurchaseInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseInfoModel(
      ownerName: fields[0] as String?,
      ownerId: fields[1] as String?,
      phoneNum: fields[2] as String?,
      bankNum: fields[3] as String?,
      bank: fields[4] as String?,
      kind: fields[5] as int?,
      signingAddress: fields[6] as String?,
      transactionAmount: fields[7] as String?,
      downPaymentAmount: fields[8] as String?,
      downPaymentNum: fields[9] as String?,
      balanceAmountBackup: fields[10] as String?,
      balanceAmountBackupNum: fields[11] as String?,
      deliveryDate: fields[12] as DateTime?,
      deliveryPlace: fields[13] as String?,
      formalities: fields[14] as String?,
      remark: fields[15] as String?,
      legalPerson: fields[16] as String?,
      channel: fields[17] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseInfoModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.ownerName)
      ..writeByte(1)
      ..write(obj.ownerId)
      ..writeByte(2)
      ..write(obj.phoneNum)
      ..writeByte(3)
      ..write(obj.bankNum)
      ..writeByte(4)
      ..write(obj.bank)
      ..writeByte(5)
      ..write(obj.kind)
      ..writeByte(6)
      ..write(obj.signingAddress)
      ..writeByte(7)
      ..write(obj.transactionAmount)
      ..writeByte(8)
      ..write(obj.downPaymentAmount)
      ..writeByte(9)
      ..write(obj.downPaymentNum)
      ..writeByte(10)
      ..write(obj.balanceAmountBackup)
      ..writeByte(11)
      ..write(obj.balanceAmountBackupNum)
      ..writeByte(12)
      ..write(obj.deliveryDate)
      ..writeByte(13)
      ..write(obj.deliveryPlace)
      ..writeByte(14)
      ..write(obj.formalities)
      ..writeByte(15)
      ..write(obj.remark)
      ..writeByte(16)
      ..write(obj.legalPerson)
      ..writeByte(17)
      ..write(obj.channel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseInfoModel _$PurchaseInfoModelFromJson(Map<String, dynamic> json) =>
    PurchaseInfoModel(
      ownerName: json['ownerName'] as String?,
      ownerId: json['ownerId'] as String?,
      phoneNum: json['phoneNum'] as String?,
      bankNum: json['bankNum'] as String?,
      bank: json['bank'] as String?,
      kind: json['kind'] as int?,
      signingAddress: json['signingAddress'] as String?,
      transactionAmount: json['transactionAmount'] as String?,
      downPaymentAmount: json['downPaymentAmount'] as String?,
      downPaymentNum: json['downPaymentNum'] as String?,
      balanceAmountBackup: json['balanceAmountBackup'] as String?,
      balanceAmountBackupNum: json['balanceAmountBackupNum'] as String?,
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
      deliveryPlace: json['deliveryPlace'] as String?,
      formalities: json['formalities'] as String?,
      remark: json['remark'] as String?,
      legalPerson: json['legalPerson'] as String?,
      channel: json['channel'] as int?,
    );

Map<String, dynamic> _$PurchaseInfoModelToJson(PurchaseInfoModel instance) =>
    <String, dynamic>{
      'ownerName': instance.ownerName,
      'ownerId': instance.ownerId,
      'phoneNum': instance.phoneNum,
      'bankNum': instance.bankNum,
      'bank': instance.bank,
      'kind': instance.kind,
      'signingAddress': instance.signingAddress,
      'transactionAmount': instance.transactionAmount,
      'downPaymentAmount': instance.downPaymentAmount,
      'downPaymentNum': instance.downPaymentNum,
      'balanceAmountBackup': instance.balanceAmountBackup,
      'balanceAmountBackupNum': instance.balanceAmountBackupNum,
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'deliveryPlace': instance.deliveryPlace,
      'formalities': instance.formalities,
      'remark': instance.remark,
      'legalPerson': instance.legalPerson,
      'channel': instance.channel,
    };
