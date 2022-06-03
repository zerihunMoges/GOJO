import 'package:flutter_bloc/flutter_bloc.dart';
import './auth_event.dart';
import './auth_state.dart';
import '../repository/repository.dart';
import '../utils/Api_response.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationRepo repo;
  AuthBloc(this.repo) : super(Idle()) {
    on<Login>(_onLogin);
    on<Signup>(_onSignup);
  }

  void _onLogin(Login event, Emitter eimt) async {
    emit(LoginIn());

    final response = await repo.loginUser(event.email, event.pass);

    if (response.hasErrors()) {
      emit(LoginFailed(response.error));
    } else {
      final user = response.data;
      emit(LoginSuccessful(user!));
    }
  }

  void _onSignup(Signup event, Emitter emit) async {
    emit(SigningIn());

    final response = await repo.registerUser(event.email, event.last_name,
        event.username, event.name, event.password);

    if (response.hasErrors()) {
      emit(SigninFailed());
    } else {
      emit(SigninSuccessful());
    }
  }
}
