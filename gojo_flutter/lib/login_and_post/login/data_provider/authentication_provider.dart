import 'package:gojo_flutter/login_and_post/login/model/user.dart';
import 'package:gojo_flutter/login_and_post/utils/Api_response.dart';
import 'package:http/http.dart';

abstract class AuthenticationProvider {
  Future<Response> authenticateUser(String username, String password);
  // Future<void> registerUser(User user);
}
