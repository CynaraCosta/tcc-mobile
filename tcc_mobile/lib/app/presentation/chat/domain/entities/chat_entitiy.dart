import 'package:equatable/equatable.dart';

class ChatEntitiy extends Equatable {
  const ChatEntitiy({
    required this.message,
    required this.sender,
    required this.timestamp,
    this.conversationId,
  });

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
