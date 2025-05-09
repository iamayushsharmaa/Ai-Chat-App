import 'package:bloc/bloc.dart';
import 'package:geminiai/models/chat_model.dart';

import 'event.dart';
import 'state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<ChatEvent>((event, emit){

    });
  }
  List<ChatModel> messages = [];

}
