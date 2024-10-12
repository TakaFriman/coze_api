import 'dart:convert';
import 'package:http/http.dart' as http;

class CozeBotCreateConversation {
  final String apiUrl = "https://api.coze.com/v1/conversation/create";
  final String apiKey = "pat_YDYPWXqbfM25xhna7gbeviyVrWNX0Q0hljuiYj8k1sFEeJb88TuFWQCHLNSgoARO";

  Future<String?> createConversation() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final conversationId = responseData['conversation_id'];
        print('Conversation created: $responseData');
        return conversationId;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}
