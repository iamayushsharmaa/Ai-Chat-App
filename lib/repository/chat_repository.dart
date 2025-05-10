import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:geminiai/models/chat_model.dart';

class ChatRepository {
  static Future<String> chatTextGenerationRepo(
    List<ChatModel> previousMessage,
  ) async {
    Dio dio = Dio();

    try {
      final response = await dio.post(
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
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response
            .data['candidates']
            .first['content']['parts']
            .first['text'];
      }
      return '';
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
