import '../model/model.dart';

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
