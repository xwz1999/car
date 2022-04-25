// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'china_region_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChinaRegionModelAdapter extends TypeAdapter<ChinaRegionModel> {
  @override
  final int typeId = 0;

  @override
  ChinaRegionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChinaRegionModel(
      id: fields[0] as int,
      parentId: fields[1] as int,
      name: fields[2] as String,
      code: fields[3] as String,
      level: fields[4] as int,
      children: (fields[5] as List?)?.cast<ChinaRegionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChinaRegionModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parentId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.level)
      ..writeByte(5)
      ..write(obj.children);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChinaRegionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChinaRegionModel _$ChinaRegionModelFromJson(Map<String, dynamic> json) =>
    ChinaRegionModel(
      id: json['id'] as int,
      parentId: json['parentId'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      level: json['level'] as int,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => ChinaRegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
