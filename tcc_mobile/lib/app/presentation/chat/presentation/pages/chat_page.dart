import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/soma/soma.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    required this.adapter,
    super.key,
  });

  final ComponentContentAdapter adapter;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: SomaContext.primaryBackgroundColorOf(context),
      child: const Center(
        child: SomaText(
          text: 'ChatPage',
          type: SomaTypographyType.title1,
        ),
      ),
    );
  }
}
