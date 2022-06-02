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
  final String time;

  @override
  List<Object> get props => [text, owner, chat, time];

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'],
      owner: json['owner'],
      chat: json['chat'],
      time: json['time'],
    );
  }

  @override
  String toString() =>
      'Message {text: $text, owner: $owner, chat: $chat, time: $time }';
}