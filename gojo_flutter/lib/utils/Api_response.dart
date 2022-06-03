import 'package:gojo_flutter/auth/model/user.dart';

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
