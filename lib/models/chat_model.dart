class ChatModel{
  final String role;
  final List<ChatPartModel> part;

  ChatModel({required this.role, required this.part});
}

class ChatPartModel{
  final String text;

  ChatPartModel({required this.text});
}