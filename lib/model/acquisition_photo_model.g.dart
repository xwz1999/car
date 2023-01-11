// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acquisition_photo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AcquisitionPhotoModelAdapter extends TypeAdapter<AcquisitionPhotoModel> {
  @override
  final int typeId = 5;

  @override
  AcquisitionPhotoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AcquisitionPhotoModel(
      carPhotos: (fields[0] as List?)?.cast<CarPhotos>(),
      dataPhotos: (fields[1] as List?)?.cast<CarPhotos>(),
    );
  }

  @override
  void write(BinaryWriter writer, AcquisitionPhotoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.carPhotos)
      ..writeByte(1)
      ..write(obj.dataPhotos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AcquisitionPhotoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcquisitionPhotoModel _$AcquisitionPhotoModelFromJson(
        Map<String, dynamic> json) =>
    AcquisitionPhotoModel(
      carPhotos: (json['carPhotos'] as List<dynamic>?)
          ?.map((e) => CarPhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataPhotos: (json['dataPhotos'] as List<dynamic>?)
          ?.map((e) => CarPhotos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AcquisitionPhotoModelToJson(
        AcquisitionPhotoModel instance) =>
    <String, dynamic>{
      'carPhotos': instance.carPhotos,
      'dataPhotos': instance.dataPhotos,
    };
