import 'dart:convert';
import 'dart:typed_data';

import 'package:gojo_flutter/post/models/post.dart';
import 'package:http/http.dart' as http;

class PostDataProvider {
  final baseUrl = 'http://127.0.0.1:8000/api/v1/posts';
  var client = http.Client();
  Future<Post> createPost(Post post) async {
    List<Map> rooms = [];

    for (var room in post.rooms) {
      rooms.add({
        'type': room.type,
        'photos': room.photos,
        'count': room.count,
      });
    }

    final response = await client.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'title': post.title,
        'user': post.user,
        'type': post.type,
        'photo': post.photo,
        'price': post.price,
        'area': post.area,
        'rooms': rooms,
        'payment_frequency': post.payment_frequency,
        'location': post.location,
      }),
    );

    if (response.statusCode == 201) {
      try {
        return Post.fromJson(jsonDecode(response.body));
      } catch (e) {
        print("the error");
        print(e);
      }
      return Post.fromJson(jsonDecode(response.body));
    } else {
      print("failed in the above");
      throw Exception('Failed to load Post');
    }
  }

  Future<List<Post>> getPosts() async {
    final response = await client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<Post> posts = [];
      List<dynamic> postse = jsonDecode(response.body);
      for (var json in postse) {
        try {
          posts.add(Post.fromJson(json));
        } catch (e) {}
      }

      return posts;
    } else {
      throw Exception("failed to load Posts");
    }
  }

  Future<Post> getPost(String id) async {
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
        'photos': room.photos,
        'count': room.count,
      }));
    }

    final response = await client.patch(
      Uri.parse("$baseUrl/${post.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        
        'title': post.title,
        'user': post.user,
        'photo': post.photo,
        'price': post.price,
        'area': post.area,
        'rooms': rooms,
        'payment_frequency': post.payment_frequency,
        'location': post.location
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("failed to update course");
    }
  }

  Future<void> deletePost(String id) async {
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
