import 'package:flutter/material.dart';
import 'package:get_course/api/coze_create_message.dart';
import 'package:get_course/api/test.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final CozeChatService _chatService = CozeChatService('7423783652548411397');
  final CozeBotCreateMessage createMessage = CozeBotCreateMessage();

  final List<String> _messages = [];

  void _sendMessage() {
    String content = _controller.text.trim();
    if (content.isNotEmpty) {
      setState(() {
        _messages.add('Вы: $content');
      });
      _chatService.createMessage(content).then((_) async {
        String response = await createMessage.getMessage('7423783652548411397');
        setState(() {
          _messages.add('Бот: $response');
        });

        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat with Bot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_messages[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Введите сообщение'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
