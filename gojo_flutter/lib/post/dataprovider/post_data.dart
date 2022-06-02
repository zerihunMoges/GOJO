import 'dart:convert';

import 'package:gojo_flutter/post/models/post.dart';
import 'package:http/http.dart' as http;

class PostDataProvider {
  final baseUrl = "http://127.0.0.1:8000/api/v1/posts";
  Future<Post> createPost(Post post) async {

    List<Map<String, dynamic>> rooms = <Map<String, dynamic>>[];
    
    for (var room in post.rooms) {
      rooms.add(
      jsonEncode(<String, dynamic>{
      'type': room.type,
      'count': room.count,
      }
);
    }
    
 

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': post.id,
        'title': post.title,
        'user': post.user,
        'photo': post.photo,
        'price': post.price,
        'area': post.area,
        'rooms': 
      }),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load course');
    }
  }
}
