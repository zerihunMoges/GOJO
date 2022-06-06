import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
class Message extends Equatable {
  Message(
      {required this.text,
      required this.owner,
      required this.chat,
      required this.time});
  final String text;
  final String owner;
  final String chat;
  final DateTime time;

  @override
  List<Object> get props => [text, owner, chat, time];

  factory Message.fromJson(Map<String, dynamic> json) {
    String datetime = json['updated'];
    DateTime now = DateTime.parse(datetime);

    return Message(
      text: json['text'].toString(),
      owner: json['user'].toString(),
      chat: json['chat'].toString(),
      time: now,
    );
  }

  @override
  String toString() =>
      'Message {text: $text, owner: $owner, chat: $chat, time: $time }';
}
