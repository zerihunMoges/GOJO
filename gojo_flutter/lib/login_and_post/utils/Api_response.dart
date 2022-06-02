import 'package:gojo_flutter/login_and_post/login/model/user.dart';

class ApiResponse {
  User? data;
  String? error;
  bool hasErrors() {
    if (this.error != null) {
      return true;
    } else
      return false;
  }
}
