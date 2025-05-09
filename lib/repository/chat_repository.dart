import 'package:geminiai/models/chat_model.dart';
import 'package:dio/dio.dart';
class SpaceRepo{
  static chatTextGenerationRepo(List<ChatModel> previousMessage) async{
    Dio dio = Dio();
    
    final response = dio.post('https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyDqP2szA8RnC4-Ae1iZd_PPTQ8eSbu4c-c',

    );
  }
}