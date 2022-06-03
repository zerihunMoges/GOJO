import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../../auth/model/model.dart';

class MessageDataProvider {
  final _baseUrl = 'http://127.0.0.1:8000/api/v1';
  final http.Client httpClient = http.Client();
  final String token;

  MessageDataProvider(this.token);

  Future<Message> createMessage(String chat_id, Message message) async {
    print("got in");
    print("");
    print("message is ${message.owner}");
    print("message text is ${message.text}");
    print("chat id is ${chat_id}");
    print("");
    print("chat is $chat_id");
    final response = await httpClient.post(
      Uri.parse('$_baseUrl/chat/$chat_id/messages'),
      headers: {'Authorization': 'Bearer ${token}'},
      body: jsonEncode(<String, dynamic>{
        'text': message.text.toString(),
        'user': message.owner,
        'chat': chat_id.toString()
      }),
    );

    // final response = await httpClient.post(
    //   Uri.parse('$_baseUrl/chat/$chat_id/messages'),
    //   headers: {'Authorization': 'Bearer ${token}'},
    //   body: jsonEncode(
    //       <String, dynamic>{'text': "bitch", 'user': "1", 'chat': "1"}),
    // );
    print("next");

    print("the status code is ${response.statusCode}");

    if (response.statusCode == 201) {
      return Message.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Message.');
    }
  }

  Future<List<Message>> getMessages(String chatId) async {
    print('the chat id is $chatId');
    print("token is $token");
    final response = await httpClient.get(
      Uri.parse('$_baseUrl/chat/$chatId/messages'),
      headers: {'Authorization': 'Bearer ${token}'},
    );

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
      headers: {'Authorization': 'Bearer ${token}'},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete Message.');
    }
  }
}
