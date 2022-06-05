import 'package:equatable/equatable.dart';
import '../models/models.dart';

class UserState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadingFailure extends UserState {}

class UserLoading extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> users;

  UserLoadSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserUpdating extends UserState {}

class UserUpdateSuccess extends UserState {
  final message = "User has been updated succesfully";
}

class UserUpdateFailure extends UserState {
  final message = "Couldn't update user";
}

class UserDeleting extends UserState {}

class UserDeleteSuccess extends UserState {
  final message = "User has been deleted succesfully";
}

class UserDeleteFailure extends UserState {
  final message = "Couldn't delete user";
}
