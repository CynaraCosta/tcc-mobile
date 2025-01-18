import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/bloc/chat_cubit.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/bloc/chat_state.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/widgets/bottom_chat_widget.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/widgets/box_chat_widget.dart';
import 'package:tcc_mobile/app/presentation/chat/utils/chat_strings.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';
import 'package:tcc_mobile/soma/soma.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    required this.appNavigator,
    required this.adapter,
    required this.chatCubit,
    super.key,
  });

  final AppNavigator appNavigator;
  final ComponentContentAdapter adapter;
  final ChatCubit chatCubit;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> _messages = [];

  void _sendMessage(String question) {
    setState(() {
      _messages.add(Message(text: question, isUser: true));
    });

    widget.chatCubit.sendQuestion(question);
  }

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final backgroundColor = SomaContext.primaryBackgroundColorOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => widget.chatCubit),
      ],
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: tokens.spacings.inline.xs),
            child: SomaIcon(
              type: SomaIconType.arrowLeft,
              size: SomaIconSize.md,
              onTap: widget.appNavigator.pop,
            ),
          ),
          centerTitle: true,
          title: const SomaText(
            text: ChatStrings.appBarChatTitle,
            type: SomaTypographyType.title2,
          ),
        ),
        body: Stack(
          children: [
            BlocListener<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccessState) {
                  setState(() {
                    _messages
                        .add(Message(text: state.entity.response, isUser: false));
                  });
                } else if (state is ChatErrorState) {
                  setState(() {
                    _messages.add(
                      const Message(
                        text: 'Erro ao processar a mensagem.',
                        isUser: false,
                      ),
                    );
                  });
                }
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: false,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: tokens.spacings.inline.xxs,
                            horizontal: tokens.spacings.inline.xs,
                          ),
                          child: BoxChatWidget(
                            text: message.text,
                            isUser: message.isUser,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: tokens.spacings.inline.xs,
                  vertical: tokens.spacings.inline.md,
                ),
                child: BottomChatWidget(
                  onSubmitted: _sendMessage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  const Message({
    required this.text,
    required this.isUser,
  });

  final String text;
  final bool isUser;
}
