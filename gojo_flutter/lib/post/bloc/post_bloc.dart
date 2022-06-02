import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/post/bloc/post_event.dart';
import 'package:gojo_flutter/post/bloc/post_state.dart';
import 'package:gojo_flutter/post/repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostLoading()) {
    on<PostLoad>(_onPostLoad);
    on<PostCreate>(_onPostCreate);
    on<PostDelete>(_onPostDelete);
    on<PostUpdate>(_onPostUpdate);
  }
  
  void _onPostLoad(PostLoad event, Emitter emit) async {
    emit(PostLoading());
    try {
     
      final posts = await postRepository.getPosts();
      emit(PostLoadSuccess(posts));
    } catch (_) {
     
      emit(PostOperationFailure());
    }
  }

  void _onPostCreate(PostCreate event, Emitter emit) async {
    emit(PostCreating());
    try {
      await postRepository.createPost(event.post);
      final posts = await postRepository.getPosts();
      emit(PostLoadSuccess(posts));
    } catch (_) {
      emit(PostOperationFailure());
    }
  }

  void _onPostUpdate(PostUpdate event, Emitter emit) async {
    emit(PostCreating());
    try {
      await postRepository.updatePost(event.post);
      final posts = await postRepository.getPosts();
      emit(PostLoadSuccess(posts));
    } catch (_) {
      emit(PostOperationFailure());
    }
  }

  void _onPostDelete(PostDelete event, Emitter emit) async {
    emit(PostCreating());
    try {
      await postRepository.deletePost(event.post.id);
      final posts = await postRepository.getPosts();
      emit(PostLoadSuccess(posts));
    } catch (_) {
      emit(PostOperationFailure());
    }
  }
}
