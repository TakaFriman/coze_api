import 'dart:convert';
import 'package:http/http.dart' as http;

class CozeBotServiceListBots {
  final String apiKey = "pat_YDYPWXqbfM25xhna7gbeviyVrWNX0Q0hljuiYj8k1sFEeJb88TuFWQCHLNSgoARO"; // Ваш API ключ
  final String spaceId = "7421510447092072453";
  final String publishedBotsUrl = "https://api.coze.com/v1/space/published_bots_list";

  Future<void> getPublishedBotsList() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final queryParameters = {
      'space_id': spaceId,
    };

    final uri = Uri.parse(publishedBotsUrl).replace(queryParameters: queryParameters);

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Published Bots List: $responseData');
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}



class CozeServiceChat {
  final String apiKey = "pat_YDYPWXqbfM25xhna7gbeviyVrWNX0Q0hljuiYj8k1sFEeJb88TuFWQCHLNSgoARO"; 
  final String chatUrl = "https://api.coze.com/v3/chat";
  final String postMessagesUrl = 'https://api.coze.com/v3/chat/message';

  Future<void> postMessages(String conversationId, String botId, String content) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      'bot_id': botId,
      'user_id': '1728485137',
      'stream': false,
      'auto_save_history': true,
      'additional_messages': [
        {'role': 'user', 'content': content, 'content_type': 'text'}
      ]
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
}

