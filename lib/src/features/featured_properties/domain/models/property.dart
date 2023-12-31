import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../common/domain/models/user.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "amenities")
  final List<String>? amenities;
  @JsonKey(name: "balcony")
  final String? balcony;
  @JsonKey(name: "bathRoom")
  final String? bathRoom;
  @JsonKey(name: "bedRoom")
  final String? bedRoom;
  @JsonKey(name: "collectionId")
  final String? collectionId;
  @JsonKey(name: "collectionName")
  final String? collectionName;
  @JsonKey(name: "contactNumber")
  final int? contactNumber;
  @JsonKey(name: "created")
  final DateTime? created;
  @JsonKey(name: "createdBy")
  final String? createdBy;
  @JsonKey(name: "expand")
  final Expand? expand;
  @JsonKey(name: "floorNum")
  final String? floorNum;
  @JsonKey(name: "furnitureStatus")
  final String? furnitureStatus;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "isCoveredParking")
  final bool? isCoveredParking;
  @JsonKey(name: "isPetFriendly")
  final bool? isPetFriendly;
  @JsonKey(name: "isResidential")
  final bool? isResidential;
  @JsonKey(name: "isSelling")
  final bool? isSelling;
  @JsonKey(name: "isUnderConstruction")
  final bool? isUnderConstruction;
  @JsonKey(name: "propertyCost")
  final int? propertyCost;
  @JsonKey(name: "propertyDetail")
  final String? propertyDetail;
  @JsonKey(name: "propertyName")
  final String? propertyName;
  @JsonKey(name: "propertyNum")
  final String? propertyNum;
  @JsonKey(name: "propertySize")
  final int? propertySize;
  @JsonKey(name: "propertyType")
  final String? propertyType;
  @JsonKey(name: "updated")
  final DateTime? updated;
  @JsonKey(name: "userStatus")
  final String? userStatus;

  Property({
    this.address,
    this.amenities,
    this.balcony,
    this.bathRoom,
    this.bedRoom,
    this.collectionId,
    this.collectionName,
    this.contactNumber,
    this.created,
    this.createdBy,
    this.expand,
    this.floorNum,
    this.furnitureStatus,
    this.id,
    this.images,
    this.isCoveredParking,
    this.isPetFriendly,
    this.isResidential,
    this.isSelling,
    this.isUnderConstruction,
    this.propertyCost,
    this.propertyDetail,
    this.propertyName,
    this.propertyNum,
    this.propertySize,
    this.propertyType,
    this.updated,
    this.userStatus,
  });

  Property copyWith({
    String? address,
    List<String>? amenities,
    String? balcony,
    String? bathRoom,
    String? bedRoom,
    String? collectionId,
    String? collectionName,
    int? contactNumber,
    DateTime? created,
    String? createdBy,
    Expand? expand,
    String? floorNum,
    String? furnitureStatus,
    String? id,
    List<String>? images,
    bool? isCoveredParking,
    bool? isPetFriendly,
    bool? isResidential,
    bool? isSelling,
    bool? isUnderConstruction,
    int? propertyCost,
    String? propertyDetail,
    String? propertyName,
    String? propertyNum,
    int? propertySize,
    String? propertyType,
    DateTime? updated,
    String? userStatus,
  }) =>
      Property(
        address: address ?? this.address,
        amenities: amenities ?? this.amenities,
        balcony: balcony ?? this.balcony,
        bathRoom: bathRoom ?? this.bathRoom,
        bedRoom: bedRoom ?? this.bedRoom,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        contactNumber: contactNumber ?? this.contactNumber,
        created: created ?? this.created,
        createdBy: createdBy ?? this.createdBy,
        expand: expand ?? this.expand,
        floorNum: floorNum ?? this.floorNum,
        furnitureStatus: furnitureStatus ?? this.furnitureStatus,
        id: id ?? this.id,
        images: images ?? this.images,
        isCoveredParking: isCoveredParking ?? this.isCoveredParking,
        isPetFriendly: isPetFriendly ?? this.isPetFriendly,
        isResidential: isResidential ?? this.isResidential,
        isSelling: isSelling ?? this.isSelling,
        isUnderConstruction: isUnderConstruction ?? this.isUnderConstruction,
        propertyCost: propertyCost ?? this.propertyCost,
        propertyDetail: propertyDetail ?? this.propertyDetail,
        propertyName: propertyName ?? this.propertyName,
        propertyNum: propertyNum ?? this.propertyNum,
        propertySize: propertySize ?? this.propertySize,
        propertyType: propertyType ?? this.propertyType,
        updated: updated ?? this.updated,
        userStatus: userStatus ?? this.userStatus,
      );

  factory Property.fromRecord(RecordModel record) =>
      Property.fromJson(record.toJson());

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

@JsonSerializable()
class Expand {
  @JsonKey(name: "createdBy")
  final User? createdBy;

  Expand({
    this.createdBy,
  });

  Expand copyWith({
    User? createdBy,
  }) =>
      Expand(
        createdBy: createdBy ?? this.createdBy,
      );

  factory Expand.fromRecord(RecordModel record) =>
      Expand.fromJson(record.toJson());

  factory Expand.fromJson(Map<String, dynamic> json) => _$ExpandFromJson(json);

  Map<String, dynamic> toJson() => _$ExpandToJson(this);
}
