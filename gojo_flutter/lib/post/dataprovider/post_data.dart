import 'dart:convert';

import 'package:gojo_flutter/post/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:gojo_flutter/database.dart';

class PostDataProvider {
  final baseUrl = 'http://127.0.0.1:8000/api/v1/posts';
  var client = http.Client();
  Future<Post> createPost(Post post) async {
    List<String> rooms = [];

    for (var room in post.rooms) {
      rooms.add(jsonEncode(<dynamic, dynamic>{
        'type': room.type,
        'count': room.count,
      }));
    }

    final response = await client.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'id': post.id,
        'title': post.title,
        'user': post.username,
        'photo': post.photo,
        'price': post.price,
        'area': post.area,
        'rooms': rooms,
        'payment_frequency': post.payment_frequency,
        'locaton': post.location
      }),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Post');
    }
  }

  Future<List<Post>> getPosts() async {
    print(Uri.parse(baseUrl));
    try {
      final response = await client.get(
        Uri.parse(baseUrl),
        // headers: {'Authorization': 'Bearer ${DatabaseProvider.db.getToken()}'}
      );

      if (response.statusCode == 200) {
        List<Post> posts = [];
        List<dynamic> postse = jsonDecode(response.body);
        for (var json in postse) {
          print("this is the json $json");
          posts.add(Post.fromJson(json));
        }

        return posts;
      } else {
        throw Exception("failed to load Posts");
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<Post> getPost(int id) async {
    final response = await client.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to Load Post");
    }
  }

  Future<void> updatePost(Post post) async {
    List<String> rooms = [];

    for (var room in post.rooms) {
      rooms.add(jsonEncode(<dynamic, dynamic>{
        'type': room.type,
        'count': room.count,
      }));
    }

    final response = await client.put(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'id': post.id,
        'title': post.title,
        'user': post.username,
        'photo': post.photo,
        'price': post.price,
        'area': post.area,
        'rooms': rooms,
        'payment_frequency': post.payment_frequency,
        'locaton': post.location
      }),
    );

    if (response.statusCode == 204) {
      throw Exception("failed to update course");
    }
  }

  Future<void> deletePost(int id) async {
    final response = await client.delete(
      Uri.parse("$baseUrl/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 204) {
      throw Exception("failed to delete Post");
    }
  }
}
