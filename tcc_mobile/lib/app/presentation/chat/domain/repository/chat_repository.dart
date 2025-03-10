import 'package:tcc_mobile/app/presentation/chat/domain/entities/chat_entitiy.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<ChatEntitiy> getChatResponse(String question, String? conversationId);
  Future<MessagesEntity> getMessagesByConversationId(String conversationId);
}
