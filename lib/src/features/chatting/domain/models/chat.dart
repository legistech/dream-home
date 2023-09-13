import 'package:dream_home/src/common/domain/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  @JsonKey(name: "collectionId")
  final String? collectionId;
  @JsonKey(name: "collectionName")
  final String? collectionName;
  @JsonKey(name: "created")
  final DateTime? created;
  @JsonKey(name: "expand")
  final Expand? expand;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "updated")
  final DateTime? updated;
  @JsonKey(name: "users")
  final List<String>? users;

  Chat({
    this.collectionId,
    this.collectionName,
    this.created,
    this.expand,
    this.id,
    this.updated,
    this.users,
  });

  Chat copyWith({
    String? collectionId,
    String? collectionName,
    DateTime? created,
    Expand? expand,
    String? id,
    DateTime? updated,
    List<String>? users,
  }) =>
      Chat(
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        expand: expand ?? this.expand,
        id: id ?? this.id,
        updated: updated ?? this.updated,
        users: users ?? this.users,
      );

  factory Chat.fromRecord(RecordModel record) => Chat.fromJson(record.toJson());

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

@JsonSerializable()
class Expand {
  @JsonKey(name: "users")
  final List<User>? users;

  Expand({
    this.users,
  });

  Expand copyWith({
    List<User>? users,
  }) =>
      Expand(
        users: users ?? this.users,
      );

  factory Expand.fromRecord(RecordModel record) =>
      Expand.fromJson(record.toJson());

  factory Expand.fromJson(Map<String, dynamic> json) => _$ExpandFromJson(json);

  Map<String, dynamic> toJson() => _$ExpandToJson(this);
}
