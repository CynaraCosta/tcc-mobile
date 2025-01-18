import 'package:equatable/equatable.dart';

class ChatEntitiy extends Equatable {
  const ChatEntitiy({
    required this.message,
    required this.sender,
    required this.timestamp,
  });

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
