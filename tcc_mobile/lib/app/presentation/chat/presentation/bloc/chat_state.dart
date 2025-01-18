import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/entities/chat_entitiy.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatInitialState extends ChatState {
  const ChatInitialState() : super();
}

class ChatLoadingState extends ChatState {
  const ChatLoadingState() : super();
}

class ChatErrorState extends ChatState {
  const ChatErrorState() : super();
}

class ChatSuccessState extends ChatState {
  const ChatSuccessState({
    required this.entity,
  });
  final ChatEntitiy entity;

  @override
  List<Object?> get props => [entity];
}