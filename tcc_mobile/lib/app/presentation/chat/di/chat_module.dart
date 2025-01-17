import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/pages/chat_page_factory.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/components_page_factory.dart';

@module
abstract class PageModule {
  @Named('ChatPageFactory')
  ComponentsPageFactory providesChat(
    ComponentContentAdapterBuilder adapterBuilder,
  ) {
    return ChatPageFactory()
      ..addAdapter(
        adapterBuilder.build(),
      );
  }
}
