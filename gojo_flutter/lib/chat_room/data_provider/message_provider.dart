import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class MessageDataProvider {
  final _baseUrl = 'http://127.0.0.1:8000//api/v1';
  final http.Client httpClient = http.Client();

  MessageDataProvider();

  Future<Message> createMessage(String chat_id, Message message) async {
    final response = await httpClient.post(
      Uri.http(_baseUrl, '/chat/$chat_id/messages'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'text': message.text,
        'user': message.owner,
        'chat': message.chat,
        'time': message.time
      }),
    );

    if (response.statusCode == 201) {
      return Message.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Message.');
    }
  }

  Future<List<Message>> getMessages(String chatId) async {
    final response =
        await httpClient.get(Uri.parse('$_baseUrl/chat/$chatId/messages'));

    if (response.statusCode == 200) {
      final messages = jsonDecode(response.body) as List;
      return messages.map((message) => Message.fromJson(message)).toList();
    } else {
      throw Exception('Failed to load Messages');
    }
  }

  Future<void> deleteMessage(String chatId, Message message) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/chat/$chatId/message/${message}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete Message.');
    }
  }
}
