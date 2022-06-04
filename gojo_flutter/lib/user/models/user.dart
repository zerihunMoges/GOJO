import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  User({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
  
  });

   int id;
   String username;
   String firstname;
   String lastname;
   String email;


  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        firstname: json['first_name'],
        lastname: json['last_name'],
        email: json['email']);
  }
  @override
  List<Object?> get props => [id, username, firstname, lastname, email];
}
