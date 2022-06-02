import 'package:flutter/widgets.dart';
import 'package:gojo_flutter/post/models/post.dart';

class CourseRepository {
  final PostDataProvider dataProvider;

  CourseRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Post> createPost(Post Post) async {
    return await dataProvider.createPost(Post);
  }

  Future<List<Post>> getPosts() async {
    return await dataProvider.getPosts();
  }

  Future<void> updatePost(Post ost) async {
    await dataProvider.updatePost(Post);
  }

  Future<void> deletePost(String id) async {
    await dataProvider.deletePost(id);
  }
}