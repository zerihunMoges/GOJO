import 'package:equatable/equatable.dart';
import '../models/models.dart';

class UserEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoad extends UserEvent {}

class UserUpdate extends UserEvent {
  final User user;

  UserUpdate(this.user);

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'User Updated {User: $user}';
}

class UserDelete extends UserEvent {
  final User user;

  UserDelete(this.user);

  @override
  List<Object?> get props => [User];

  @override
  String toString() => 'User Deleted {User: $User}';
}
