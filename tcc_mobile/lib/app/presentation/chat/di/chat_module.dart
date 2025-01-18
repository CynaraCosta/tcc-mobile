import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/app/presentation/chat/data/repository/chat_repository_impl.dart';
import 'package:tcc_mobile/app/presentation/chat/domain/repository/chat_repository.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/bloc/chat_cubit.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/pages/chat_page_factory.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/components_page_factory.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';
import 'package:tcc_mobile/commons/router/router.dart';

@module
abstract class PageModule {
  @Named('ChatPageFactory')
  ComponentsPageFactory providesChat(
    ComponentContentAdapterBuilder adapterBuilder,
    AppNavigator appNavigator,
    ChatCubit chatCubit,
  ) {
    return ChatPageFactory()
      ..addNavigator(appNavigator)
      ..addChatCubit(chatCubit)
      ..addAdapter(
        adapterBuilder.build(),
      );
  }

  ChatRepository providesChatRepository(ApiDataSourceDelegate delegate) =>
      ChatRepositoryImpl(delegate: delegate);

  ChatCubit providesChatCubit(ChatRepository repository) =>
      ChatCubit(repository: repository);
}
