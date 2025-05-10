
import 'package:flutter/cupertino.dart';

@immutable
sealed class ChatEvent {}

class ChatGenerateNewTextMessageEvent extends ChatEvent{
  final String inputMessage;

  ChatGenerateNewTextMessageEvent({required this.inputMessage});
}

