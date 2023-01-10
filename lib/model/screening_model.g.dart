// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScreeningModelAdapter extends TypeAdapter<ScreeningModel> {
  @override
  final int typeId = 3;

  @override
  ScreeningModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScreeningModel(
      brandId: fields[0] as int,
      seriesId: fields[1] as int,
      minPrice: fields[2] as int,
      maxPrice: fields[3] as int,
      minMileage: fields[4] as int,
      maxMileage: fields[5] as int,
      struct: fields[6] as String,
      fuelType: fields[7] as int,
      gearType: fields[8] as int,
      dischargeStandard: fields[9] as String,
      brandName: fields[10] as String,
      seriesName: fields[11] as String,
      structName: fields[12] as String,
      fuelName: fields[13] as String,
      gearName: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ScreeningModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.brandId)
      ..writeByte(1)
      ..write(obj.seriesId)
      ..writeByte(2)
      ..write(obj.minPrice)
      ..writeByte(3)
      ..write(obj.maxPrice)
      ..writeByte(4)
      ..write(obj.minMileage)
      ..writeByte(5)
      ..write(obj.maxMileage)
      ..writeByte(6)
      ..write(obj.struct)
      ..writeByte(7)
      ..write(obj.fuelType)
      ..writeByte(8)
      ..write(obj.gearType)
      ..writeByte(9)
      ..write(obj.dischargeStandard)
      ..writeByte(10)
      ..write(obj.brandName)
      ..writeByte(11)
      ..write(obj.seriesName)
      ..writeByte(12)
      ..write(obj.structName)
      ..writeByte(13)
      ..write(obj.fuelName)
      ..writeByte(14)
      ..write(obj.gearName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreeningModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreeningModel _$ScreeningModelFromJson(Map<String, dynamic> json) =>
    ScreeningModel(
      brandId: json['brandId'] as int,
      seriesId: json['seriesId'] as int,
      minPrice: json['minPrice'] as int,
      maxPrice: json['maxPrice'] as int,
      minMileage: json['minMileage'] as int,
      maxMileage: json['maxMileage'] as int,
      struct: json['struct'] as String,
      fuelType: json['fuelType'] as int,
      gearType: json['gearType'] as int,
      dischargeStandard: json['dischargeStandard'] as String,
      brandName: json['brandName'] as String,
      seriesName: json['seriesName'] as String,
      structName: json['structName'] as String,
      fuelName: json['fuelName'] as String,
      gearName: json['gearName'] as String,
    );

Map<String, dynamic> _$ScreeningModelToJson(ScreeningModel instance) =>
    <String, dynamic>{
      'brandId': instance.brandId,
      'seriesId': instance.seriesId,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'minMileage': instance.minMileage,
      'maxMileage': instance.maxMileage,
      'struct': instance.struct,
      'fuelType': instance.fuelType,
      'gearType': instance.gearType,
      'dischargeStandard': instance.dischargeStandard,
      'brandName': instance.brandName,
      'seriesName': instance.seriesName,
      'structName': instance.structName,
      'fuelName': instance.fuelName,
      'gearName': instance.gearName,
    };
