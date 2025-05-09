class ChatModel {
  final String role;
  final List<ChatPartModel> parts;

  ChatModel({required this.role, required this.parts});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    role: json['role'],
    parts: List<ChatPartModel>.from(
      json['parts'].map((x) => ChatModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'role': role,
    'parts': List<dynamic>.from(parts.map((x) => x.toJson())),
  };
}

class ChatPartModel {
  final String text;

  ChatPartModel({required this.text});

  factory ChatPartModel.fromJson(Map<String, dynamic> json){
    return ChatPartModel(text: json['text']);
  }

  Map<String, dynamic> toJson() => {
    'text': text,
  };
}
