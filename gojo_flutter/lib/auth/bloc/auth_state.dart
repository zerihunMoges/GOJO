import '../model/model.dart';

abstract class AuthState {}

class Idle extends AuthState {}

class LoginIn extends AuthState {}

class LoginSuccessful extends AuthState {
  User userId;
  LoginSuccessful(this.userId);
}

class LoginFailed extends AuthState {
  String? error;
  LoginFailed(this.error);
}

class SigningIn extends AuthState {}

class SigninSuccessful extends AuthState {}

class SigninFailed extends AuthState {}

class UserUpdating extends AuthState {}

class UserUpdateSuccess extends AuthState {
  final message = "User has been updated succesfully";
}

class UserUpdateFailure extends AuthState {
  final message = "Couldn't update user";
}

class UserDeleting extends AuthState {}

class UserDeleteSuccess extends AuthState {
  final message = "User has been deleted succesfully";
}

class UserDeleteFailure extends AuthState {
  final message = "Couldn't delete user";
}
