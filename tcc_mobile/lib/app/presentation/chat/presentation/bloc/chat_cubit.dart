import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/entities/message_entity.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/repository/chat_repository.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/bloc/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({
    required this.repository,
  }) : super(const ChatInitialState());

  final ChatRepository repository;

  Future<void> sendQuestion(String question, String? conversationId) async {
    emit(const ChatLoadingState());

    try {
      final result = await repository.getChatResponse(question, conversationId);
      emit(ChatSuccessState(entity: result));
    } catch (_) {
      emit(const ChatErrorState());
    }
  }

  Future<MessagesEntity> getMessagesByConversationId(
    String conversationId,
  ) async {
    try {
      final result =
          await repository.getMessagesByConversationId(conversationId);
      return result;
    } catch (_) {
      return const MessagesEntity(messages: []);
    }
  }
}
