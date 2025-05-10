import '../models/chat_model.dart';

class ChatState {

}

class ChatInitialState extends ChatState{}

class ChatSuccessState extends ChatState{
  final List<ChatModel> messages;
  ChatSuccessState({required this.messages});
}

class ChatFailureState extends ChatState{
  final String errorMessage;
  ChatFailureState({required this.errorMessage});
}
