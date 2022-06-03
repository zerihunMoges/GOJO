import '../data_provider/data_provider.dart';
import 'package:http/http.dart' as http;

import '../model/user_register.dart';

class AuthenticationRemote implements AuthenticationProvider {
  final _uri = Uri.parse("http://127.0.0.1:8000/api/v1/token/");
  final _uri2 = Uri.parse("http://127.0.0.1:8000/api/v1/register");
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
    try {
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
      return response;
    } catch (err) {
      throw Exception("failed to connect");
    }
  }
}
