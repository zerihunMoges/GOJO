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

  Signup(
      {required this.email,
      required this.name,
      required this.last_name,
      required username});
}
