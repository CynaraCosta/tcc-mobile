import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/entities/chat_entitiy.dart';

class ChatModel extends Equatable {
  const ChatModel({
    required this.message,
    required this.sender,
    required this.timestamp,
  });

  factory ChatModel.fromJson(dynamic json) {
    return ChatModel(
      message: json['message'],
      sender: json['sender'],
      timestamp: json['timestamp'],
    );
  }

  ChatEntitiy toEntity() {
    return ChatEntitiy(
      message: message,
      sender: sender,
      timestamp: timestamp,
    );
  }

  final String message;
  final String sender;
  final String timestamp;

  @override
  List<Object?> get props => [
        message,
        sender,
        timestamp,
      ];
}
