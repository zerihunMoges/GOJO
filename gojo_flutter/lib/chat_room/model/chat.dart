import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class Chat extends Equatable {
  Chat(
      {required this.id,
      required this.owner1,
      required this.owner2,
      required this.time,
      required this.lastMessage});

  final String id;
  final Map<String, dynamic> owner1;
  final Map<String, dynamic> owner2;
  final String time;
  final String lastMessage;

  @override
  List<Object> get props => [id, owner1, owner2, time, lastMessage];

  factory Chat.fromJson(Map<String, dynamic> json) {
    String datetime = json['updated'];
    DateTime now = DateTime.parse(datetime);
    return Chat(
        id: json['id'].toString(),
        owner1: json['owner1'],
        owner2: json['owner2'],
        time: DateFormat.jm().format(now),
        lastMessage: json['last_message'].toString());
  }
  //   print("chat is $cht");
  //   return Chat(
  //       id: json['id'],
  //       owner1: json['owner1'],
  //       owner2: json['owner2'],
  //       time: json['updated'],
  //       lastMessage: json['last_message']);
  // }

  @override
  String toString() =>
      'Chat { id: $id, owner1: $owner1, owner2: $owner2, time: $time, last message: $lastMessage }';
}
