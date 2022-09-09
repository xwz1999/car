// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsocketMessageModel _$WebsocketMessageModelFromJson(
        Map<String, dynamic> json) =>
    WebsocketMessageModel(
      title: json['title'] as String,
      content: json['content'] as String,
      extras: json['extras'] as String?,
    );

Map<String, dynamic> _$WebsocketMessageModelToJson(
        WebsocketMessageModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'extras': instance.extras,
    };
