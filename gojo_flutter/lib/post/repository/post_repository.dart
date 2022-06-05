import 'package:flutter/widgets.dart';
import 'package:gojo_flutter/post/dataprovider/post_data.dart';
import 'package:gojo_flutter/post/models/post.dart';

class PostRepository {
  final PostDataProvider dataProvider;

  PostRepository({required this.dataProvider})
      : assert(dataProvider != null);

  Future<Post> createPost(Post Post) async {
    return await dataProvider.createPost(Post);
  }

  Future<List<Post>> getPosts() async {
    return await dataProvider.getPosts();
  }

  Future<void> updatePost(Post post) async {
    await dataProvider.updatePost(post);
  }

  Future<void> deletePost(int id) async {
    await dataProvider.deletePost(id);
  }
}