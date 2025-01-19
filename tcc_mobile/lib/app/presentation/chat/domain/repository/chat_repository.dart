import 'package:tcc_mobile/app/presentation/chat/domain/entities/chat_entitiy.dart';

abstract class ChatRepository {
  Future<ChatEntitiy> getChatResponse(String question, String? conversationId);
}
