import '../data_provider/data_provider.dart';
import 'package:http/http.dart' as http;

class AuthenticationRemote implements AuthenticationProvider {
  final _uri = Uri.parse("http://127.0.0.1:8000/api/v1/token/");
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

  // @override
  // Future<void> registerUser(User user) {
  //   return ;
  // }
}
