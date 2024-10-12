import 'package:flutter/material.dart';
import 'package:get_course/api/coze_chat.dart';
import 'package:get_course/api/coze_create_conversation.dart';
import 'package:get_course/api/coze_create_message.dart';
import 'package:get_course/chat_page.dart';
import 'package:get_course/home_page.dart';
import 'package:get_course/api/coze_list_bots.dart';

void main() {
  final CozeBotServiceListBots botService = CozeBotServiceListBots();
  final CozeBotCreateMessage createMessage = CozeBotCreateMessage();
  final CozeBotChat cozeBotChat = CozeBotChat();
  final CozeBotCreateConversation cozeBotCreateConversation = CozeBotCreateConversation();
  createMessage.createMessage('7423783652548411397');
  createMessage.listMessage('7423783652548411397');
  createMessage.getMessage('7423783652548411397');
  cozeBotCreateConversation.createConversation();
  botService.getPublishedBotsList();
  cozeBotChat.getChatMessages('7424102931634323461', '7423783652548411397');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),
    );
  }
}
