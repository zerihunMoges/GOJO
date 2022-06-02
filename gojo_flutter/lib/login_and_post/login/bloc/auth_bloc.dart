import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/login_and_post/login/bloc/auth_event.dart';
import 'package:gojo_flutter/login_and_post/login/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Idle()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter eimt) async {
    print(event.pass);
    emit(LoginIn());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginSuccessful());
  }
}
