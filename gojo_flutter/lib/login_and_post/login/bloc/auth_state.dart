abstract class AuthState{}
class Idle extends AuthState{}
class LoginIn extends AuthState{}
class LoginSuccessful extends AuthState{}
class LoginFailed extends AuthState{}