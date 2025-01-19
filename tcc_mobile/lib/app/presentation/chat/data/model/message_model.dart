class Message {
  const Message({
    required this.text,
    required this.isUser,
    this.conversationId,
  });

  final String text;
  final bool isUser;
  final String? conversationId;
}