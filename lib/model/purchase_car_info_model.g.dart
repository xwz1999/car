// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_car_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseCarInfoModelAdapter extends TypeAdapter<PurchaseCarInfoModel> {
  @override
  final int typeId = 2;

  @override
  PurchaseCarInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseCarInfoModel(
      carName: fields[0] as String?,
      viNum: fields[1] as String?,
      licensePlate: fields[2] as String?,
      licensingDate: fields[3] as DateTime?,
      carNatureOfUse: fields[4] as int?,
      engineNum: fields[5] as String?,
      productionDate: fields[6] as DateTime?,
      compulsoryInsuranceDate: fields[7] as DateTime?,
      mileage: fields[8] as String?,
      color: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseCarInfoModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.carName)
      ..writeByte(1)
      ..write(obj.viNum)
      ..writeByte(2)
      ..write(obj.licensePlate)
      ..writeByte(3)
      ..write(obj.licensingDate)
      ..writeByte(4)
      ..write(obj.carNatureOfUse)
      ..writeByte(5)
      ..write(obj.engineNum)
      ..writeByte(6)
      ..write(obj.productionDate)
      ..writeByte(7)
      ..write(obj.compulsoryInsuranceDate)
      ..writeByte(8)
      ..write(obj.mileage)
      ..writeByte(9)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseCarInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
