// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      avatar: json['avatar'] as String?,
      collectionId: json['collectionId'] as String?,
      collectionName: json['collectionName'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      emailVisibility: json['emailVisibility'] as bool?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      username: json['username'] as String?,
      verified: json['verified'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'created': instance.created?.toIso8601String(),
      'emailVisibility': instance.emailVisibility,
      'id': instance.id,
      'name': instance.name,
      'updated': instance.updated?.toIso8601String(),
      'username': instance.username,
      'verified': instance.verified,
    };
