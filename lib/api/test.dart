import 'dart:convert';
import 'package:http/http.dart' as http;

class CozeChatService {
  final String apiKey =
      "pat_YDYPWXqbfM25xhna7gbeviyVrWNX0Q0hljuiYj8k1sFEeJb88TuFWQCHLNSgoARO"; // Замените на ваш ключ доступа
  final String chatUrl = "https://api.coze.com/v1/conversation/message/create";
  String conversationId;
  CozeChatService(this.conversationId);

  // Создание нового сообщения
  Future<String> createMessage(String content) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      'role': 'user',
      'content': content,
      'content_type': 'text',
    });

    try {
      final response = await http.post(
        Uri.parse('$chatUrl?conversation_id=$conversationId'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String botReply = responseData['data']['content'] ?? 'Нет ответа от бота'; 
        return botReply;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return 'Ошибка: ${response.statusCode}';
      }
    } catch (e) {
      print('Exception: $e');
      return 'Ошибка сети';
    }
  }
}
