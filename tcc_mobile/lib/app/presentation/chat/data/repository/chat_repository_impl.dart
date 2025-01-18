import 'package:tcc_mobile/app/presentation/chat/data/model/chat_model.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/entities/chat_entitiy.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/repository/chat_repository.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';
import 'package:tcc_mobile/commons/network/data/request_params.dart';
import 'package:tcc_mobile/commons/network/data/request_type.dart';

class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl({
    required this.delegate,
  });

  final ApiDataSourceDelegate delegate;

  @override
  Future<ChatEntitiy> getChatResponse(String question) async {
    final timestamp = DateTime.now().toIso8601String();
    return await delegate
        .fetchAsFuture<ChatModel>(
          params: RequestParams(
            endpoint: '/v1/send-question',
            requestType: RequestType.post,
            body: {
              'message': question,
              'sender': 'doctor',
              'timestamp': timestamp,
            },
          ),
          mapper: ChatModel.fromJson,
        )
        .then((value) => value.toEntity());
  }
}
