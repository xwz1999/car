import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'websocket_message_model.g.dart';

@JsonSerializable()
class WebsocketMessageModel extends Equatable {
  final String title;
  final String content;
  final String? extras;

  factory WebsocketMessageModel.fromJson(Map<String, dynamic> json) =>
      _$WebsocketMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$WebsocketMessageModelToJson(this);

  @override
  List<Object?> get props => [
        title,
        content,
        extras,
      ];

  const WebsocketMessageModel({
    required this.title,
    required this.content,
    this.extras,
  });
}
