import 'package:json_annotation/json_annotation.dart';

part 'car_manage_photo_model.g.dart';

@JsonSerializable()
class CarManagePhotoModel {
  List<String> carPhotos;
  List<String> interiorPhotos;
  List<String> defectPhotos;
  List<String> dataPhotos;

  factory CarManagePhotoModel.fromJson(Map<String, dynamic> json) =>
      _$CarManagePhotoModelFromJson(json);

  static CarManagePhotoModel get init => CarManagePhotoModel(
      carPhotos: [], interiorPhotos: [], defectPhotos: [], dataPhotos: []);

//<editor-fold desc="Data Methods">

  CarManagePhotoModel({
    required this.carPhotos,
    required this.interiorPhotos,
    required this.defectPhotos,
    required this.dataPhotos,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarManagePhotoModel &&
          runtimeType == other.runtimeType &&
          carPhotos == other.carPhotos &&
          interiorPhotos == other.interiorPhotos &&
          defectPhotos == other.defectPhotos &&
          dataPhotos == other.dataPhotos);

  @override
  int get hashCode =>
      carPhotos.hashCode ^
      interiorPhotos.hashCode ^
      defectPhotos.hashCode ^
      dataPhotos.hashCode;

  @override
  String toString() {
    return 'CarManagePhotoModel{'
        ' carPhotos: $carPhotos,'
        ' interiorPhotos: $interiorPhotos,'
        ' defectPhotos: $defectPhotos,'
        ' dataPhotos: $dataPhotos,'
        '}';
  }

  CarManagePhotoModel copyWith({
    List<String>? carPhotos,
    List<String>? interiorPhotos,
    List<String>? defectPhotos,
    List<String>? dataPhotos,
  }) {
    return CarManagePhotoModel(
      carPhotos: carPhotos ?? this.carPhotos,
      interiorPhotos: interiorPhotos ?? this.interiorPhotos,
      defectPhotos: defectPhotos ?? this.defectPhotos,
      dataPhotos: dataPhotos ?? this.dataPhotos,
    );
  }

//</editor-fold>
}
