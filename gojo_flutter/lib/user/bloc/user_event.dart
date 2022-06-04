
import 'package:equatable/equatable.dart';
import 'package:gojo_flutter/user/models/user.dart';

class UserEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}

class UserUpdate extends UserEvent{
  final User user;

  UserUpdate(this.user);
}
