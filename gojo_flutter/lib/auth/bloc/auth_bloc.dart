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
    on<UserUpdate>(_onUserUpdate);
  }

  void _onUserUpdate(UserUpdate event, Emitter emit) {
    print("update user called");
    emit(UserUpdating());
    try {
      repo.updateUser(event.user);
      final user = repo.getUser(event.user.id);
      print("the user has been updated");
      emit(UserUpdateSuccess());
    } catch (_) {
      emit(UserUpdateFailure());
    }
  }

  void _onLogin(Login event, Emitter eimt) async {
    emit(LoginIn());

    try {
      final response = await repo.loginUser(event.email, event.pass);

      if (response.hasErrors()) {
        emit(LoginFailed(response.error));
      } else {
        final user = response.data;
        emit(LoginSuccessful(user!));
      }
    } catch (err) {
      emit(LoginFailed(err.toString()));
    }
  }

  void _onSignup(Signup event, Emitter emit) async {
    emit(SigningIn());

    final response = await repo.registerUser(event.name, event.last_name,
        event.username, event.email, event.password);

    if (response.hasErrors()) {
      emit(SigninFailed());
    } else {
      emit(SigninSuccessful());
    }
  }
}
