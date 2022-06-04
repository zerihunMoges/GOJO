import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/user/bloc/user_event.dart';
import 'package:gojo_flutter/user/bloc/user_state.dart';
import 'package:gojo_flutter/user/dataprovider/user_data.dart';
import 'package:gojo_flutter/user/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository =
      UserRepository(dataProvider: UserDataProvider());

  UserBloc(UserRepository) : super(UserUpdateSuccess()) {
    on<UserUpdate>(_onUserUpdate);
  }

  void _onUserUpdate(UserUpdate event, Emitter emit) {
    emit(UserUpdating());
    try {
      userRepository.updateUser(event.user);
      final user = userRepository.getUser(event.user.id);
      emit(UserUpdateSuccess());
    } catch (_) {
      emit(UserUpdateFailuer());
    }
  }
}
