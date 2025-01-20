import 'package:equatable/equatable.dart';

class MessagesEntity extends Equatable {
  const MessagesEntity({
    required this.messages,
  });

  final List<MessageEntity> messages;

  @override
  List<Object?> get props => [
        messages,
      ];
}

class MessageEntity extends Equatable {
  const MessageEntity({
    required this.text,
    required this.isUser,
    this.conversationId,
  });

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
