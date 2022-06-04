import 'package:equatable/equatable.dart';

class UserState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}

class UserUpdating extends UserState{}

class UserUpdateSuccess extends UserState{}

class UserUpdateFailuer extends UserState{}