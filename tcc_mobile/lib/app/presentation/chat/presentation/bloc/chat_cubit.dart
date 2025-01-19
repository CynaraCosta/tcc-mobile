import 'package:flutter_bloc/flutter_bloc.dart';
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
}
