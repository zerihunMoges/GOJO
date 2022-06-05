import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:gojo_flutter/post/models/post.dart';

class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class PostLoad extends PostEvent {
  const PostLoad();

  @override
  List<Object?> get props => [];
}

class PostCreate extends PostEvent {
  final Post post;

  const PostCreate(this.post);

  @override
  List<Object?> get props => [post];

  @override
  String toString() => 'Post created {post: $post}';
}

class PostUpdate extends PostEvent {
  final Post post;

  const PostUpdate(this.post);

  @override
  List<Object?> get props => [post];

  @override
  String toString() => 'Post Updated {post: $post}';
}

class PostFilter extends PostEvent {
  final List priceRange;
  final List area;
  final String type;
  final List<Post> posts;
  final String query;
  final String userid;

  PostFilter(this.priceRange, this.area, this.type, this.posts, this.query, this.userid);
}

class PostDelete extends PostEvent {
  final Post post;

  const PostDelete(this.post);

  @override
  List<Object?> get props => [post];

  @override
  String toString() => 'Post Deleted {post: $post}';
}
