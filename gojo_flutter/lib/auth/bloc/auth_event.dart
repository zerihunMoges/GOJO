abstract class AuthEvent {}

class Login extends AuthEvent {
  late final String email;
  late final String pass;

  Login({required this.email, required this.pass});
}


class Signup extends AuthEvent{}

