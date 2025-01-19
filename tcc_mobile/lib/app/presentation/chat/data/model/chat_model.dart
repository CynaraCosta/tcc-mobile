import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/entities/chat_entitiy.dart';

class ChatModel extends Equatable {
  const ChatModel({
    required this.message,
    required this.sender,
    required this.timestamp,
    this.conversationId,
  });

  factory ChatModel.fromJson(dynamic json) {
    return ChatModel(
      message: json['message'],
      sender: json['sender'],
      timestamp: json['timestamp'],
      conversationId: json['_id'],
    );
  }

  ChatEntitiy toEntity() {
    return ChatEntitiy(
      message: message,
      sender: sender,
      timestamp: timestamp,
      conversationId: conversationId,
    );
  }

  final String message;
  final String sender;
  final String timestamp;
  final String? conversationId;

  @override
  List<Object?> get props => [
        message,
        sender,
        timestamp,
        conversationId,
      ];
}
