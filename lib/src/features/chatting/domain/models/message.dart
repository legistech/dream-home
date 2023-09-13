import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: "chat")
  final String? chat;
  @JsonKey(name: "collectionId")
  final String? collectionId;
  @JsonKey(name: "collectionName")
  final String? collectionName;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "created")
  final DateTime? created;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "receiver")
  final String? receiver;
  @JsonKey(name: "sender")
  final String? sender;
  @JsonKey(name: "updated")
  final DateTime? updated;

  Message({
    this.chat,
    this.collectionId,
    this.collectionName,
    this.content,
    this.created,
    this.id,
    this.receiver,
    this.sender,
    this.updated,
  });

  Message copyWith({
    String? chat,
    String? collectionId,
    String? collectionName,
    String? content,
    DateTime? created,
    String? id,
    String? receiver,
    String? sender,
    DateTime? updated,
  }) =>
      Message(
        chat: chat ?? this.chat,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        content: content ?? this.content,
        created: created ?? this.created,
        id: id ?? this.id,
        receiver: receiver ?? this.receiver,
        sender: sender ?? this.sender,
        updated: updated ?? this.updated,
      );

  factory Message.fromRecord(RecordModel record) =>
      Message.fromJson(record.toJson());

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
