import 'package:gojo_flutter/auth/model/user.dart';
// import 'package:gojo_flutter/auth/Api_response.dart';
import 'package:http/http.dart';

abstract class AuthenticationProvider {
  Future<Response> authenticateUser(String username, String password);
  // Future<void> registerUser(User user);
}
