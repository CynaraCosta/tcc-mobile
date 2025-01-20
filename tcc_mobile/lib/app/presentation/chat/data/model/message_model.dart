import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/entities/message_entity.dart';

class MessagesModel extends Equatable {
  const MessagesModel({
    required this.messages,
  });

  factory MessagesModel.fromJson(dynamic json) {
    final List<dynamic> list = json['messages'];
    final List<MessageEntity> messagesEntity = list
        .map((dynamic message) => MessageModel.fromJson(message).toEntity())
        .toList();
    return MessagesModel(
      messages: messagesEntity,
    );
  }

  MessagesEntity toEntity() {
    return MessagesEntity(messages: messages);
  }

  final List<MessageEntity> messages;

  @override
  List<Object?> get props => [messages];
}

class MessageModel extends Equatable {
  const MessageModel({
    required this.text,
    required this.isUser,
    required this.conversationId,
  });

  factory MessageModel.fromJson(dynamic json) {
    return MessageModel(
      text: json['text'],
      isUser: json['isUser'],
      conversationId: json['conversationId'],
    );
  }

  MessageEntity toEntity() => MessageEntity(
        text: text,
        isUser: isUser,
        conversationId: conversationId,
      );

  final String text;
  final bool isUser;
  final String? conversationId;

  @override
  List<Object?> get props => [
        text,
        isUser,
        conversationId,
      ];
}
