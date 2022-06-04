import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

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
