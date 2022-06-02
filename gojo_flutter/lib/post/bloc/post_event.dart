import 'package:equatable/equatable.dart';
import 'package:gojo_flutter/post/models/post.dart';

class PostLoad extends Equatable {
  const PostLoad();

  @override

  List<Object?> get props => [];
}

class PostCreate extends Equatable {
  final Post post;

  const PostCreate(this.post);

  @override

  List<Object?> get props => [post];

  @override
  String toString() => 'Post created {post: $post}';
}

class PostUpdate extends Equatable {
  final Post post;

  const PostUpdate(this.post);

  @override

  List<Object?> get props => [post];

  @override
  String toString() => 'Post Updated {post: $post}';
}

class PostDelete extends Equatable {
  final Post post;

  const PostDelete(this.post);

  @override
  // TODO: implement props
  List<Object?> get props => [post];

  @override
  String toString() => 'Post Deleted {post: $post}';
}
