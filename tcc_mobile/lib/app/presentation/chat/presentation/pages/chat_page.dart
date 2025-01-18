import 'package:flutter/material.dart';
import 'package:tcc_mobile/app/presentation/chat/presentation/bloc/chat_cubit.dart';
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
  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final backgroundColor = SomaContext.primaryBackgroundColorOf(context);
    return Scaffold(
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: tokens.spacings.inline.sm,
                horizontal: tokens.spacings.inline.xs,
              ),
              child: Column(
                children: [
                  const BoxChatWidget(
                    text:
                        'Qual foi o último exame que o paciente Leandro Antunes realizou?',
                    isUser: true,
                  ),
                  SizedBox(
                    height: tokens.spacings.inline.sm,
                  ),
                  const BoxChatWidget(
                    text:
                        'O último exame que o paciente Leandro Antunes realizou foi a ressonância magnética passada no dia 23/12/24',
                    isUser: false,
                  ),
                ],
              ),
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
                onSubmitted: (question) {
                  // ignore: avoid_print
                  print(question);
                  widget.chatCubit.sendQuestion(question);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
