import 'package:gojo_flutter/auth/model/user.dart';

abstract class AuthState {}

class Idle extends AuthState {}

class LoginIn extends AuthState {}

class LoginSuccessful extends AuthState {
  User? userId;
  LoginSuccessful(this.userId);
}

class LoginFailed extends AuthState {
  String? error;
  LoginFailed(this.error);
}
