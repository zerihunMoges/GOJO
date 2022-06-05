import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gojo_flutter/user/models/user.dart';

class Post extends Equatable {
  Post({
    required this.id,
    required this.title,
    required this.user,
    required this.photo,
    required this.price,
    required this.area,
    required this.rooms,
    required this.payment_frequency,
    required this.location,
  });

  final String id;
  final String title;
  final String user;
  final Uint8List photo;
  final String price;
  final String area;
  final List<Room> rooms;
  final String payment_frequency;
  final String location;

  factory Post.fromJson(json) {
    List<Room> rooms = [];
    for (var item in json['rooms']) {
      rooms.add(Room.fromJson(item));
    }
    return Post(
        id: json['id'].toString(),
        title: json['title'].toString(),
        user: json['user'].toString(),
        photo: Uint8List.fromList(List<int>.from(json['photo'])),
        price: json['price'].toString(),
        area: json['area'].toString(),
        rooms: rooms,
        payment_frequency: json['payment_frequency'].toString(),
        location: json['location'].toString());
  }
  @override
  List<Object?> get props =>
      [id, title, photo, price, area, rooms, payment_frequency, location];
}

class Room extends Equatable {
  Room({required this.type, required this.photos, required this.count});

  final String type;
  final List<dynamic> photos;
  final String count;

  factory Room.fromJson(json) {
    return Room(
        type: json['type'].toString(),
        photos: json['photos'],
        count: json['count'].toString());
  }
  @override
  List<Object?> get props => [type, photos, count];
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
