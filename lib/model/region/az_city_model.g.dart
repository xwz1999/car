// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'az_city_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AzCityModelAdapter extends TypeAdapter<AzCityModel> {
  @override
  final int typeId = 1;

  @override
  AzCityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AzCityModel(
      cityId: fields[0] as int,
      cityName: fields[1] as String,
      provId: fields[2] as int,
      provName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AzCityModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.cityId)
      ..writeByte(1)
      ..write(obj.cityName)
      ..writeByte(2)
      ..write(obj.provId)
      ..writeByte(3)
      ..write(obj.provName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AzCityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AzCityModel _$AzCityModelFromJson(Map<String, dynamic> json) => AzCityModel(
      cityId: json['cityId'] as int,
      cityName: json['cityName'] as String,
      provId: json['provId'] as int,
      provName: json['provName'] as String,
    )..isShowSuspension = json['isShowSuspension'] as bool;

Map<String, dynamic> _$AzCityModelToJson(AzCityModel instance) =>
    <String, dynamic>{
      'isShowSuspension': instance.isShowSuspension,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'provId': instance.provId,
      'provName': instance.provName,
    };
