import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/user/bloc/user_event.dart';
import 'package:gojo_flutter/user/bloc/user_state.dart';
import 'package:gojo_flutter/user/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserLoading()) {
    on<UserLoad>(_onUserLoad);
    on<UserDelete>(_onUserDelete);
    on<UserUpdate>(_onUserUpdate);
  }

  void _onUserLoad(UserLoad event, Emitter emit) async {
    print("trying to load");
    emit(UserLoading());
    try {
      final users = await userRepository.getUsers();
      emit(UserLoadSuccess(users));
    } catch (_) {
      emit(UserLoadingFailure());
    }
  }

  void _onUserUpdate(UserUpdate event, Emitter emit) async {
    emit(UserUpdating());
    try {
      await userRepository.updateUser(event.user);
      final users = await userRepository.getUsers();
      emit(UserLoadSuccess(users));
    } catch (_) {
      emit(UserUpdateFailure());
    }
  }

  void _onUserDelete(UserDelete event, Emitter emit) async {
    emit(UserDeleting());
    try {
      await userRepository.deleteUser(event.user.id);
      emit(UserDeleteSuccess());
    } catch (_) {
      emit(UserDeleteFailure());
    }
  }
}
