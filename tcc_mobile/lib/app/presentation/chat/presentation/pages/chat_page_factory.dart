import 'package:flutter/material.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/bloc/chat_cubit.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/pages/chat_page.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/domain/adapter/component_content_adapter.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/components_page_factory.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';

class ChatPageFactory extends ComponentsPageFactory {
  ChatPageFactory();

  late AppNavigator navigator;
  late ChatCubit chatCubit;

  void addNavigator(AppNavigator navigator) {
    this.navigator = navigator;
  }

  void addChatCubit(ChatCubit chatCubit) {
    this.chatCubit = chatCubit;
  }

  @override
  void addAdapter(ComponentContentAdapter adapter) {
    this.adapter = adapter;
  }

  @override
  Widget create([params]) {
    return ChatPage(
      adapter: adapter,
      appNavigator: navigator,
      chatCubit: chatCubit,
      conversationId: params[0]['conversationId'],
    );
  }
}
