import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class ChatDataProvider {
  final _baseUrl = 'http://127.0.0.1:8000//api/v1';
  final http.Client httpClient = http.Client();

  ChatDataProvider();

  Future<Chat> createChat(Chat chat) async {
    final response = await httpClient.post(
      Uri.http(_baseUrl, '/chats'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'owner1': chat.owner1,
        'owner2': chat.owner2,
      }),
    );

    if (response.statusCode == 201) {
      return Chat.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Chat.');
    }
  }

  Future<List<Chat>> getChats() async {
    final response = await httpClient.get('$_baseUrl/chats');

    if (response.statusCode == 200) {
      final chats = jsonDecode(response.body) as List;
      return chats.map((chat) => Chat.fromJson(chat)).toList();
    } else {
      throw Exception('Failed to load Chats');
    }
  }

  Future<void> deleteChat(Chat chat) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/chat/${chat.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete Chat.');
    }
  }
}
