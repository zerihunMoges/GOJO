import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OtherUser extends Equatable {
  late String username;
  late String name;
  late String last_name;
  late String email;
  late String id;

  OtherUser({
    required this.id,
    required this.username,
    required this.name,
    required this.last_name,
    required this.email,
  });

  factory OtherUser.fromJson(Map<dynamic, dynamic> json) {
    return OtherUser(
        id: json['id'],
        username: json['username'],
        name: json['first_name'],
        last_name: json['last_name'],
        email: json['email']);
  }
  @override
  List<Object?> get props => [id, username, name, last_name, email];
}
