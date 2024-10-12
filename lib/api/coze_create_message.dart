import 'dart:convert';
import 'package:http/http.dart' as http;

class CozeBotCreateMessage {
  final String apiKey = "pat_YDYPWXqbfM25xhna7gbeviyVrWNX0Q0hljuiYj8k1sFEeJb88TuFWQCHLNSgoARO";
  final String chatUrl = "https://api.coze.com/v1/conversation/message/create";
  final String chatUrlList = 'https://api.coze.com/v1/conversation/message/list';
  final String chatUrlMessage = 'https://api.coze.com/v1/conversation/message/retrieve';

  Future<void> createMessage(String conversationId) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      'role': 'user',
      'content': 'what a nice day',
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
        print('Message sent: $responseData');
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<void> listMessage(String conversationId) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      'role': 'user',
      'content': 'what a nice day',
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
        print('list sent: $responseData');
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<String> getMessage(String conversationId) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    try {
      final response = await http.get(
        Uri.parse('$chatUrlMessage?conversation_id=$conversationId&message_id=7424125942697803781'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('get mess sent: ${responseData['data']['content']}');
        String answer = responseData['data']['content'];
        return answer;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return 'ошибка';
      }
    } catch (e) {
      print('Exception: $e');
      return "ошибка сети";
    }
  }
}
