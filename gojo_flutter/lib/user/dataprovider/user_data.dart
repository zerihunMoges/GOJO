import 'dart:convert';

import 'package:gojo_flutter/post/models/post.dart';
import 'package:gojo_flutter/user/models/models.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final baseUrl = 'http://127.0.0.1:8000/api/v1/users';
  var client = http.Client();
  Future<User> createUser(User user) async {
    final response = await client.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'id': user.id,
        'username': user.username,
        'first_name': user.firstname,
        'last_name': user.lastname,
        'email': user.email,
      }),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Post');
    }
  }

  Future<List<User>> getUsers() async {
    print(Uri.parse(baseUrl));
    try {
      final response = await client.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        print("made it here");
        List<User> users = [];
        List<dynamic> Userse = jsonDecode(response.body);
        for (var json in Userse) {
          print("this is the json $json");
          users.add(User.fromJson(json));
        }

        return users;
      } else {
        throw Exception("failed to load Users");
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<User> getUser(int id) async {
    final response = await client.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      print("this is the user i got: " + response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to Load User");
    }
  }

  Future<void> updateUser(User user) async {
    print("this is the last" + user.lastname);
    final response = await client.patch(
      Uri.parse("$baseUrl/${user.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'id': user.id,
        'username': user.username,
        'first_name': user.firstname,
        'last_name': user.lastname,
        'email': user.email,
      }),
    );

    if (response.statusCode == 204) {
      throw Exception("failed to update course");
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await client.delete(
      Uri.parse("$baseUrl/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 204) {
      throw Exception("failed to delete Post");
    }
  }
}
