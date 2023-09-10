// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      address: json['address'] as String?,
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      balcony: json['balcony'] as String?,
      bathRoom: json['bathRoom'] as String?,
      bedRoom: json['bedRoom'] as String?,
      collectionId: json['collectionId'] as String?,
      collectionName: json['collectionName'] as String?,
      contactNumber: json['contactNumber'] as int?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      createdBy: json['createdBy'] as String?,
      expand: json['expand'] == null
          ? null
          : Expand.fromJson(json['expand'] as Map<String, dynamic>),
      floorNum: json['floorNum'] as String?,
      furnitureStatus: json['furnitureStatus'] as String?,
      id: json['id'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isCoveredParking: json['isCoveredParking'] as bool?,
      isPetFriendly: json['isPetFriendly'] as bool?,
      isResidential: json['isResidential'] as bool?,
      isSelling: json['isSelling'] as bool?,
      isUnderConstruction: json['isUnderConstruction'] as bool?,
      propertyCost: json['propertyCost'] as int?,
      propertyDetail: json['propertyDetail'] as String?,
      propertyName: json['propertyName'] as String?,
      propertyNum: json['propertyNum'] as String?,
      propertySize: json['propertySize'] as int?,
      propertyType: json['propertyType'] as String?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      userStatus: json['userStatus'] as String?,
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'address': instance.address,
      'amenities': instance.amenities,
      'balcony': instance.balcony,
      'bathRoom': instance.bathRoom,
      'bedRoom': instance.bedRoom,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'contactNumber': instance.contactNumber,
      'created': instance.created?.toIso8601String(),
      'createdBy': instance.createdBy,
      'expand': instance.expand,
      'floorNum': instance.floorNum,
      'furnitureStatus': instance.furnitureStatus,
      'id': instance.id,
      'images': instance.images,
      'isCoveredParking': instance.isCoveredParking,
      'isPetFriendly': instance.isPetFriendly,
      'isResidential': instance.isResidential,
      'isSelling': instance.isSelling,
      'isUnderConstruction': instance.isUnderConstruction,
      'propertyCost': instance.propertyCost,
      'propertyDetail': instance.propertyDetail,
      'propertyName': instance.propertyName,
      'propertyNum': instance.propertyNum,
      'propertySize': instance.propertySize,
      'propertyType': instance.propertyType,
      'updated': instance.updated?.toIso8601String(),
      'userStatus': instance.userStatus,
    };

Expand _$ExpandFromJson(Map<String, dynamic> json) => Expand(
      createdBy: json['createdBy'] == null
          ? null
          : User.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpandToJson(Expand instance) => <String, dynamic>{
      'createdBy': instance.createdBy,
    };
