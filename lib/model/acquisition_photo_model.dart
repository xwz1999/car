import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import '../ui/home/car_manager/publish_car/push_photo_model.dart';
part 'acquisition_photo_model.g.dart';


@JsonSerializable()
@HiveType(typeId: 5)
class AcquisitionPhotoModel extends Equatable{
  @HiveField(0)
  List<CarPhotos>? carPhotos;
  @HiveField(1)
  List<CarPhotos>? dataPhotos;
    factory AcquisitionPhotoModel.fromJson(Map<String, dynamic> json) =>_$AcquisitionPhotoModelFromJson(json);
    Map<String,dynamic> toJson()=> _$AcquisitionPhotoModelToJson(this);

  AcquisitionPhotoModel({
    this.carPhotos,
    this.dataPhotos,
  });
  @override
  List<Object?> get props => [carPhotos,dataPhotos];
}