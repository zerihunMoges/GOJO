import 'package:equatable/equatable.dart';
import 'package:gojo_flutter/post/models/post.dart';

class PostState extends Equatable {
  const PostState();

  @override
  
  List<Object> get props => [];
  
}

class PostLoading extends PostState{}
class PostCreating extends PostState{}

class PostLoadSuccess extends PostState{
  final List<Post> posts;

  const PostLoadSuccess([this.posts = const []]);

  @override
  List<Object> get props => [posts];
}

class PostOperationFailure extends PostState{}