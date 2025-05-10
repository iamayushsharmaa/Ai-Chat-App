import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geminiai/models/chat_model.dart';

import 'event.dart';
import 'state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }

  List<ChatModel> messages = [];

  FutureOr<void> chatGenerateNewTextMessageEvent(
    ChatGenerateNewTextMessageEvent event,
    Emitter<ChatState> emit,
  ) {
    messages.add(
      ChatModel(role: 'user', parts: [ChatPartModel(text: event.inputMessage)]),
    );
  }
}
