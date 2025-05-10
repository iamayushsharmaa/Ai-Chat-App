import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geminiai/models/chat_model.dart';
import 'package:geminiai/repository/chat_repository.dart';

import 'event.dart';
import 'state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }

  List<ChatModel> messages = [];

  FutureOr<void> chatGenerateNewTextMessageEvent(
    ChatGenerateNewTextMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    messages.add(
      ChatModel(role: 'user', parts: [ChatPartModel(text: event.inputMessage)]),
    );
    emit(ChatSuccessState(messages: messages));
    String generatedText = await ChatRepository.chatTextGenerationRepo(
      messages,
    );
    if (generatedText.length > 0) {
      messages.add(
        ChatModel(role: 'model', parts: [ChatPartModel(text: generatedText)]),
      );
      emit(ChatSuccessState(messages: messages));
    }
  }
}
