import '../model/model.dart';
import '../utils/Api_response.dart';
import 'package:http/http.dart';

abstract class AuthenticationProvider {
  Future<Response> authenticateUser(String username, String password);
  Future<Response> registerUser(User_register user);
}
