// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      chat: json['chat'] as String?,
      collectionId: json['collectionId'] as String?,
      collectionName: json['collectionName'] as String?,
      content: json['content'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      id: json['id'] as String?,
      receiver: json['receiver'] as String?,
      sender: json['sender'] as String?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'chat': instance.chat,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'content': instance.content,
      'created': instance.created?.toIso8601String(),
      'id': instance.id,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'updated': instance.updated?.toIso8601String(),
    };
