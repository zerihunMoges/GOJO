import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/repository.dart';
import 'message_event.dart';
import 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepository;

  MessageBloc(this.messageRepository) : super(MessageLoading()) {
    on<LoadMessages>(_onLoadMessages);
    // on<DeleteMessage>(_onDeleteMessage);
  }

  void _onLoadMessages(LoadMessages event, Emitter emit) async {
    emit(MessageLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final messages = await messageRepository.getMessages(event.chatId);
      emit(MessagesLoadSuccess(messages));
    } catch (err) {
      emit(MessagesLoadingFailure());
    }
  }

  // void _onDeleteMessage(DeleteMessage event, Emitter emit) async {
  //   await MessageRepository.deleteMessage(event.chatId, event.message);
  //   emit(MessageDeleteSuccessful());
  // }
}
