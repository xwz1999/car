import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'real_name_model.g.dart';


@JsonSerializable()
class RealNameModel extends Equatable{
  final String certifyId;
  final String url;
    factory RealNameModel.fromJson(Map<String, dynamic> json) =>_$RealNameModelFromJson(json);
    Map<String,dynamic> toJson()=> _$RealNameModelToJson(this);

  const RealNameModel({
    required this.certifyId,
    required this.url,
  });
  @override
  List<Object?> get props => [certifyId,url];
}