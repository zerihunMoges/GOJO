import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../../auth/model/model.dart';

class ChatDataProvider {
  final _baseUrl = 'http://127.0.0.1:8000/api/v1';
  final http.Client httpClient = http.Client();
  final User user;

  ChatDataProvider(this.user);

  Future<Chat> createChat(Chat chat) async {
    // String token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU0Mjg3MzU0LCJpYXQiOjE2NTQyMDA5NTQsImp0aSI6Ijc4MzYwZjRiZDk2NjQxMDI5ZGI5ZDI4NmM3YTIxYjU4IiwidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJoZW5vayIsImVtYWlsIjoiaGVub2tAZ21haWwuY29tIiwiZmlyc3RfbmFtZSI6IiIsImxhc3RfbmFtZSI6IiJ9.YzziyiJg90iOAAudJOCsLs2jQNaAmEVEdqSEDzWwzBo';
    final response = await httpClient.post(
      Uri.http(_baseUrl, '/chats'),
      headers: {'Authorization': 'Bearer ${user.access_token}'},
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
    // String token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU0Mjg3MzU0LCJpYXQiOjE2NTQyMDA5NTQsImp0aSI6Ijc4MzYwZjRiZDk2NjQxMDI5ZGI5ZDI4NmM3YTIxYjU4IiwidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJoZW5vayIsImVtYWlsIjoiaGVub2tAZ21haWwuY29tIiwiZmlyc3RfbmFtZSI6IiIsImxhc3RfbmFtZSI6IiJ9.YzziyiJg90iOAAudJOCsLs2jQNaAmEVEdqSEDzWwzBo';
    final response = await httpClient.get(Uri.parse('$_baseUrl/chats'),
        headers: <String, String>{
          'Authorization': 'Bearer ${user.access_token}'
        });

    if (response.statusCode == 200) {
      final chats = jsonDecode(response.body) as List;
      print(chats);
      print(Chat.fromJson(chats[0]));
      final actual = chats.map((chat) => Chat.fromJson(chat)).toList();
      print("the actual is $actual");

      return chats.map((chat) => Chat.fromJson(chat)).toList();
    } else {
      throw Exception('Failed to load Chats');
    }
  }

  Future<void> deleteChat(Chat chat) async {
    // String token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU0Mjg3MzU0LCJpYXQiOjE2NTQyMDA5NTQsImp0aSI6Ijc4MzYwZjRiZDk2NjQxMDI5ZGI5ZDI4NmM3YTIxYjU4IiwidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJoZW5vayIsImVtYWlsIjoiaGVub2tAZ21haWwuY29tIiwiZmlyc3RfbmFtZSI6IiIsImxhc3RfbmFtZSI6IiJ9.YzziyiJg90iOAAudJOCsLs2jQNaAmEVEdqSEDzWwzBo';
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/chat/${chat.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${user.access_token}'
      },
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to delete Chat.');
    }
  }
}
