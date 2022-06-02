import 'package:flutter_bloc/flutter_bloc.dart';
import './auth_event.dart';
import './auth_state.dart';
import '../repository/repository.dart';
import '../utils/Api_response.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationRepo repo;
  AuthBloc(this.repo) : super(Idle()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter eimt) async {
    emit(LoginIn());

    final response = await repo.loginUser(event.email, event.pass);

    if (response.hasErrors()) {
      emit(LoginFailed(response.error));
    } else {
      final user = response.data;
      emit(LoginSuccessful(user));
    }
  }
}
