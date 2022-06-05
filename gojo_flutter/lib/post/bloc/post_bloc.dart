import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojo_flutter/post/bloc/post_event.dart';
import 'package:gojo_flutter/post/bloc/post_state.dart';
import 'package:gojo_flutter/post/models/post.dart';
import 'package:gojo_flutter/post/repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostLoading()) {
    on<PostLoad>(_onPostLoad);
    on<PostCreate>(_onPostCreate);
    on<PostDelete>(_onPostDelete);
    on<PostUpdate>(_onPostUpdate);
    on<PostFilter>(_search);
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
    emit(PostDeleting());
    try {
      await postRepository.deletePost(event.post.id);
      final posts = await postRepository.getPosts();
      emit(PostDeleteSuccess());
    } catch (_) {
      emit(PostDeleteFailure());
    }
  }

  void _search(PostFilter event, Emitter emit) {
    if (event.userid != '') {
      List<Post> searched = event.posts
          .where((post) =>
              post.user.toString() == event.userid.toString() )
          .toList();
      emit(PostFilterSuccess(searched));
    } else {
      List<Post> searched = event.posts
          .where((post) =>
              post.title
                  .toString()
                  .toLowerCase()
                  .contains(event.query.toLowerCase()) ||
              post.location
                  .toString()
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
          .toList();
      emit(PostFilterSuccess(searched));
    }
  }
}
