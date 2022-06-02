import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/repository.dart';
import './chat_event.dart';
import './chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc(this.chatRepository) : super(ChatLoading()) {
    on<LoadChats>(_onLoadChats);
    on<DeleteChat>(_onDeleteChat);
  }

  void _onLoadChats(LoadChats event, Emitter emit) async {
    emit(ChatLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final chats = await chatRepository.getChats();
      emit(ChatsLoadSuccess(chats));
    } catch (err) {
      emit(ChatsLoadingFailure());
    }
  }

  void _onDeleteChat(DeleteChat event, Emitter emit) async {
    await chatRepository.deleteChat(event.chat);
    emit(ChatDeleteSuccessful());
  }
}
