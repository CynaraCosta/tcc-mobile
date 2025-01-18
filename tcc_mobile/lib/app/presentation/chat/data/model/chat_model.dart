import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/entities/chat_entitiy.dart';

class ChatModel extends Equatable {
  const ChatModel({
    required this.response,
    required this.author,
    required this.time,
  });

  factory ChatModel.fromJson(dynamic json) {
    return ChatModel(
      response: json['response'],
      author: json['author'],
      time: json['time'],
    );
  }

  ChatEntitiy toEntity() {
    return ChatEntitiy(
      response: response,
      author: author,
      time: time,
    );
  }

  final String response;
  final String author;
  final String time;

  @override
  List<Object?> get props => [
        response,
        author,
        time,
      ];
}
