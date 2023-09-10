import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "collectionId")
  final String? collectionId;
  @JsonKey(name: "collectionName")
  final String? collectionName;
  @JsonKey(name: "created")
  final DateTime? created;
  @JsonKey(name: "emailVisibility")
  final bool? emailVisibility;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "updated")
  final DateTime? updated;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "verified")
  final bool? verified;

  User({
    this.avatar,
    this.collectionId,
    this.collectionName,
    this.created,
    this.emailVisibility,
    this.id,
    this.name,
    this.updated,
    this.username,
    this.verified,
  });

  User copyWith({
    String? avatar,
    String? collectionId,
    String? collectionName,
    DateTime? created,
    bool? emailVisibility,
    String? id,
    String? name,
    DateTime? updated,
    String? username,
    bool? verified,
  }) =>
      User(
        avatar: avatar ?? this.avatar,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        emailVisibility: emailVisibility ?? this.emailVisibility,
        id: id ?? this.id,
        name: name ?? this.name,
        updated: updated ?? this.updated,
        username: username ?? this.username,
        verified: verified ?? this.verified,
      );

  factory User.fromRecord(RecordModel record) => User.fromJson(record.toJson());

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
