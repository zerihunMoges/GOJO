

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Post extends Equatable {
  Post({
    required this.id,
    required this.title,
    required this.username,
    required this.photo,
    required this.price,
    required this.area,
    required this.rooms,
    required this.payment_frequency,
    required this.location,
  });

  final int id;
  final String title;
  final int username;
  final String photo;
  final double price;
  final double area;
  final List<Room> rooms;
  final int payment_frequency;
  final String location;

  factory Post.fromJson(Map<dynamic, dynamic> json) {
    List<Room> rooms = [];
    for (var item in json['rooms']) {
      rooms.add(Room.fromJson(item));
    }
    return Post(
        id: json['id'],
        title: json['title'],
        username: json['user'],
        photo: json['photo'],
        price: json['price'],
        area: json['area'],
        rooms: rooms,
        payment_frequency: json['payment_frequency'],
        location: json['location']);
  }
  @override

  List<Object?> get props =>
      [id, title, username, photo, price, area, rooms, payment_frequency, location];
}

class Room extends Equatable {
  Room({required this.id, required this.type, required this.count});

  final int id;
  final String type;
  final int count;

  factory Room.fromJson(Map<dynamic, dynamic> json) {
    return Room(
        id: json['id'],
        type: json['type'],
        count: json['count']);
  }
  @override
  List<Object?> get props => [id, type, count];
}

// class User extends Equatable {
//   User({required this.id, required this.username});
//   final String id;
//   final String username;

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(id: json['user']['id'], username: json['user']['username']);
//   }
//   @override
//   List<Object?> get props => [id, username];
// }
