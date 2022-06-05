import 'package:equatable/equatable.dart';
import '../model/model.dart';

abstract class AuthEvent {}

class Login extends AuthEvent {
  late final String email;
  late final String pass;

  Login({required this.email, required this.pass});
}

class Signup extends AuthEvent {
  late String name;
  late String last_name;
  late String email;
  late String username;
  late String password;

  Signup(
      {required this.username,
      required this.name,
      required this.last_name,
      required this.email,
      required this.password});
}

class UserUpdate extends AuthEvent {
  final OtherUser user;

  UserUpdate(this.user);
}
