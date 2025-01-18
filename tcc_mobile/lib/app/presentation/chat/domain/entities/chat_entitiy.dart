import 'package:equatable/equatable.dart';

class ChatEntitiy extends Equatable {
  const ChatEntitiy({
    required this.response,
    required this.author,
    required this.time,
  });

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
