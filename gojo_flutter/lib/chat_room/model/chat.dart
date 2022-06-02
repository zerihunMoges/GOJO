import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Chat extends Equatable {
  Chat(
      {required this.id,
      required this.owner1,
      required this.owner2,
      required this.time,
      required this.lastMessage});

  final String id;
  final String owner1;
  final String owner2;
  final String time;
  final String lastMessage;

  @override
  List<Object> get props => [id, owner1, owner2, time, lastMessage];

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        id: json['id'],
        owner1: json['owner1'],
        owner2: json['owner2'],
        time: json['time'],
        lastMessage: json['last_message']);
  }

  @override
  String toString() =>
      'Chat { id: $id, owner1: $owner1, owner2: $owner2, time: $time, last message: $lastMessage }';
}
