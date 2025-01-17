import 'package:flutter/material.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/pages/chat_page.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/domain/adapter/component_content_adapter.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/components_page_factory.dart';

class ChatPageFactory extends ComponentsPageFactory {
  ChatPageFactory();

  @override
  void addAdapter(ComponentContentAdapter adapter) {
    this.adapter = adapter;
  }

  @override
  Widget create([params]) {
    return ChatPage(
      adapter: adapter,
    );
  }
}
