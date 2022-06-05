import '../data_provider/data_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user_register.dart';
import '../model/user_other.dart';

class AuthenticationRemote implements AuthenticationProvider {
  final _uri = Uri.parse("http://127.0.0.1:8000/api/v1/token/");
  final _uri2 = Uri.parse("http://127.0.0.1:8000/api/v1/register");
  final _baseUrl = 'http://127.0.0.1:8000/api/v1';
  var client = http.Client();
  @override
  Future<http.Response> authenticateUser(
      String username, String password) async {
    try {
      final response = await http.post(_uri, body: {
        'username': username,
        'password': password,
      });
      return response;
    } catch (err) {
      throw Exception("failed to connect");
    }
  }

  @override
  Future<http.Response> registerUser(User_register user) async {
    final response = await http.post(
      _uri2,
      body: {
        "username": user.username,
        "password": user.password,
        "first_name": user.name,
        "last_name": user.last_name,
        "email": user.email
      },
    );
    if (response.statusCode == 201) {
      return response;
    }
    throw Exception("failed to connect");
  }

  Future<List<OtherUser>> getUsers() async {
    print(Uri.parse(_baseUrl));
    try {
      final response = await client.get(Uri.parse("$_baseUrl/users"));

      if (response.statusCode == 200) {
        print("made it here");
        List<OtherUser> users = [];
        List<dynamic> Userse = jsonDecode(response.body);
        for (var json in Userse) {
          print("this is the json $json");
          users.add(OtherUser.fromJson(json));
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

  Future<OtherUser> getUser(String id) async {
    final response = await client.get(Uri.parse("$_baseUrl/users/$id"));

    if (response.statusCode == 200) {
      print("this is the user i got: " + response.body);
      return OtherUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to Load User");
    }
  }

  Future<void> updateUser(OtherUser user) async {
    print("this is the last" + user.last_name);
    final response = await client.patch(
      Uri.parse("$_baseUrl/users/${user.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': user.id,
        'username': user.username,
        'first_name': user.name,
        'last_name': user.last_name,
        'email': user.email,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update course");
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await client.delete(
      Uri.parse("$_baseUrl/users/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 204) {
      throw Exception("failed to delete User");
    }
  }
}
