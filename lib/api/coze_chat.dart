import 'dart:convert';
import 'package:http/http.dart' as http;

class CozeBotChat {
  final String apiKey = "pat_YDYPWXqbfM25xhna7gbeviyVrWNX0Q0hljuiYj8k1sFEeJb88TuFWQCHLNSgoARO";
  final String chatUrl = "https://api.coze.com/v3/chat/message/list";

  Future<void> getChatMessages(String chatId, String conversationId) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    try {
      final response =
          await http.post(Uri.parse('$chatUrl?chat_id=$chatId&conversation_id=$conversationId'), headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('chat sent: $responseData');
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
