import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:geminiai/models/chat_model.dart';

class SpaceRepo {
  static chatTextGenerationRepo(List<ChatModel> previousMessage) async {
    Dio dio = Dio();

    try {
      final response = dio.post(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyDqP2szA8RnC4-Ae1iZd_PPTQ8eSbu4c-c',
        data: {
          "content": previousMessage.map((e) => e.toJson()).toList(),
          "generationConfig": {
            "temperature": 1,
            "topP": 1,
            "responseMimeType": "text/plain",
          },
        },
      );
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
