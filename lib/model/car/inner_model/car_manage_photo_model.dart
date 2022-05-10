import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'car_manage_photo_model.g.dart';

@JsonSerializable()
class CarManagePhotoModel extends Equatable {
  final List<String> carPhotos;
  final List<String> interiorPhotos;
  final List<String> defectPhotos;
  final List<String> dataPhotos;

  factory CarManagePhotoModel.fromJson(Map<String, dynamic> json) =>
      _$CarManagePhotoModelFromJson(json);

  CarManagePhotoModel get init => const CarManagePhotoModel(
      carPhotos: [], interiorPhotos: [], defectPhotos: [], dataPhotos: []);

  const CarManagePhotoModel({
    required this.carPhotos,
    required this.interiorPhotos,
    required this.defectPhotos,
    required this.dataPhotos,
  });

  @override
  List<Object?> get props => [
        carPhotos,
        interiorPhotos,
        defectPhotos,
        dataPhotos,
      ];
}
